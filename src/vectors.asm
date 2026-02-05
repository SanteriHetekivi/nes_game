; Interrupt vectors.
.segment "VECTORS"
    .word 0     ; Non-Maskable interrupts (NMI) to 0 (not used).
    .word RESET ; Reset vector (Triggered when NES starts) to the RESET label.
    .word 0     ; IRQ or BRK interrupts to 0 (not used).
