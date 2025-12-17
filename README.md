# GameASM

# Updating the tiles using Gameboy Tile Designer

Export Settings:

Type: RGBDS Assembly file (\*.z80)

From: 0 - (Number of tiles - 1)

Format: Gameboy 4 color

Counter: None

# Updating the tilemap from Gameboy Map builder

Make sure it is at least 32x32 tiles (says 31 in the builder since it starts at 0)

Export Settings:

Type: RGBDS Assembly file (\*.z80)

Split data: No

Property: [Tile number]

Bits: 7

Map layout: Row

Plane count: 1 plane (8 bits)

Plane order: Tiles are continues

Tile offset: 0

# When the tilemap is exported change:

```asm
Example:
TileMapWidth EQU 32

To:
DEF TileMapWidth EQU 32

And remove the section
SECTION "FirstMap", HOME

To:

;SECTION "FirstMap", HOME
```

# How to run

Run make in terminal

```bash
make
```

After that download an emulator and run the .gb file
