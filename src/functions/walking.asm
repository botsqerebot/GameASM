WalkingAni:
    ld a, [currentWayWalking]
    cp 0
    jp nz, Walk

    ld a, [currentInput]

    bit 6, a               ;Check if dpad is up
    jp nz, SetDirUp_AndWalk
    
    bit 7, a                ;Check if dpad is down
    jp nz, SetDirDown_AndWalk
    
    bit 5, a                ;Check if dpad is left
    jp nz, SetDirLeft_AndWalk
    
    bit 4, a                ;Check if dpad is right
    jp nz, SetDirRight_AndWalk

    ret

SetDirUp_AndWalk:
    ld a, 1
    ld [currentWayWalking], a
    call Walk
    ret

SetDirDown_AndWalk:
    ld a, 2
    ld [currentWayWalking], a
    call Walk
    ret

SetDirLeft_AndWalk:
    ld a, 3
    ld [currentWayWalking], a
    call Walk
    ret

SetDirRight_AndWalk:
    ld a, 4
    ld [currentWayWalking], a
    call Walk
    ret
