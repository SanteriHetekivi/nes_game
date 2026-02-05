    ; PPU is now in vblank.
    
    ; Update input.
    .include "input.asm"

    ; Strobe picture processing unit (PPU) address to $3F (start of palette RAM).
    strobe PPU_ADDR, $3F

    ; Use first controller's pressed buttons directly as color byte.
    copy PPU_DATA, controllerInputs

    ; Set PPU control register 1 to enable background and sprites.
    write PPU_MASK, $1E
