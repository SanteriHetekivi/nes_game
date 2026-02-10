    ; Read both controller's pressed buttons into controllerInputs variable.
    write CONTROLLER_1, 1                   ; Write 1 to CONTROLLER_1 to signal both controller to poll their input.
    write CONTROLLER_1, 0                   ; Write 0 to CONTROLLER_1 to finish the poll.
    ldx #$00                                ; Init controller index (X-register) to 0.
    @loopController:
        ldy #$08                            ; Init button counter (Y-register) to 8.
        write controllerInputTmp, %00000000 ; Init controllerInputTmp to 0 before reading buttons into it.
        @loopButton:
            lda CONTROLLER_1, X             ; Read the current controller's current button value into A register.
            lsr A                           ; Move Bit 0 into the carry flag.
            rol controllerInputTmp          ; Rotate that carry into our temporary input byte.

            dey                             ; Decrement button counter (Y-register).
            bne @loopButton                 ; If not zero yet, repeat for next button.
        
        ; After reading all 8 buttons,
        lda controllerInputTmp              ; store the read button values from controllerInputTmp
        sta controllerInputs, X             ; into current controller's input byte.

        inx                                 ; Increment to controller index (X-register).
        cpx #$02                            ; Compare controller index (X-register) against 2.
        bne @loopController                 ; If it is not 2 yet, repeat for next controller.   