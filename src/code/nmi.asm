    ; NMI logic.

    ; Point PPU to start of OAM
    write PPU_OAM_ADDR, 0
    ; Tell DMA to copy from $0200-$02FF.
    write PPU_OAM_DMA, 2
