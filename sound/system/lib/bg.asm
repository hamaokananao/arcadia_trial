	NOLIST
;=============================================================
; bg.asm BG処理ライブラリ
;=============================================================
;=============================================================
; r0の値表示。PTR1=書き込み先アドレス
;=============================================================
	LIST
DSP_R0:
	strz	r1
	rrr,r0
	rrr,r0
	rrr,r0
	rrr,r0
	andi,r0	0fh
	addi,r0	10h
	stra,r0	*PTR1
	loda,r0	PTR1+1
	addi,r0	1
	stra,r0	PTR1+1
	andi,r1	0fh
	addi,r1	10h
	stra,r1	*PTR1
	retc,un

	NOLIST
;=============================================================
; BG消去
;=============================================================
	LIST
CLEAR_BG:
 CLR_FIL	SET	000h
 CLR_LEN	SET	0d0h
 CLR_POS	SET	(SCRUPDATA+16*0+0)

	lodi,r0	CLR_POS / 0100h
	stra,r0	PTR1
	lodi,r0	CLR_POS & 00ffh
	stra,r0	PTR1+1
	lodi,r0	CLR_FIL
	stra,r0	PTR2
	lodi,r1	CLR_LEN
	bsta,un	FIL_MEM
	retc,un

	NOLIST
;=============================================================
; BG読み取り r0:x座標,r1:y座標
;=============================================================
	LIST
GET_BG:
	rrr,r0
	rrr,r0
	rrr,r0
	andi,r0	00fh
	rrl,r1
	andi,r1	0f0h
	addz	r1
	stra,r0	PTR1+1
	lodi,r0	SCRUPDATA / 100h
	stra,r0	PTR1
	loda,r0	*(PTR1)
	retc,un

	NOLIST
;=============================================================
; BG書き込み r0:x座標,r1:y座標,r2:書き込みデータ
;=============================================================
	LIST
SET_BG:
	rrr,r0
	rrr,r0
	rrr,r0
	andi,r0	00fh
	rrl,r1
	andi,r1	0f0h
	addz	r1
	stra,r0	PTR1+1
	lodi,r0	SCRUPDATA / 100h
	stra,r0	PTR1
	stra,r2	*(PTR1)
	retc,un

	end