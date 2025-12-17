StartScreen_State:
    ld a, [currentInput]
    bit 0, a
    jp nz, GoToGame_State

    ret

GoToGame_State:
    ld a, 1
    ld [gameState], a
    call WaitVBlank

    ld a, [lastCoorY]
    ld [rSCY], a
    
    ld a, [lastCoorX]
    ld [rSCX], a

    ret
