    ; PPU is now in vblank.
    
    ; Strobe the controller, by writing 1 then 0 to first controller ($4016).
    JOYPAD1 = $4016
    write16 JOYPAD1, $0100
    LDX #$08         ; Init X as counter from 8.
    LDA #$00         ; Init A register to 0.
    STA buttons      ; Clear the previous state of buttons.
    ; Read all buttons in a loop.
    loop:
        LDA JOYPAD1      ; Read the button to A register.
        ; --- The "Open Bus" Fix ---
        AND #%00000011   ; Mask out everything except the controller data
        CMP #$01         ; If Bit 0 or 1 is set, the Carry flag becomes 1
        ROL buttons      ; Shift that Carry flag into our variable
        DEX              ; Decrement X counter.
        BNE loop         ; Repeat until all 8 bits are read.

    ; Set picture processing unit (PPU) adddress to $3F00 (start of palette RAM).
    write16 $2006, $3F00

    ; Use buttons value directly as color
    LDA buttons
    STA $2007

    ; Set PPU control register 1 ($2001) to enable background and sprites.
    write8 $2001, $1E
