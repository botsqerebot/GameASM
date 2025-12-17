INCLUDE "include.asm"

section "Header", ROM0[$100]

    jp Entrypoint

    ds $150 - @, 0 ; Make room for the header

Entrypoint: 
    ; Turn off audio
    ld a, 0
    ld [rNR52], a
    
    ;How many steps the player can walk each second
    ld a, 16
    ld [walkingSteps], a

    ;Initialize variables that will be 0 at boot.
    ld a, 0
    ld [currentSteps], a            ;How many steps the player has taken in an interval, always set to 0 at start
    ld [walkCooldown], a            ;A cooldown to make movement slower or to pause it. If movement not wanted at start set to high number (max 255)
    ld [currentWayWalking], a       ;The way the player is wakling right now, not walking at boot.

    
;--------------------------------------------------------------
;The WaitVBlank function is only running on startup to load 
;all the tiles to ram 
;It does so saftly by turning off the lcd to copy them saftely.

;The main loop has a mini version where it does not turn off the screen
;becuase it doesent transfer lots of data to ram
;--------------------------------------------------------------
call WaitVBlank


;My main loop of the game. Basically a main(){} in c
MainLoop:
    ;Wait for vblank
    ld a, [rLY]
    cp 144
    jp c, MainLoop

    call walkCooldownTick ;Function that disables movment if not ready

    ;Increse the frame counter every frame
    ld a, [wFramesCounter]
    inc a
    ld [wFramesCounter], a

    call InputButton        ;Takes the input
    ld [currentInput], a    ;Stores the current input

    call WalkingAni          ;Handels moving the background simulating walking

    jp MainLoop 


PrintA:
    deb_msg A_msg
    ret

A_msg:
    db "A=%A%", 0
