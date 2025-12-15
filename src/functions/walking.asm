WalkingAni:
    bit 6, a               ;Check if dpad is up
    call nz, AdvWalkUp
    ld a, [currentInput]

    bit 7, a                ;Check if dpad is down
    call nz, AdvWalkDown
    ld a, [currentInput]
    
    bit 5, a                ;Check if dpad is left
    call nz, AdvWalkLeft
    ld a, [currentInput]

    bit 4, a                ;Check if dpad is right
    call nz, AdvWalkRight
    ld a, [currentInput]

    ret