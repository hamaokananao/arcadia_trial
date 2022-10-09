	NOLIST
;=============================================================
; get_key_sub.asm キー入力
;=============================================================
	LIST
	loda,r0	KEY_NOW_H
	stra,r0	KEY_OLD_H

	loda,r0	KEY_NOW_L
	stra,r0	KEY_OLD_L

	ppsl	PSL_COM	; unsigned 演算開始
	loda,r1	PAD_READ_ADDR
	comi,r1	PAD_READ_ERR
	bcfr,eq	`LOCAL_LABEL`_1
	lodi,r1	PAD_INIT	; READ ERROR! IGNORE INPUT
`LOCAL_LABEL`_1:
	lodi,r0	KEY_N
	comi,r1	PAD_NEUTRAL_LIMIT_L
	bcfr,lt	`LOCAL_LABEL`_12
	lodi,r0	KEY_U
	bctr,un	`LOCAL_LABEL`_1E
`LOCAL_LABEL`_12:
	comi,r1	PAD_NEUTRAL_LIMIT_H
	bctr,lt	`LOCAL_LABEL`_1E
	lodi,r0	KEY_D
`LOCAL_LABEL`_1E:
	cpsl	PSL_COM	; unsigned 演算終了
	loda,r1	PAD	; 
	andi,r1	PAD_MASK	; 垂直 = 0, 水平 != 0
	bctr,eq	`LOCAL_LABEL`_2	; 水平時 左シフト*2
	rrl,r0
	rrl,r0
	andi,r0	0c0h
`LOCAL_LABEL`_2:
	loda,r2	BTN_READ_MIDDLE
	andi,r2	BTN_READ_MASK
	iorz	r2	; r0: PAD＆中列ボタン合成
	stra,r0	KEY_NOW_H

	loda,r0	BTN_READ_RIGHT
	andi,r0	BTN_READ_MASK
	loda,r1	BTN_READ_LEFT
	rrr,r1
	rrr,r1
	rrr,r1
	rrr,r1
	andi,r1	(BTN_READ_MASK << 4)
	iorz	r1	; r0: 左列＆右列ボタン
	stra,r0	KEY_NOW_L

	loda,r0	KEY_NOW_H
	loda,r1	KEY_OLD_H
	eori,r1	0ffh	; ビット反転
	andz	r1
	stra,r0	KEY_TRG_H

	loda,r0	KEY_NOW_L
	loda,r1	KEY_OLD_L
	eori,r1	0ffh	; ビット反転
	andz	r1
	stra,r0	KEY_TRG_L

	end