	NOLIST
;=============================================================
; snd.asm サウンド処理ライブラリ
 ; どんな Arcadia 開発でも共通になりそうなサウンド処理
 ; 処理内容：
 ; ・
;=============================================================
	LIST
SND_CTRL:
	; タイマー判定
	loda,r1	(VOL_T)
	retc,lt		; < 0：終了済。何もしない
	bctr,gt	(SND_CTRL_1)	; > 0：発音中。時間待ち
			; ==0：発音終了。次の音設定
	loda,r1	(SND_PTR)	; 読み取りアドレス更新
	loda,r2	(SND_PTR+1)
	cpsl	PSL_C	; 16ビット加算準備
	ppsl	PSL_WC	;
	addi,r2	002h	; + 0002h
	addi,r1	000h
	cpsl	PSL_WC	; 8ビット演算に戻す
	stra,r1	(SND_PTR)
	stra,r2	(SND_PTR+1)
	bsta,un	(SE_ON)	; 発音設定処理
	retc,un
 SND_CTRL_1:
	subi,r1	001h	; タイマ減算
	stra,r1	(VOL_T)
	retc,un

;--------------
;新規に発音設定する場合はここから
; r0: SEID
;--------------
SE_PLY:
	rrl,r0
	andi,r0	0feh
	strz	r3
	loda,r0	(SEDATA),r3
	stra,r0	(SND_PTR)
	loda,r0	(SEDATA+1),r3
	stra,r0	(SND_PTR+1)

;--------------
;次の音設定
;--------------
SE_ON:
	loda,r0	*(SND_PTR)	; タイマ設定
	stra,r0	(VOL_T)
	bctr,lt	(SE_OFF)	; < 0 シーケンス終了。SE_OFFへ

	lodi,r3	001H
	loda,r0	(PITCH)	; 音階設定(bits 6..0)
	andi,r0	ACM_MASK	; キャラモードを残してクリア
	adda,r0	*(SND_PTR),r3
	stra,r0	(PITCH)

	loda,r0	(VOLUMESCROLL)	; 音量設定
	andi,r0	SCR_H_MASK	; 水平方向スクロールを残してクリア
	addi,r0	(TON_ON + 003h)	; (ノイズOFF)+トーンON+音量
	stra,r0	(VOLUMESCROLL)

	retc,un

SE_OFF:
	loda,r0	(PITCH)	; 音階設定(bits 6..0)
	andi,r0	ACM_MASK	; キャラモードを残してクリア
	stra,r0	(PITCH)

	;loda,r0	(VOLUMESCROLL)	; 音量=0 にする
	;andi,r0	SCR_H_MASK	; スクロール領域を残してクリア
	;stra,r0	(VOLUMESCROLL)
	retc,un

;===============
; サウンドデータ一覧
;===============
SEDATA:
    DW  SOUND00, SOUND01, SOUND02, SOUND03, SOUND04, SOUND05
;===============
; サウンドデータ
 ; タイマ, ピッチ, ... 0ffh (終端)
;===============
SOUND00: ; ピコッ
    DB  001H, 00AH, 003H, 009H, 0FFH ;DB  03fH, 03bH, 03fH, 035H, 0FFH
SOUND01: ; キピ
    DB  001H, 008H, 001H, 009H, 0FFH ;DB  03fH, 035H, 0FFH
SOUND02: ; キポッ
    DB  003H, 009H, 002H, 019H, 002H, 006H, 0FFH ;DB  03fH, 02fH, 0FFH
SOUND03: ; ピコッ
    DB  002H, 00CH, 002H, 009H, 002H, 009H, 0FFH ;DB  03fH, 02cH, 0FFH
SOUND04: ; 
    DB  03fH, 027H, 0FFH
SOUND05: ; 
    DB  03fH, 023H, 0FFH

	end