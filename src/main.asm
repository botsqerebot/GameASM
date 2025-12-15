INCLUDE "include.asm"

section "Header", ROM0[$100]

    jp Entrypoint

    ds $150 - @, 0 ; Make room for the header

Entrypoint: 
    ; Turn off audio
    ld a, 0
    ld [rNR52], a
    
    ;Initialize the screen coordinates
    ld a, [rSCY]
    ld [ScrollY], a

    ld a, [rSCX]
    ld [ScrollX], a
    
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
