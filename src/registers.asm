; PPU (Picture Processing Unit) registers:
PPU_CTRL             = $2000 ; PPU Control.
PPU_MASK             = $2001 ; PPU Mask.
PPU_STATUS           = $2002 ; PPU Status.
PPU_SCROLL           = $2005 ; PPU Scroll.
PPU_ADDR             = $2006 ; PPU Address.
PPU_DATA             = $2007 ; PPU Data.
; PPU_OAM_(Object Attribute Memory) registers:
PPU_OAM_ADDR         = $2003 ; OAM Address
PPU_OAM_BUFFER       = $0200 ; OAM buffer in RAM (not a real register, but used for DMA).
PPU_OAM_DATA         = $2004 ; OAM Data.
PPU_OAM_DMA          = $4014 ; OAM Direct memory access.

; APU (Audio Processing Unit) registers:
APU_STATUS          = $4015 ; APU status.
APU_FRAME_COUNTER   = $4017 ; Frame counter.
; First Pulse Channel:
APU_PULSE1          = $4000 ; Pulse 1 control.
APU_PULSE1_SWEEP    = $4001 ; Pulse 1 sweep.
APU_PULSE1_TIMER    = $4002 ; Pulse 1 timer low.
APU_PULSE1_LEN      = $4003 ; Pulse 1 length counter.
; Second Pulse Channel:
APU_PULSE2          = $4004 ; Pulse 2 control.
APU_PULSE2_SWEEP    = $4005 ; Pulse 2 sweep.
APU_PULSE2_TIMER    = $4006 ; Pulse 2 timer low.
APU_PULSE2_LEN      = $4007 ; Pulse 2 length counter.
; Triangle Channel:
APU_TRIANGLE        = $4008 ; Triangle control.
APU_TRIANGLE_TIMER  = $400A ; Triangle timer low.
APU_TRIANGLE_LEN    = $400B ; Triangle length counter.
; Noise Channel:
APU_NOISE           = $400C ; Noise control.
APU_NOISE_TIMER     = $400E ; Noise timer.
APU_NOISE_LEN       = $400F ; Noise length counter.
; DMC (Delta modulation channel):
APU_DMC_CTRL        = $4010 ; DMC control.
APU_DMC_DIRECT_LOAD = $4011 ; DMC direct load.
APU_DMC_ADDR        = $4012 ; DMC address.
APU_DMC_LEN         = $4013 ; DMC length.

; Controller Ports:
CONTROLLER_1         = $4016 ; Controller port 1.
CONTROLLER_2         = $4017 ; Controller port 2.
