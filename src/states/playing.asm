
Playing_State:
    call walkCooldownTick ;Function that disables movment if not ready

    call WalkingAni          ;Handels moving the background simulating walking

    ld a, [currentInput]
    bit 3, a
    jp nz, GoToStart_State


    ret

GoToStart_State:
    ld a, 0
    ld [gameState], a
    ld [rSCY], a
    ld [rSCX], a
    ld [currentWayWalking], a
    ld [currentSteps], a
    ld [walkCooldown], a

    call WaitVBlank
    ret
