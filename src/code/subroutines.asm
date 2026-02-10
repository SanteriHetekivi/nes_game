; Subroutines.

; Hide sprites by writing off-screen Y-coordinate to all sprites in OAM buffer.
HideSprites:
    ldx #0                      ; Start with the first sprite.
    lda #254                  ; Set A-register to 254, which is off-screen Y-coordinate for sprites.
    @loop_hide_sprite:
        sta PPU_OAM_BUFFER, x   ; Write 254 to the current sprite's Y-coordinate, effectively hiding it off-screen.
        inx                     ; Skip tile index.
        inx                     ; Skip attributes.
        inx                     ; Skip X-coordinate.
        inx                     ; Move to the next sprite's Y-coordinate.
        bne @loop_hide_sprite   ; Repeat until X wraps back to 0 (all 64 sprites).
    rts                         ; Return to where you came from.

; Wait for vertical blanking (vblank) period to start by polling PPU status register.
WaitForVBlank:
    bit PPU_STATUS      ; Check if we are in vertical blanking (vblank) period by reading PPU status register.
    bpl WaitForVBlank   ; If bit 7 of PPU status is not set, we are still in vblank, so keep waiting.
    rts                 ; Return to where you came from.
