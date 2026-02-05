.segment "HEADER"
    .byte $4E, $45, $53, $1A    ; ASCII "NES<SUB>"
    .byte %00000001             ; 1 PRG bank (16KB)
    .byte %00000001             ; 1 CHR bank (8KB)
    ; Flags 6 (Mapper, mirroring, battery, trainer)
    .byte %00000001             ; 0: Nametable arrangement. (1 = vertically mirrored)
                                ; 1: Is there battery-backed PRG RAM? (0 = no)
                                ; 2: Is there 512-byte trainer? (0 = no)
                                ; 3: Alternative nametable layout (0 = no)
                                ; 4-7: lower 4 bits of mapper number (0 = NROM)
    .res 8, 0                   ; End with 8 zero bytes.
