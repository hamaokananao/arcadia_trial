	NOLIST
;=============================================================
; main.asm
 ; By Jun-ichiro Noguchi - hamaoka.nanao @ gmail.com
 ; Version 0.1 - October 8, 2022
 ; Signetics 2650 source-code for the Arcadia 2001 console.
 ; This file assembles well under VACS v1.24/w32 
 ; (by W.H. Taphoorn; updated by D.D. Spreen)
;=============================================================
	LIST
;=============================================================
; 各種定義
;=============================================================

	include	"./inc/arcadia_define.h"

	NAME	MAIN
	SECTION	PAGE0
	; lst ファイル出力設定関係
	WIDTH	128
	PAGE	255
	TABS	16
	; 0000h：リセット開始アドレス
 BASIS	SET	0000H
	ORG	BASIS
	; システムメモリ定義
	include	"./inc/arcadia.h"
	; ワーク領域定義
	include	"./inc/ram.h"

;=============================================================
; 初期化処理→メインループ
;=============================================================
;--------------
; 起動時処理
;--------------
	include	"./system/util/boot.asm"

;--------------
; 初期設定
;--------------
	; 画面表示位置
	lodi,r0	CRTCVPR_INIT
	stra,r0	CRTCVPR_W

	; パッド取得方向、色設定
	lodi,r0	(PAD_V + CSET_A + BLACK)
	stra,r0	BGCOLOUR_W

	; サウンド
	lodi,r0	0ffH
	stra,r0	(VOL_T)
;--------------
; メインループ
;--------------
MAIN:
	; 表示期間終了待ち
	tpsu	PSU_S
	bctr,eq	MAIN

 MAIN_1:
	; 垂直帰線開始待ち
	tpsu	PSU_S
	bcfr,eq	MAIN_1

;--------------
; メインループ　垂直帰線期間処理
;--------------
	; 　画面表示位置設定
	loda,r0	CRTCVPR_W
	stra,r0	CRTCVPR

	; 　パッド取得方向、色設定
	loda,r0	BGCOLOUR_W
	stra,r0	BGCOLOUR

	; 　キー入力取得
	bsta,un	GET_KEY

	; 　サウンド処理
	bsta,un	(SND_CTRL)

	; （テスト）キー入力表示
	;include	"./system/util/dsp_key.asm"

	; サウンドプレイ処理
	bsta,un	(SND_PLAY)

;--------------
; メインループ　処理完了
;--------------
	; MAINに戻る
	bcta,un	MAIN
	halt

;=============================================================
; サウンドプレイ処理
;=============================================================
SND_PLAY:
	loda,r1	(P2KEY_TRG)
	loda,r2	(P2KEY_TRG+1)
	lodz	r2
	; P2 1キーで鳴らす
	andi,r0	KEY_1
	bcfr,eq	SND_PLAY_10
	lodz	r1
	; P2 2キーで鳴らす
	andi,r0	KEY_2
	bcfr,eq	SND_PLAY_11
	lodz	r2
	; P2 3キーで鳴らす
	andi,r0	KEY_3
	bcfr,eq	SND_PLAY_12
	lodz	r2
	; P2 4キーで鳴らす
	andi,r0	KEY_4
	bcfr,eq	SND_PLAY_13
	lodz	r1
	; P2 5キーで鳴らす
	andi,r0	KEY_5
	bcfr,eq	SND_PLAY_14
	lodz	r2
	; P2 6キーで鳴らす
	andi,r0	KEY_6
	bcfr,eq	SND_PLAY_15
	; キー入力なし
	retc,un

 SND_PLAY_10:			; サウンド設定
	lodi,r0	000H
	bsta,un	(SE_PLY)
	retc,un
 SND_PLAY_11:			; サウンド設定
	lodi,r0	001H
	bsta,un	(SE_PLY)
	retc,un
 SND_PLAY_12:			; サウンド設定
	lodi,r0	002H
	bsta,un	(SE_PLY)
	retc,un
 SND_PLAY_13:			; サウンド設定
	lodi,r0	003H
	bsta,un	(SE_PLY)
	retc,un
 SND_PLAY_14:			; サウンド設定
	lodi,r0	004H
	bsta,un	(SE_PLY)
	retc,un
 SND_PLAY_15:			; サウンド設定
	lodi,r0	005H
	bsta,un	(SE_PLY)
	retc,un

;=============================================================
; サブルーチン群
;=============================================================

	include	"./system/lib/mem.asm"	; メモリ処理ライブラリ
	include	"./system/lib/bg.asm"	; BG処理ライブラリ
	include	"./system/lib/key.asm"	; キー入力ライブラリ
	include	"./system/lib/snd.asm"	; サウンド処理ライブラリ
	end