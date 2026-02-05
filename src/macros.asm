; Write a given value to a given address.
.MACRO WRITE address, value
    LDA #value
    STA address
.ENDMACRO

; Copy value in given address to another given address.
.MACRO COPY address_destination, address_source
    LDA address_source
    STA address_destination
.ENDMACRO

; Strobe given address, by writing the given value to it and then zeroing it.
.MACRO STROBE address, value
    WRITE address, value
    WRITE address, %00000000
.ENDMACRO
