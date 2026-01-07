SetupCharacter:
    ld hl, _OAMRAM
    ld de, CharacterSpriteData
    ld b, 8 ;  8 Tiles

.loop:
    ;Y position
    ld a, [de]
    ld c, a
    ld a, [CharacterYOffset]
    add c
    inc de
    ld [hli], a

    ;X position
    ld a, [de]
    ld c, a
    ld a, [CharacterXOffset]
    add c
    inc de
    ld [hli], a

    ;Tile ID
    ld a, [de]
    inc de
    ld [hli], a

    ;Attributes (0 right now)
    xor a
    ld [hli], a

    dec b
    jr nz, .loop
    ret




CharacterSpriteData:
    ; Y, X, Tile ID
    db SCREEN_HEIGHT_PX / 2,            SCREEN_WIDTH_PX / 2,        0
    db SCREEN_HEIGHT_PX / 2,            SCREEN_WIDTH_PX / 2 + 8,    1

    db SCREEN_HEIGHT_PX / 2 + 8,        SCREEN_WIDTH_PX / 2,        2
    db SCREEN_HEIGHT_PX / 2 + 8,        SCREEN_WIDTH_PX / 2 + 8,    3

    db SCREEN_HEIGHT_PX / 2 + 16,       SCREEN_WIDTH_PX / 2,        4
    db SCREEN_HEIGHT_PX / 2 + 16,       SCREEN_WIDTH_PX / 2 + 8,    5

    db SCREEN_HEIGHT_PX / 2 + 24,       SCREEN_WIDTH_PX / 2,        6
    db SCREEN_HEIGHT_PX / 2 + 24,       SCREEN_WIDTH_PX / 2 + 8,    7