; Arcadia 2001 - code.asm
; By Adam Trionfo - ballyalley @ hotmail.com
;
; Version 1.0 - April 21, 2002
;
; Signetics 2650 source-code for the Arcadia 2001 console.
;
; This program prints 'HELLO WORLD' to the screen.
;
; This file assembles well under VACS v1.24/w32 (by W.H. Taphoorn; updated by D.D. Spreen)
;
;      asm32.exe code.asm
;
	name code			; module name

	include	"arcadia.h"	; v1.01

	ORG		0000H		; Start of Arcadia ROM

programentry:
	eorz	r0				; Zero-out register 0
	bctr,un	programstart	; Branch to start of program
	retc,un					; Called on VSYNC or VBLANK?
							; As suggested by Paul Robson

programstart:
	ppsu	00100000b	; Set Interrupt Inhibit bit
						; The Tech doc that Paul
						; wrote infers that Inter-
						; rupts aren't used

; Scroll Screen
	lodi,r0	0f8h
	stra,r0	CRTCVPR

; Set Screen High-Resolution
;	lodi,r0	01000000b	; normal Mode
	lodi,r0	11000000b	; block Mode
	stra,r0	RESOLUTION	; 
; Set Background Color to blue
	lodi,r0	10000111b	; Put Black (07h) & CSET_A into reg 0 
;	lodi,r0	10001110b	; Put Black (07h) & CSET_B into reg 0 
	stra,r0	BGCOLOUR	; Bits 0-2 of 19F9h control
						; background color

; Set Screen Low-Resolution
;	lodi,r0	00000000b	; normal Mode
;	lodi,r0	10000000b	; block Mode
;	stra,r0	RESOLUTION	; 
; Set Background Color to blue
;	lodi,r0	00000111b	; Put Black (07h) & CSET_A into reg 0 
;	lodi,r0	00001111b	; Put Black (07h) & CSET_B into reg 0 
;	stra,r0	BGCOLOUR	; Bits 0-2 of 19F9h control
;						; background color

; Print message onto screen 
	ppsl	00000010b	; unsigned compare start
	lodi,r1	000h
	lodi,r3	000h

displaymessage00:
	lodi,r0	000h

displaymessagexx:
	stra,r0	SCRUPDATA,r3
	addi,r3	001h
	addi,r1	001h
	lodz	r1
	comi,r0	040h
	bctr,eq	(displaymessage00)
	comi,r0	0c0h
	bctr,eq	(displaymessage00)
	comi,r1	0d0h
	bcfr,eq	(displaymessagexx)
	cpsl	00000010b	; unsigned compare end

	ppsl	00000010b	; unsigned compare start
	lodi,r1	000h
	lodi,r3	000h

displaymessage00_1:
	lodi,r0	000h

displaymessagexx_1:
	stra,r0	SCRLODATA,r3
	addi,r3	001h
	addi,r1	001h
	lodz	r1
	comi,r0	040h
	bctr,eq	(displaymessage00_1)
	comi,r0	0c0h
	bctr,eq	(displaymessage00_1)
	comi,r1	0d0h
	bcfr,eq	(displaymessagexx_1)
	cpsl	00000010b	; unsigned compare end

; Loop forever
loopforever:
	bctr,un	loopforever

      end ; End of assembly
