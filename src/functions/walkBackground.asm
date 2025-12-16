;------------------------------------------------------------------------------------------
;Goes 8 pixels up each second, disables movement for 1 second before its accessable.
;These are just copies of each other.

;To copy remember to call walkCooldownTick each frame in the main MainLoop
;------------------------------------------------------------------------------------------

;Called each frame in the main loop and removes 1 each frame
;to decreese the

;Resets the current steps taken variable and the current way walking
ResetWalk:
    ld a, 0
    ld [currentWayWalking], a

    ld a, 0
    ld [currentSteps], a

    ret

;A walking tick that disables movement
walkCooldownTick:
    ld a, [walkCooldown]
    or a                        ;"or" checks if the value is 0, same as doing cp 0
    jr z, walkCooldownTick_End
    dec a
    ld [walkCooldown], a

walkCooldownTick_End:
    ret


AWalk:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, AWalk_End

    ;ld a, 0
    ;ld [currentWayWalking], a

    ld a, 15
    ld [walkCooldown], a

    ;Loading screen position, This is what changes the direction
    ld a, [currentWayWalking]
    cp 1
    jp z, WalkUP
    
    cp 2
    jp z, WalkDown

    cp 3
    jp z, WalkLeft

    cp 4
    jp z, WalkRight
   
    
AWalk_End:
    ret
AfterSteps:
    ld a, [currentSteps]
    inc a
    ld [currentSteps], a

    ld a, [currentSteps]
    ld b, a
    ld a, [walkingSteps]
    cp b
    jr z, ResetWalk
    ret


WalkUP:
    ld a, [rSCY]
    dec a
    ld [rSCY], a
    jr AfterSteps

WalkDown:
    ld a, [rSCY]
    inc a
    ld [rSCY], a
    jr AfterSteps

WalkLeft:
    ld a, [rSCX]
    dec a
    ld [rSCX], a
    jr AfterSteps

WalkRight:
    ld a, [rSCX]
    inc a
    ld [rSCX], a
    jr AfterSteps











;Walk functions
AdvWalkUp:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, AdvWalkUp_End
    
    ld a, [currentInput]
    call PrintA
    ;Moves the screen
    ld a, [walkingSteps]
    ld b, a
    ld a, [rSCY]
    sub b
    ld [rSCY], a

    ;Restarts the walkCooldown
    ld a, 60
    ld [walkCooldown], a
AdvWalkUp_End:
    ret

AdvWalkDown:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, AdvWalkDown_End

    ld a, [currentInput]
    call PrintA
    ;Moves the screen
    ld a, [walkingSteps]
    ld b, a
    ld a, [rSCY]

    add b
    ld [rSCY], a

    ;Restarts the walkCooldown
    ld a, 60
    ld [walkCooldown], a
AdvWalkDown_End:
    ret

AdvWalkLeft:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, AdvWalkLeft_End

    ld a, [currentInput]
    call PrintA
    ;Moves the screen
    ld a, [walkingSteps]
    ld b, a
    ld a, [rSCX]
    sub b
    ld [rSCX], a

    ;Restarts the walkCooldown
    ld a, 60
    ld [walkCooldown], a
AdvWalkLeft_End:
    ret

AdvWalkRight:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, AdvWalkRight_End

    ld a, [currentInput]
    call PrintA
    ;Moves the screen
    ld a, [walkingSteps]
    ld b, a
    ld a, [rSCX]
    add b
    ld [rSCX], a

    ;Restarts the walkCooldown
    ld a, 60
    ld [walkCooldown], a
AdvWalkRight_End:
    ret

