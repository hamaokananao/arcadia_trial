	NOLIST
;=============================================================
; dsp_r0.asm 文字列表示
 ; DSP_R0_ADDR_H 表示アドレス上位
 ; DSP_R0_ADDR_L 表示アドレス下位
 ; r0            表示データ
;=============================================================
	LIST

	lodi,r0	DSP_R0_ADDR_H
	stra,r0	PTR1
	lodi,r0	DSP_R0_ADDR_L
	stra,r0	PTR1+1
	loda,r0	DSP_R0_DAT
	bsta,un	DSP_R0	; r0の値表示。

	end