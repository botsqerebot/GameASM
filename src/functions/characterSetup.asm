ChangeCharacterSpritesDir:
    ld a, [FlipSpritesDir]
    cp 0
    ret z
    cp 1
    ;jp z, SetupCharacterUp

    cp 2
    ;jp z, SetupCharacterDown

    cp 3
    jp z, SetupCharacterLeft

    cp 4
    jp SetupCharacterRight
    ret


SetupCharacterRight:
    ;Checks is the last sprites sets it the same as its trying to do now
    ld a, [CurrentFlipSpritesDir]
    cp 4
    ret z

    ;Sets the last direction to be right to be safer with cpu usage.
    ld a, 4
    ld [CurrentFlipSpritesDir], a

    ;The start of setting the sprites direction
    ld hl, _OAMRAM
    ld de, CharacterSpriteData
    ld b, 8 ;  8 Tiles
    jp LoadSpriteLoop

SetupCharacterLeft:
    ;Checks is the last sprites sets it the same as its trying to do now
    ld a, [CurrentFlipSpritesDir]
    cp 3
    ret z

    ;Sets the last direction to be right to be safer with cpu usage.
    ld a, 3
    ld [CurrentFlipSpritesDir], a

    ld hl, _OAMRAM
    ld de, CharacterSpriteDataLeft
    ld b, 8 ;  8 Tiles
    jp LoadSpriteLoop

LoadSpriteLoop:
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

    ld a, [FlipSpritesDir]
    cp 3
    call z, flipSprites
    call nz, notFlipSprites

    dec b
    jr nz, LoadSpriteLoop
    ret


flipSprites:
    ;Attributes (0 right now)
    ld a, [B_OAM_YFLIP]
    ld [hli], a
    ret
notFlipSprites:
    xor a
    ld [hli], a
    ret

CharacterSpriteData:
CharacterHead:
    ; Y, X, Tile ID
    db SCREEN_HEIGHT_PX / 2,            SCREEN_WIDTH_PX / 2,        0
    db SCREEN_HEIGHT_PX / 2,            SCREEN_WIDTH_PX / 2 + 8,    1
    
    db SCREEN_HEIGHT_PX / 2 + 8,        SCREEN_WIDTH_PX / 2,        2
    db SCREEN_HEIGHT_PX / 2 + 8,        SCREEN_WIDTH_PX / 2 + 8,    3

CharacterBody:
    db SCREEN_HEIGHT_PX / 2 + 16,       SCREEN_WIDTH_PX / 2,        4
    db SCREEN_HEIGHT_PX / 2 + 16,       SCREEN_WIDTH_PX / 2 + 8,    5

CharacterLegsStanding:
    db SCREEN_HEIGHT_PX / 2 + 24,       SCREEN_WIDTH_PX / 2,        6
    db SCREEN_HEIGHT_PX / 2 + 24,       SCREEN_WIDTH_PX / 2 + 8,    7

CharacterLegsWalking:
    db 8, 9
CharacterLegsWalkingLeft:
    db 9, 8


CharacterSpriteDataLeft:
CharacterHeadLeft:
    ; Y, X, Tile ID
    db SCREEN_HEIGHT_PX / 2,            SCREEN_WIDTH_PX / 2,            1
    db SCREEN_HEIGHT_PX / 2,            SCREEN_WIDTH_PX / 2 + 8,        0

    db SCREEN_HEIGHT_PX / 2 + 8,        SCREEN_WIDTH_PX / 2,            3
    db SCREEN_HEIGHT_PX / 2 + 8,        SCREEN_WIDTH_PX / 2 + 8,        2
CharacterBodyLeft:
    db SCREEN_HEIGHT_PX / 2 + 16,       SCREEN_WIDTH_PX / 2,            5
    db SCREEN_HEIGHT_PX / 2 + 16,       SCREEN_WIDTH_PX / 2 + 8,        4
CharacterLegsStandingLeft:
    db SCREEN_HEIGHT_PX / 2 + 24,       SCREEN_WIDTH_PX / 2,            7
    db SCREEN_HEIGHT_PX / 2 + 24,       SCREEN_WIDTH_PX / 2 + 8,        6
