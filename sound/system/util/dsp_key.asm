	NOLIST
;=============================================================
; dsp_key.asm キー入力表示
;=============================================================
	LIST
 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*1+0) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*1+0) & 00ffh)
 DSP_R0_DAT	SET	(P1KEY)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*1+2) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*1+2) & 00ffh)
 DSP_R0_DAT	SET	(P1KEY+1)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*2+0) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*2+0) & 00ffh)
 DSP_R0_DAT	SET	(P1KEY_OLD)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*2+2) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*2+2) & 00ffh)
 DSP_R0_DAT	SET	(P1KEY_OLD+1)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*3+0) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*3+0) & 00ffh)
 DSP_R0_DAT	SET	(P1KEY_TRG)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*3+2) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*3+2) & 00ffh)
 DSP_R0_DAT	SET	(P1KEY_TRG+1)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*1+4) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*1+4) & 00ffh)
 DSP_R0_DAT	SET	(P2KEY)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*1+6) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*1+6) & 00ffh)
 DSP_R0_DAT	SET	(P2KEY+1)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*2+4) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*2+4) & 00ffh)
 DSP_R0_DAT	SET	(P2KEY_OLD)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*2+6) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*2+6) & 00ffh)
 DSP_R0_DAT	SET	(P2KEY_OLD+1)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*3+4) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*3+4) & 00ffh)
 DSP_R0_DAT	SET	(P2KEY_TRG)
	include	"./system/util/dsp_r0.asm"

 DSP_R0_ADDR_H	SET	((SCRUPDATA+16*3+6) / 0100h)
 DSP_R0_ADDR_L	SET	((SCRUPDATA+16*3+6) & 00ffh)
 DSP_R0_DAT	SET	(P2KEY_TRG+1)
	include	"./system/util/dsp_r0.asm"

	end