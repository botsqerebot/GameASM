SetupCharacter:
    ;Tile 0
    ld hl, _OAMRAM
    ld a, SCREEN_HEIGHT_PX / 2 - 16
    ld [hli], a
    ld a, SCREEN_WIDTH_PX / 2 - 8
    ld [hli], a
    ld a, 0
    ld [hli], a
    ld [hli], a

    ;Tile 1
    ld a, SCREEN_HEIGHT_PX / 2 - 16
    ld [hli], a
    ld a, SCREEN_WIDTH_PX / 2
    ld [hli], a
    ld a, 1
    ld [hli], a
    ld [hli], a

    ;Tile 2
    ld a, SCREEN_HEIGHT_PX / 2 - 8
    ld [hli], a
    ld a, SCREEN_WIDTH_PX / 2 - 8
    ld [hli], a
    ld a, 2
    ld [hli], a
    ld [hli], a

    ;Tile 3
    ld a, SCREEN_HEIGHT_PX / 2 - 8
    ld [hli], a
    ld a, SCREEN_WIDTH_PX / 2 
    ld [hli], a
    ld a, 3
    ld [hli], a
    ld [hli], a

    ;Tile 4
    ld a, SCREEN_HEIGHT_PX / 2
    ld [hli], a
    ld a, SCREEN_WIDTH_PX / 2 - 8
    ld [hli], a
    ld a, 4
    ld [hli], a
    ld [hli], a

    ;Tile 5
    ld a, SCREEN_HEIGHT_PX / 2
    ld [hli], a
    ld a, SCREEN_WIDTH_PX / 2
    ld [hli], a
    ld a, 5
    ld [hli], a
    ld [hli], a

    ;Tile 6
    ld a, SCREEN_HEIGHT_PX / 2 + 8
    ld [hli], a
    ld a, SCREEN_WIDTH_PX / 2 - 8
    ld [hli], a
    ld a, 6
    ld [hli], a
    ld [hli], a

    ;Tile 7
    ld a, SCREEN_HEIGHT_PX / 2 + 8
    ld [hli], a
    ld a, SCREEN_WIDTH_PX / 2
    ld [hli], a
    ld a, 7
    ld [hli], a
    ld [hli], a
    ret

    