
;Do not turn off lcd outside of VBlank
WaitVBlank:
    ld a, [rLY]
    cp 144
    jp c, WaitVBlank
    
    ;Turn off lcd to change the graphics
    ld a, 0
    ld [rLCDC], a

    ld a, [gameState]
    cp 0
    call z, LoadStartScreen
    cp 1
    call z, LoadWorldMap

    ;Turn on lcd
    ld a, LCDC_ON | LCDC_BG_ON
    ld [rLCDC], a

    ;Set pallette
    ld a, %11100100
    ld [rBGP], a

    ret

LoadWorldMap:
    ;Copy tile data
    ld de, World
    ld hl, $9000
    ld bc, 4 * 16
    call CopyTiles

    ;Copy tile map
    ld de, WorldTileMap
    ld hl, $9800
    ld bc, WorldTileMapWidth * WorldTileMapHeight
    call CopyTilemap

    ret

LoadStartScreen:
    ;Copy tile data
    ld de, HelloWorld_Tiles
    ld hl, $9000
    ld bc, HelloWorld_TilesEnd - HelloWorld_Tiles
    call CopyTiles

    ;Copy tile map
    ld de, HelloWorldmap
    ld hl, $9800
    ld bc, HelloWorldmapEnd - HelloWorldmap
    call CopyTilemap

    ret