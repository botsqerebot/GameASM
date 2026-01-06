WalkingAni:
    call SaveCoordiate2

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

    ;ld a, [currentWayWalking]
    ;cp 0
    ;jp z, SaveCoordiate
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


;Save the last coordinate so that if i change scene i can 
;go back to the same spot
SaveCoordiate:
    ;debug_message "Saving coordinate"
    ld a, [rSCY]
    ld [lastCoorY], a

    ld a, [rSCX]
    ld [lastCoorX], a
    
    ret

increese:
    ld a, b
    inc a
    ld b, a
    ret


SaveCoordiate2:
    ld a, 0
    ld b, a
    ld a, [rSCY]
    and $0F
    cp 0
    call z, increese

    ld a, [rSCX]
    and $0F
    cp 0
    call z, increese

    ld a, b
    cp 2
    call z, SaveCoordiate
    ret

