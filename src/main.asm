INCLUDE "libs/hardware.inc"
INCLUDE "textures/Tilemap/hello_world.asm"
INCLUDE "textures/Tiles/hello_world.asm"
INCLUDE "functions/CopyTiles.asm"
INCLUDE "libs/variables.asm"
INCLUDE "functions/printConsole.asm"


section "Header", ROM0[$100]

    jp Entrypoint

    ds $150 - @, 0 ; Make room for the header

Entrypoint: 
    ; Turn off audio
    ld a, 0
    ld [rNR52], a

;Do not turn off lcd outside of VBlank
WaitVBlank:
    ld a, [rLY]
    cp 144
    jp c, WaitVBlank
    
    ;Turn off lcd to change the graphics
    ld a, 0
    ld [rLCDC], a

    ;Copy tile data
    ld de, Tiles
    ld hl, $9000
    ld bc, TilesEnd - Tiles
    call CopyTiles

    ld de, Tiles2
    ld hl, $9000 + (TilesEnd - Tiles)
    ld bc, Tiles2End - Tiles2
    call CopyTiles2

    ;Copy tile map
    ld de, Tilemap
    ld hl, $9800
    ld bc, TilemapEnd - Tilemap
    call CopyTilemap

    ;Turn on lcd
    ld a, LCDC_ON | LCDC_BG_ON
    ld [rLCDC], a

    ;Set pallette
    ld a, %11100100
    ld [rBGP], a


MainLoop:
    ;Wait for vblank
    ld a, [rLY]
    cp 144
    jp c, MainLoop


    ;Increse the frame counter every frame
    ld a, [wFramesCounter]
    inc a
    ld [wFramesCounter], a

    ;If the frame == 60 jump to ScrollYNow
    ;ld a, [wFramesCounter]
    ;cp 60
    ;call z, ScrollYNow


    ; Invoke the macro
    debug_message "Hello world"
    
    
    jp MainLoop 
    
    
ScrollYNow:
    ;Reset the frame counter every 60 frame
    ld a, 0
    ld [wFramesCounter], a

    ;Scroll the screen up
    ld a, [ScrollY]
    inc a
    ld [ScrollY], a
    ld [rSCY], a
	ld [rSCX], a

    ret

ScrollRight:
    ;Got rigjt 8 pixels
    ld a, 8
    ld [rSCX], a
    ret

;If DP == right call Scroll ScrollRight
GetDPRight:
