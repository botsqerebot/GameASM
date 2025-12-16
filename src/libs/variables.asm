section "Variables", wram0

;Screen variables
ScrollY: ds 1           ;Not used
ScrollX: ds 1           ;Not used
wFramesCounter: ds 1


currentInput: ds 1

;Walking variables
walkCooldown: ds 1
walkingSteps: ds 1
currentSteps: ds 1

;--------------------------------------------------------
;0 = UP
;1 = Down
;2 = Left
;3 = Right
currentWayWalking: ds 1