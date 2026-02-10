; Code that runs when NES is powered on or reset.
RESET:
    sei ; Disable interrupts.
    cld ; Disable decimal mode.

    ; Disable Audio Processing Unit (APU) by writing 01000000 to frame counter control register.
    write APU_FRAME_COUNTER, %01000000
    write PPU_CTRL, %00000000           ; Disable VBlank interrupts.
    write PPU_MASK, %00000000           ; Disable rendering.
    write APU_DMC_CTRL, %00000000       ; Disable DMC IRQs

    ; Set stack pointer to $FF (top of stack).
    ldx #$FF
    txs

    ; Wait for the start of vertical blanking (vblank) period.
    jsr WaitForVBlank

    ; Clear all RAM by writing 0 to all addresses from $0000 to $07FF (2KB of RAM).
    ldx #0
    lda #0
    @clear_ram:
        sta $00, x
        sta $0100, x
        sta $0200, x
        sta $0300, x
        sta $0400, x
        sta $0500, x
        sta $0600, x
        sta $0700, x
        inx
        bne @clear_ram

    ; Hide all sprites off-screen until we set their positions and tile indices.
    jsr HideSprites                     

    ; Init both player Y-coordinates to center.
    lda #116        
    sta player1_y
    sta player2_y
    ; Init player  X-coordinates to left
    write player1_x, 8
    write player2_x, 240                ; and right edges.

    ; Wait for the start of vertical blanking (vblank) period.
    jsr WaitForVBlank

    ; Set universal background color to black.
    write16 PPU_ADDR, $3F00
    write PPU_DATA, $0F
    ; Set sprite palette 0 all colors to white.
    write PPU_DATA, $30
    write PPU_DATA, $30
    write PPU_DATA, $30

    ; Set flag to indicate we are now waiting for NMI to start the game loop.   
    inc wait_for_nmi            
    ; Enable VBlank NMI
    write PPU_CTRL, %10000000

    ; Enable sprites and background rendering. 
    write PPU_MASK, %00011000   
