    ; Main loop logic.

    ; Read both inputs to controllerInputs variable.
    .include "input.asm"

    ; Write player sprites to sprite RAM (OAM Buffer).
    sprite SPRITE_ID_PLAYER_1, #TILE_ID_PLAYER_1, player1_x, player1_y, $00
    sprite SPRITE_ID_PLAYER_2, #TILE_ID_PLAYER_2, player2_x, player2_y, $00
