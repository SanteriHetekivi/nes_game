
.segment "CODE"

; Inlude reset/initialization code that runs once when the NES is powered on or reset.
.include "code/reset.asm"   

@loop_main:
    ; Wait for NMI to be done.
    @wait_for_nmi:
        LDA wait_for_nmi
        BNE @wait_for_nmi
        
    .include "code/main.asm"    ; Include main game logic.

    JMP @loop_main              ; Infinite loop.

; Non-Maskable Interrupt (NMI) handler, runs at the start of vertical blanking (vblank) period.
NMI:
    ; Push A-register to stack.
    PHA

    ; Tell main thread to wait for NMI.
    LDA #$01
    STA wait_for_nmi

    ; Push X-register to stack.
    PHA
    TXA

    ; Push Y-register to stack.
    PHA
    TYA

    ; Include acual logic to run during NMI.
    .include "code/nmi.asm"

    ; Restore Y-register from stack.
    PLA
    TAY

    ; Restore X-register from stack.
    PLA
    TAX

    ; Tell to not wait for NMI anymore, so that main loop can continue.
    LDA #$00
    STA wait_for_nmi

    ; Restore A-register from stack.
    PLA

    ; Return from interrupt.
    RTI

; Add all of the subroutines to the end of the code segment.
.include "code/subroutines.asm"
