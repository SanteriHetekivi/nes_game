; Interrupt vectors.
.segment "VECTORS"
    .word NMI   ; Non-Maskable interrupts (NMI) to NMI-label.
    .word RESET ; Reset vector (Triggered when NES starts) to the RESET-label.
    .word 0     ; IRQ or BRK interrupts to 0 (not used).
