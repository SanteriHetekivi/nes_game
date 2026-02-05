; Write value in X register to a specified address.
.macro writex addr
    TXA
    STA addr
.endmacro

; Write a 8-bit value high to a specified address.
.macro write8 addr, value
    ; High byte
    LDA #value
    STA addr
.endmacro

; Write a 16-bit value high and low byte to a specified address.
.macro write16 addr, value
    write8 addr, (>value)       ; High byte.
    write8 addr, (value & $FF)  ; Low byte.
.endmacro
