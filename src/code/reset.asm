; Code that runs when NES is powered on or reset.
RESET:
    SEI             ; Disable interrupts.
    CLD             ; Disable decimal mode.

    ; Disable Audio Processing Unit (APU) by writing
    LDX #%01000000  ; 01000000 (Bit 6 set to disable DMC).
    STX $4017       ; to frame counter control register.

    ; Set stack pointer to $FF (top of stack).
    LDX #$FF    
    TXS
