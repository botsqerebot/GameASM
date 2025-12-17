;Liberaries and global variables
INCLUDE "libs/hardware.inc"
INCLUDE "libs/variables.asm"


SECTION "GameCode", ROM0
;Functions
INCLUDE "functions/walkBackground.asm"
INCLUDE "functions/printConsole.asm"
INCLUDE "functions/CopyTiles.asm"
INCLUDE "functions/walking.asm"
INCLUDE "functions/VBlank.asm"
INCLUDE "functions/input.asm"


SECTION "TileData", ROM0

;TileMaps
INCLUDE "textures/Tilemap/First.z80"
INCLUDE "textures/Tilemap/hello_world.asm"


;Tiles
INCLUDE "textures/Tiles/Export.z80"
INCLUDE "textures/Tiles/hello_world.asm"

