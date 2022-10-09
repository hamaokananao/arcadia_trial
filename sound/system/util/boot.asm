	NOLIST
;=============================================================
; boot.asm 起動時処理ユーティリティ
 ; どんな Arcadia 開発でも共通になりそうな起動時処理。
 ; アドレス 0000h に置くこと。処理内容は下記：
 ; ・割り込みポインタ(0003h)の処理（ハードウェア異常を想定）
 ; ・ram、i/o領域クリア 1800h..18ffh,1900h..19ffh,1a00h..1affh
 ; ・デフォルトの演算は signed 。 unsigned 演算は都度設定する。
;=============================================================
	LIST
	eorz	r0
	bctr,un	BOOT
	retc,un
 BOOT:
	lpsu
	lpsl
	ppsu	PSU_II
	stra,r0	CRTCVPR
 BOOT_1:			; 表示期間終了待ち
	tpsu	PSU_S
	bcfr,eq	BOOT_1
 BOOT_2:			; 垂直帰線開始待ち
	tpsu	PSU_S
	bctr,eq	BOOT_2

	ppsl	PSL_COM	; unsigned 演算開始
	strz	r1	; r1: 書き込み先idx(00...ff)
 BOOT_3:
	stra,r0	SCRUPDATA,r1-	; --r1; *(1800h + r1) = r0;
	stra,r0	P1LEFTKEYS,r1	; *(1900h + r1) = r0;
	stra,r0	SCRLODATA,r1	; *(1a00h + r1) = r0;
	comi,r1	0
	bctr,gt	BOOT_3
	cpsl	PSL_COM	; unsigned 演算終了

	end
