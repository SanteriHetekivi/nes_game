    ; Read both controller's pressed buttons into controllerInputs variable.
    strobe CONTROLLER_1, %00000001  ; Freeze both controller for reading by strobing CONTROLLER_1 with 1.
    ldx #$00                        ; Init controller index (X-register) to 0.
    @loopController:
        ldy #$08                    ; Init button counter (Y-register) to 8.
        @loopButton:
            lda CONTROLLER_1, X     ; Read the current controller's current button value into A register.
            lsr A                   ; Move Bit 0 into the carry flag.
            rol controllerInputs, X ; Rotate that carry into our current controller's input byte.

            dey                     ; Decrement button counter (Y-register).
            bne @loopButton         ; If not zero yet, repeat for next button.

        inx                         ; Increment to controller index (X-register).
        cpx #$02                    ; Compare controller index (X-register) against 2.
        bne @loopController         ; If it is not 2 yet, repeat for next controller.
