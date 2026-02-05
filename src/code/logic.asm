    ; PPU is now in vblank.
    
    ; Strobe the controller, by writing 1 then 0 to first controller.
    STROBE CONTROLLER_1, $01
    LDX #$08            ; Init X as counter from 8.
    LDA #$00            ; Init A register to 0.
    STA buttons         ; Clear the previous state of buttons.
    ; Read all buttons in a loop.
    loop:
        LDA CONTROLLER_1        ; Read the button to A register.
        AND #%00000011  ; Mask out everything except the controller data.
        CMP #$01        ; If Bit 0 or 1 is set, the Carry flag becomes 1.
        ROL buttons     ; Shift that Carry flag into our variable.
        DEX             ; Decrement X counter.
        BNE loop        ; Repeat until all 8 bits are read.

    ; Strobe picture processing unit (PPU) address to $3F (start of palette RAM).
    STROBE PPU_ADDR, $3F

    ; Use buttons value directly as color byte.
    COPY PPU_DATA, buttons

    ; Set PPU control register 1 to enable background and sprites.
    WRITE PPU_MASK, $1E
