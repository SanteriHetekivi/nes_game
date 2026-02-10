; Zero page, for storing variables.
.segment "ZP"
    wait_for_nmi: .res 1        ; Flag to indicate if we are waiting for NMI.
    controllerInputTmp: .res 1  ; Reserve 1 byte for temporary controller input storage.
    controllerInputs: .res 2    ; Reserve 2 bytes for both controller's inputs.
    player1_x: .res 1           ; Reserve 1 byte for player 1's X-coordinate.
    player1_y: .res 1           ; Reserve 1 byte for player 1's Y-coordinate.
    player2_x: .res 1           ; Reserve 1 byte for player 2's X-coordinate.
    player2_y: .res 1           ; Reserve 1 byte for player 2's Y-coordinate.
