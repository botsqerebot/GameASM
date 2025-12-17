;------------------------------------------------------------------------------------------
;To use remember to call walkCooldownTick each frame in the main MainLoop
;------------------------------------------------------------------------------------------

;A walking tick that disables movement
walkCooldownTick:
    ld a, [walkCooldown]
    or a                        ;"or" checks if the value is 0, same as doing cp 0
    jr z, walkCooldownTick_End
    dec a
    ld [walkCooldown], a

walkCooldownTick_End:
    ret


Walk:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, Walk_End

    ;ld a, 0
    ;ld [currentWayWalking], a

    ld a, 15
    ld [walkCooldown], a

    ;Basically if statements to see what direction to walk
    ld a, [currentWayWalking]
    cp 1
    jp z, WalkUP
    
    cp 2
    jp z, WalkDown

    cp 3
    jp z, WalkLeft

    cp 4
    jp z, WalkRight
   

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

Walk_End:
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

;Resets the current steps taken variable and the current way walking
ResetWalk:
    ld a, 0
    ld [currentWayWalking], a

    ld a, 0
    ld [currentSteps], a

    ret



;---------------------------------------------------------
;Old walking code.
;This takes steps in full, aka if i set it to go 
;16 pixels it will do that instantly and add a 1 second 
;timer as a cooldown
;---------------------------------------------------------

Stutter_WalkUp:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, Stutter_WalkUp_End
    
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
Stutter_WalkUp_End:
    ret

Stutter_WalkDown:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, Stutter_WalkDown_End

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
Stutter_WalkDown_End:
    ret

Stutter_WalkLeft:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, Stutter_WalkLeft_End

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
Stutter_WalkLeft_End:
    ret

Stutter_WalkRight:
    ;Check if the walk cooldown is over
    ld a, [walkCooldown]
    cp 0
    jp nz, Stutter_WalkRight_End

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
Stutter_WalkRight_End:
    ret

