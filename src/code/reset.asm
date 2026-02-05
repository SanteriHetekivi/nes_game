; Code that runs when NES is powered on or reset.
RESET:
    SEI ; Disable interrupts.
    CLD ; Disable decimal mode.

    ; Disable Audio Processing Unit (APU) by writing 01000000 to frame counter control register.
    WRITE APU_FRAME_COUNTER, %01000000

    ; Set stack pointer to $FF (top of stack).
    LDX #$FF
    TXS
