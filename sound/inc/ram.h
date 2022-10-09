	NOLIST
;==========================================================
; RAM 領域定義
 ; RAM1	$18D0..$18EF( 32 Byte)
 ; RAM2	$18F8..$18FB(  4 Byte)
 ; RAM3	$1AD0..$1AFF( 48 Byte)
;==========================================================
	LIST
 CRTCVPR_W	SET	RAM1	; CRTCVPR コピー 1
 BGCOLOUR_W	SET	RAM1+1	; BGCOLOUR コピー 1
 PAD	SET	BGCOLOUR_W	; PAD(BGCOLOUR bit6)
 P1KEY	SET	RAM1+2	; P1今回入力 2
 P1KEY_OLD	SET	RAM1+4	; P1前回入力 2
 P1KEY_TRG	SET	RAM1+6	; P1ONトリガ 2
 P2KEY	SET	RAM1+8	; P2今回入力 2
 P2KEY_OLD	SET	RAM1+10	; P2前回入力 2
 P2KEY_TRG	SET	RAM1+12	; P2ONトリガ 2
 ;;;FRAME_COUNT	SET	RAM1+14	; フレームカウンタ 2
 ;;;;;;;;;SP0_X	SET	RAM1+16
 ;;;;;;;;;SP0_Y	SET	RAM1+17
 ;;;;;;;;;SP0_C	SET	RAM1+18
 ;;;;;;;;;SP1_X	SET	RAM1+19
 ;;;;;;;;;SP1_Y	SET	RAM1+20
 ;;;;;;;;;SP1_C	SET	RAM1+21
 ;;;;;;;;;SP2_X	SET	RAM1+22
 ;;;;;;;;;SP2_Y	SET	RAM1+23
 ;;;;;;;;;SP2_C	SET	RAM1+24
 ;;;;;;;;;SP3_X	SET	RAM1+25
 ;;;;;;;;;SP3_Y	SET	RAM1+26
 ;;;;;;;;;SP3_C	SET	RAM1+27
 SND_PTR	SET	RAM1+28	; サウンド：データアドレス 2
 VOL_T	SET	RAM1+30	; サウンド：タイマー 1

 PTR1	SET	RAM2	; 転送元アドレス 2
 PTR2	SET	RAM2+2	; 転送先アドレス 2

	end