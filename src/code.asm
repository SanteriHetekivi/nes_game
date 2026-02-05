
.segment "CODE"
.include "code/reset.asm"    

; Wait for the start of vertical blanking (vblank) period.
vblankwait:
    BIT PPU_STATUS  ; If bit 7 of picture processing unit (PPU_) status register is not clear, we're still in vblank.
    BPL vblankwait  ; Wait until it's set.

    ; Run game logic inside the vblank period.
    .include "code/logic.asm"

    ; Jump back to wait for the vblank.
    JMP vblankwait
