;------------------------------------------------------------------------------------------
;Goes 8 pixels up each second, disables movement for 1 second before its accessable.
;These are just copies of each other.

;To copy remember to call walkCooldownTick each frame in the main MainLoop
;------------------------------------------------------------------------------------------

;Called each frame in the main loop and removes 1 each frame
;to decreese the

AdvWalkUp2:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, AdvWalkUp2_End

    ;Moves the screen
    ld a, [walkingSteps]
    ld b, a
    ld a, [rSCY]
    sub b
    ld [rSCY], a

    ;Restarts the walkCooldown
    ld a, 60
    ld [walkCooldown], a
AdvWalkUp2_End:
    ret

walkCooldownTick:
    ld a, [walkCooldown]
    or a                        ;"or" checks if the value is 0, same as doing cp 0
    jr z, walkCooldownTick_End
    dec a
    ld [walkCooldown], a

walkCooldownTick_End:
    ret

;Walk functions
AdvWalkUp:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, AdvWalkUp_End

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





;------------------------------------------------------------
;Old walk code, walks 1 pixel each frame

;The ScrollX and ScrollY variable is removed, use rSCY and rSCX instead directealy
;------------------------------------------------------------

WalkUp:
    ld a, [ScrollY]
    dec a
    ld [ScrollY], a
    ld [rSCY], a
    ret

WalkDown:
    ld a, [ScrollY]
    inc a
    ld [ScrollY], a
    ld [rSCY], a
    ret

WalkLeft:
    ld a, [ScrollX]
    dec a
    ld [ScrollX], a
    ld [rSCX], a
    ret

WalkRight:
    ld a, [ScrollX]
    inc a
    ld [ScrollX], a
    ld [rSCX], a
    ret

