;-------------------------------------------------------------------------
;
; arcadia.h 
; for the Emerson Arcadia 2001 family
; based on the hardware equates/memory map by James Jacobs and the
; Technical Information written by Paul Robson
;
; v1.00  2003/04  Dennis D. Spreen (initial release)
; v1.01  2003/04  Dennis D. Spreen (fixed sprite ptrs, added more infos)
; customize 2022/09/20 J.Noguchi (EQU -> SET )
;
;-------------------------------------------------------------------------

; Memory Map
; 
;  $0000..$0FFF are ROM (first 4K of cartridge)
;  $1000..$17FF are unmapped
;  $1800..$18CF are upper screen display
;  $18D0..$18EF are user RAM
;  $18F0..$19FF are control registers
;  $1A00..$1ACF are lower screen display
;  $1AD0..$1AFF are user RAM
;  $1B00..$1FFF are unmapped
;  $2000..$7FFF are ROM (last 24K of cartridge)

;-------------------------------------------------------------------------

SCRUPDATA	SET	(1800H + BASIS)	;$1800..$18CF are upper screen display
SCRLODATA	SET	(1A00H + BASIS)	;$1A00..$1ACF are lower screen display

;-------------------------------------------------------------------------

RAM1	SET	(18D0H + BASIS)	;$18D0..$18EF are user RAM1 - 32 Byte 
RAM2	SET	(18F8H + BASIS)	;$18F8..$18FB are user RAM2 -  4 Byte
RAM3	SET	(1AD0H + BASIS)	;$1AD0..$1AFF are user RAM3 - 48 Byte

;-------------------------------------------------------------------------

SPRITE0Y	SET	(18F0H + BASIS)	;sprite 0 y-position
SPRITE0X	SET	(18F1H + BASIS)	;sprite 0 x-position
SPRITE1Y	SET	(18F2H + BASIS)	;sprite 1 y-position
SPRITE1X	SET	(18F3H + BASIS)	;sprite 1 x-position
SPRITE2Y	SET	(18F4H + BASIS)	;sprite 2 y-position 
SPRITE2X	SET	(18F5H + BASIS)	;sprite 2 x-position
SPRITE3Y	SET	(18F6H + BASIS)	;sprite 3 y-position
SPRITE3X	SET	(18F7H + BASIS)	;sprite 3 x-position

;-------------------------------------------------------------------------

CRTCVPR	SET	(18FCH + BASIS)	;crtc vertical position register

PITCH	SET	(18FDH + BASIS)	;pitch and alternate character mode selector
			;bit  7:    0 = normal mode
			;           1 = alternate character mode color2x2 
			;               (2 backgrounds, 2 foreground colours)
			;bits 6..0: pitch

VOLUMESCROLL	SET	(18FEH + BASIS)	;volume and scanline scrolling
			;bits 7..5: horizontal scanline scrolling
			;bits 4: noise on/off
			;bits 3: tones on/off
			;bits 2..0: volume(0..7)

CHARLINE	SET	(18FFH + BASIS)	;1111xxxx current character line (lower 4 bits only, the 4 most 
			;         significant bits are always '1'). The 4 least significant 
			;         bits of this count 0123456789ABC0123456789ABC, going to D 
			;         when in vertical blank
;-------------------------------------------------------------------------

P1LEFTKEYS	SET	(1900H + BASIS)	;player 1 left keys
			;bits 7..4: unknown
			;bit  3:    p1 (left) '1' button
			;bit  2:    p1 (left) '4' button
			;bit  1:    p1 (left) '7' button
			;bit  0:    p1 (left) 'E' button (Enter)

P1MIDDLEKEYS	SET	(1901H + BASIS)	;player 1 middle keys
			;bit  3:    p1 (left) '2' button
			;bit  2:    p1 (left) '5' button
			;bit  1:    p1 (left) '8' button
			;bit  0:    p1 (left) '0' button

P1RIGHTKEYS	SET	(1902H + BASIS)	;player 1 right keys
			;bits 7..4: unknown
			;bit  3:    p1 (left) '3' button
			;bit  2:    p1 (left) '6' button
			;bit  1:    p1 (left) '9' button
			;bit  0:    p1 (left) 'C' button (Clear)

P1PALLADIUM	SET	(1903H + BASIS)	;player 1 palladium keys
			;bits 7..4: unknown
			;bit  3:    p1 (right) Palladium button #1
			;bit  2:    p1 (right) Palladium button #2
			;bit  1:    p1 (right) Palladium button #3
			;bit  0:    p1 (right) Palladium button #4

P2LEFTKEYS	SET	(1904H + BASIS)	;player 2 left keys
			;bits 7..4: unknown
			;bit  3:    p2 (right) '1' button
			;bit  2:    p2 (right) '4' button
			;bit  1:    p2 (right) '7' button
			;bit  0:    p2 (right) 'E' button (Enter)

