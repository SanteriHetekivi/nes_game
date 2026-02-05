; Code that runs when NES is powered on or reset.
RESET:
    sei ; Disable interrupts.
    cld ; Disable decimal mode.

    ; Disable Audio Processing Unit (APU) by writing 01000000 to frame counter control register.
    write APU_FRAME_COUNTER, %01000000

    ; Set stack pointer to $FF (top of stack).
    ldx #$FF
    txs
