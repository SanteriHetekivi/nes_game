; Write a given value to a given address.
.macro write address, value
    lda #value
    sta address
.endmacro

; Write a 16-bit value to a given address, by writing the low byte first and then the high byte.
.macro write16 address, value
    write address, (>value)         ; Write low byte to address.
    write address, (value & $FF)    ; Write high byte to address.
.endmacro

; Write sprite data to OAM buffer.
.macro sprite id, tile, coordinate_x, coordinate_y, attributes    
    ; Calculate the OAM address for the sprite based on its ID.
    ; Each sprite takes 4 bytes in OAM, so we multiply the ID by 4 to get the correct offset.
    lda #id
    ; Multiply by 4, by shifting left twice.
    asl A
    asl A 
    tax ; Store the calculated OAM address to X-register.

    ; Write Y-coordinate.
    lda coordinate_y
    sta PPU_OAM_BUFFER, X

    ; Write tile index.
    lda tile
    inx
    sta PPU_OAM_BUFFER, X

    ; Write attributes.
    lda attributes
    inx
    sta PPU_OAM_BUFFER, X
    
    ; Write X-coordinate.
    lda coordinate_x
    inx
    sta PPU_OAM_BUFFER, X
.endmacro
