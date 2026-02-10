TILE_ID_PLAYER_1 = (tile_player_1 - tiles_start) / 16
TILE_ID_PLAYER_2 = (tile_player_2 - tiles_start) / 16

SPRITE_ID_PLAYER_1 = 0
SPRITE_ID_PLAYER_2 = 1

.segment "TILES"
tiles_start:
tile_background:
    ; Bitplane 0 (Shape)
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    ; Bitplane 1 (Color)
    ; All zeroes, so 0 in shape use color 0 and 1 in shape use color 1.
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000

tile_player_1:
    ; Bitplane 0 (Shape)
    .byte %11111111
    .byte %10000001
    .byte %10111101
    .byte %10100101
    .byte %10111101
    .byte %10000001
    .byte %11111111
    .byte %00000000
    ; Bitplane 1 (Color)
    ; All zeroes, so 0 in shape use color 0 and 1 in shape use color 1.
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000

tile_player_2:
    ; Bitplane 0 (Shape)
    .byte %11111111
    .byte %11000011
    .byte %11011011
    .byte %11000011
    .byte %11011011
    .byte %11000011
    .byte %11111111
    .byte %00000000
    ; Bitplane 1 (Color)
    ; All zeroes, so 0 in shape use color 0 and 1 in shape use color 1.
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000
    .byte %00000000

tiles_rest:
    .res 8192-(tiles_rest-tiles_start), 0    ; Fill the rest of the 8KB CHR bank with zeroes.
tiles_end:
