	NOLIST
;=============================================================
; mem.asm メモリ処理ライブラリ
 ; FIL_MEM メモリへの転送
 ; TRS_MEM メモリの埋め立て
 ; PTR1,PTR2 を使うので起動時には使えない。
;=============================================================
;=============================================================
; メモリ埋め立て r1 転送量 PTR1:書き込み先 PTR2:書き込み値
;=============================================================
	LIST
FIL_MEM:
	ppsl	PSL_COM	; unsigned comp
	loda,r0	PTR2
 FIL_MEM_1:
	stra,r0	*(PTR1),r1-
	comi,r1	0
	bctr,gt	FIL_MEM_1
	cpsl	PSL_COM	; signed comp
	retc,un

	NOLIST
;=============================================================
; メモリ転送 r1 転送量(1...256)
;=============================================================
	LIST
TRS_MEM:
	ppsl	PSL_COM	; unsigned comp
 TRS_MEM_1:
	loda,r0	*(PTR1),r1-
	stra,r0	*(PTR2),r1
	comi,r1	0
	bctr,gt	TRS_MEM_1
	cpsl	PSL_COM	; signed comp
	retc,un

	end