P2MIDDLEKEYS	SET	(1905H + BASIS)	;player 2 middle keys
			;bits 7..4: unknown
			;bit  3:    p2 (right) '2' button
			;bit  2:    p2 (right) '5' button
			;bit  1:    p2 (right) '8' button
			;bit  0:    p2 (right) '0' button

P2RIGHTKEYS	SET	(1906H + BASIS)	;player 2 right keys
			;bits 7..4: unknown
			;bit  3:    p2 (right) '3' button
			;bit  2:    p2 (right) '6' button
			;bit  1:    p2 (right) '9' button
			;bit  0:    p2 (right) 'C' button (Clear)

P2PALLADIUM	SET	(1907H + BASIS)	;player 2 palladium keys
			;bits 7..4: unknown
			;bit  3:    p2 (right) Palladium button #1
			;bit  2:    p2 (right) Palladium button #2
			;bit  1:    p2 (right) Palladium button #3
			;bit  0:    p2 (right) Palladium button #4

CONSOLE	SET	(1908H + BASIS)	;console buttons
			;bits 7..3: unknown
			;bit  2:    DIFFICULTY button
			;bit  1:    OPTION button
			;bit  0:    START button

;-------------------------------------------------------------------------

; $1909..$197F: unmapped

SPRITE0DATA	SET	(1980H + BASIS)	;$1980..$1987: sprite #0
SPRITE1DATA	SET	(1988H + BASIS)	;$1988..$198F: sprite #1
SPRITE2DATA	SET	(1990H + BASIS)	;$1990..$1997: sprite #2
SPRITE3DATA	SET	(1998H + BASIS)	;$1998..$199F: sprite #3

UDC0DATA	SET	(19A0H + BASIS)	;$19A0..$19A7: user-defined character #0
UDC1DATA	SET	(19A8H + BASIS)	;$19A8..$19AF: user-defined character #1
UDC2DATA	SET	(19B0H + BASIS)	;$19B0..$19B7: user-defined character #2
UDC3DATA	SET	(19B8H + BASIS)	;$19B8..$19BF: user-defined character #3


; $19C0..$19F7: unmapped

RESOLUTION	SET	(19F8H + BASIS)	;screen resolution
			;bit  7: 0 = normal mode
			;        1 = block graphics mode
			;bit  6: 0 = low-res mode
			;        1 = high-res mode
			;bits 5..0: rectangle descriptions in block graphics mode

BGCOLOUR	SET	(19F9H + BASIS)	;background colour and sprite settings
			;bit  7:    0 = doublescanned sprites
			;           1 = singlescanned sprites
			;bit  6:    paddle interpolation (switches between the axes of the analog sticks)
			;bits 5..3: colours of tile set 0
			;bits 2..0: background colour

			; Colour Code    Name    Colour Elements
			; ------ ----    ----    ---------------
			;  7     111     Black   (GRB = 000)
			;  6     110     Blue    (GRB = 001)
			;  5     101     Red     (GRB = 010)
			;  4     100     Magenta (GRB = 011)
			;  3     011     Green   (GRB = 100)
			;  2     010     Cyan    (GRB = 101)
			;  1     001     Yellow  (GRB = 110)
			;  0     000     White   (GRB = 111)


SPRITES23CTRL	SET	(19FAH + BASIS)	;sprites 2 & 3 control settings
			;bit  7:    0 = sprite #2 normal
			;           1 = sprite #2 double-height
			;bit  6:    0 = sprite #3 normal
			;           1 = sprite #3 double-height
			;bits 5..3: colours of sprite #2
			;bits 2..0: colours of sprite #3

SPRITES01CTRL	SET	(19FBH + BASIS)	;sprites 0 & 1 control settings
			;bit  7:    0 = sprite #0 normal
			;           1 = sprite #0 double-height
			;bit  6:    0 = sprite #1 normal
			;           1 = sprite #1 double-height
			;bits 5..3: colours of sprite #0
			;bits 2..0: colours of sprite #1

BGCOLLIDE	SET	(19FCH + BASIS)	;background collision detection
			;bits 7..4: unknown
			;bits 3..0: collision between sprites #3..#0 (respectively) and the background

SPRITECOLLIDE	SET	(19FDH + BASIS)	;sprite collision detection
			;bits 7..6: unknown
			;bit 5:     sprite #2/#3 collision
			;bit 4:     sprite #1/#3 collision
			;bit 3:     sprite #1/#2 collision
			;bit 2:     sprite #0/#3 collision
			;bit 1:     sprite #0/#3 collision
			;bit 0:     sprite #0/#3 collision

;-------------------------------------------------------------------------

P2PADDLE	SET	(19FEH + BASIS)	;player 2 paddle
P1PADDLE	SET	(19FFH + BASIS)	;player 1 paddle

;-------------------------------------------------------------------------

end