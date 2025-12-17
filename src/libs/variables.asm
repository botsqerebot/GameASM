section "Variables", wram0

;Screen variables
ScrollY: ds 1           ;Not used
ScrollX: ds 1           ;Not used
wFramesCounter: ds 1

;--------------------------------------------------------
;   Bit 0-3:    Buttons
;   Bit 4-7:    DPad

;   Bit 0   A       Mask $01
;   Bit 1   B       Mask $02
;   Bit 2   Select  Mask $04
;   Bit 3   Start   Mask $08

;   Bit 4   Right   Mask $10
;   Bit 5   Left    Mask $20
;   Bit 6   Up      Mask $40
;   Bit 7   Down    Mask $80
currentInput: ds 1

;--------------------------------------------------------

;Walking variables

;--------------------------------------------------------
;A cooldown that makes it so i can make movement seem slower
walkCooldown: ds 1

;--------------------------------------------------------
;How many steps to take in total each time you press a
;directional pad
walkingSteps: ds 1

;--------------------------------------------------------
;The current amount of steps taken in one turn
currentSteps: ds 1

;--------------------------------------------------------
;0 = None
;1 = UP
;2 = Down
;3 = Left
;4 = Right
currentWayWalking: ds 1