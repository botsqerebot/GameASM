
;Do not turn off lcd outside of VBlank
WaitVBlank:
    ld a, [rLY]
    cp 144
    jp c, WaitVBlank
    
    ;Turn off lcd to change the graphics
    ld a, 0
    ld [rLCDC], a

    ;Copy tile data
    ld de, TileLabel
    ld hl, $9000
    ld bc, 4 * 16
    call CopyTiles

    ;ld de, Tiles2
    ;ld hl, $9000 + (TilesEnd - Tiles)
    ;ld bc, Tiles2End - Tiles2
    ;call CopyTiles

    ;Copy tile map
    ld de, FirstTileMap
    ld hl, $9800
    ld bc, FirstTileMapWidth * FirstTileMapHeight
    call CopyTilemap

    ;Turn on lcd
    ld a, LCDC_ON | LCDC_BG_ON
    ld [rLCDC], a

    ;Set pallette
    ld a, %11100100
    ld [rBGP], a

    ret