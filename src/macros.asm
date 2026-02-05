; Write a given value to a given address.
.macro write address, value
    lda #value
    sta address
.endmacro

; Copy value in given address to another given address.
.macro copy address_destination, address_source
    lda address_source
    sta address_destination
.endmacro

; Strobe given address, by writing the given value to it and then zeroing it.
.macro strobe address, value
    write address, value
    write address, %00000000
.endmacro
