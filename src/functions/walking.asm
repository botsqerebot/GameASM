WalkingAni:
    ld a, [currentInput]

    and %11110000
    jp z, WalkingAni_NoInput

    ;Check if already walking
    ld a, [currentWayWalking]
    cp 0
    jp nz, WalkingAni_AlreadyWalking

    ;Not walking yet, set direction first
    ld a, [currentInput]

    bit 6, a               ;Check if dpad is up
    jp nz, SetDirUp_AndWalk
    
    bit 7, a                ;Check if dpad is down
    jp nz, SetDirDown_AndWalk
    
    bit 5, a                ;Check if dpad is left
    jp nz, SetDirLeft_AndWalk
    
    bit 4, a                ;Check if dpad is right
    jp nz, SetDirRight_AndWalk

    jp WalkingAni_End

SetDirUp_AndWalk:
    ld a, 1
    ld [currentWayWalking], a
    call AWalk
    ret

SetDirDown_AndWalk:
    ld a, 2
    ld [currentWayWalking], a
    call AWalk
    ret

SetDirLeft_AndWalk:
    ld a, 3
    ld [currentWayWalking], a
    call AWalk
    ret

SetDirRight_AndWalk:
    ld a, 4
    ld [currentWayWalking], a
    call AWalk
    ret

WalkingAni_AlreadyWalking:
    call AWalk
    ret

WalkingAni_NoInput:
    ;No button pressed, reset walking state
    call ResetWalk
    ret

WalkingAni_End:
    ret
