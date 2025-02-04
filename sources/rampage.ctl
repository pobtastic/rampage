; Copyright Activision 1986, 2025 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @rom
> $4000 @start
b $4000 Loading Screen
D $4000 #UDGTABLE { =h Rampage Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=ScreenBuffer
  $4000,$1800,$20 Pixels.
@ $5800 label=AttributeBuffer
  $5800,$0300,$20 Attributes.

b $5F00
  $5F00,$0300,$20

b $6200
  $6200,$0300,$20

g $6500 Building Buffer?
@ $6500 label=BuildingBuffer
D $6500 TODO: Seems to be larger than this single block. Maybe also #R$6200 as well, will test.
B $6500,$0300,$20

g $6800 Game Buffer?
@ $6800 label=GameBuffer
  $6800,$0300,$20

g $6B00 Shadow Buffer
@ $6B00 label=ShadowScreenBuffer
  $6B00,$1800,$20 Pixels.
@ $8300 label=ShadowAttributeBuffer
  $8300,$0300,$20 Attributes.

b $8600
  $8600,$1800,$20 Pixels.
  $8D80
  $8E29
  $8E9A
  $8EFE
  $8F4A
  $8FF3
  $906C
  $9124

b $9E00
  $9E00,$08 #UDGTABLE { #UDG(#PC) } UDGTABLE#
L $9E00,$08,$180
  $AB60,$10

g $C1A1 Table: Sprite Information
@ $C1A1 label=Table_SpriteInfo
N $C1A1 #LET(sprite=$01+(#PC-$C1A1)/$04) Sprite ID: #N({sprite}).
M $C1A1,$04 #SPRITE({sprite})
B $C1A1,$02
W $C1A3,$02
N $C1A5 Mask ID: #N({sprite}+$01).
M $C1A5,$04 #SPRITE({sprite}+$01)
B $C1A5,$02
W $C1A7,$02
L $C1A1,$08,$7D

b $C6AF Port Mappings
@ $C6AF label=PortMappings
D $C6AF TODO; Unclear where this starts and ends. Used by the routine at #R$E1EA.
  $C6AF,$02
L $C6AF,$02,$08

b $C700

b $C81A

g $C850 User Defined Keys
D $C850 Note although there are 3 "sets" - it doesn't always follow that the monster IDs correlate with the set IDs.
D $C850 For instance; if George and Lizzy are computer controlled and Ralph uses the keyboard - he will use set 1.
.       The sets are assigned sequentially to being assigned to a player.
@ $C850 label=UserDefinedKeys_Set1
@ $C85A label=UserDefinedKeys_Set2
@ $C864 label=UserDefinedKeys_Set3
  $C850,$0A,$02 Stores in the following format:
. #TABLE(default,centre,centre)
. { =h Port | =h Bits } #FOR$00,$04(n,{ #N(#PEEK(#PC+n*$02)) | #EVAL(#PEEK(#PC+$01+n*$02),$02,$08) }, )
. TABLE#
L $C850,$0A,$03

b $C86E
  $C882
  $C896
  $C8A9

b $C8BA
  $C8BA,$08

b $C99E

b $C9F9

b $CA57

b $CB29 Data: Buildings
@ $CB29 label=Buildings_Data
  $CB29,$01 Terminator.
N $CB2A Building #N$01.
  $CB2A,$0A
  $CB34,$01 Terminator.
N $CB35 Building #N$02.
  $CB35,$0A
  $CB3F,$01 Terminator.
N $CB40 Building #N$03.
  $CB40,$0A
  $CB4A,$01 Terminator.
N $CB4B Building #N$04.
  $CB4B,$0A
  $CB55,$01 Terminator.
N $CB56 Building #N$05.
  $CB56,$0A
  $CB60,$01 Terminator.
N $CB61 Building #N$06.
  $CB61,$0A
  $CB6B,$01 Terminator.
N $CB6C Building #N$07.
  $CB6C,$0B
  $CB77,$01 Terminator.
N $CB78 Building #N$08.
  $CB78,$0B
  $CB83,$01 Terminator.
N $CB84 Building #N$09.
  $CB84,$0B
  $CB8F,$01 Terminator.
N $CB90 Building #N$0A.
  $CB90,$0B
  $CB9B,$01 Terminator.
N $CB9C Building #N$0B.
  $CB9C,$0B
  $CBA7,$01 Terminator.
N $CBA8 Building #N$0C.
  $CBA8,$0B
  $CBB3,$01 Terminator.
N $CBB4 Building #N$0D.
  $CBB4,$0C
  $CBC0,$01 Terminator.
N $CBC1 Building #N$0E.
  $CBC1,$0C
  $CBCD,$01 Terminator.
N $CBCE Building #N$0F.
  $CBCE,$0C
  $CBDA,$01 Terminator.
N $CBDB Building #N$10.
  $CBDB,$0C
  $CBE7,$01 Terminator.
N $CBE8 Building #N$11.
  $CBE8,$0C
  $CBF4,$01 Terminator.
N $CBF5 Building #N$12.
  $CBF5,$0C
  $CC01,$01 Terminator.
N $CC02 Building #N$13.
  $CC02,$0D
  $CC0F,$01 Terminator.
N $CC10 Building #N$14.
  $CC10,$0D
  $CC1D,$01 Terminator.
N $CC1E Building #N$15.
  $CC1E,$0D
  $CC2B,$01 Terminator.
N $CC2C Building #N$16.
  $CC2C,$0D
  $CC39,$01 Terminator.
N $CC3A Building #N$17.
  $CC3A,$0D
  $CC47,$01 Terminator.
N $CC48 Building #N$18.
  $CC48,$0D
  $CC55,$01 Terminator.
N $CC56 Building #N$19.
  $CC56,$0E
  $CC64,$01 Terminator.
N $CC65 Building #N$1A.
  $CC65,$0E
  $CC73,$01 Terminator.
N $CC74 Building #N$1B.
  $CC74,$0E
  $CC82,$01 Terminator.
N $CC83 Building #N$1C.
  $CC83,$0E
  $CC91,$01 Terminator.
N $CC92 Building #N$1D.
  $CC92,$0E
  $CCA0,$01 Terminator.
N $CCA1 Building #N$1E.
  $CCA1,$0E
  $CCAF,$01 Terminator.
N $CCB0 Building #N$1F.
  $CCB0,$0F
  $CCBF,$01 Terminator.
N $CCC0 Building #N$20.
  $CCC0,$0F
  $CCCF,$01 Terminator.
N $CCD0 Building #N$21.
  $CCD0,$0F
  $CCDF,$01 Terminator.
N $CCE0 Building #N$22.
  $CCE0,$0F
  $CCEF,$01 Terminator.
N $CCF0 Building #N$23.
  $CCF0,$0F
  $CCFF,$01 Terminator.
N $CD00 Building #N$24.
  $CD00,$0F
  $CD0F,$01 Terminator.
N $CD10 Building #N$25.
  $CD10,$10
  $CD20,$01 Terminator.
N $CD21 Building #N$26.
  $CD21,$10
  $CD31,$01 Terminator.
N $CD32 Building #N$27.
  $CD32,$10
  $CD42,$01 Terminator.
N $CD43 Building #N$28.
  $CD43,$10
  $CD53,$01 Terminator.
N $CD54 Building #N$29.
  $CD54,$10
  $CD64,$01 Terminator.
N $CD65 Building #N$2A.
  $CD65,$10
  $CD75,$01 Terminator.
N $CD76 Building #N$2B.
  $CD76,$11
  $CD87,$01 Terminator.
N $CD88 Building #N$2C.
  $CD88,$11
  $CD99,$01 Terminator.
N $CD9A Building #N$2D.
  $CD9A,$11
  $CDAB,$01 Terminator.
N $CDAC Building #N$2E.
  $CDAC,$11
  $CDBD,$01 Terminator.
N $CDBE Building #N$2F.
  $CDBE,$11
  $CDCF,$01 Terminator.
N $CDD0 Building #N$30.
  $CDD0,$11
  $CDE1,$01 Terminator.

b $CDE2 Data: Scenes
@ $CDE2 label=Scene_Data
D $CDE2 For usage see #R$DF90.
  $CDE2,$01 Terminator.
N $CDE3 Scene #N$01.
  $CDE3,$02
  $CDE5,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CDE6,$06
  $CDEC,$01 Terminator.
N $CDED Scene #N$02.
  $CDED,$02
  $CDEF,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CDF0,$08
  $CDF8,$01 Terminator.
N $CDF9 Scene #N$03.
  $CDF9,$02
  $CDFB,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CDFC,$0A
  $CE06,$01 Terminator.
N $CE07 Scene #N$04.
  $CE07,$02
  $CE09,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE0A,$0A
  $CE14,$01 Terminator.
N $CE15 Scene #N$05.
  $CE15,$02
  $CE17,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE18,$08
  $CE20,$01 Terminator.
N $CE21 Scene #N$06.
  $CE21,$02
  $CE23,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE24,$08
  $CE2C,$01 Terminator.
N $CE2D Scene #N$07.
  $CE2D,$02
  $CE2F,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE30,$0A
  $CE3A,$01 Terminator.
N $CE3B Scene #N$08.
  $CE3B,$02
  $CE3D,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE3E,$08
  $CE46,$01 Terminator.
N $CE47 Scene #N$09.
  $CE47,$02
  $CE49,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE4A,$0A
  $CE54,$01 Terminator.
N $CE55 Scene #N$0A.
  $CE55,$02
  $CE57,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE58,$06
  $CE5E,$01 Terminator.
N $CE5F Scene #N$0B.
  $CE5F,$02
  $CE61,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE62,$0A
  $CE6C,$01 Terminator.
N $CE6D Scene #N$0C.
  $CE6D,$02
  $CE6F,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE70,$08
  $CE78,$01 Terminator.
N $CE79 Scene #N$0D.
  $CE79,$02
  $CE7B,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE7C,$0A
  $CE86,$01 Terminator.
N $CE87 Scene #N$0E.
  $CE87,$02
  $CE89,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE8A,$06
  $CE90,$01 Terminator.
N $CE91 Scene #N$0F.
  $CE91,$02
  $CE93,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CE94,$08
  $CE9C,$01 Terminator.
N $CE9D Scene #N$10.
  $CE9D,$02
  $CE9F,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CEA0,$08
  $CEA8,$01 Terminator.
N $CEA9 Scene #N$11.
  $CEA9,$02
  $CEAB,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CEAC,$0A
  $CEB6,$01 Terminator.
N $CEB7 Scene #N$12.
  $CEB7,$02
  $CEB9,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CEBA,$08
  $CEC2,$01 Terminator.
N $CEC3 Scene #N$13.
  $CEC3,$02
  $CEC5,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CEC6,$0A
  $CED0,$01 Terminator.
N $CED1 Scene #N$14.
  $CED1,$02
  $CED3,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CED4,$08
  $CEDC,$01 Terminator.
N $CEDD Scene #N$15.
  $CEDD,$02
  $CEDF,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CEE0,$08
  $CEE8,$01 Terminator.
N $CEE9 Scene #N$16.
  $CEE9,$02
  $CEEB,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CEEC,$0A
  $CEF6,$01 Terminator.
N $CEF7 Scene #N$17.
  $CEF7,$02
  $CEF9,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CEFA,$0A
  $CF04,$01 Terminator.
N $CF05 Scene #N$18.
  $CF05,$02
  $CF07,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF08,$0A
  $CF12,$01 Terminator.
N $CF13 Scene #N$19.
  $CF13,$02
  $CF15,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF16,$0A
  $CF20,$01 Terminator.
N $CF21 Scene #N$1A.
  $CF21,$02
  $CF23,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF24,$08
  $CF2C,$01 Terminator.
N $CF2D Scene #N$1B.
  $CF2D,$02
  $CF2F,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF30,$0C
  $CF3C,$01 Terminator.
N $CF3D Scene #N$1C.
  $CF3D,$02
  $CF3F,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF40,$0A
  $CF4A,$01 Terminator.
N $CF4B Scene #N$1D.
  $CF4B,$02
  $CF4D,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF4E,$08
  $CF56,$01 Terminator.
N $CF57 Scene #N$1E.
  $CF57,$02
  $CF59,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF5A,$06
  $CF60,$01 Terminator.
N $CF61 Scene #N$1F.
  $CF61,$02
  $CF63,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF64,$08
  $CF6C,$01 Terminator.
N $CF6D Scene #N$20.
  $CF6D,$02
  $CF6F,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF70,$08
  $CF78,$01 Terminator.
N $CF79 Scene #N$21.
  $CF79,$02
  $CF7B,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF7C,$08
  $CF84,$01 Terminator.
N $CF85 Scene #N$22.
  $CF85,$02
  $CF87,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF88,$08
  $CF90,$01 Terminator.
N $CF91 Scene #N$23.
  $CF91,$02
  $CF93,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF94,$06
  $CF9A,$01 Terminator.
N $CF9B Scene #N$24.
  $CF9B,$02
  $CF9D,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CF9E,$04
  $CFA2,$01 Terminator.
N $CFA3 Scene #N$25.
  $CFA3,$02
  $CFA5,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CFA6,$08
  $CFAE,$01 Terminator.
N $CFAF Scene #N$26.
  $CFAF,$02
  $CFB1,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CFB2,$02
  $CFB4,$01 Terminator.
N $CFB5 Scene #N$27.
  $CFB5,$02
  $CFB7,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CFB8,$0A
  $CFC2,$01 Terminator.
N $CFC3 Scene #N$28.
  $CFC3,$02
  $CFC5,$01 #TABLE(default,centre,centre) { =h Scene Type | =h Number Of Buildings }
. { #N(#EVAL((#PEEK(#PC)&$78)>>$03)) | #N(#EVAL(#PEEK(#PC)&$07)) }
. TABLE#
  $CFC6,$0C

g $CFD2 Data: George
@ $CFD2 label=George_State
B $CFD2,$01 Relates to: #R$D244.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #R$EFA2(#N$05) | Waiting }
. { #R$EFA8(#N$08) | Falling }
. { #R$EFCC(#N$1A) | Grabbing }
. { #R$EFCE(#N$1B) | Eating }
. { #R$EFDA(#N$21) | Transform Explosion }
. { #R$EFDC(#N$22) | Turn Into Human }
. { #R$EFDE(#N$23) | Exit Stage Right }
. { #N$FF | Game Over }
. TABLE#
B $CFD3,$01 Relates to: #R$D245.
@ $CFD4 label=George_Climbing
B $CFD4,$01 Relates to: #R$D246.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Not Climbing }
. { #N$01 | Climbing }
. TABLE#
@ $CFD5 label=George_Direction
B $CFD5,$01 Relates to: #R$D247.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Left-to-Right }
. { #N$01 | Right-to-Left }
. TABLE#
@ $CFD6 label=George_Jumping
B $CFD6,$01 Relates to: #R$D248.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Not Jumping }
. { #N$01 | Jumping }
. TABLE#
@ $CFD7 label=George_IdleCountdown
B $CFD7,$01 Relates to: #R$D249.
@ $CFD8 label=George_AboutToFallCountdown
B $CFD8,$01 Relates to: #R$D24A.
@ $CFD9 label=George_Countdown
B $CFD9,$01 Relates to: #R$D24B.
B $CFDA,$01 Relates to: #R$D24C.
@ $CFDB label=George_X_Position
B $CFDB,$01 Relates to: #R$D24D.
@ $CFDC label=George_Y_Position
B $CFDC,$01 Relates to: #R$D24E.
B $CFDD,$01 Relates to: #R$D24F.
@ $CFDE label=George_Energy
B $CFDE,$01 Relates to: #R$D250.
N $CFDF When monster frames are drawn, this is used with an OR to set a bit which changes the sprite to the appropriate
.       character. See #R$D251.
@ $CFDF label=George_Sprite_Offset
B $CFDF,$01 For George no bits are set: #EVAL(#PEEK(#PC),$02,$08).
@ $CFE0 label=George_Control_Type
  $CFE0,$01 #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Computer Controlled }
. { #N$01 | Sinclair Interface 2 (port 2) }
. { #N$02 | Sinclair Interface 2 (port 1) }
. { #N$03 | Kempston Joystick }
. { #N$04 | Keyboard (set 1) }
. { #N$05 | Keyboard (set 2) }
. { #N$06 | Keyboard (set 3 }
. { #N$FF | Not set }
. TABLE#
W $CFE1,$02
B $CFE3,$1B,$03

g $D001 Data: Lizzy
@ $D001 label=Lizzy_State
B $D001,$01 Relates to: #R$D244.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #R$EFA2(#N$05) | Waiting }
. { #R$EFA8(#N$08) | Falling }
. { #R$EFCC(#N$1A) | Grabbing }
. { #R$EFCE(#N$1B) | Eating }
. { #R$EFDA(#N$21) | Transform Explosion }
. { #R$EFDC(#N$22) | Turn Into Human }
. { #R$EFDE(#N$23) | Exit Stage Right }
. { #N$FF | Game Over }
. TABLE#
B $D002,$01 Relates to: #R$D245.
@ $D003 label=Lizzy_Climbing
B $D003,$01 Relates to: #R$D246.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Not Climbing }
. { #N$01 | Climbing }
. TABLE#
@ $D004 label=Lizzy_Direction
B $D004,$01 Relates to: #R$D247.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Left-to-Right }
. { #N$01 | Right-to-Left }
. TABLE#
@ $D005 label=Lizzy_Jumping
B $D005,$01 Relates to: #R$D248.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Not Jumping }
. { #N$01 | Jumping }
. TABLE#
@ $D006 label=Lizzy_IdleCountdown
B $D006,$01 Relates to: #R$D249.
@ $D007 label=Lizzy_AboutToFallCountdown
B $D007,$01 Relates to: #R$D24A.
@ $D008 label=Lizzy_Countdown
B $D008,$01 Relates to: #R$D24B.
B $D009,$01 Relates to: #R$D24C.
@ $D00A label=Lizzy_X_Position
B $D00A,$01 Relates to: #R$D24D.
@ $D00B label=Lizzy_Y_Position
B $D00B,$01 Relates to: #R$D24E.
B $D00C,$01 Relates to: #R$D24F.
@ $D00D label=Lizzy_Energy
B $D00D,$01 Relates to: #R$D250.
N $D00E When monster frames are drawn, this is used with an OR to set a bit which changes the sprite to the appropriate
.       character. See #R$D251.
@ $D00E label=Lizzy_Sprite_Offset
B $D00E,$01 For Lizzy bit 6 is set: #EVAL(#PEEK(#PC),$02,$08).
@ $D00F label=Lizzy_Control_Type
  $D00F,$01 #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Computer Controlled }
. { #N$01 | Sinclair Interface 2 (port 2) }
. { #N$02 | Sinclair Interface 2 (port 1) }
. { #N$03 | Kempston Joystick }
. { #N$04 | Keyboard (set 1) }
. { #N$05 | Keyboard (set 2) }
. { #N$06 | Keyboard (set 3 }
. { #N$FF | Not set }
. TABLE#
W $D010,$02
B $D012,$1B,$03

g $D030 Data: Ralph
@ $D030 label=Ralph_State
B $D030,$01 Relates to: #R$D244.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #R$EFA2(#N$05) | Waiting }
. { #R$EFA8(#N$08) | Falling }
. { #R$EFCC(#N$1A) | Grabbing }
. { #R$EFCE(#N$1B) | Eating }
. { #R$EFDA(#N$21) | Transform Explosion }
. { #R$EFDC(#N$22) | Turn Into Human }
. { #R$EFDE(#N$23) | Exit Stage Right }
. { #N$FF | Game Over }
. TABLE#
B $D031,$01 Relates to: #R$D245.
@ $D032 label=Ralph_Climbing
B $D032,$01 Relates to: #R$D246.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Not Climbing }
. { #N$01 | Climbing }
. TABLE#
@ $D033 label=Ralph_Direction
B $D033,$01 Relates to: #R$D247.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Left-to-Right }
. { #N$01 | Right-to-Left }
. TABLE#
@ $D034 label=Ralph_Jumping
B $D034,$01 Relates to: #R$D248.
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Not Jumping }
. { #N$01 | Jumping }
. TABLE#
@ $D035 label=Ralph_IdleCountdown
B $D035,$01 Relates to: #R$D249.
@ $D036 label=Ralph_AboutToFallCountdown
B $D036,$01 Relates to: #R$D24A.
@ $D037 label=Ralph_Countdown
B $D037,$01 Relates to: #R$D24B.
B $D038,$01 Relates to: #R$D24C.
@ $D039 label=Ralph_X_Position
B $D039,$01 Relates to: #R$D24D.
@ $D03A label=Ralph_Y_Position
B $D03A,$01 Relates to: #R$D24E.
B $D03B,$01 Relates to: #R$D24F.
@ $D03C label=Ralph_Energy
B $D03C,$01 Relates to: #R$D250.
N $D03D When monster frames are drawn, this is used with an OR to set a bit which changes the sprite to the appropriate
.       character. See #R$D251.
@ $D03D label=Ralph_Sprite_Offset
B $D03D,$01 For Ralph bit 7 is set: #EVAL(#PEEK(#PC),$02,$08).
@ $D03E label=Ralph_Control_Type
B $D03E,$01 #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Computer Controlled }
. { #N$01 | Sinclair Interface 2 (port 2) }
. { #N$02 | Sinclair Interface 2 (port 1) }
. { #N$03 | Kempston Joystick }
. { #N$04 | Keyboard (set 1) }
. { #N$05 | Keyboard (set 2) }
. { #N$06 | Keyboard (set 3 }
. { #N$FF | Not set }
. TABLE#
W $D03F,$02
B $D041,$1B,$03

t $D05F Messaging: George
@ $D05F label=Messaging_George
  $D05F,$07,$06:$01 "#STR(#PC)".
@ $D066 label=Messaging_GeorgeScore
  $D066,$07,$06:$01 "#STR(#PC)".

t $D06D Messaging: Lizzy
@ $D06D label=Messaging_Lizzy
  $D06D,$07,$06:$01 "#STR(#PC)".
@ $D074 label=Messaging_LizzyScore
  $D074,$07,$06:$01 "#STR(#PC)".

t $D07B Messaging: Ralph
@ $D07B label=Messaging_Ralph
  $D07B,$07,$06:$01 "#STR(#PC)".
@ $D082 label=Messaging_RalphScore
  $D082,$07,$06:$01 "#STR(#PC)".

t $D089 Messaging: Credits
@ $D089 label=Messaging_Credits
  $D089,$07,$06:$01 "#STR(#PC)".
  $D090,$09,$08:$01 "#STR(#PC)".
  $D099,$0B,$0A:$01 "#STR(#PC)".
  $D0A4,$0C,$0B:$01 "#STR(#PC)".
  $D0B0,$0B,$0A:$01 "#STR(#PC)".
  $D0BB,$10,$0F:$01 "#STR(#PC)".

t $D0CB Messaging: Rampage
@ $D0CB label=Messaging_Rampage
  $D0CB,$0A,$09:$01 "#STR(#PC)".

t $D0D5 Messaging: Change Controls
@ $D0D5 label=Messaging_ChangeControls
  $D0D5,$0A,$09:$01 "#STR(#PC)".
  $D0DF,$0C,$0B:$01 "#STR(#PC)".

t $D0EB Messaging: Controls
@ $D0EB label=Messaging_Controls
  $D0EB,$04,$03:$01 "#STR(#PC)".
  $D0EF,$05,$04:$01 "#STR(#PC)".
  $D0F4,$02,$01:$01 "#STR(#PC)".
  $D0F6,$04,$03:$01 "#STR(#PC)".
  $D0FA,$05,$04:$01 "#STR(#PC)".
  $D0FF,$05,$04:$01 "#STR(#PC)".
@ $D104 label=Messaging_QuestionMark
  $D104,$02,$01:$01 "#STR(#PC)".
@ $D106 label=Messaging_Buffer
  $D106,$02,$01:$01 "#STR(#PC)".

t $D108 Messaging: Special Keys
@ $D108 label=Messaging_CapsShift
  $D108,$02,$01:$01 "#STR(#PC)".
@ $D10A label=Messaging_SymbolShift
  $D10A,$02,$01:$01 "#STR(#PC)".
@ $D10C label=Messaging_Space
  $D10C,$02,$01:$01 "#STR(#PC)".
@ $D10E label=Messaging_Enter
  $D10E,$02,$01:$01 "#STR(#PC)".

t $D110 Messaging: Select Menu
@ $D110 label=Messaging_SelectMenu
  $D110,$09,$08:$01 "#STR(#PC)".
  $D119,$04,$03:$01 "#STR(#PC)".
  $D11D,$0A,$09:$01 "#STR(#PC)".
  $D127,$04,$03:$01 "#STR(#PC)".
  $D12B,$08,$07:$01 "#STR(#PC)".

t $D133 Messaging: Choose Controls/ Character Option
@ $D133 label=Messaging_ChooseControls
  $D133,$0C,$0B:$01 "#STR(#PC)".
  $D13F,$0E,$0D:$01 "#STR(#PC)".
  $D14D,$0E,$0D:$01 "#STR(#PC)".
  $D15B,$0C,$0B:$01 "#STR(#PC)".
  $D167,$0C,$0B:$01 "#STR(#PC)".
  $D173,$0E,$0D:$01 "#STR(#PC)".
  $D181,$0E,$0D:$01 "#STR(#PC)".

t $D18F Messaging: Game Over
@ $D18F label=Messaging_GameOver
  $D18F,$09,$08:$01 "#STR(#PC)".

b $D198 Graphics: Ticker
@ $D198 label=Graphics_Ticker
D $D198 #PUSHS #SIM(start=$FD2B,stop=$FD7F) #SCR$02,$00,$10,$20,$08(ticker) #POPS
N $D198 See #R$FD44.
  $D198,$08
L $D198,$08,$0F,$02

g $D210 Human Generator Limiter
@ $D210 label=HumanGeneratorLimiter
D $D210 Defaults to #N$80 (see #R$DEC9) is used for limiting the generation of humans. Humans are only generated when a
.       generated random number between #N$00-#N$FF is below the number set here.
B $D210,$01

g $D211 Maximum Number Humans
@ $D211 label=MaxHumansCount
D $D211 Used by the routines at #R$DCA1 and #R$DF90.
B $D211,$01

g $D212 Maximum Number Helicopters
@ $D212 label=MaxHelicopterCount
B $D212,$01

b $D213

b $D214

b $D215

g $D216 Level Finished Countdown
@ $D216 label=LevelFinishedCountdown
D $D216 After all the buildings have collapsed, the game doesn't instantly end the level. This countdown is reduced and
.       the level ends only when it reaches zero.
B $D216,$01

g $D217 Active Monster Control Byte
@ $D217 label=Active_MonsterControl
D $D217 TODO; bit pattern is maybe different to the control pattern.
B $D217,$01

g $D218
  $D218
  $D219

g $D21A Game Clock
@ $D21A label=Game_Clock
D $D21A Counts up while the game plays, used as a random number generator (as it's never reset).
W $D21A,$02

g $D21E

g $D220

g $D222

g $D224
W $D224,$02

g $D226

g $D227 George
B $D227,$06,$01

g $D22D Lizzy
B $D22D,$06,$01

g $D233 Ralph
B $D233,$06,$01

b $D239

g $D23E
B $D23E,$03,$01

g $D241
B $D241,$03,$01

g $D244 Jump Table Pointer
@ $D244 label=JumpTable_Pointer
D $D244 See #R$E67C.
B $D244,$01

g $D245

g $D246 Active Monster Climbing Flag
@ $D246 label=Flag_MonsterClimbing
D $D246 Relates to: #LIST { #R$CFD4 } { #R$D003 } { #R$D032 } LIST#
. #TABLE(default,centre,centre) { =h Byte | =h Meaning }
. { #N$00 | No  }
. { #N$01 | Yes }
. TABLE#
B $D246,$01

g $D247 Active Monster Orientation Flag
@ $D247 label=Flag_Orientation
D $D247 Relates to: #LIST { #R$CFD5 } { #R$D004 } { #R$D033 } LIST#
. #TABLE(default,centre,centre) { =h Byte | =h Facing }
. { #N$00 | Left-to-right  }
. { #N$01 | Right-to-left }
. TABLE#
B $D247,$01

g $D248 Active Monster Jumping Flag
@ $D248 label=Flag_MonsterJumping
D $D248 Relates to: #LIST { #R$CFD6 } { #R$D005 } { #R$D034 } LIST#
. #TABLE(default,centre,centre) { =h Byte | =h Meaning }
. { #N$00 | No  }
. { #N$01 | Yes }
. TABLE#
B $D246,$01

g $D249 Active Monster Idle Countdown
@ $D249 label=Active_MonsterIdleCountdown
D $D249 Used by the routines at #R$E68C, #R$EED6, #R$EEEB and #R$EF0A.
N $D249 Relates to: #LIST { #R$CFD7 } { #R$D006 } { #R$D035 } LIST#
B $D249,$01 Counts down from #N$19 and launches #R$E99B when finished.

g $D24A Active Monster About-To-Fall Countdown
@ $D24A label=Active_MonsterAboutToFallCountdown
D $D24A Used by the routine at #R$EA18.
N $D24A Relates to: #LIST { #R$CFD8 } { #R$D007 } { #R$D036 } LIST#
B $D24A,$01

g $D24B Active Monster Action Countdown
@ $D24B label=Active_MonsterActionCountdown
D $D24B Relates to: #LIST { #R$CFD9 } { #R$D008 } { #R$D037 } LIST#
B $D24B,$01

g $D24C

g $D24D Active Monster Co-ordinates
D $D24D Relates to: #LIST { #R$CFDB/ #R$CFDC } { #R$D00A/ #R$D00B } { #R$D039/ #R$D03A } LIST#
@ $D24D label=Active_MonsterXPosition
@ $D24E label=Active_MonsterYPosition
B $D24D,$02,$01

g $D24F

g $D250 Active Monster Energy
@ $D250 label=Active_MonsterEnergy
D $D250 Seem to be unused. Relates to: #LIST { #R$CFDE } { #R$D00D } { #R$D03C } LIST#
B $D250,$01

g $D251 Active Monster Sprite Modifier
@ $D251 label=MonsterSpriteModifier
D $D251 When monster frames are drawn, this is used with an OR to set a bit which changes the sprite to the appropriate
.       character. See #R$D9BB.
. #TABLE(default,centre,centre,centre)
. { =h Byte | =h Bit | =h Monster }
. { #N$00 | #EVAL($00,$02,$08) | George }
. { #N$40 | #EVAL($40,$02,$08) | Lizzy }
. { #N$80 | #EVAL($80,$02,$08) | Ralph }
. TABLE#
B $D251,$01

g $D252 Active Monster Control Type
@ $D252 label=Active_MonsterControlType
D $D252 ID: #N$0E. See #R$F9BF, relates to: #LIST { #R$CFE0 } { #R$D00F } { #R$D03E } LIST#
B $D252,$01 #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Computer Controlled }
. { #N$01 | Sinclair Interface 2 (port 2) }
. { #N$02 | Sinclair Interface 2 (port 1) }
. { #N$03 | Kempston Joystick }
. { #N$04 | Keyboard (set 1) }
. { #N$05 | Keyboard (set 2) }
. { #N$06 | Keyboard (set 3 }
. { #N$FF | Not set }
. TABLE#

g $D253
W $D253

g $D255 Table: Humans
@ $D255 label=Table_Humans
D $D255 See #R$E25D.
N $D255 Human ##N($01+(#PC-$D255)/$04).
B $D255,$01 Type.
B $D256,$01 Countdown.
B $D257,$01 X position.
B $D258,$01 Y position.
L $D255,$04,$10

g $D295 Table: Helicopters
@ $D295 label=Table_Helicopters
D $D295 See #R$DBE5.
N $D295 Helicopter ##N($01+(#PC-$D295)/$03).
B $D295,$01 State.
B $D296,$01 X position.
B $D297,$01 Y position.
L $D295,$03,$06

g $D2A7 Table: Helicopter Something
@ $D2A7 label=Table_SomethingHelicopters
N $D2A7 Helicopter ##N($01+(#PC-$D2A7)/$04).
B $D2A7,$01
B $D2A8,$01
B $D2A9,$01
B $D2AA,$01
L $D2A7,$04,$06

g $D2BF Table: Bullets
@ $D2BF label=Table_Bullets
B $D2BF,$03 ##N($01+(#PC-$D2BF)/$03).
L $D2BF,$03,$1A

g $D30D Table: Projectiles
@ $D30D label=Table_Projectiles
B $D30D,$03 ##N($01+(#PC-$D30D)/$03).
L $D30D,$03,$06

b $D31F

g $D39F Table: Buildings
@ $D39F label=Table_Buildings
N $D39F Building ID: #N($01+(#PC-$D39F)/$0E).
B $D39F,$01 #N$00: State:
. #TABLE(default,centre,centre,centre)
. { =h Byte | =h State | =h Meaning }
. { #N$00 | N/A | Not in use }
. { #N$01 | Normal | I'm just a building }
. { #N$02 | Crumbling | The cracking animation }
. { #N$03 | Collapsing | When the building falls down }
. { #N$04 | Rubble | The one character block rubble animation }
. { #N$05 | Gone | No Building }
. TABLE#
N $D3A0 X/Y co-ordinates are targeting the top-left corner of the building.
B $D3A0,$01 #N$01 X co-ordinate.
B $D3A1,$01 #N$02 Y co-ordinate.
W $D3A2,$02 #N$03 Pointer to building in buffer?
B $D3A4,$01 #N$05
B $D3A5,$01 #N$06 Width (in bytes).
B $D3A6,$01 #N$07
B $D3A7,$01 #N$08
B $D3A8,$01 #N$09
B $D3A9,$01 #N$0A Height countdown for crumbling animation.
B $D3AA,$01 #N$0B Height countdown for collapsing animation.
B $D3AB,$01 #N$0C Entire collapsing sequence countdown.
B $D3AC,$01 #N$0D Sound modifier; either #N$01 or #N$02.
L $D39F,$0E,$06

g $D3F3 Number Of Buildings Remaining
@ $D3F3 label=BuildingsRemainingCount
D $D3F3 Number of buildings remaining standing on the current level.
B $D3F3,$01

g $D3F4 Human Count (TODO)
@ $D3F4 label=NumberHumans
B $D3F4,$01

g $D3F5 Active Helicopter Count
@ $D3F5 label=NumberActiveHelicopters
B $D3F5,$01

g $D3F6 On-Screen Helicopter Count
@ $D3F6 label=NumberOnScreenHelicopters
B $D3F6,$01

b $D3F7

g $D3F8 Bullet Count
@ $D3F8 label=NumberBullets
B $D3F8,$01

b $D3F9

g $D3FA Projectile Count
@ $D3FA label=NumberProjectiles
B $D3FA,$01

b $D3FB
  $D3FC

g $D3FD Game State
@ $D3FD label=Game_State
D $D3FD #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | In-Play }
. { #N$01 | Game Over }
. TABLE#
B $D3FD,$01

g $D3FE Scene Carpet
@ $D3FE label=Scene_Carpet
D $D3FE Is it carpet? Awning? Unsure...
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | No carpet }
. { #N$01 | Carpet }
. TABLE#
B $D3FE,$01

g $D3FF

g $D400 Scene Type
@ $D400 label=Scene_Type
B $D400,$01

g $D401 Table: Vehicle
N $D401 See #R$FC39.
@ $D401 label=VehicleCounter
B $D401,$01 #TABLE(default,centre,centre) { =h Byte | =h Meaning }
. { #N$00-#N$18 | Countdown until spawn }
. { #N$FE | Spawning "off" }
. { #N$FF | Vehicle is spawned }
. TABLE#
@ $D402 label=VehicleType
B $D402,$01 #TABLE(default,centre,centre) { =h Byte | =h Vehicle }
. { #N$00 | Tank }
. { #N$01 | Car }
. { #N$02 | Police car }
. { #N$03 | Destroyed }
. TABLE#
@ $D403 label=VehicleXPosition
B $D403,$01 Vehicle horizontal position on the screen.
@ $D404 label=VehicleYPosition
B $D404,$01 Vehicle vertical position on the screen.

g $D405 Table: Train
N $D405 See #R$FCB6.
@ $D405 label=TrainState
B $D405,$01 #TABLE(default,centre,centre) { =h Byte | =h Meaning }
. { #N$00-#N$20 | Countdown until spawn }
. { #N$FE | Spawning "off" }
. { #N$FF | Train is spawned }
. TABLE#
@ $D406 label=TrainXPosition
B $D406,$01 Train horizontal position on the screen.
@ $D407 label=TrainYPosition
B $D407,$01 Train vertical position on the screen.

b $D408

c $D409 Write Scene To Shadow Buffer
@ $D409 label=WriteSceneToShadowBuffer
  $D409,$03 #REGbc=#N($0000,$04,$04).
N $D40C Self-modifying code. These lines populate the value for a LoaD command below. The values relate to areas of the
.       shadow screen buffer: #LIST { #R$6B00(#N$6B00) } { #R$7300 } { #R$7B00 } LIST#
  $D40C,$08 Write #N$6B to: #LIST { *#R$D474(#N$D475) } { *#R$D4B5(#N$D4B6) } LIST#
  $D414,$03 Call #R$D42A.
  $D417,$08 Write #N$73 to: #LIST { *#R$D474(#N$D475) } { *#R$D4B5(#N$D4B6) } LIST#
  $D41F,$03 Call #R$D42A.
  $D422,$08 Write #N$7B to: #LIST { *#R$D474(#N$D475) } { *#R$D4B5(#N$D4B6) } LIST#
@ $D42A label=WriteSceneToShadowBuffer_Loop_1
  $D42A,$02 #REGa=#N$89.
  $D42C,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D42D,$01 #REGa=#REGb.
  $D42E,$02 #REGa+=#N$68.
  $D430,$01 #REGh=#REGa.
  $D431,$01 #REGl=#REGc.
  $D432,$02 #REGd=#N$00.
  $D434,$05 Jump to #R$D494 if *#REGhl is zero.
  $D439,$01 Write #REGd to *#REGhl.
  $D43A,$05 Write #N$60 to *#R$D220.
  $D43F,$03 Decrease #REGh by three.
  $D442,$05 Jump to #R$D45F if *#REGhl is not zero.
  $D447,$05 Write #N$20 to *#R$D220.
  $D44C,$03 Decrease #REGh by three.
  $D44F,$05 Jump to #R$D45F if *#REGhl is not zero.
  $D454,$04 Write #N$00 to *#R$D220.
  $D458,$03 Decrease #REGh by three.
  $D45B,$02 #REGa=#N$86.
  $D45D,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D45E,$01 #REGa=*#REGhl.
@ $D45F label=WriteSceneToShadowBuffer_Loop_2
  $D45F,$02,b$01 Keep only bits 0-6.
  $D461,$01 #REGe=#REGa.
  $D462,$01 #REGa=*#REGhl.
  $D463,$03 Write #REGa to *#R$D222.
  $D466,$01 #REGh=#REGd.
  $D467,$01 #REGl=#REGe.
  $D468,$04 #REGhl*=#N$08+#REGde.
  $D46C,$05 Jump to #R$D49A if #REGa is higher than #N$80.
  $D471,$03 Call #R$D4E8.
N $D474 The value here is self-modified at:
. #TABLE(default,centre,centre) { =h Location | =h Byte Set }
. { #R$D40C | #N$6B } { #R$D417 | #N$73 } { #R$D422 | #N$7B }
. TABLE#
  $D474,$02 #REGd=#N$00 (as above).
  $D476,$01 #REGa=*#REGhl.
  $D477,$01 Write #REGa to *#REGde.
  $D478,$01 Increment #REGhl by one.
  $D479,$01 Increment #REGd by one.
  $D47A,$01 #REGa=*#REGhl.
  $D47B,$01 Write #REGa to *#REGde.
  $D47C,$01 Increment #REGhl by one.
  $D47D,$01 Increment #REGd by one.
  $D47E,$01 #REGa=*#REGhl.
  $D47F,$01 Write #REGa to *#REGde.
  $D480,$01 Increment #REGhl by one.
  $D481,$01 Increment #REGd by one.
  $D482,$01 #REGa=*#REGhl.
  $D483,$01 Write #REGa to *#REGde.
  $D484,$01 Increment #REGhl by one.
  $D485,$01 Increment #REGd by one.
  $D486,$01 #REGa=*#REGhl.
  $D487,$01 Write #REGa to *#REGde.
  $D488,$01 Increment #REGhl by one.
  $D489,$01 Increment #REGd by one.
  $D48A,$01 #REGa=*#REGhl.
  $D48B,$01 Write #REGa to *#REGde.
  $D48C,$01 Increment #REGhl by one.
  $D48D,$01 Increment #REGd by one.
  $D48E,$01 #REGa=*#REGhl.
  $D48F,$01 Write #REGa to *#REGde.
  $D490,$01 Increment #REGhl by one.
  $D491,$01 Increment #REGd by one.
  $D492,$01 #REGa=*#REGhl.
  $D493,$01 Write #REGa to *#REGde.
@ $D494 label=WriteSceneToShadowBuffer_Loop_3
  $D494,$01 Increment #REGc by one.
  $D495,$03 Jump to #R$D42A if {} is not zero.
  $D498,$01 Increment #REGb by one.
  $D499,$01 Return.
  $D49A,$03 Call #R$D4E8.
  $D49D,$01 Stash #REGbc on the stack.
  $D49E,$01 #REGa=#REGc.
  $D49F,$01 Switch to the shadow registers.
  $D4A0,$01 #REGc=#REGa.
  $D4A1,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D4A2,$01 Reset the bits from #REGc.
  $D4A3,$02,b$01 Keep only bits 0-1.
  $D4A5,$01 #REGc=#REGa.
  $D4A6,$04 #REGa*=#N$08+#REGc.
  $D4AA,$02 #REGb=#N$00.
  $D4AC,$01 #REGc=#REGa.
  $D4AD,$03 #REGhl=#R$8B40.
  $D4B0,$01 #REGhl+=#REGbc.
  $D4B1,$01 Increment #REGl by one.
  $D4B2,$01 Stash #REGhl on the stack.
  $D4B3,$01 Switch back to the normal registers.
  $D4B4,$01 Restore #REGbc from the stack.
N $D4B5 The value here is self-modified at:
. #TABLE(default,centre,centre) { =h Location | =h Byte Set }
. { #R$D40C | #N$6B } { #R$D417 | #N$73 } { #R$D422 | #N$7B }
. TABLE#
  $D4B5,$02 #REGd=#N$00 (as above).
  $D4B7,$01 #REGa=*#REGbc.
  $D4B8,$01 Set the bits from *#REGhl.
  $D4B9,$01 Write #REGa to *#REGde.
  $D4BA,$01 Increment #REGhl by one.
  $D4BB,$01 Increment #REGbc by one.
  $D4BC,$01 Increment #REGd by one.
  $D4BD,$01 #REGa=*#REGbc.
  $D4BE,$01 Set the bits from *#REGhl.
  $D4BF,$01 Write #REGa to *#REGde.
  $D4C0,$01 Increment #REGhl by one.
  $D4C1,$01 Increment #REGbc by one.
  $D4C2,$01 Increment #REGd by one.
  $D4C3,$01 #REGa=*#REGbc.
  $D4C4,$01 Set the bits from *#REGhl.
  $D4C5,$01 Write #REGa to *#REGde.
  $D4C6,$01 Increment #REGhl by one.
  $D4C7,$01 Increment #REGbc by one.
  $D4C8,$01 Increment #REGd by one.
  $D4C9,$01 #REGa=*#REGbc.
  $D4CA,$01 Set the bits from *#REGhl.
  $D4CB,$01 Write #REGa to *#REGde.
  $D4CC,$01 Increment #REGhl by one.
  $D4CD,$01 Increment #REGbc by one.
  $D4CE,$01 Increment #REGd by one.
  $D4CF,$01 #REGa=*#REGbc.
  $D4D0,$01 Set the bits from *#REGhl.
  $D4D1,$01 Write #REGa to *#REGde.
  $D4D2,$01 Increment #REGhl by one.
  $D4D3,$01 Increment #REGbc by one.
  $D4D4,$01 Increment #REGd by one.
  $D4D5,$01 #REGa=*#REGbc.
  $D4D6,$01 Set the bits from *#REGhl.
  $D4D7,$01 Write #REGa to *#REGde.
  $D4D8,$01 Increment #REGhl by one.
  $D4D9,$01 Increment #REGbc by one.
  $D4DA,$01 Increment #REGd by one.
  $D4DB,$01 #REGa=*#REGbc.
  $D4DC,$01 Set the bits from *#REGhl.
  $D4DD,$01 Write #REGa to *#REGde.
  $D4DE,$01 Increment #REGhl by one.
  $D4DF,$01 Increment #REGbc by one.
  $D4E0,$01 Increment #REGd by one.
  $D4E1,$01 #REGa=*#REGbc.
  $D4E2,$01 Set the bits from *#REGhl.
  $D4E3,$01 Write #REGa to *#REGde.
  $D4E4,$01 Restore #REGbc from the stack.
  $D4E5,$03 Jump to #R$D494.

c $D4E8
  $D4E8,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D4E9,$01 #REGa+=#REGh.
  $D4EA,$01 #REGh=#REGa.
  $D4EB,$01 #REGa=#REGb.
  $D4EC,$02 #REGa+=#N$83.
  $D4EE,$01 #REGd=#REGa.
  $D4EF,$01 #REGe=#REGc.
  $D4F0,$04 #REGa=*#R$D220.
  $D4F4,$01 #REGa=*#REGhl.
  $D4F5,$02 Jump to #R$D509 if *#R$D220 is zero.
  $D4F7,$01 #REGa=#REGc.
  $D4F8,$02,b$01 Keep only bits 0-4.
  $D4FA,$01 Switch to the shadow registers.
  $D4FB,$01 #REGc=#REGa.
  $D4FC,$02 #REGb=#N$00.
  $D4FE,$03 #REGhl=#R$D31F.
  $D501,$01 #REGhl+=#REGbc.
  $D502,$04 #REGc=*#R$D220.
  $D506,$01 #REGhl+=#REGbc.
  $D507,$01 #REGa=*#REGhl.
  $D508,$01 Switch back to the normal registers.
  $D509,$01 Write #REGa to *#REGde.
  $D50A,$01 Increment #REGhl by one.
  $D50B,$01 Return.

c $D50C
  $D50C,$01 Set zero flag based on #REGa.
  $D50D,$02 Shift #REGa left (with carry).
  $D50F,$01 Store the result in #REGl.
  $D510,$01 Rotate #REGa left (bit 7 is moved to bit 0).
  $D511,$02,b$01 Keep only bit 0.
  $D513,$01 #REGh=#REGa.
  $D514,$03 #REGde=#R$C700.
  $D517,$01 #REGhl+=#REGde.
  $D518,$01 Exchange the #REGde and #REGhl registers.
  $D519,$03 #REGbc=#N($0020,$04,$04).
  $D51C,$03 #REGhl=#R$6140.
  $D51F,$02 Stash #REGhl and #REGde on the stack.
  $D521,$01 #REGa=*#REGde.
  $D522,$01 Decrease #REGa by one.
  $D523,$01 Increment #REGde by one.
  $D524,$01 Set the bits from #REGa.
  $D525,$02 Write #N$01 to *#REGhl.
  $D527,$02 #REGhl-=#REGbc.
  $D529,$01 Decrease #REGa by one.
  $D52A,$02 Jump to #R$D525 until #REGa is zero.
  $D52C,$04 Jump to #R$D550 if *#REGde is zero.
  $D530,$01 Stash #REGhl on the stack.
  $D531,$03 #REGhl=#R$C800.
  $D534,$01 #REGe=#REGa.
  $D535,$01 #REGa=*#REGhl.
  $D536,$01 Increment #REGhl by one.
  $D537,$05 Jump to #R$D535 if #REGa is lower than #N$80.
  $D53C,$01 Decrease #REGe by one.
  $D53D,$03 Jump to #R$D535 until #REGe is zero.
  $D540,$01 Exchange the #REGde and #REGhl registers.
  $D541,$01 Restore #REGhl from the stack.
  $D542,$01 #REGa=*#REGde.
  $D543,$02,b$01 Keep only bits 0-6.
  $D545,$01 Write #REGa to *#REGhl.
  $D546,$01 #REGa=*#REGde.
  $D547,$04 Jump to #R$D550 if bit 7 of #REGa is set.
  $D54B,$02 #REGhl-=#REGbc.
  $D54D,$01 Increment #REGde by one.
  $D54E,$02 Jump to #R$D542.
  $D550,$02 Restore #REGde and #REGhl from the stack.
  $D552,$01 Increment #REGhl by one.
  $D553,$02 Increment #REGde by two.
  $D555,$05 Jump to #R$D51F if #REGl is not equal to #N$60.
  $D55A,$01 Return.

c $D55B
  $D55B,$03 #REGhl=#R$C7C0.
  $D55E,$02 #REGd=#N$00.
  $D560,$01 #REGe=#REGa.
  $D561,$01 #REGhl+=#REGde.
  $D562,$03 #REGde=#R$6140.
  $D565,$02 #REGb=#N$10.
  $D567,$02 Stash #REGhl and #REGde on the stack.
  $D569,$01 #REGa=*#REGhl.
  $D56A,$01 Decrease #REGa by one.
  $D56B,$01 #REGe=#REGa.
  $D56C,$01 #REGa+=#REGa.
  $D56D,$01 #REGa+=#REGe.
  $D56E,$01 #REGa+=#REGa.
  $D56F,$01 #REGe=#REGa.
  $D570,$02 #REGd=#N$00.
  $D572,$03 #REGhl=#R$C81A.
  $D575,$01 #REGhl+=#REGde.
  $D576,$01 Restore #REGde from the stack.
  $D577,$01 Stash #REGde on the stack.
  $D578,$02 #REGc=#N$03.
  $D57A,$01 #REGa=*#REGhl.
  $D57B,$01 Write #REGa to *#REGde.
  $D57C,$01 Increment #REGhl by one.
  $D57D,$01 Increment #REGde by one.
  $D57E,$01 #REGa=*#REGhl.
  $D57F,$01 Write #REGa to *#REGde.
  $D580,$01 Increment #REGhl by one.
  $D581,$01 Stash #REGhl on the stack.
  $D582,$03 #REGhl=#N($001F,$04,$04).
  $D585,$01 #REGhl+=#REGde.
  $D586,$01 Exchange the #REGde and #REGhl registers.
  $D587,$01 Restore #REGhl from the stack.
  $D588,$01 Decrease #REGc by one.
  $D589,$02 Jump to #R$D57A until #REGc is zero.
  $D58B,$01 Restore #REGde from the stack.
  $D58C,$02 Increment #REGe by two.
  $D58E,$01 Restore #REGhl from the stack.
  $D58F,$01 Increment #REGhl by one.
  $D590,$02 Decrease counter by one and loop back to #R$D567 until counter is zero.
  $D592,$01 Return.

c $D593
  $D593,$01 #REGe=#REGa.
  $D594,$04 Jump to #R$D59C if #REGa is not equal to #N$06.
  $D598,$02 #REGa=#N$01.
  $D59A,$02 Jump to #R$D5A5.
  $D59C,$04 Jump to #R$D5A4 if #REGa is not equal to #N$07.
  $D5A0,$02 #REGa=#N$02.
  $D5A2,$02 Jump to #R$D5A5.
  $D5A4,$04 Write #N$00 to *#R$D3FE.
  $D5A8,$01 #REGa=#REGe.
  $D5A9,$01 Decrease #REGa by one.
  $D5AA,$02 #REGa*=#N$04.
  $D5AC,$01 #REGe=#REGa.
  $D5AD,$01 #REGa+=#REGe.
  $D5AE,$01 #REGa+=#REGe.
  $D5AF,$02 #REGd=#N$00.
  $D5B1,$01 #REGe=#REGa.
  $D5B2,$03 #REGhl=#R$C8BA.
  $D5B5,$01 #REGhl+=#REGde.
  $D5B6,$03 #REGde=#R$61A0.
  $D5B9,$02 #REGb=#N$0C.
  $D5BB,$02 Stash #REGhl and #REGde on the stack.
  $D5BD,$01 #REGa=*#REGhl.
  $D5BE,$01 Decrease #REGa by one.
  $D5BF,$03 #REGa*=#N$08.
  $D5C2,$02 #REGd=#N$00.
  $D5C4,$01 #REGe=#REGa.
  $D5C5,$03 #REGhl=#R$C91A.
  $D5C8,$01 #REGhl+=#REGde.
  $D5C9,$01 Restore #REGde from the stack.
  $D5CA,$02 #REGc=#N$08.
  $D5CC,$01 #REGa=*#REGhl.
  $D5CD,$01 Write #REGa to *#REGde.
  $D5CE,$01 Increment #REGhl by one.
  $D5CF,$01 Increment #REGde by one.
  $D5D0,$01 Decrease #REGc by one.
  $D5D1,$02 Jump to #R$D5CC until #REGc is zero.
  $D5D3,$01 Restore #REGhl from the stack.
  $D5D4,$01 Increment #REGhl by one.
  $D5D5,$02 Decrease counter by one and loop back to #R$D5BB until counter is zero.
  $D5D7,$01 Return.

c $D5D8 Clear Buffers
@ $D5D8 label=ClearBuffers
  $D5D8,$02 #REGa=#N$03 (counter).
@ $D5DA label=ClearBuffers_Loop
  $D5DA,$01 Stash the counter on the stack.
  $D5DB,$03 Call #R$D5E6.
  $D5DE,$01 Restore the counter from the stack.
  $D5DF,$01 Decrease the counter by one.
  $D5E0,$02 Jump to #R$D5DA until the counter is zero.
  $D5E2,$03 Call #R$D5E6.
  $D5E5,$01 Return.
N $D5E6 Calculate each buffer address.
N $D5E6 #TABLE(default,centre,centre)
. { =h Counter | =h,c2 Registers }
. { =h #REGa | =h #REGhl | =h #REGde }
. { #N$03 | #R$6800 | #N$6801 }
. { #N$02 | #R$6500 | #N$6501 }
. { #N$01 | #R$6200 | #N$6201 }
. { #N$00 | #R$5F00 | #N$5F01 }
. TABLE#
@ $D5E6 label=ClearBuffers_Action
  $D5E6,$01 #REGh=#REGa.
  $D5E7,$04 #REGa*=#N$03+#N$5F.
  $D5EB,$01 #REGh=#REGa.
N $D5EC #REGde is the same address + #N$01.
  $D5EC,$01 #REGd=#REGa.
  $D5ED,$02 #REGl=#N$00.
  $D5EF,$02 #REGe=#N$01.
  $D5F1,$01 Write #N$00 (from #REGl) to *#REGhl.
  $D5F2,$03 #REGbc=#N($02FF,$04,$04).
  $D5F5,$02 Copy #N($02FF,$04,$04) bytes from #REGhl to #REGde.
  $D5F7,$01 Return.

c $D5F8 Update Attribute Buffer
@ $D5F8 label=AttributeBuffer_Update
  $D5F8,$03 #REGhl=#R$8300.
  $D5FB,$03 #REGde=#R$5800.
  $D5FE,$03 #REGbc=#N$0300.
  $D601,$02 Copy attribute shadow buffer to screen attribute buffer.
  $D603,$01 Return.

c $D604 Update Screen Buffer
@ $D604 label=ScreenBuffer_Update
  $D604,$03 #REGhl=#R$6B00.
  $D607,$03 #REGde=#R$4000(#N$4000).
  $D60A,$03 Call #R$D61C.
  $D60D,$03 #REGhl=#R$7300.
  $D610,$03 #REGde=#R$4800.
  $D613,$03 Call #R$D61C.
  $D616,$03 #REGhl=#R$7B00.
  $D619,$03 #REGde=#R$5000.
N $D61C This routine is called three times which correlates to the three sections of the screen layout.
@ $D61C label=CopyShadowBufferToScreen
  $D61C,$01 Stash the shadow buffer pointer on the stack.
  $D61D,$01 #REGa=#REGd.
  $D61E,$01 Exchange #REGaf with the shadow #REGaf register.
  $D61F,$01 #REGa=#REGl.
  $D620,$03 Call #R$D688.
  $D623,$01 #REGe=#REGa.
  $D624,$01 #REGl=#REGa.
  $D625,$01 Increment #REGd by one.
  $D626,$01 Increment #REGh by one.
  $D627,$03 Call #R$D688.
  $D62A,$01 #REGe=#REGa.
  $D62B,$01 #REGl=#REGa.
  $D62C,$01 Increment #REGd by one.
  $D62D,$01 Increment #REGh by one.
  $D62E,$03 Call #R$D688.
  $D631,$01 #REGe=#REGa.
  $D632,$01 #REGl=#REGa.
  $D633,$01 Increment #REGd by one.
  $D634,$01 Increment #REGh by one.
  $D635,$03 Call #R$D688.
  $D638,$01 #REGe=#REGa.
  $D639,$01 #REGl=#REGa.
  $D63A,$01 Increment #REGd by one.
  $D63B,$01 Increment #REGh by one.
  $D63C,$03 Call #R$D688.
  $D63F,$01 #REGe=#REGa.
  $D640,$01 #REGl=#REGa.
  $D641,$01 Increment #REGd by one.
  $D642,$01 Increment #REGh by one.
  $D643,$03 Call #R$D688.
  $D646,$01 #REGe=#REGa.
  $D647,$01 #REGl=#REGa.
  $D648,$01 Increment #REGd by one.
  $D649,$01 Increment #REGh by one.
  $D64A,$03 Call #R$D688.
  $D64D,$01 #REGe=#REGa.
  $D64E,$01 #REGl=#REGa.
  $D64F,$01 Increment #REGd by one.
  $D650,$01 Increment #REGh by one.
  $D651,$03 Call #R$D688.
  $D654,$01 Switch #REGaf back with the normal #REGaf register.
  $D655,$01 #REGd=#REGa.
  $D656,$01 Restore the shadow buffer pointer from the stack.
  $D657,$04 #REGl+=#N$20.
  $D65B,$01 #REGe=#REGa.
  $D65C,$05 Jump to #R$D61C if #REGa is not #N$E0.
  $D661,$03 Call #R$D688.
  $D664,$01 #REGe=#REGa.
  $D665,$01 #REGl=#REGa.
  $D666,$03 Call #R$D688.
  $D669,$01 #REGe=#REGa.
  $D66A,$01 #REGl=#REGa.
  $D66B,$03 Call #R$D688.
  $D66E,$01 #REGe=#REGa.
  $D66F,$01 #REGl=#REGa.
  $D670,$03 Call #R$D688.
  $D673,$01 #REGe=#REGa.
  $D674,$01 #REGl=#REGa.
  $D675,$03 Call #R$D688.
  $D678,$01 #REGe=#REGa.
  $D679,$01 #REGl=#REGa.
  $D67A,$03 Call #R$D688.
  $D67D,$01 #REGe=#REGa.
  $D67E,$01 #REGl=#REGa.
  $D67F,$03 Call #R$D688.
  $D682,$01 #REGe=#REGa.
  $D683,$01 #REGl=#REGa.
  $D684,$03 Call #R$D688.
  $D687,$01 Return.

c $D688 Fast Copy To The Screen Buffer
@ $D688 label=Blit
  $D688,$40 Copy one line to the screen buffer.
  $D6C8,$01 Return.

c $D6C9 Print Sprite
@ $D6C9 label=PrintSprite
R $D6C9 A Sprite ID
R $D6C9 BC Screen co-ordinates
  $D6C9,$03 Write #REGa to *#R$D214.
  $D6CC,$01 Stash #REGbc on the stack.
  $D6CD,$03 Call #R$D9A9.
  $D6D0,$01 Restore #REGbc from the stack.
  $D6D1,$01 #REGd=#REGa.
  $D6D2,$03 #REGa=*#R$D247.
N $D6D5 Moves the orientation flag into the carry flag.
  $D6D5,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $D6D6,$03 Jump to #R$D800 if the carry flag is set.
  $D6D9,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D6DA,$01 #REGe=#REGa.
  $D6DB,$01 #REGl=#REGc.
  $D6DC,$01 Switch to the shadow registers.
  $D6DD,$01 #REGa=*#REGhl.
  $D6DE,$01 Increment #REGhl by one.
  $D6DF,$01 #REGh=*#REGhl.
  $D6E0,$01 #REGl=#REGa.
  $D6E1,$01 Switch back to the normal registers.
  $D6E2,$05 Jump to #R$D6FC if #REGc is not equal to #REGl.
  $D6E7,$01 #REGa=#REGb.
  $D6E8,$02,b$01 Keep only bits 3-7.
  $D6EA,$02 #REGa+=#N$6B.
  $D6EC,$01 #REGh=#REGa.
  $D6ED,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D6EE,$01 #REGa=#REGb.
  $D6EF,$02,b$01 Keep only bits 0-2.
  $D6F1,$03 RRCA.
  $D6F4,$01 #REGa+=#REGc.
  $D6F5,$01 Switch to the shadow registers.
  $D6F6,$01 #REGc=#REGa.
  $D6F7,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D6F8,$01 #REGb=#REGa.
  $D6F9,$03 Jump to #R$D700.
  $D6FC,$01 #REGa=#REGh.
  $D6FD,$01 Switch back to the normal registers.
  $D6FE,$01 Increment #REGc by one.
  $D6FF,$01 #REGb=#REGa.
  $D700,$01 Switch to the shadow registers.
  $D701,$01 #REGa=#REGc.
  $D702,$05 Jump to #R$D7A5 if #REGa is higher than #N$20.
  $D707,$01 #REGa=#REGb.
  $D708,$05 Jump to #R$D7A5 if #REGa is higher than #N$18.
  $D70D,$01 Switch back to the normal registers.
  $D70E,$06 Jump to #R$D778 if *#REGhl is equal to #N$36.
  $D714,$06 Jump to #R$D7C7 if *#REGde is equal to #N$36.
  $D71A,$01 Increment #REGhl by one.
  $D71B,$01 Increment #REGde by one.
  $D71C,$01 #REGa=*#REGbc.
  $D71D,$01 Merge the bits from *#REGhl.
  $D71E,$01 Exchange the #REGde and #REGhl registers.
  $D71F,$01 Set the bits from *#REGhl.
  $D720,$01 Exchange the #REGde and #REGhl registers.
  $D721,$01 Write #REGa to *#REGbc.
  $D722,$01 Increment #REGde by one.
  $D723,$01 Increment #REGhl by one.
  $D724,$01 Increment #REGb by one.
  $D725,$01 #REGa=*#REGbc.
  $D726,$01 Merge the bits from *#REGhl.
  $D727,$01 Exchange the #REGde and #REGhl registers.
  $D728,$01 Set the bits from *#REGhl.
  $D729,$01 Exchange the #REGde and #REGhl registers.
  $D72A,$01 Write #REGa to *#REGbc.
  $D72B,$01 Increment #REGde by one.
  $D72C,$01 Increment #REGhl by one.
  $D72D,$01 Increment #REGb by one.
  $D72E,$01 #REGa=*#REGbc.
  $D72F,$01 Merge the bits from *#REGhl.
  $D730,$01 Exchange the #REGde and #REGhl registers.
  $D731,$01 Set the bits from *#REGhl.
  $D732,$01 Exchange the #REGde and #REGhl registers.
  $D733,$01 Write #REGa to *#REGbc.
  $D734,$01 Increment #REGde by one.
  $D735,$01 Increment #REGhl by one.
  $D736,$01 Increment #REGb by one.
  $D737,$01 #REGa=*#REGbc.
  $D738,$01 Merge the bits from *#REGhl.
  $D739,$01 Exchange the #REGde and #REGhl registers.
  $D73A,$01 Set the bits from *#REGhl.
  $D73B,$01 Exchange the #REGde and #REGhl registers.
  $D73C,$01 Write #REGa to *#REGbc.
  $D73D,$01 Increment #REGde by one.
  $D73E,$01 Increment #REGhl by one.
  $D73F,$01 Increment #REGb by one.
  $D740,$01 #REGa=*#REGbc.
  $D741,$01 Merge the bits from *#REGhl.
  $D742,$01 Exchange the #REGde and #REGhl registers.
  $D743,$01 Set the bits from *#REGhl.
  $D744,$01 Exchange the #REGde and #REGhl registers.
  $D745,$01 Write #REGa to *#REGbc.
  $D746,$01 Increment #REGde by one.
  $D747,$01 Increment #REGhl by one.
  $D748,$01 Increment #REGb by one.
  $D749,$01 #REGa=*#REGbc.
  $D74A,$01 Merge the bits from *#REGhl.
  $D74B,$01 Exchange the #REGde and #REGhl registers.
  $D74C,$01 Set the bits from *#REGhl.
  $D74D,$01 Exchange the #REGde and #REGhl registers.
  $D74E,$01 Write #REGa to *#REGbc.
  $D74F,$01 Increment #REGde by one.
  $D750,$01 Increment #REGhl by one.
  $D751,$01 Increment #REGb by one.
  $D752,$01 #REGa=*#REGbc.
  $D753,$01 Merge the bits from *#REGhl.
  $D754,$01 Exchange the #REGde and #REGhl registers.
  $D755,$01 Set the bits from *#REGhl.
  $D756,$01 Exchange the #REGde and #REGhl registers.
  $D757,$01 Write #REGa to *#REGbc.
  $D758,$01 Increment #REGde by one.
  $D759,$01 Increment #REGhl by one.
  $D75A,$01 Increment #REGb by one.
  $D75B,$01 #REGa=*#REGbc.
  $D75C,$01 Merge the bits from *#REGhl.
  $D75D,$01 Exchange the #REGde and #REGhl registers.
  $D75E,$01 Set the bits from *#REGhl.
  $D75F,$01 Exchange the #REGde and #REGhl registers.
  $D760,$01 Write #REGa to *#REGbc.
  $D761,$03 Call #R$D986.
  $D764,$01 Increment #REGde by one.
  $D765,$01 Increment #REGhl by one.
  $D766,$01 Switch to the shadow registers.
  $D767,$01 Increment #REGc by one.
  $D768,$02 Compare #REGe with #REGc...
  $D76A,$01 Switch back to the normal registers.
  $D76B,$03 Jump to #R$D6E1 if #REGe is not equal to #REGc on line #R$D768.
  $D76E,$01 Switch to the shadow registers.
  $D76F,$01 #REGc=#REGl.
  $D770,$01 Increment #REGb by one.
  $D771,$02 Compare #REGd with #REGb...
  $D773,$01 Switch back to the normal registers.
  $D774,$03 Jump to #R$D6E1 if #REGd is not equal to #REGb on line #R$D771.
  $D777,$01 Return.
  $D778,$06 Jump to #R$D764 if *#REGde is equal to #N$36.
  $D77E,$01 Increment #REGde by one.
  $D77F,$01 Increment #REGhl by one.
  $D780,$01 #REGa=*#REGde.
  $D781,$01 Write #REGa to *#REGbc.
  $D782,$01 Increment #REGde by one.
  $D783,$01 Increment #REGb by one.
  $D784,$01 #REGa=*#REGde.
  $D785,$01 Write #REGa to *#REGbc.
  $D786,$01 Increment #REGde by one.
  $D787,$01 Increment #REGb by one.
  $D788,$01 #REGa=*#REGde.
  $D789,$01 Write #REGa to *#REGbc.
  $D78A,$01 Increment #REGde by one.
  $D78B,$01 Increment #REGb by one.
  $D78C,$01 #REGa=*#REGde.
  $D78D,$01 Write #REGa to *#REGbc.
  $D78E,$01 Increment #REGde by one.
  $D78F,$01 Increment #REGb by one.
  $D790,$01 #REGa=*#REGde.
  $D791,$01 Write #REGa to *#REGbc.
  $D792,$01 Increment #REGde by one.
  $D793,$01 Increment #REGb by one.
  $D794,$01 #REGa=*#REGde.
  $D795,$01 Write #REGa to *#REGbc.
  $D796,$01 Increment #REGde by one.
  $D797,$01 Increment #REGb by one.
  $D798,$01 #REGa=*#REGde.
  $D799,$01 Write #REGa to *#REGbc.
  $D79A,$01 Increment #REGde by one.
  $D79B,$01 Increment #REGb by one.
  $D79C,$01 #REGa=*#REGde.
  $D79D,$01 Write #REGa to *#REGbc.
  $D79E,$01 Increment #REGde by one.
  $D79F,$03 Call #R$D986.
  $D7A2,$03 Jump to #R$D766.
  $D7A5,$01 Switch to the shadow registers.
  $D7A6,$01 #REGa=*#REGde.
  $D7A7,$01 Increment #REGde by one.
  $D7A8,$05 Jump to #R$D7B5 if #REGa is equal to #N$36.
  $D7AD,$08 Increment #REGde by eight.
  $D7B5,$01 #REGa=*#REGhl.
  $D7B6,$01 Increment #REGhl by one.
  $D7B7,$05 Jump to #R$D766 if #REGa is equal to #N$36.
  $D7BC,$08 Increment #REGhl by eight.
  $D7C4,$03 Jump to #R$D766.
  $D7C7,$01 Increment #REGde by one.
  $D7C8,$01 Increment #REGhl by one.
  $D7C9,$01 #REGa=*#REGbc.
  $D7CA,$01 Merge the bits from *#REGhl.
  $D7CB,$01 Write #REGa to *#REGbc.
  $D7CC,$01 Increment #REGhl by one.
  $D7CD,$01 Increment #REGb by one.
  $D7CE,$01 #REGa=*#REGbc.
  $D7CF,$01 Merge the bits from *#REGhl.
  $D7D0,$01 Write #REGa to *#REGbc.
  $D7D1,$01 Increment #REGhl by one.
  $D7D2,$01 Increment #REGb by one.
  $D7D3,$01 #REGa=*#REGbc.
  $D7D4,$01 Merge the bits from *#REGhl.
  $D7D5,$01 Write #REGa to *#REGbc.
  $D7D6,$01 Increment #REGhl by one.
  $D7D7,$01 Increment #REGb by one.
  $D7D8,$01 #REGa=*#REGbc.
  $D7D9,$01 Merge the bits from *#REGhl.
  $D7DA,$01 Write #REGa to *#REGbc.
  $D7DB,$01 Increment #REGhl by one.
  $D7DC,$01 Increment #REGb by one.
  $D7DD,$01 #REGa=*#REGbc.
  $D7DE,$01 Merge the bits from *#REGhl.
  $D7DF,$01 Write #REGa to *#REGbc.
  $D7E0,$01 Increment #REGhl by one.
  $D7E1,$01 Increment #REGb by one.
  $D7E2,$01 #REGa=*#REGbc.
  $D7E3,$01 Merge the bits from *#REGhl.
  $D7E4,$01 Write #REGa to *#REGbc.
  $D7E5,$01 Increment #REGhl by one.
  $D7E6,$01 Increment #REGb by one.
  $D7E7,$01 #REGa=*#REGbc.
  $D7E8,$01 Merge the bits from *#REGhl.
  $D7E9,$01 Write #REGa to *#REGbc.
  $D7EA,$01 Increment #REGhl by one.
  $D7EB,$01 Increment #REGb by one.
  $D7EC,$01 #REGa=*#REGbc.
  $D7ED,$01 Merge the bits from *#REGhl.
  $D7EE,$01 Write #REGa to *#REGbc.
  $D7EF,$01 Increment #REGhl by one.
  $D7F0,$03 Call #R$D986.
  $D7F3,$03 Jump to #R$D766.

c $D7F6 Print Sprite Mirrored
@ $D7F6 label=PrintSprite_Mirrored
  $D7F6,$03 Write #REGa to #R$D214.
  $D7F9,$01 Decrease #REGc by one.
  $D7FA,$01 Stash #REGbc on the stack.
  $D7FB,$03 Call #R$D9A9.
  $D7FE,$01 Restore #REGbc from the stack.
  $D7FF,$01 #REGd=#REGa.

  $D800,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D801,$01 #REGl=#REGa.
  $D802,$01 #REGe=#REGc.
  $D803,$01 #REGc=#REGa.
  $D804,$01 Switch to the shadow registers.
  $D805,$01 #REGa=*#REGhl.
  $D806,$01 Increment #REGhl by one.
  $D807,$01 #REGh=*#REGhl.
  $D808,$01 #REGl=#REGa.
  $D809,$01 Switch to the shadow registers.
  $D80A,$05 Jump to #R$D824 if #REGc is not equal to #REGl.
  $D80F,$01 #REGa=#REGb.
  $D810,$02,b$01 Keep only bits 3-7.
  $D812,$02 #REGa+=#N$6B.
  $D814,$01 #REGh=#REGa.
  $D815,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D816,$01 #REGa=#REGb.
  $D817,$02,b$01 Keep only bits 0-2.
  $D819,$03 RRCA.
  $D81C,$01 #REGa+=#REGc.
  $D81D,$01 Switch to the shadow registers.
  $D81E,$01 #REGc=#REGa.
  $D81F,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D820,$01 #REGb=#REGa.
  $D821,$03 Jump to #R$D828.
  $D824,$01 #REGa=#REGh.
  $D825,$01 Switch to the shadow registers.
  $D826,$01 Decrease #REGc by one.
  $D827,$01 #REGb=#REGa.
  $D828,$01 Switch to the shadow registers.
  $D829,$06 Jump to #R$D8D8 if #REGc is higher than #N$20.
  $D82F,$06 Jump to #R$D8D8 if #REGb is higher than #N$18.
  $D835,$01 Switch to the shadow registers.
  $D836,$06 Jump to #R$D8FA if *#REGhl is equal to #N$36.
  $D83C,$06 Jump to #R$D93B if *#REGde is equal to #N$36.
  $D842,$01 Increment #REGhl by one.
  $D843,$01 Increment #REGde by one.
  $D844,$01 Stash #REGhl on the stack.
  $D845,$01 #REGa=*#REGbc.
  $D846,$01 #REGl=*#REGhl.
  $D847,$02 #REGh=#N$C6.
  $D849,$01 Merge the bits from *#REGhl.
  $D84A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D84B,$01 #REGa=*#REGde.
  $D84C,$01 #REGl=#REGa.
  $D84D,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D84E,$01 Set the bits from *#REGhl.
  $D84F,$01 Write #REGa to *#REGbc.
  $D850,$01 Restore #REGhl from the stack.
  $D851,$01 Increment #REGde by one.
  $D852,$01 Increment #REGhl by one.
  $D853,$01 Increment #REGb by one.
  $D854,$01 Stash #REGhl on the stack.
  $D855,$01 #REGa=*#REGbc.
  $D856,$01 #REGl=*#REGhl.
  $D857,$02 #REGh=#N$C6.
  $D859,$01 Merge the bits from *#REGhl.
  $D85A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D85B,$01 #REGa=*#REGde.
  $D85C,$01 #REGl=#REGa.
  $D85D,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D85E,$01 Set the bits from *#REGhl.
  $D85F,$01 Write #REGa to *#REGbc.
  $D860,$01 Restore #REGhl from the stack.
  $D861,$01 Increment #REGde by one.
  $D862,$01 Increment #REGhl by one.
  $D863,$01 Increment #REGb by one.
  $D864,$01 Stash #REGhl on the stack.
  $D865,$01 #REGa=*#REGbc.
  $D866,$01 #REGl=*#REGhl.
  $D867,$02 #REGh=#N$C6.
  $D869,$01 Merge the bits from *#REGhl.
  $D86A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D86B,$01 #REGa=*#REGde.
  $D86C,$01 #REGl=#REGa.
  $D86D,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D86E,$01 Set the bits from *#REGhl.
  $D86F,$01 Write #REGa to *#REGbc.
  $D870,$01 Restore #REGhl from the stack.
  $D871,$01 Increment #REGde by one.
  $D872,$01 Increment #REGhl by one.
  $D873,$01 Increment #REGb by one.
  $D874,$01 Stash #REGhl on the stack.
  $D875,$01 #REGa=*#REGbc.
  $D876,$01 #REGl=*#REGhl.
  $D877,$02 #REGh=#N$C6.
  $D879,$01 Merge the bits from *#REGhl.
  $D87A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D87B,$01 #REGa=*#REGde.
  $D87C,$01 #REGl=#REGa.
  $D87D,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D87E,$01 Set the bits from *#REGhl.
  $D87F,$01 Write #REGa to *#REGbc.
  $D880,$01 Restore #REGhl from the stack.
  $D881,$01 Increment #REGde by one.
  $D882,$01 Increment #REGhl by one.
  $D883,$01 Increment #REGb by one.
  $D884,$01 Stash #REGhl on the stack.
  $D885,$01 #REGa=*#REGbc.
  $D886,$01 #REGl=*#REGhl.
  $D887,$02 #REGh=#N$C6.
  $D889,$01 Merge the bits from *#REGhl.
  $D88A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D88B,$01 #REGa=*#REGde.
  $D88C,$01 #REGl=#REGa.
  $D88D,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D88E,$01 Set the bits from *#REGhl.
  $D88F,$01 Write #REGa to *#REGbc.
  $D890,$01 Restore #REGhl from the stack.
  $D891,$01 Increment #REGde by one.
  $D892,$01 Increment #REGhl by one.
  $D893,$01 Increment #REGb by one.
  $D894,$01 Stash #REGhl on the stack.
  $D895,$01 #REGa=*#REGbc.
  $D896,$01 #REGl=*#REGhl.
  $D897,$02 #REGh=#N$C6.
  $D899,$01 Merge the bits from *#REGhl.
  $D89A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D89B,$01 #REGa=*#REGde.
  $D89C,$01 #REGl=#REGa.
  $D89D,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D89E,$01 Set the bits from *#REGhl.
  $D89F,$01 Write #REGa to *#REGbc.
  $D8A0,$01 Restore #REGhl from the stack.
  $D8A1,$01 Increment #REGde by one.
  $D8A2,$01 Increment #REGhl by one.
  $D8A3,$01 Increment #REGb by one.
  $D8A4,$01 Stash #REGhl on the stack.
  $D8A5,$01 #REGa=*#REGbc.
  $D8A6,$01 #REGl=*#REGhl.
  $D8A7,$02 #REGh=#N$C6.
  $D8A9,$01 Merge the bits from *#REGhl.
  $D8AA,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D8AB,$01 #REGa=*#REGde.
  $D8AC,$01 #REGl=#REGa.
  $D8AD,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D8AE,$01 Set the bits from *#REGhl.
  $D8AF,$01 Write #REGa to *#REGbc.
  $D8B0,$01 Restore #REGhl from the stack.
  $D8B1,$01 Increment #REGde by one.
  $D8B2,$01 Increment #REGhl by one.
  $D8B3,$01 Increment #REGb by one.
  $D8B4,$01 Stash #REGhl on the stack.
  $D8B5,$01 #REGa=*#REGbc.
  $D8B6,$01 #REGl=*#REGhl.
  $D8B7,$02 #REGh=#N$C6.
  $D8B9,$01 Merge the bits from *#REGhl.
  $D8BA,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D8BB,$01 #REGa=*#REGde.
  $D8BC,$01 #REGl=#REGa.
  $D8BD,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D8BE,$01 Set the bits from *#REGhl.
  $D8BF,$01 Write #REGa to *#REGbc.
  $D8C0,$01 Restore #REGhl from the stack.
  $D8C1,$03 Call #R$D986.
  $D8C4,$01 Increment #REGde by one.
  $D8C5,$01 Increment #REGhl by one.
  $D8C6,$01 Switch to the shadow registers.
  $D8C7,$01 Decrease #REGc by one.
  $D8C8,$02 Compare #REGe with #REGc...
  $D8CA,$01 Switch to the shadow registers.
  $D8CB,$03 Jump to #R$D809 if #REGe is not equal to #REGc on line #R$D8C8.
  $D8CE,$01 Switch to the shadow registers.
  $D8CF,$01 #REGc=#REGl.
  $D8D0,$01 Increment #REGb by one.
  $D8D1,$02 Compare #REGd with #REGb...
  $D8D3,$01 Switch to the shadow registers.
  $D8D4,$03 Jump to #R$D809 if #REGd is not equal to #REGb on line #R$D8D1.
  $D8D7,$01 Return.
  $D8D8,$01 Switch to the shadow registers.
  $D8D9,$01 #REGa=*#REGde.
  $D8DA,$01 Increment #REGde by one.
  $D8DB,$05 Jump to #R$D8E8 if #REGa is equal to #N$36.
  $D8E0,$08 Increment #REGde by eight.
  $D8E8,$01 #REGa=*#REGhl.
  $D8E9,$01 Increment #REGhl by one.
  $D8EA,$05 Jump to #R$D8C6 if #REGa is equal to #N$36.
  $D8EF,$08 Increment #REGhl by eight.
  $D8F7,$03 Jump to #R$D8C6.
  $D8FA,$06 Jump to #R$D8C4 if *#REGde is equal to #N$36.
  $D900,$01 Increment #REGde by one.
  $D901,$01 Increment #REGhl by one.
  $D902,$01 Stash #REGhl on the stack.
  $D903,$02 #REGh=#N$C6.
  $D905,$01 #REGa=*#REGde.
  $D906,$01 #REGl=#REGa.
  $D907,$01 #REGa=*#REGhl.
  $D908,$01 Write #REGa to *#REGbc.
  $D909,$01 Increment #REGde by one.
  $D90A,$01 Increment #REGb by one.
  $D90B,$01 #REGa=*#REGde.
  $D90C,$01 #REGl=#REGa.
  $D90D,$01 #REGa=*#REGhl.
  $D90E,$01 Write #REGa to *#REGbc.
  $D90F,$01 Increment #REGde by one.
  $D910,$01 Increment #REGb by one.
  $D911,$01 #REGa=*#REGde.
  $D912,$01 #REGl=#REGa.
  $D913,$01 #REGa=*#REGhl.
  $D914,$01 Write #REGa to *#REGbc.
  $D915,$01 Increment #REGde by one.
  $D916,$01 Increment #REGb by one.
  $D917,$01 #REGa=*#REGde.
  $D918,$01 #REGl=#REGa.
  $D919,$01 #REGa=*#REGhl.
  $D91A,$01 Write #REGa to *#REGbc.
  $D91B,$01 Increment #REGde by one.
  $D91C,$01 Increment #REGb by one.
  $D91D,$01 #REGa=*#REGde.
  $D91E,$01 #REGl=#REGa.
  $D91F,$01 #REGa=*#REGhl.
  $D920,$01 Write #REGa to *#REGbc.
  $D921,$01 Increment #REGde by one.
  $D922,$01 Increment #REGb by one.
  $D923,$01 #REGa=*#REGde.
  $D924,$01 #REGl=#REGa.
  $D925,$01 #REGa=*#REGhl.
  $D926,$01 Write #REGa to *#REGbc.
  $D927,$01 Increment #REGde by one.
  $D928,$01 Increment #REGb by one.
  $D929,$01 #REGa=*#REGde.
  $D92A,$01 #REGl=#REGa.
  $D92B,$01 #REGa=*#REGhl.
  $D92C,$01 Write #REGa to *#REGbc.
  $D92D,$01 Increment #REGde by one.
  $D92E,$01 Increment #REGb by one.
  $D92F,$01 #REGa=*#REGde.
  $D930,$01 #REGl=#REGa.
  $D931,$01 #REGa=*#REGhl.
  $D932,$01 Write #REGa to *#REGbc.
  $D933,$01 Increment #REGde by one.
  $D934,$01 Restore #REGhl from the stack.
  $D935,$03 Call #R$D986.
  $D938,$03 Jump to #R$D8C6.
  $D93B,$01 Increment #REGde by one.
  $D93C,$01 Increment #REGhl by one.
  $D93D,$01 Stash #REGde on the stack.
  $D93E,$02 #REGd=#N$C6.
  $D940,$01 #REGe=*#REGhl.
  $D941,$01 #REGa=*#REGde.
  $D942,$01 #REGe=#REGa.
  $D943,$01 #REGa=*#REGbc.
  $D944,$01 Merge the bits from #REGe.
  $D945,$01 Write #REGa to *#REGbc.
  $D946,$01 Increment #REGhl by one.
  $D947,$01 Increment #REGb by one.
  $D948,$01 #REGe=*#REGhl.
  $D949,$01 #REGa=*#REGde.
  $D94A,$01 #REGe=#REGa.
  $D94B,$01 #REGa=*#REGbc.
  $D94C,$01 Merge the bits from #REGe.
  $D94D,$01 Write #REGa to *#REGbc.
  $D94E,$01 Increment #REGhl by one.
  $D94F,$01 Increment #REGb by one.
  $D950,$01 #REGe=*#REGhl.
  $D951,$01 #REGa=*#REGde.
  $D952,$01 #REGe=#REGa.
  $D953,$01 #REGa=*#REGbc.
  $D954,$01 Merge the bits from #REGe.
  $D955,$01 Write #REGa to *#REGbc.
  $D956,$01 Increment #REGhl by one.
  $D957,$01 Increment #REGb by one.
  $D958,$01 #REGe=*#REGhl.
  $D959,$01 #REGa=*#REGde.
  $D95A,$01 #REGe=#REGa.
  $D95B,$01 #REGa=*#REGbc.
  $D95C,$01 Merge the bits from #REGe.
  $D95D,$01 Write #REGa to *#REGbc.
  $D95E,$01 Increment #REGhl by one.
  $D95F,$01 Increment #REGb by one.
  $D960,$01 #REGe=*#REGhl.
  $D961,$01 #REGa=*#REGde.
  $D962,$01 #REGe=#REGa.
  $D963,$01 #REGa=*#REGbc.
  $D964,$01 Merge the bits from #REGe.
  $D965,$01 Write #REGa to *#REGbc.
  $D966,$01 Increment #REGhl by one.
  $D967,$01 Increment #REGb by one.
  $D968,$01 #REGe=*#REGhl.
  $D969,$01 #REGa=*#REGde.
  $D96A,$01 #REGe=#REGa.
  $D96B,$01 #REGa=*#REGbc.
  $D96C,$01 Merge the bits from #REGe.
  $D96D,$01 Write #REGa to *#REGbc.
  $D96E,$01 Increment #REGhl by one.
  $D96F,$01 Increment #REGb by one.
  $D970,$01 #REGe=*#REGhl.
  $D971,$01 #REGa=*#REGde.
  $D972,$01 #REGe=#REGa.
  $D973,$01 #REGa=*#REGbc.
  $D974,$01 Merge the bits from #REGe.
  $D975,$01 Write #REGa to *#REGbc.
  $D976,$01 Increment #REGhl by one.
  $D977,$01 Increment #REGb by one.
  $D978,$01 #REGe=*#REGhl.
  $D979,$01 #REGa=*#REGde.
  $D97A,$01 #REGe=#REGa.
  $D97B,$01 #REGa=*#REGbc.
  $D97C,$01 Merge the bits from #REGe.
  $D97D,$01 Write #REGa to *#REGbc.
  $D97E,$01 Increment #REGhl by one.
  $D97F,$01 Restore #REGde from the stack.
  $D980,$03 Call #R$D986.
  $D983,$03 Jump to #R$D8C6.

c $D986
  $D986,$01 Switch to the shadow registers.
  $D987,$01 Stash #REGhl on the stack.
  $D988,$01 #REGa=#REGb.
  $D989,$03 Rotate #REGa left three positions (bits 5 to 7 are now in positions 0 to 2).
  $D98C,$01 #REGl=#REGa.
  $D98D,$02,b$01 Keep only bits 0-2.
  $D98F,$02 #REGa+=#N$68.
  $D991,$01 #REGh=#REGa.
  $D992,$01 #REGa=#REGl.
  $D993,$02,b$01 Keep only bits 3-7.
  $D995,$01 #REGa+=#REGc.
  $D996,$01 #REGl=#REGa.
  $D997,$03 #REGa=*#R$D214.
  $D99A,$04 Jump to #R$D9A5 if #REGa is lower than #N$E6.
  $D99E,$04 Jump to #R$D9A5 if #REGa is higher than #N$EF.
  $D9A2,$04 Write *#R$D408 to *#REGhl.
  $D9A6,$01 Restore #REGhl from the stack.
  $D9A7,$01 Switch back to the normal registers.
  $D9A8,$01 Return.

c $D9A9 Initialise Sprite
@ $D9A9 label=InitialiseSprite
R $D9A9 A Sprite ID
R $D9A9 BC Screen co-ordinates
  $D9A9,$03 Call #R$DA1D.
  $D9AC,$01 #REGa=#REGc.
  $D9AD,$01 #REGa+=*#REGhl.
  $D9AE,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D9AF,$01 Increment #REGhl by one.
  $D9B0,$01 #REGa=#REGb.
  $D9B1,$01 #REGa+=*#REGhl.
  $D9B2,$01 Increment #REGhl by one.
  $D9B3,$01 #REGe=*#REGhl.
  $D9B4,$01 Increment #REGhl by one.
  $D9B5,$01 #REGd=*#REGhl.
  $D9B6,$03 Increment #REGhl by three.
  $D9B9,$01 Switch to the shadow registers.
  $D9BA,$01 Return.

c $D9BB Draw Monster Sprite
@ $D9BB label=DrawMonsterSprite
R $D9BB A Sprite ID
R $D9BB BC Screen co-ordinates
N $D9BB This is a wrapper around #R$D6C9 which simply takes the given sprite ID
.       and applies a "modifier" if the monster is either Lizzy or Ralph. This
.       then alters the sprite ID to be the correct value for the active
.       monster; bit 6 for Lizzy, bit 7 for Ralph.
  $D9BB,$01 #REGl=#REGa.
  $D9BC,$03 #REGa=*#R$D251.
  $D9BF,$01 Set the bits from #REGl.
  $D9C0,$03 Jump to #R$D6C9.

c $D9C3
  $D9C3,$09 Jump to #R$D9D2 if *#REGix+#N$05 is equal to *#REGix+#N$04.
  $D9CC,$03 Increment *#REGix+#N$05 by one.
  $D9CF,$03 Jump to #R$D9E2.
  $D9D2,$09 Jump to #R$D9E2 if *#REGix+#N$01 is equal to *#REGix+#N$02.
  $D9DB,$03 Increment *#REGix+#N$01 by one.
  $D9DE,$04 Write #N$01 to *#REGix+#N$05.
  $D9E2,$03 #REGa=*#REGix+#N$00.
  $D9E5,$02,b$01 Keep only bits 0-1.
  $D9E7,$03 Jump to #R$D9F3 if the result is zero.
  $D9EA,$03 #REGb=*#REGix+#N$03.
  $D9ED,$03 #REGc=*#REGix+#N$01.
  $D9F0,$03 Jump to #R$D9F9.
  $D9F3,$03 #REGb=*#REGix+#N$01.
  $D9F6,$03 #REGc=*#REGix+#N$03.
  $D9F9,$03 #REGa=*#REGix+#N$05.
  $D9FC,$02 #REGa+=#N$05.
  $D9FE,$01 #REGa+=#REGl.
  $D9FF,$01 #REGl=#REGa.
  $DA00,$02 #REGa=#N$00.
  $DA02,$01 #REGa+=#REGh.
  $DA03,$01 #REGh=#REGa.
  $DA04,$01 #REGa=*#REGhl.
  $DA05,$03 Call #R$D6C9.
  $DA08,$03 #REGa=*#REGix+#N$05.
  $DA0B,$03 Compare #REGa with *#REGix+#N$04.
  $DA0E,$01 Return.

c $DA0F
  $DA0F,$01 Decrease #REGa by one.
  $DA10,$01 #REGa*=#N$02.
  $DA11,$04 #REGa*=#N$05.
  $DA15,$02 #REGh=#N$00.
  $DA17,$01 #REGl=#REGa.
  $DA18,$01 #REGhl+=#REGde.
  $DA19,$03 #REGix=#REGhl using the stack.
  $DA1C,$01 Return.

c $DA1D Get Sprite Information
@ $DA1D label=GetSpriteInfo
R $DA1D A Sprite ID
R $DA1D O:HL Pointer to sprite information for the given ID
  $DA1D,$01 Decrease #REGa by one.
  $DA1E,$03 Create an offset using #REGhl.
  $DA21,$06 #REGhl=#R$C1A1+(#REGhl*#N$04).
  $DA27,$01 Return.

c $DA28 Random Number
@ $DA28 label=RandomNumber
R $DA28 O:A Random number
  $DA28,$04 #REGde=*#R$D21A.
  $DA2C,$01 Increment #REGde by one.
N $DA2D The max value is #N$2800 so test the higher order byte to check if this limit has been hit.
  $DA2D,$05 If #REGd is #N$28 then jump to #R$DA38.
N $DA32 Update the "clock" value.
@ $DA32 label=WriteSeed
  $DA32,$04 Write #REGde back to *#R$D21A.
N $DA36 The "random number" is actually a byte from the Spectrum ROM. The "clock" is used as a pointer to return a value
.       from between memory locations #N($0000,$04,$04)-#N$27FF.
  $DA36,$01 #REGa=*#REGde.
  $DA37,$01 Return.
N $DA38 Reset the "clock" back to #N($0000,$04,$04).
@ $DA38 label=ResetSeed
  $DA38,$02 #REGd=#N$00.
  $DA3A,$03 Jump to #R$DA32.

c $DA3D
  $DA3D,$01 #REGa=#REGd.
  $DA3E,$01 #REGa+=#REGa.
  $DA3F,$01 #REGa+=#REGd.
  $DA40,$01 #REGa+=#REGb.
  $DA41,$02 #REGa+=#N$5F.
  $DA43,$01 #REGd=#REGa.
  $DA44,$01 #REGa=#REGe.
  $DA45,$01 #REGe=#REGc.
  $DA46,$01 Write #REGa to *#REGde.
  $DA47,$01 Stash #REGde on the stack.
  $DA48,$04 #REGd=#N$68+#REGb.
  $DA4C,$03 Write #N$FF to *#REGde.
  $DA4F,$01 Restore #REGde from the stack.
  $DA50,$01 Return.

c $DA51 Handler: Increment Monster X Position
@ $DA51 label=Handler_IncrementMonsterXPosition
  $DA51,$07 Increment *#R$D24D by one.
  $DA58,$01 Return.

c $DA59 Handler: Increment Monster Y Position
@ $DA59 label=Handler_IncrementMonsterYPosition
  $DA59,$07 Increment *#R$D24E by one.
  $DA60,$01 Return.

c $DA61 Handler: Decrease Monster X Position
@ $DA61 label=Handler_DecreaseMonsterXPosition
  $DA61,$07 Decrease *#R$D24D by one.
  $DA68,$01 Return.

c $DA69 Handler: Decrease Monster Y Position
@ $DA69 label=Handler_DecreaseMonsterYPosition
  $DA69,$07 Decrease *#R$D24E by one.
  $DA70,$01 Return.

c $DA71
R $DA71 IX Buildings Table
  $DA71,$03 Write #REGa to *#R$D213.
  $DA74,$04 Write #N$01 to *#REGix+#N$00.
  $DA78,$03 Write #REGa to *#REGix+#N$07.
  $DA7B,$03 Write #REGd to *#REGix+#N$08.
  $DA7E,$01 Stash #REGde on the stack.
  $DA7F,$01 #REGd=#REGa.
  $DA80,$02 #REGe=#N$00.
  $DA82,$03 Call #R$DA3D.
  $DA85,$03 Write #REGe to *#REGix+#N$03.
  $DA88,$03 Write #REGd to *#REGix+#N$04.
  $DA8B,$01 Restore #REGde from the stack.
  $DA8C,$01 #REGa=#REGc.
  $DA8D,$02,b$01 Keep only bits 0-4.
  $DA8F,$03 Write #REGa to *#REGix+#N$01.
  $DA92,$03 #REGhl=#R$CB29.
  $DA95,$01 #REGa=*#REGhl.
  $DA96,$01 Increment #REGhl by one.
  $DA97,$04 Jump to #R$DA95 if #REGa is not equal to #N$FF.
  $DA9B,$01 Decrease #REGe by one.
  $DA9C,$02 Jump to #R$DA95 until #REGe is zero.
  $DA9E,$03 Write #REGhl to *#R$DB52.
  $DAA1,$01 #REGa=*#REGhl.
  $DAA2,$02,b$01 Keep only bits 6-7.
  $DAA4,$02 Rotate #REGa left two positions (bits 6 to 7 are now in positions 0 to 1).
  $DAA6,$04 Jump to #R$DAB1 if #REGa is not equal to #N$00.
  $DAAA,$03 #REGhl=#R$C99E.
  $DAAD,$02 #REGe=#N$06.
  $DAAF,$02 Jump to #R$DAC1.
  $DAB1,$04 Jump to #R$DABC if #REGa is not equal to #N$01.
  $DAB5,$03 #REGhl=#R$C9F9.
  $DAB8,$02 #REGe=#N$07.
  $DABA,$02 Jump to #R$DAC1.
  $DABC,$03 #REGhl=#R$CA57.
  $DABF,$02 #REGe=#N$08.
  $DAC1,$03 #REGa=*#REGix+#N$01.
  $DAC4,$01 #REGa+=#REGe.
  $DAC5,$01 Decrease #REGa by one.
  $DAC6,$03 Write #REGa to *#REGix+#N$02.
  $DAC9,$03 Write #REGe to *#REGix+#N$06.
  $DACC,$02 Decrease #REGe by two.
  $DACE,$01 Stash #REGhl on the stack.
  $DACF,$03 #REGhl=*#R$DB52.
  $DAD2,$01 #REGa=*#REGhl.
  $DAD3,$05 Jump to #R$DB2B if #REGa is equal to #N$FF.
  $DAD8,$01 Restore #REGhl from the stack.
  $DAD9,$03 Increment *#REGix+#N$05 by one.
  $DADC,$02,b$01 Keep only bits 0-5.
  $DADE,$03 Stash #REGhl and #REGde (twice) on the stack.
  $DAE1,$02 #REGd=#N$00.
  $DAE3,$01 #REGhl+=#REGde.
  $DAE4,$01 Decrease #REGa by one.
  $DAE5,$02 Jump to #R$DAE3 until #REGa is zero.
  $DAE7,$01 Restore #REGde from the stack.
  $DAE8,$01 Stash #REGbc on the stack.
  $DAE9,$01 #REGa=*#REGhl.
  $DAEA,$04 Jump to #R$DAF7 if #REGa is higher than #N$0E.
  $DAEE,$04 Jump to #R$DAF7 if #REGa is lower than #N$09.
  $DAF2,$03 Call #R$DB43.
  $DAF5,$02 Jump to #R$DAFC.
  $DAF7,$02 #REGa=#N$11.
  $DAF9,$03 Call #R$DB43.
  $DAFC,$01 #REGa=*#REGhl.
  $DAFD,$03 Call #R$DB43.
  $DB00,$01 Increment #REGhl by one.
  $DB01,$01 Decrease #REGe by one.
  $DB02,$02 Jump to #R$DAFC until #REGe is zero.
  $DB04,$01 Decrease #REGhl by one.
  $DB05,$01 #REGa=*#REGhl.
  $DB06,$04 Jump to #R$DB13 if #REGa is higher than #N$0E.
  $DB0A,$04 Jump to #R$DB13 if #REGa is lower than #N$09.
  $DB0E,$03 Call #R$DB43.
  $DB11,$02 Jump to #R$DB18.
  $DB13,$02 #REGa=#N$14.
  $DB15,$03 Call #R$DB43.
  $DB18,$01 Restore #REGbc from the stack.
  $DB19,$03 #REGhl=#N($0020,$04,$04).
  $DB1C,$01 #REGhl+=#REGbc.
  $DB1D,$01 #REGb=#REGh.
  $DB1E,$01 #REGc=#REGl.
  $DB1F,$01 Restore #REGde from the stack.
  $DB20,$03 #REGhl=*#R$DB52.
  $DB23,$01 Increment #REGhl by one.
  $DB24,$03 Write #REGhl to *#R$DB52.
  $DB27,$01 Restore #REGhl from the stack.
  $DB28,$03 Jump to #R$DACE.
  $DB2B,$01 Restore #REGhl from the stack.
  $DB2C,$03 #REGa=*#REGix+#N$05.
  $DB2F,$01 Increment #REGa by one.
  $DB30,$03 Write #REGa to *#REGix+#N$0A.
  $DB33,$03 Write #REGa to *#REGix+#N$0B.
  $DB36,$01 #REGa+=#REGa.
  $DB37,$01 #REGa+=#REGa.
  $DB38,$02 #REGa+=#N$0A.
  $DB3A,$03 Write #REGa to *#REGix+#N$0C.
  $DB3D,$02 #REGa=#N$02.
  $DB3F,$03 Write #REGa to *#REGix+#N$0D.
  $DB42,$01 Return.
  $DB43,$01 Stash #REGde on the stack.
  $DB44,$01 #REGe=#REGa.
  $DB45,$03 #REGa=*#R$D213.
  $DB48,$01 #REGd=#REGa.
  $DB49,$03 Call #R$DA3D.
  $DB4C,$03 Increment *#REGix+#N$09 by one.
  $DB4F,$01 Increment #REGbc by one.
  $DB50,$01 Restore #REGde from the stack.
  $DB51,$01 Return.
W $DB52,$02
  $DB54,$04 #REGix=#R$D253.
  $DB58,$03 #REGa=*#R$D24D.
  $DB5B,$03 Write #REGa to *#REGix+#N$01.
  $DB5E,$03 Write #REGa to *#REGix+#N$02.
  $DB61,$03 Write #REGa to *#REGix+#N$0D.
  $DB64,$03 Write #REGa to *#REGix+#N$17.
  $DB67,$03 #REGa=*#R$D24E.
  $DB6A,$03 Write #REGa to *#REGix+#N$03.
  $DB6D,$03 Write #REGa to *#REGix+#N$0B.
  $DB70,$03 Write #REGa to *#REGix+#N$0C.
  $DB73,$03 Write #REGa to *#REGix+#N$15.
  $DB76,$03 Write #REGa to *#REGix+#N$16.
  $DB79,$04 #REGde=*#R$D253.
  $DB7D,$01 Return.

c $DB7E Target A Monster
@ $DB7E label=TargetMonster
  $DB7E,$04 Write #N$00 to *#R$D214.
M $DB82,$05 Get a random number between 0-3.
  $DB85,$02,b$01 Keep only bits 0-1.
N $DB87 Note; #R$DBB4 increments #REGa on entry.
@ $DB87 label=ConvertToMonsterId
  $DB87,$03 Call #R$DBB4.
@ $DB8A label=CheckIfMonsterIsAlive
  $DB8A,$04 Jump to #R$DB96 if the monster state is lower than #N$C8.
  $DB8E,$05 Write #N$80 to *#R$D214.
N $DB93 The monster ID e.g. #N$01 - George, #N$02 - Lizzy and #N$03 Ralph.
  $DB93,$01 #REGa=the selected monster ID.
N $DB94 Try again with the next monster in sequence.
  $DB94,$02 Jump to #R$DB87.
@ $DB96 label=SetTargetedMonster_XPos
  $DB96,$03 #REGa=*#R$D214.
  $DB99,$01 Set the bits from #REGb.
  $DB9A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $DB9B,$01 #REGa=the targeted monsters X position.
  $DB9C,$02 Increment #REGa by two.
  $DB9E,$01 #REGb=#REGa.
  $DB9F,$04 Jump to #R$DBA5 if #REGa is lower than #N$64.
  $DBA3,$02 #REGb=#N$00.
@ $DBA5 label=SetTargetedMonster_YPos
  $DBA5,$01 Increment #REGde by one.
  $DBA6,$01 #REGa=the targeted monsters y position.
  $DBA7,$01 Increment #REGa by one.
  $DBA8,$01 #REGc=#REGa.
  $DBA9,$04 Jump to #R$DBAF if #REGa is lower than #N$64.
  $DBAD,$02 #REGc=#N$00.
  $DBAF,$04 Write #N$00 to *#R$D214.
  $DBB3,$01 Return.

c $DBB4 Character Picker
@ $DBB4 label=CharacterPicker
R $DBB4 A Number between 0-3
R $DBB4 O:A Monster state
R $DBB4 O:B Monster number
R $DBB4 O:DE Pointer to Monster X Position
N $DBB4 The monster IDs are the following: #TABLE(default,centre,centre)
. { =h ID | =h Monster }
. { #N$01 | George }
. { #N$02 | Lizzy }
. { #N$03 | Ralph }
. TABLE#
  $DBB4,$01 Make the number 1-4 instead of 0-3.
  $DBB5,$04 Jump to #R$DBBB if #REGa is not equal to #N$04.
N $DBB9 There aren't four monsters so make #N$04 into #N$01. This means George has 50% chance of being chosen, Lizzy and
.       Ralph are 25% each.
  $DBB9,$02 #REGa=#N$01.
@ $DBBB label=GetCharacter
  $DBBB,$01 #REGb=#REGa.
N $DBBC Test if it's George.
@ $DBBC label=CharacterPicker_George
  $DBBC,$04 Jump to #R$DBC7 if #REGa is not equal to #N$01.
  $DBC0,$03 #REGa=*#R$CFD2.
  $DBC3,$03 #REGde=#R$CFDB.
  $DBC6,$01 Return.
N $DBC7 Test if it's Lizzy.
@ $DBC7 label=CharacterPicker_Lizzy
  $DBC7,$04 Jump to #R$DBD2 if #REGa is not equal to #N$02.
  $DBCB,$03 #REGa=*#R$D001.
  $DBCE,$03 #REGde=#R$D00A.
  $DBD1,$01 Return.
N $DBD2 If it's neither of the above then it can only be Ralph.
@ $DBD2 label=CharacterPicker_Ralph
  $DBD2,$03 #REGa=*#R$D030.
  $DBD5,$03 #REGde=#R$D039.
  $DBD8,$01 Return.

c $DBD9
R $DBD9 A Monster ID
R $DBD9 O:A Monster state
R $DBD9 O:B Monster number
R $DBD9 O:DE Pointer to Monster X Position
  $DBD9,$01 Stash the monster ID temporarily.
  $DBDA,$04 Write #N$00 to *#R$D214.
  $DBDE,$01 Restore the monster ID back to #REGa.
  $DBDF,$03 Call #R$DBBB.
  $DBE2,$03 Jump to #R$DB8A.

c $DBE5 Handler: Helicopters
@ $DBE5 label=Handler_Helicopters
  $DBE5,$02 #REGb=#N$06 (maximum possible number of on-screen helicopters).
  $DBE7,$04 #REGix=#R$D295.
  $DBEB,$04 Write #N$00 to *#R$D247.
@ $DBEF label=Handler_Helicopters_Loop
  $DBEF,$01 Stash current helicopter on the stack.
  $DBF0,$08 Jump to #R$DC95 if this helicopter is not active.
  $DBF8,$03 #REGc=*#REGix+#N$01.
  $DBFB,$03 #REGb=*#REGix+#N$02.
  $DBFE,$01 Rotate #REGa left one position, setting the carry flag if bit 7 was set.
  $DBFF,$02 Jump to #R$DC62 if the carry flag is set.
  $DC01,$05 Jump to #R$DC18 if #REGc is equal to #N$21.
  $DC06,$01 #REGa=#REGd.
  $DC07,$02,b$01 Keep only bits 0-1 and 6.
  $DC09,$01 Increment #REGa by one.
  $DC0A,$05 Jump to #R$DC86 until #REGa is equal to #N$44.
  $DC0F,$02 #REGa=#N$40.
  $DC11,$01 Increment #REGc by one.
  $DC12,$03 Write #REGc to *#REGix+#N$01.
  $DC15,$03 Jump to #R$DC86.
  $DC18,$02 #REGb=#N$04.
  $DC1A,$02 #REGc=#N$20.
  $DC1C,$07 Jump to #R$DC4D if *#R$D3F6 is equal to #N$06.
N $DC23 Loop to find an empty slot.
  $DC23,$03 #REGhl=#R$D2A3 (#R$D2A7-#N$04).
@ $DC26 label=Handler_Helicopters_FindSlot
  $DC26,$04 Increment #REGhl by four.
  $DC2A,$04 Jump to #R$DC26 if *#REGhl is not zero.
  $DC2E,$01 Write #REGb to *#REGhl.
  $DC2F,$01 Increment #REGhl by one.
  $DC30,$01 Write #REGc to *#REGhl.
  $DC31,$01 Increment #REGhl by one.
  $DC32,$03 Call #R$DA28.
  $DC35,$02,b$01 Keep only bits 0-4.
M $DC32,$05 Get a random number between 0-31.
  $DC37,$02 #REGa+=#N$08.
  $DC39,$02,b$01 Keep only bits 0-4.
  $DC3B,$01 Write #REGa to *#REGhl.
  $DC3C,$01 Increment #REGhl by one.
  $DC3D,$03 #REGa=*#REGix+#N$02.
  $DC40,$01 Decrease #REGa by one.
  $DC41,$02 RLCA.
  $DC43,$02 #REGa+=#N$04.
  $DC45,$01 Write #REGa to *#REGhl.
  $DC46,$03 Call #R$DA28.
  $DC49,$02,b$01 Keep only bits 0-1.
M $DC46,$05 Get a random number between 0-3.
  $DC4B,$01 #REGa+=*#REGhl.
  $DC4C,$01 Write #REGa to *#REGhl.
  $DC4D,$04 Write #N$00 to *#REGix+#N$00.
  $DC51,$07 Decrease *#R$D3F5 by one.
  $DC58,$07 Increment *#R$D3F6 by one.
  $DC5F,$03 Jump to #R$DC95.
  $DC62,$06 Jump to #R$DC7F if #REGc is equal to #N$FC.
  $DC68,$05 Write #N$01 to *#R$D247.
  $DC6D,$01 #REGa=#REGd.
  $DC6E,$02,b$01 Keep only bits 0-1 and 7.
  $DC70,$01 Increment #REGa by one.
  $DC71,$05 Jump to #R$DC86 if #REGa is not equal to #N$84.
  $DC76,$02 #REGa=#N$80.
  $DC78,$01 Decrease #REGc by one.
  $DC79,$03 Write #REGc to *#REGix+#N$01.
  $DC7C,$03 Jump to #R$DC86.
  $DC7F,$02 #REGb=#N$02.
  $DC81,$02 #REGc=#N$FC.
  $DC83,$03 Jump to #R$DC1C.
  $DC86,$03 Write #REGa to *#REGix+#N$00.
  $DC89,$02,b$01 Keep only bits 0-1.
  $DC8B,$01 #REGa+=#REGa.
  $DC8C,$02 #REGa+=#N$DE.
  $DC8E,$03 Call #R$D6C9.
  $DC91,$04 Write #N$00 to *#R$D247.
@ $DC95 label=Handler_Helicopters_Next
  $DC95,$06 Move onto the next helicopter table data.
  $DC9B,$01 Restore helicopter ID from the stack.
  $DC9C,$01 Decrease helicopter ID by one.
  $DC9D,$03 Jump to #R$DBEF until all helicopters have been processed.
  $DCA0,$01 Return.

c $DCA1 Handler: Spawn Humans
@ $DCA1 label=Handler_SpawnHumans
N $DCA1 Just return if the number of active humans is already at the maximum amount for this level.
  $DCA1,$04 #REGb=*#R$D3F4.
  $DCA5,$05 Return if *#R$D211 is equal to #REGb.
M $DCA1,$09 Return if *#R$D3F4 is equal to *#R$D211.
N $DCAA Add a hint of randomness to whether we proceed or not. Roughly 50% chance.
  $DCAA,$04 #REGb=random number.
  $DCAE,$03 #REGa=*#R$D210 (this appears to only ever be set to #N$80).
  $DCB1,$02 Return if #REGa is lower than #REGb.
N $DCB3 Creates a random number between #N($0000,$04,$04)-#N$02FD.
  $DCB3,$03 Call #R$DA28.
  $DCB6,$03 #REGhl=random number between #N($0000,$04,$04)-#N($00FF,$04,$04).
  $DCB9,$03 Call #R$DA28.
  $DCBC,$02 #REGbc=random number between #N($0000,$04,$04)-#N($00FF,$04,$04).
  $DCBE,$03 Call #R$DA28.
  $DCC1,$02 #REGde=random number between #N($0000,$04,$04)-#N($00FF,$04,$04).
  $DCC3,$02 Add them all together: #REGhl=#REGhl+#REGde+#REGbc.
  $DCC5,$02 #REGbc=#REGhl.
N $DCC7 Adding #N$65 to #REGh gives an address range of anywhere between #R$6500(#N$6500)-#N$67FD.
  $DCC7,$04 #REGh+=#N$65.
  $DCCB,$04 Jump to #R$DCD5 if *#REGhl is not zero.
N $DCCF The address in the buffer isn't compatible with containing a human, so have one more try...
  $DCCF,$03 Decrease #REGh by three.
N $DCD2 Just give up here if we still haven't found a building to land on.
  $DCD2,$03 Return if *#REGhl is zero.
N $DCD5 The routine has found "something" but we still need to check that it's compatible with containing a human.
@ $DCD5 label=FoundSolidMatter
  $DCD5,$02,b$01 Keep only bit 6.
  $DCD7,$01 #REGd=#REGa.
  $DCD8,$01 #REGa=*#REGhl.
  $DCD9,$03 Return if #REGa is higher than #N$07.
  $DCDC,$03 Return if #REGa is lower than #N$03.
  $DCDF,$02,b$01 Keep only bit 0.
  $DCE1,$02 Jump to #R$DCEF if the result is zero.
  $DCE3,$02 #REGa=#N$07.
  $DCE5,$01 Set the bits from #REGd.
  $DCE6,$01 Write #REGa to *#REGhl.
  $DCE7,$01 Increment #REGl by one.
  $DCE8,$02 #REGa=#N$08.
  $DCEA,$01 Set the bits from #REGd.
  $DCEB,$01 Write #REGa to *#REGhl.
  $DCEC,$01 Decrease #REGl by one.
  $DCED,$02 Jump to #R$DCFA.
  $DCEF,$02 #REGa=#N$08.
  $DCF1,$01 Set the bits from #REGd.
  $DCF2,$01 Write #REGa to *#REGhl.
  $DCF3,$01 Decrease #REGl by one.
  $DCF4,$02 #REGa=#N$07.
  $DCF6,$01 Set the bits from #REGd.
  $DCF7,$01 Write #REGa to *#REGhl.
  $DCF8,$01 Increment #REGl by one.
  $DCF9,$01 Decrease #REGc by one.
  $DCFA,$01 Stash #REGbc on the stack.
  $DCFB,$04 #REGb+=#N$68.
  $DCFF,$03 Write #N$FF to *#REGbc.
  $DD02,$01 Increment #REGc by one.
  $DD03,$01 Write #REGa to *#REGbc.
  $DD04,$01 Exchange the #REGde and #REGhl registers.
N $DD05 Register that a new human has been created.
  $DD05,$07 Increment *#R$D3F4 by one.
N $DD0C Loop to find an empty slot.
  $DD0C,$03 #REGhl=#R$D251 (#R$D255-#N$04).
@ $DD0F label=Handler_Humans_FindSlot
  $DD0F,$04 Increment #REGhl by four.
  $DD13,$04 Jump to #R$DD0F if *#REGhl is not zero.
N $DD17 Found an empty slot.
N $DD17 All humans start as type #R$E295(#N$01).
  $DD17,$02 Write human type #R$E295(#N$01) to *#REGhl.
N $DD19 Set a random countdown value.
  $DD19,$01 Increment #REGhl by one.
  $DD1A,$03 Call #R$DA28.
  $DD1D,$02,b$01 Keep only bits 0-4.
M $DD1A,$07 Get a random number between #N$1F-#N$3E.
  $DD1F,$02 #REGa+=#N$1F.
  $DD21,$01 Write #REGa as the countdown to *#REGhl.
  $DD22,$01 Increment #REGhl by one.
  $DD23,$01 Restore #REGbc from the stack.
  $DD24,$01 #REGa=#REGc.
  $DD25,$02,b$01 Keep only bits 0-4.
  $DD27,$01 Write #REGa to *#REGhl.
  $DD28,$01 Increment #REGhl by one.
  $DD29,$01 #REGa=#REGb.
  $DD2A,$03 Rotate #REGa left three positions (bits 5 to 7 are now in positions 0 to 2).
  $DD2D,$01 Store the result in #REGb.
  $DD2E,$01 #REGa=#REGc.
  $DD2F,$03 Rotate #REGa left three positions (bits 5 to 7 are now in positions 0 to 2).
  $DD32,$02,b$01 Keep only bits 0-2.
  $DD34,$01 Set the bits from #REGb.
  $DD35,$01 Decrease #REGa by one.
  $DD36,$01 Write #REGa to *#REGhl.
  $DD37,$01 Return.

c $DD38 Get Sprite ID?
@ $DD38 label=GetSpriteID
R $DD38 BC Screen co-ordinates
R $DD38 O:A Sprite ID
R $DD38 O:HL Buffer address of the sprite
N $DD38 Creates an offset in #REGhl using #REGb.
  $DD38,$02 #REGh=#N$00.
  $DD3A,$01 #REGl=#REGb.
N $DD3B Creates an offset in #REGde using #REGc.
  $DD3B,$01 #REGd=#N$00.
  $DD3C,$01 #REGe=#REGc.
N $DD3D Position Y * #N$20 to find the row + position X to find the column.
  $DD3D,$06 #REGhl*=#N$20+#REGde.
N $DD43 The game buffer begins at #R$6800(#N$6800)-#N$6AFF which is #N$0300 screen locations (#N$20x#N$18).
  $DD43,$04 #REGh+=#N$68.
N $DD47 Fetch the sprite ID from this location.
  $DD47,$01 #REGa=*#REGhl.
N $DD48 Never return with #N$FF instead use #N$00.
  $DD48,$03 Return if #REGa is not equal to #N$FF.
  $DD4B,$01 #REGa=#N$00.
  $DD4C,$01 Return.

c $DD4D Convert To Monster Data
@ $DD4D label=Convert_To_MonsterData
R $DD4D O:A Monster ID
E $DD4D Continue on to #R$DD52.
  $DD4D,$02,b$01 Keep only bits 6-7.
  $DD4F,$02 Rotate #REGa left twice, moving bits 6-7 to bits 0-1.
N $DD51 Converts 0-2 into 1-3 for the monster ID.
  $DD51,$01 Increment #REGa by one.

c $DD52 Sets #REGiy To Monster Data
@ $DD52 label=SetIYMonsterData
R $DD52 A Monster ID
R $DD52 O:IY Monster data
  $DD52,$04 Jump to #R$DD5B if #REGa is not equal to #N$01.
N $DD56 #REGa is #N$01; set to George:
  $DD56,$04 #REGiy=#R$CFD2.
  $DD5A,$01 Return.
N $DD5B If it's not #N$01, is it #N$02?
@ $DD5B label=SetIYMonsterData_Lizzy
  $DD5B,$04 Jump to #R$DD64 if #REGa is not equal to #N$02.
N $DD5F #REGa is #N$02; set to Lizzy:
  $DD5F,$04 #REGiy=#R$D001.
  $DD63,$01 Return.
N $DD64 Just return if #REGa is none of #N$01, #N$02 or #N$03.
@ $DD64 label=SetIYMonsterData_Ralph
  $DD64,$03 Return if #REGa is not equal to #N$03.
N $DD67 #REGa is #N$03; set to Ralph:
  $DD67,$04 #REGiy=#R$D030.
  $DD6B,$01 Return.

c $DD6C Handler: Decrease Energy
@ $DD6C label=Handler_DecreaseEnergy
R $DD6C IY Monster Pointer
R $DD6C A Damage value
  $DD6C,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $DD6D,$06 Return if the monster state (*#REGiy+#N$00) is higher than #N$21 (includes the "explosion" and "human"
.           states). If this is the case then the monster is already "game over".
  $DD73,$01 Exchange the shadow #REGaf register back to the normal #REGaf register.
N $DD74 Keep decreasing the monsters energy by the number held in #REGa.
@ $DD74 label=Handler_DecreaseEnergy_Loop
  $DD74,$03 Decrease monster energy (*#REGiy+#N$0C) by one.
  $DD77,$01 Decrease #REGa by one.
  $DD78,$02 Jump to #R$DD74 until #REGa is zero.
N $DD7A Is the monster still in-play?
  $DD7A,$06 Return if *#REGiy+#N$0C is lower than #N$C8.
N $DD80 If the monsters energy falls to less than #N$00 - their turn is over.
  $DD80,$04 Reset monsters energy to #N$00 (in *#REGiy+#N$0C).
  $DD84,$04 Write #N$21 (explosion state) to the current monster state (*#REGiy+#N$00).
  $DD88,$01 Return.

c $DD89 Handler: Increase Energy (Eaten Food)
R $DD89 IY Monster data
R $DD89 A Energy increment
@ $DD89 label=Handler_IncreaseEnergy
  $DD89,$06 Add the energy value to the monsters current energy level (*#REGiy+#N$0C).
N $DD8F Ensure the maximum value for monster energy is not breached.
  $DD8F,$03 Return if the monsters energy is lower than #N$41.
  $DD92,$04 Else write #N$40 to the monsters energy (*#REGiy+#N$0C) to keep it within the acceptable range.
  $DD96,$01 Return.

c $DD97 Handler: Add Points To Score
@ $DD97 label=Handler_AddPoints
R $DD97 A Monster ID
R $DD97 D Points to add to score digit
R $DD97 E Digit to update
N $DD97 Derive pointer to monster score messaging from the given ID.
  $DD97,$04 Jump to #R$DDA0 if #REGa is not targeting George (#N$01).
N $DD9B George:
  $DD9B,$03 #REGhl=#R$D066.
  $DD9E,$02 Jump to #R$DDAA.
N $DDA0 Ralph:
@ $DDA0 label=AddPoints_CheckLizzy
  $DDA0,$03 #REGhl=#R$D082.
  $DDA3,$04 Jump to #R$DDAA if #REGa is not targeting Lizzy (#N$02) (i.e. keep Ralph which was set above).
N $DDA7 Lizzy:
  $DDA7,$03 #REGhl=#R$D074.
N $DDAA Apply points to score.
@ $DDAA label=AddPointsToScore
  $DDAA,$01 #REGa=#REGe.
  $DDAB,$02,b$01 Flip bits 0-2.
  $DDAD,$01 Decrease #REGa by one.
  $DDAE,$01 #REGe=#REGa.
M $DDAA,$05 Work out which digit to update.
  $DDAF,$01 #REGa=points to add.
  $DDB0,$03 Move #REGhl to the appropriate score digit.
@ $DDB3 label=AddPointsToScore_Loop
  $DDB3,$01 #REGa=*#REGhl+point value held in #REGa.
  $DDB4,$01 Write #REGa to *#REGhl.
  $DDB5,$03 Return if #REGa is lower than #N$3A (ASCII #N$39 is "#CHR$39").
N $DDB8 This digit is higher than "#CHR$39" so subtract 10 to make it a valid number again.
  $DDB8,$02 #REGa-=#N$0A.
  $DDBA,$01 Update the current score digit.
N $DDBB We work backwards here, as the smaller units are on the right-hand side. So now we want to add "1" to the next
.       digit. At it's simplest; 19+01 would first set "10" then move the pointer to the "tens" and add one to it to
.       equal 20.
  $DDBB,$01 Decrease the score pointer by one.
  $DDBC,$02 #REGa=#N$01.
  $DDBE,$02 Jump to #R$DDB3.

c $DDC0 Choose Control Type
@ $DDC0 label=ChooseControlType
  $DDC0,$03 #REGde=#N$FF2F.
  $DDC3,$03 #REGbc=#N$FEFE.
@ $DDC6 label=ReadKeyboard_Loop
  $DDC6,$02 Read from the keyboard.
  $DDC8,$01 Invert the bits in #REGa.
  $DDC9,$02,b$01 Keep only bits 0-4.
  $DDCB,$02 Jump to #R$DDDA if there's no match.
  $DDCD,$01 Increment #REGd by one.
  $DDCE,$01 Return if #REGd is not zero.
  $DDCF,$01 #REGh=#REGa.
  $DDD0,$01 #REGa=#REGe.
  $DDD1,$02 #REGa-=#N$08.
  $DDD3,$02 Shift #REGh right.
  $DDD5,$02 Jump to #R$DDD1 if {} is higher.
  $DDD7,$01 Return if {} is not zero.
  $DDD8,$01 #REGd=#REGa.
  $DDD9,$01 #REGl=#REGb.
  $DDDA,$01 Decrease #REGe by one.
  $DDDB,$02 Rotate #REGb left (with carry).
  $DDDD,$02 Jump to #R$DDC6 if {} is lower.
  $DDDF,$01 #REGa=#REGd.
  $DDE0,$02,b$01 Keep only bits 3-5.
  $DDE2,$03 Rotate #REGa right three positions (bits 3 to 5 are now in positions 0 to 2).
  $DDE5,$01 Stash #REGhl on the stack.
  $DDE6,$03 #REGhl=#R$DDF2.
  $DDE9,$02 #REGb=#N$00.
  $DDEB,$01 #REGc=#REGa.
  $DDEC,$01 #REGhl+=#REGbc.
  $DDED,$01 #REGb=*#REGhl.
  $DDEE,$01 Restore #REGhl from the stack.
  $DDEF,$01 #REGh=#REGb.
  $DDF0,$01 #REGa=#N$00.
  $DDF1,$01 Return.
B $DDF2

> $DE00 @org
c $DE00 Entry Point
D $DE00 When the game has loaded #R$6B00 contains this copyright splash.
D $DE00 #PUSHS #SIM(start=$DE06,stop=$DE11) #UDGTABLE { #SCR$02(splash-screen) } UDGTABLE# #POPS
@ $DE00 label=EntryPoint
E $DE00 Continue on to #R$DE19.
  $DE00,$04 #HTML(Write #N$00 to <a href="https://skoolkid.github.io/rom/asm/5C48.html">BORDCR</a>.)
  $DE04,$02 Set the border colour to BLACK.
  $DE06,$03 #REGhl=#R$6B00.
  $DE09,$03 #REGde=#R$4000(#N$4000) (screen buffer).
  $DE0C,$03 #REGbc=#N$1B00.
  $DE0F,$02 Copy the splash screen to the screen buffer.
N $DE11 Show this for an extended period of time.
  $DE11,$02 #REGa=#N$0A.
@ $DE13 label=GameEntryPoint_PauseLoop
  $DE13,$03 Call #R$FBEC.
  $DE16,$01 Decrease #REGa by one.
  $DE17,$02 Jump to #R$DE13 until #REGa is zero.

c $DE19 Game Entry Point
@ $DE19 label=GameEntryPoint
  $DE19,$03 Call #R$F916.
  $DE1C,$03 Call #R$FD2B.
  $DE1F,$03 Set the border colour to BLACK.
  $DE22,$03 Call #R$DF46.
  $DE25,$03 Call #R$DEE1.
@ $DE28 label=GameStartLevel
  $DE28,$03 Call #R$DEC6.
  $DE2B,$03 #REGa=*#R$DF44.
  $DE2E,$03 Call #R$DF90.
N $DE31 Game loop.
@ $DE31 label=GameLoop
  $DE31,$03 Call #R$F8CF.
N $DE34 Is the game still in-play?
  $DE34,$06 Jump to #R$DE19 if *#R$D3FD is not zero.
  $DE3A,$04 #HTML(Write #N$00 to <a href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
N $DE3E Check each monster state. If any are "in-play" then jump to #R$DE53. If not, we cycle back round to #R$DE19.
N $DE3E Is George still in-play?
  $DE3E,$07 Jump to #R$DE53 if *#R$CFD2 is not equal to #N$FF (in-play).
N $DE45 Is Lizzy still in-play?
  $DE45,$07 Jump to #R$DE53 if *#R$D001 is not equal to #N$FF (in-play).
N $DE4C Is Ralph still in-play?
  $DE4C,$07 Jump to #R$DE19 if *#R$D030 is equal to #N$FF (in-play).
N $DE53 The game is in-play so run the handlers until the level is completed.
@ $DE53 label=Game_InPlay
  $DE53,$06 Jump to #R$DE77 until *#R$D3F3 is zero - until all the buildings have collapsed.
N $DE59 Keep running the handlers for a short while even though all the buildings have collapsed. It would be a bit
.       jarring if the level stopped instantly after the last building rubble cleared.s
  $DE59,$03 #REGa=*#R$D216.
  $DE5C,$04 Decrease *#R$D216 by one.
  $DE60,$02 Jump to #R$DE77 until #REGa is zero.
N $DE62 Level complete! Move onto the next level.
  $DE62,$03 #REGa=*#R$DF44.
  $DE65,$01 Increment level number by one.
N $DE66 Check to see if all levels (#N$28 in total) have been played, if so loop back to level #N$01.
  $DE66,$04 Jump to #R$DE6C if #REGa is not equal to #N$29.
N $DE6A Else cycle back to level 1 again.
  $DE6A,$02 #REGa=level #N$01.
@ $DE6C label=WriteLevelNumber
  $DE6C,$03 Write level number to *#R$DF44.
  $DE6F,$03 Call #R$FD2B.
  $DE72,$03 Call #R$DF46.
  $DE75,$02 Jump to #R$DE28.

c $DE77 Run Handlers
@ $DE77 label=RunHandlers
  $DE77,$03 Call #R$EFE0.
  $DE7A,$03 Call #R$DCA1.
  $DE7D,$03 Call #R$F28B.
  $DE80,$03 Call #R$F2CA.
  $DE83,$03 Call #R$D409.
  $DE86,$03 Call #R$F31C.
  $DE89,$03 Call #R$E25D.
  $DE8C,$03 Call #R$F726.
  $DE8F,$03 Call #R$DBE5.
  $DE92,$03 Call #R$FC39.
  $DE95,$03 Call #R$E119.
  $DE98,$03 Call #R$F10E.
  $DE9B,$03 Call #R$FCB6.
  $DE9E,$03 Call #R$F3EF.
  $DEA1,$03 Call #R$E576.
  $DEA4,$03 Call #R$F69F.
  $DEA7,$03 Call #R$F788.
  $DEAA,$03 Call #R$F434.
  $DEAD,$03 Call #R$FC1A.
  $DEB0,$03 Call #R$D604.
  $DEB3,$03 Call #R$D5F8.
  $DEB6,$03 Call #R$F8BE.
  $DEB9,$03 Call #R$FF00.
@ $DEBC label=WaitForFrameBuffer
  $DEBC,$03 #HTML(#REGhl=<a href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
  $DEBF,$04 Jump to #R$DEBC if #REGa is lower than #N$06.
  $DEC3,$03 Jump to #R$DE31.

c $DEC6
  $DEC6,$03 Call #R$FBDB.
  $DEC9,$05 Write #N$80 to #R$D210.
  $DECE,$05 Write #N$20 to #R$D216.
  $DED3,$03 #REGhl=#R$D255.
  $DED6,$03 #REGde=#REGhl+#N$01.
  $DED9,$03 #REGbc=#N$01AD.
  $DEDC,$02 Write #N$00 to *#REGhl.
  $DEDE,$02
  $DEE0,$01 Return.

c $DEE1 Initialise New Game
@ $DEE1 label=InitialiseNewGame
  $DEE1,$01 #REGa=#N$00 (face right).
N $DEE2 Set up George.
  $DEE2,$04 #REGiy=#R$CFD2.
  $DEE6,$03 Call #R$DF1F.
  $DEE9,$04 Write #N$01 (face left) to monster direction (*#REGiy+#N$03).
  $DEED,$04 Write #N$15 to monster X position (*#REGiy+#N$09).
N $DEF1 Set up Lizzy.
  $DEF1,$04 #REGiy=#R$D001.
  $DEF5,$03 Call #R$DF1F.
  $DEF8,$04 Write #N$FD to monster X position (*#REGiy+#N$09).
N $DEFC Set up Ralph.
  $DEFC,$04 #REGiy=#R$D030.
  $DF00,$03 Call #R$DF1F.
  $DF03,$04 Write #N$08 to monster X position (*#REGiy+#N$09).
N $DF07 Set starting level.
  $DF07,$05 Write #N$01 to *#R$DF44.
N $DF0C Set all monster scores to "000000".
  $DF0C,$03 #REGhl=#R$D066.
  $DF0F,$03 Call #R$DF39.
  $DF12,$03 #REGhl=#R$D074.
  $DF15,$03 Call #R$DF39.
  $DF18,$03 #REGhl=#R$D082.
  $DF1B,$03 Call #R$DF39.
  $DF1E,$01 Return.

c $DF1F Set Monster States
@ $DF1F label=SetMonsterStates
R $DF1F A Default for
N $DF1F See: #R$CFD2, #R$D001, #R$D030.
  $DF1F,$04 Write #R$EFD0(#N$1C) (falling) to monster state (#REGiy+#N$00).
  $DF23,$09 Write #REGa to: #LIST { #REGiy+#N$02 } { monster direction (#REGiy+#N$03) } { #REGiy+#N$08 } LIST#
  $DF2C,$04 Write #N$01 to #REGiy+#N$04.
  $DF30,$04 Write #N$FE to monster Y position (#REGiy+#N$0A).
  $DF34,$04 Write #N$40 to monster energy (#REGiy+#N$0C).
  $DF38,$01 Return.

c $DF39 Reset Score
@ $DF39 label=ResetScore
R $DF39 HL Pointer to monsters score
  $DF39,$03 #REGde=#REGhl+#N$01.
  $DF3C,$03 #REGbc=#N($0005,$04,$04).
  $DF3F,$02 Write #N$30 (ASCII "0") to *#REGhl.
  $DF41,$02 Copy the "0" to the following five memory locations.
  $DF43,$01 Return.

g $DF44 Game: Current Level
@ $DF44 label=CurrentLevel
  $DF44,$01

g $DF45 Temporary Monster ID
@ $DF45 label=Temp_MonsterID
  $DF45,$01

c $DF46 Set Monster Defaults
@ $DF46 label=MonsterDefaults
N $DF46 George:
  $DF46,$04 #REGiy=#R$CFD2.
  $DF4A,$03 Call #R$DF68.
  $DF4D,$04 Write #N$01 to #R$CFDB (*#REGiy+#N$09).
N $DF51 Lizzy:
  $DF51,$04 #REGiy=#R$D001.
  $DF55,$03 Call #R$DF68.
  $DF58,$04 Write #N$0D to #R$D00A (*#REGiy+#N$09).
N $DF5C Ralph:
  $DF5C,$04 #REGiy=#R$D030.
  $DF60,$03 Call #R$DF68.
  $DF63,$04 Write #N$19 to #R$D039 (*#REGiy+#N$09).
  $DF67,$01 Return.
N $DF68 Sets common defaults on #REGiy=Monster data.
@ $DF68 label=SetMonsterDefaults
  $DF68,$06 Return if the monster state (#REGiy+#N$00) is "No Monster".
  $DF6E,$07 Write #N$00 to: #LIST { State (#REGiy+#N$00) } { #REGiy+#N$02 } LIST#
  $DF75,$04 Write #N$01 (face left) to monster direction (#REGiy+#N$03).
  $DF79,$03 Write #N$00 to #REGiy+#N$04.
  $DF7C,$04 Write #N$19 to #REGiy+#N$05.
  $DF80,$04 Write #N$03 to #REGiy+#N$06.
  $DF84,$04 Write #N$19 to #REGiy+#N$07.
  $DF88,$03 Write #N$00 to #REGiy+#N$08.
  $DF8B,$04 Write #N$12 to Y position (#REGiy+#N$0A).
  $DF8F,$01 Return.

c $DF90 Find Scene
@ $DF90 label=FindScene
R $DF90 A Level
N $DF90 In order to find the scene data for the requested level, the code "counts" the number of terminator bytes found.
  $DF90,$01 #REGe=level.
  $DF91,$03 #REGhl=#R$CDE2.
@ $DF94 label=FindScene_Loop
  $DF94,$01 #REGa=byte of scene data.
  $DF95,$01 Increment scene data pointer by one.
N $DF96 Check for a terminator byte.
  $DF96,$04 Loop back to #R$DF94 until #REGa is equal to #N$FF.
N $DF9A Only continue when the "level" has been decreased to zero.
.       This is when the appropriate scene data has been found.
  $DF9A,$01 Decrease level by one.
  $DF9B,$02 Jump to #R$DF94 until #REGe is zero.
N $DF9D Process the scene data.
  $DF9D,$01 #REGa=byte of scene data.
  $DF9E,$01 Stash the scene data pointer on the stack temporarily.
  $DF9F,$03 Call #R$D50C.
  $DFA2,$01 Restore the scene data pointer from the stack.
  $DFA3,$01 Increment the scene data pointer by one.
  $DFA4,$01 #REGa=byte of scene data.
  $DFA5,$01 Stash the scene data pointer on the stack temporarily.
  $DFA6,$03 Call #R$D55B.
  $DFA9,$01 Restore the scene data pointer from the stack.
  $DFAA,$01 Increment the scene data pointer by one.
  $DFAB,$01 #REGa=byte of scene data.
  $DFAC,$02,b$01 Keep only bits 3-6.
  $DFAE,$03 Rotate #REGa right three positions (bits 3 to 6 are now in positions 0 to 3).
  $DFB1,$01 Stash the scene data pointer on the stack temporarily.
  $DFB2,$03 Write #REGa to *#R$D400.
  $DFB5,$03 Call #R$D593.
  $DFB8,$01 Restore the scene data pointer from the stack.
  $DFB9,$07 Write #N$00 to: #LIST { *#R$D220 } { *#R$D222 } LIST#
N $DFC0 Set the number of buildings for this level.
  $DFC0,$01 #REGa=*#REGhl.
  $DFC1,$02,b$01 Keep only bits 0-2.
  $DFC3,$03 Write #REGa to *#R$D3F3.
  $DFC6,$01 Increment the scene data pointer by one.
  $DFC7,$02 Stash #REGaf and #REGhl on the stack.
  $DFC9,$03 #REGhl=#R$D39F.
  $DFCC,$03 #REGa=*#R$D220.
  $DFCF,$02 #REGd=#N$00.
  $DFD1,$01 #REGe=#REGa.
  $DFD2,$01 #REGhl+=#REGde.
  $DFD3,$03 #REGix=#REGhl using the stack.
  $DFD6,$02 #REGa+=#N$0E.
  $DFD8,$03 Write #REGa to *#R$D220.
  $DFDB,$03 #REGa=*#R$D222.
  $DFDE,$01 Increment #REGa by one.
  $DFDF,$03 Write #REGa to *#R$D222.
  $DFE2,$01 Restore #REGhl from the stack.
  $DFE3,$01 #REGa=*#REGhl.
  $DFE4,$02,b$01 Keep only bits 0-6.
  $DFE6,$01 #REGe=#REGa.
  $DFE7,$01 #REGa=*#REGhl.
  $DFE8,$02,b$01 Keep only bit 7.
  $DFEA,$01 Move bit 7 to bit 0, and also set/ unset the carry flag.
  $DFEB,$01 Increment #REGa by one.
  $DFEC,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $DFED,$01 Increment #REGhl by one.
  $DFEE,$01 #REGa=*#REGhl.
  $DFEF,$02,b$01 Keep only bits 5-7.
  $DFF1,$03 Rotate #REGa left three positions (bits 5 to 7 are now in positions 0 to 2).
  $DFF4,$02 #REGb=#N$00.
  $DFF6,$01 #REGc=#REGa.
  $DFF7,$01 Stash #REGhl on the stack.
  $DFF8,$03 #REGhl=#R$E0A5.
  $DFFB,$01 #REGhl+=#REGbc.
  $DFFC,$01 #REGd=*#REGhl.
  $DFFD,$01 Restore #REGhl from the stack.
  $DFFE,$01 #REGa=*#REGhl.
  $DFFF,$02,b$01 Keep only bits 0-4.
  $E001,$01 #REGc=#REGa.
  $E002,$01 Increment #REGhl by one.
  $E003,$01 Stash #REGhl on the stack.
  $E004,$03 #REGhl=#N($0080,$04,$04).
  $E007,$01 #REGhl+=#REGbc.
  $E008,$02 #REGc=#N$08.
  $E00A,$01 #REGa=#REGe.
  $E00B,$01 Decrease #REGa by one.
  $E00C,$01 Decrease #REGc by one.
  $E00D,$02 #REGa-=#N$06.
  $E00F,$02 Jump to #R$E00C if there's no carry (i.e. #REGa was higher than #N$06).
  $E011,$06 Rotate #REGc right three positions.
  $E017,$01 #REGhl+=#REGbc.
  $E018,$01 #REGb=#REGh.
  $E019,$01 #REGc=#REGl.
  $E01A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E01B,$03 Call #R$DA71.
  $E01E,$03 #REGhl=#R$D31F.
  $E021,$03 #REGa=*#REGix+#N$07.
  $E024,$01 Rotate #REGa left one position, setting the carry flag if bit 0 was set.
  $E025,$02 Jump to #R$E02A if the carry flag was set.
  $E027,$03 #REGhl=#R$D35F.
  $E02A,$02 #REGd=#N$00.
  $E02C,$03 #REGe=*#REGix+#N$01.
  $E02F,$01 #REGhl+=#REGde.
  $E030,$03 #REGa=*#REGix+#N$02.
  $E033,$01 #REGa-=#REGe.
  $E034,$01 Increment #REGa by one.
  $E035,$01 #REGb=#REGa.
  $E036,$03 #REGa=*#R$D222.
  $E039,$01 Write #REGa to *#REGhl.
  $E03A,$01 Stash #REGhl on the stack.
  $E03B,$02 #REGe=#N$20.
  $E03D,$01 #REGhl+=#REGde.
  $E03E,$03 #REGa=*#REGix+#N$08.
  $E041,$01 Write #REGa to *#REGhl.
  $E042,$01 Restore #REGhl from the stack.
  $E043,$01 Increment #REGhl by one.
  $E044,$02 Decrease counter by one and loop back to #R$E036 until counter is zero.
  $E046,$02 Restore #REGhl and #REGaf from the stack.
  $E048,$01 Decrease #REGa by one.
  $E049,$03 Jump to #R$DFC7 until #REGa is zero.
  $E04C,$03 #REGhl=#R$D31F.
  $E04F,$03 #REGde=#R$D35F.
  $E052,$02 #REGb=#N$20 (counter).
  $E054,$01 #REGa=*#REGde.
  $E055,$03 Rotate #REGa left three positions.
  $E058,$01 Set the bits from *#REGhl.
  $E059,$01 Write #REGa to *#REGhl.
  $E05A,$01 Increment #REGhl by one.
  $E05B,$01 Increment #REGde by one.
  $E05C,$02 Decrease counter by one and loop back to #R$E054 until counter is zero.
N $E05E Default to not using the train.
  $E05E,$05 Write #N$FE (spawning "off") to *#R$D405.
  $E063,$07 Jump to #R$E099 if *#R$D400 is equal to #N$02.
  $E06A,$04 Jump to #R$E09E if #REGa is equal to #N$05.
N $E06E Anything else uses vehicles.
  $E06E,$05 Write #N$18 to *#R$D401.
@ $E073 label=Helicopters_CalculateCount
  $E073,$03 #REGa=*#R$DF44.
N $E076 Divide the level number by #N$08 but ensure the result is no higher than #N$07.
  $E076,$03 Rotate #REGa right three positions (bits 3 to 5 are now in positions 0 to 2).
  $E079,$02,b$01 Keep only bits 0-2.
N $E07B Always ensure there are at least two helicopters.
  $E07B,$02 #REGa+=#N$02.
N $E07D Don't allow any more than six helicopters.
  $E07D,$04 Jump to #R$E083 if #REGa is lower than #N$07.
N $E081 Else, set the limit of six which is the maximum the game can support.
  $E081,$02 #REGa=#N$06.
@ $E083 label=Helicopter_SetCount
  $E083,$03 Write #REGa to *#R$D212.
  $E086,$03 #REGa=*#R$DF44.
N $E089 Divide the level number by #N$04 but ensure the result is no higher than #N$0F.
  $E089,$02 Rotate #REGa right two positions (bits 2 to 5 are now in positions 0 to 3).
  $E08B,$02,b$01 Keep only bits 0-3.
  $E08D,$02 #REGa+=#N$06.
  $E08F,$04 Jump to #R$E095 if #REGa is lower than #N$11.
  $E093,$05 Write #N$10 to *#R$D211.
  $E098,$01 Return.
N $E099 Sets the train countdown and turns off vehicles as they can't co-exist.
@ $E099 label=Train_Enable
  $E099,$05 Write #N$20 to *#R$D405.
@ $E09E label=Vehicle_Disable
  $E09E,$05 Write #N$FE (spawning "off") to *#R$D401.
  $E0A3,$02 Jump to #R$E073.
B $E0A5

c $E0AD
  $E0AD,$03 #REGhl=#R$D24D.
  $E0B0,$01 #REGa=#REGc.
  $E0B1,$04 Jump to #R$E0C1 if the sign flag set.
  $E0B5,$01 #REGa+=*#REGhl.
  $E0B6,$01 #REGc=#REGa.
  $E0B7,$01 Increment #REGhl by one.
  $E0B8,$01 #REGa=#REGb.
  $E0B9,$04 Jump to #R$E0C9 if the sign flag set.
  $E0BD,$01 #REGa+=*#REGhl.
  $E0BE,$01 #REGb=#REGa.
  $E0BF,$02 Jump to #R$E0CF.
  $E0C1,$02,b$01 Flip bit 7.
  $E0C3,$01 #REGa-=*#REGhl.
  $E0C4,$01 Invert the bits in #REGa.
  $E0C5,$01 Increment #REGa by one.
  $E0C6,$01 #REGc=#REGa.
  $E0C7,$02 Jump to #R$E0B7.
  $E0C9,$02,b$01 Flip bit 7.
  $E0CB,$01 #REGa-=*#REGhl.
  $E0CC,$01 Invert the bits in #REGa.
  $E0CD,$01 Increment #REGa by one.
  $E0CE,$01 #REGb=#REGa.
  $E0CF,$01 #REGa=#REGc.
  $E0D0,$04 Jump to #R$E10A if #REGa is higher than #N$20.
  $E0D4,$01 #REGa=#REGb.
  $E0D5,$04 Jump to #R$E10A if #REGa is higher than #N$18.
  $E0D9,$03 RRCA.
  $E0DC,$01 #REGl=#REGa.
  $E0DD,$02,b$01 Keep only bits 0-1.
  $E0DF,$02 #REGa+=#N$65.
  $E0E1,$01 #REGh=#REGa.
  $E0E2,$01 #REGa=#REGl.
  $E0E3,$02,b$01 Keep only bits 5-7.
  $E0E5,$01 #REGa+=#REGc.
  $E0E6,$01 #REGl=#REGa.
  $E0E7,$04 Jump to #R$E0FE if *#REGhl is not zero.
  $E0EB,$03 Decrease #REGh by three.
  $E0EE,$04 Jump to #R$E0FE if *#REGhl is not zero.
  $E0F2,$01 #REGa=#REGd.
  $E0F3,$04 Jump to #R$E113 if #REGa is not equal to #N$3D.
  $E0F7,$03 Decrease #REGh by three.
  $E0FA,$04 Jump to #R$E114 if *#REGhl is zero.
  $E0FE,$03 Jump to #R$E114 if #REGa is lower than #REGd.
  $E101,$01 Increment #REGe by one.
  $E102,$03 Jump to #R$E114 if #REGa is higher than #REGe.
  $E105,$03 Write #REGa to *#R$D215.
  $E108,$01 Set the bits from #REGa.
  $E109,$01 Return.
  $E10A,$01 Restore #REGhl from the stack.
  $E10B,$07 Jump to #R$EF86 if *#R$D3FB is zero.
  $E112,$01 Stash #REGhl on the stack.
  $E113,$04 Write #N$00 to *#R$D215.
  $E117,$01 #REGa=#N$00.
  $E118,$01 Return.

c $E119 Handler: Monsters
@ $E119 label=Handler_Monsters
N $E119 George:
N $E119 Copy Georges states/ flags to the active states/ flags.
  $E119,$03 #REGhl=#R$CFD2.
  $E11C,$03 Call #R$E16B.
  $E11F,$03 Call #R$E62D.
  $E122,$03 Call #R$F3CA.
N $E125 Copy the active states/ flags back to Georges data.
  $E125,$03 #REGde=#R$CFD2.
  $E128,$03 Call #R$E170.
N $E12B Lizzy:
N $E12B Copy Lizzys states/ flags to the active states/ flags.
  $E12B,$03 #REGhl=#R$D001.
  $E12E,$03 Call #R$E16B.
  $E131,$03 Call #R$E62D.
  $E134,$03 #REGhl=#R$D22C.
  $E137,$03 #REGde=#R$D23E.
  $E13A,$03 Call #R$F41A.
  $E13D,$03 Call #R$F3CA.
N $E140 Copy the active states/ flags back to Lizzys data.
  $E140,$03 #REGde=#R$D001.
  $E143,$03 Call #R$E170.
N $E146 Ralph:
N $E146 Copy Ralphs states/ flags to the active states/ flags.
  $E146,$03 #REGhl=#R$D030.
  $E149,$03 Call #R$E16B.
  $E14C,$03 Call #R$E62D.
  $E14F,$03 #REGhl=#R$D22C.
  $E152,$03 #REGde=#R$D23E.
  $E155,$03 Call #R$F41A.
  $E158,$03 #REGhl=#R$D232.
  $E15B,$03 #REGde=#R$D23F.
  $E15E,$03 Call #R$F41A.
  $E161,$03 Call #R$F3CA.
N $E164 Copy the active states/ flags back to Ralphs data.
  $E164,$03 #REGde=#R$D030.
  $E167,$03 Call #R$E170.
  $E16A,$01 Return.
N $E16B Sets up copying TO the active flags #R$D244(#N$D244)-#R$D255(#N$D255).
@ $E16B label=CopyToActiveFlags
  $E16B,$03 #REGde=#R$D244.
  $E16E,$02 Jump to #R$E173.
N $E170 Sets up copying FROM the active flags back to the monsters states.
@ $E170 label=CopyFromActiveFlags
  $E170,$03 #REGhl=#R$D244.
@ $E173 label=Copy17Bytes
  $E173,$05 Copy #N$11 bytes from *#REGhl to *#REGde.
  $E178,$01 Return.

c $E179 Controls
@ $E179 label=Controls
R $E179 O:A Byte representing the intended action
N $E179 First off, check if the active monster is computer controlled.
  $E179,$06 Jump to #R$E1CE if *#R$D252 is not set to "computer controlled".
  $E17F,$03 Call #R$DA28.
  $E182,$02,b$01 Keep only bits 0-4.
  $E184,$03 Write #REGa to *#R$D217.
N $E17F Handles the monster being computer controlled.
@ $E17F label=ComputerControlled
M $E17F,$08 Write a random number between #N$00-#N$1F (#EVAL($00,$02,$08)-#EVAL($1F,$02,$08)
.           e.g. Up/ Down/ Left/ Right/ Action) to *#R$D217.
N $E187 Check if the currently active monster is jumping.
  $E187,$03 #REGa=*#R$D248.
  $E18A,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E18B,$02 Jump to #R$E193 if the monster isn't currently jumping.
N $E18D The active monster is jumping...
  $E18D,$05 Write #R$E6C5(#EVAL($08,$02,$08)) to *#R$D217.
  $E192,$01 Return.
N $E193 Check if the currently active monster is climbing.
@ $E193 label=Controls_IsMonsterClimbing
  $E193,$03 #REGa=*#R$D246.
  $E196,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E197,$02 Jump to #R$E1A1 if the monster isn't currently climbing.
N $E199 The active monster is climbing...
  $E199,$07 Jump to #R$E17F if *#R$D217 is equal to #N$10 (#R$E693(#EVAL($10,$02,$08)) e.g. "jumping/ punching").
  $E1A0,$01 Return.
N $E1A1 Checks the screen boundaries to ensure the monster can't go off-screen.
@ $E1A1 label=Controls_CheckBoundaries
  $E1A1,$03 #REGa=*#R$D24E.
  $E1A4,$02 Compare #REGa with #N$11...
  $E1A6,$03 #REGa=*#R$D217.
  $E1A9,$01 Return if #REGa was is lower than #N$11 on line #R$E1A4.
  $E1AA,$04 Jump to #R$E17F if #REGa is equal to #N$10.
  $E1AE,$03 #REGa=*#R$D24D.
  $E1B1,$04 Jump to #R$E1C3 if #REGa is higher than #N$FA.
  $E1B5,$04 Jump to #R$E1C3 if #REGa is lower than #N$03.
  $E1B9,$02 Compare #REGa with #N$1B...
  $E1BB,$03 #REGa=*#R$D217.
  $E1BE,$01 Return if #REGa was lower #N$1B on line #R$E1B9.
N $E1BF Unsets the computer controlled monster "right" option.
  $E1BF,$02 Reset bit 1 of #REGa.
  $E1C1,$02 Jump to #R$E1C8.
N $E1C3 Unsets the computer controlled monster "left" option.
@ $E1C3 label=ComputerUnset_Left
  $E1C3,$03 #REGa=*#R$D217.
  $E1C6,$02 Reset bit 0 of #REGa.
N $E1C8 Unsets the computer controlled monster "jump/punch" option.
@ $E1C8 label=ComputerUnset_JumpPunch
  $E1C8,$02 Reset bit 4 of #REGa.
  $E1CA,$03 Write #REGa to *#R$D217.
  $E1CD,$01 Return.
N $E1CE The active monster is player controlled so using #R$D252 fetch the controller routine.
@ $E1CE label=PlayerControlled
  $E1CE,$04 Create an offset in #REGhl using #REGa*#N$02.
  $E1D2,$04 #REGhl+=#R$E24F.
N $E1D6 Load the controls address into #REGhl and jump to it.
  $E1D6,$01 Load the low byte of the controls address from the jump table.
  $E1D7,$01 Increment the controls jump table pointer by one.
  $E1D8,$01 Set the high byte of the controls address from the jump table.
  $E1D9,$01 Set low byte of the controls address from #REGa.
  $E1DA,$01 Jump to the address held by *#REGhl.
N $E1DB Given the "not zero" check at #R$E179 the #N$00 option (#R$E24F(#N$E24F)) should never be chosen to end up here.
@ $E1DB label=Controls_ComputerControlled
  $E1DB,$01 #REGa=#N$00.
  $E1DC,$03 Jump to #R$E243.
N $E1DF Read the controls from the Sinclair Interface 2 joystick (port 2).
@ $E1DF label=Controls_ReadSinclair2_P2
  $E1DF,$04 Read from the keyboard;
. #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$F7 | 1 | 2 | 3 | 4 | 5 }
. TABLE#
  $E1E3,$02,b$01 Flip bits 0-5 and 7.
  $E1E5,$02,b$01 Keep only bits 0-4.
  $E1E7,$03 Jump to #R$E243.
N $E1EA Read the controls from the Sinclair Interface 2 joystick (port 1).
@ $E1EA label=Controls_ReadSinclair2_P1
  $E1EA,$04 Read from the keyboard;
. #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$EF | 0 | 9 | 8 | 7 | 6 }
. TABLE#
N $E1EE Converts the input into a table address beginning at #R$C6AF.
  $E1EE,$03 Create an offset using #REGbc - where #REGb=#N$C6 and #REGc=#REGa.
  $E1F1,$01 #REGa=*#REGbc.
  $E1F2,$03 Rotate #REGa right three positions (bits 3 to 7 are now in positions 0 to 4).
  $E1F5,$02,b$01 Flip bits 0-5 and 7.
  $E1F7,$02,b$01 Keep only bits 0-4.
  $E1F9,$03 Jump to #R$E243.
N $E1FC Read the controls from the Kempston joystick port.
@ $E1FC label=Controls_ReadKempston
  $E1FC,$02 Read Kempston Joystick input.
  $E1FE,$02,b$01 Keep only bits 0-4.
  $E200,$03 Jump to #R$E243 if the result is zero.
  $E203,$01 #REGb=#REGa.
  $E204,$02,b$01 Keep only bits 0-1.
  $E206,$01 #REGa=#REGb.
  $E207,$03 Jump to #R$E20C if #REGa is zero.
  $E20A,$02,b$01 Flip bits 0-1.
  $E20C,$01 Set the bits from #REGa.
  $E20D,$03 Jump to #R$E243.
N $E210 Use user-defined keys set 1.
@ $E210 label=Controls_Set1
  $E210,$03 #REGhl=#R$C850.
  $E213,$02 Jump to #R$E21D.
N $E215 Use user-defined keys set 2.
@ $E215 label=Controls_Set2
  $E215,$03 #REGhl=#R$C85A.
  $E218,$02 Jump to #R$E21D.
N $E21A Use user-defined keys set 3.
@ $E21A label=Controls_Set3
  $E21A,$03 #REGhl=#R$C864.
N $E21D Read the keyboard set in #REGhl.
@ $E21D label=Controller_ReadKeyboard
  $E21D,$02 #REGc=#N$00.
N $E21F Has "left" been pressed?
  $E21F,$03 Call #R$E248.
  $E222,$02 Jump to #R$E226 if "left" is not being pressed.
  $E224,$02 Set bit 0 of #REGc if "left" is being pressed.
N $E226 Has "right" been pressed?
@ $E226 label=Controls_ReadKeyboardRight
  $E226,$03 Call #R$E248.
  $E229,$02 Jump to #R$E22D if "right" is not being pressed.
  $E22B,$02 Set bit 1 of #REGc if "right" is being pressed.
N $E22D Has "up" been pressed?
@ $E22D label=Controls_ReadKeyboardUp
  $E22D,$03 Call #R$E248.
  $E230,$02 Jump to #R$E234 if "up" is not being pressed.
  $E232,$02 Set bit 3 of #REGc if "up" is being pressed.
N $E234 Has "down" been pressed?
@ $E234 label=Controls_ReadKeyboardDown
  $E234,$03 Call #R$E248.
  $E237,$02 Jump to #R$E23B if "down" is not being pressed.
  $E239,$02 Set bit 2 of #REGc if "down" is being pressed.
N $E23B Has "jump/punch" been pressed?
@ $E23B label=Controls_ReadKeyboardJumpPunch
  $E23B,$03 Call #R$E248.
  $E23E,$02 Jump to #R$E242 if "jump/punch" is not being pressed.
  $E240,$02 Set bit 4 of #REGc if "jump/punch" is being pressed.
@ $E242 label=Controls_ReadKeyboardSet
  $E242,$01 #REGa=#REGc.
N $E243 Set the "zero" flag if no controls are being pressed.
@ $E243 label=Controls_Return
  $E243,$01 Set flags.
  $E244,$03 Write #REGa to *#R$D217.
  $E247,$01 Return.
N $E248 Using the keyboard set in #REGhl, read the control from the keyboard.
@ $E248 label=Controls_ReadKeyboard
  $E248,$01 #REGa=*#REGhl.
  $E249,$02 Read from the entire keyboard.
  $E24B,$01 Increment #REGhl by one.
  $E24C,$01 Merge the bits from *#REGhl.
  $E24D,$01 Increment #REGhl by one.
  $E24E,$01 Return.
N $E24F The monster control type jump table. See #R$D252.
@ $E24F label=JumpTable_Controls
W $E24F,$02 Control type ID: #N((#PC-$E24F)/$02).
L $E24F,$02,$07,$02

c $E25D Handler: Humans
@ $E25D label=Handler_Humans
  $E25D,$02 #REGb=#N$10 (maximum possible number of on-screen humans).
  $E25F,$04 Write #N$00 to *#R$D247.
  $E263,$03 #REGhl=#R$D255.
@ $E266 label=Handler_Humans_Loop
  $E266,$01 Stash the countdown on the stack.
  $E267,$01 #REGa=human type.
  $E268,$01 Increment human table pointer by one.
  $E269,$04 Jump to #R$E54D if the currently processed human is not in-use.
  $E26D,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E26E,$01 Stash the human table pointer on the stack.
N $E26F Fetch the humans screen co-ordinates and store them in #REGbc.
  $E26F,$01 Increment human table pointer by one.
  $E270,$01 #REGc=*#REGhl.
  $E271,$01 Increment human table pointer by one.
  $E272,$01 #REGb=*#REGhl.
  $E273,$03 #REGde=#N$0108 (TODO; probably sprite size #N$01 byte by #N$08 lines).
  $E276,$03 Call #R$E0CF.
  $E279,$02 Jump to #R$E286 if this human is able to be processed (as in, is alive).
N $E27B This human is no more (RIP) mark this position as no longer viable for holding human data.
  $E27B,$01 Restore human table pointer from the stack.
  $E27C,$01 Decrease the human table pointer by one (back to the "type").
  $E27D,$02 Mark this human as no longer in-use.
  $E27F,$04 Move the human table pointer to the next human.
  $E283,$03 Jump to #R$E550.
N $E286 Convert the human type to an address from #R$E556 and jump to it.
@ $E286 label=Controller_Humans
  $E286,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E287,$01 Decrease #REGa by one.
  $E288,$01 #REGa*=#N$02.
  $E289,$03 Create an offset using #REGde.
  $E28C,$04 #REGhl=#R$E556+#REGde.
  $E290,$01 #REGa=*#REGhl.
  $E291,$01 Increment #REGhl by one.
  $E292,$01 #REGh=*#REGhl.
  $E293,$01 #REGl=#REGa.
  $E294,$01 Jump to *#REGhl.

c $E295 Human #N$01: Hiding
@ $E295 label=Human_Hiding
  $E295,$01 Restore human table pointer from the stack.
N $E296 Decrease the countdown and just skip this human while they're still hiding.
  $E296,$03 Decrease the humans action countdown by one.
  $E299,$03 Jump to #R$E54D until the countdown is zero.
N $E29C Now the countdown has expired.
  $E29C,$02 Update the countdown to #N$10.
  $E29E,$01 Decrease the human table pointer by one (back to the "type").
  $E29F,$02 Write human type #R$E2A5(#N$02) to *#REGhl.
  $E2A1,$01 Restore the current human ID from the stack.
  $E2A2,$03 Jump to #R$E266.

c $E2A5 Human #N$02: Reappearing
@ $E2A5 label=Human_Reappearing
  $E2A5,$01 Restore human table pointer from the stack.
N $E2A6 Decrease the countdown and just skip this human until they're "ready" to be generated.
  $E2A6,$03 Decrease the humans action countdown by one.
  $E2A9,$03 Jump to #R$E54D until the countdown is zero.
N $E2AC Choose a random human type...
  $E2AC,$02 Update the countdown to #N$0E.
  $E2AE,$01 Decrease the human table pointer by one (back to the "type").
  $E2AF,$03 Call #R$DA28.
  $E2B2,$02,b$01 Keep only bits 0-3.
M $E2AF,$06 Get a random number between 1-16.
  $E2B4,$01 Increment #REGa by one.
  $E2B5,$01 Write the random number to the human type.
  $E2B6,$01 Restore the current human ID from the stack.
  $E2B7,$03 Jump to #R$E266.

c $E2BA Human: Should The Human Hide?
@ $E2BA label=ShouldHumanHide
  $E2BA,$03 #REGa=random number between #N$00-#N$FF.
N $E2BD There's about a 96.48% chance of returning based on the random number.
  $E2BD,$03 Return if the random number is higher than #N$08.
  $E2C0,$02 Update the countdown to #N$CE.
  $E2C2,$01 Return.

c $E2C3 Human: Manage Human Hiding
@ $E2C3 label=Handler_Human_Hide
  $E2C3,$02 Update the countdown to #N$20.
  $E2C5,$01 Decrease the human table pointer by one (back to the "type").
  $E2C6,$02 Write human type #R$E295(#N$01) to *#REGhl.
  $E2C8,$01 Restore the human ID from the stack.
  $E2C9,$03 Jump to #R$E266.

c $E2CC Human #N$0D-#N$10: Throwing Projectiles
@ $E2CC label=Human_Lobber
  $E2CC,$01 Restore human table pointer from the stack.
@ $E2CD label=Lobber_DecreaseCountdown
  $E2CD,$03 Decrease the humans action countdown by one.
  $E2D0,$05 Jump to #R$E36B if the humans action countdown (#REGa) is higher than #N$C8.
  $E2D5,$04 Jump to #R$E319 if the humans action countdown (#REGa) is higher than #N$5A.
  $E2D9,$04 Jump to #R$E320 if the humans action countdown (#REGa) is higher than #N$50.
  $E2DD,$04 Jump to #R$E327 if the humans action countdown (#REGa) is higher than #N$46.
  $E2E1,$04 Jump to #R$E333 if the humans action countdown (#REGa) is higher than #N$3C.
  $E2E5,$04 Jump to #R$E341 if the humans action countdown (#REGa) is higher than #N$32.
  $E2E9,$04 Jump to #R$E348 if the humans action countdown (#REGa) is higher than #N$28.
  $E2ED,$04 Jump to #R$E34F if the humans action countdown (#REGa) is higher than #N$1E.
  $E2F1,$04 Jump to #R$E35B if the humans action countdown (#REGa) is higher than #N$14.
  $E2F5,$04 Jump to #R$E365 if the humans action countdown (#REGa) is higher than #N$0A.
@ $E2F9 label=Hmmmmmmm
  $E2F9,$01 Set flags.
  $E2FA,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C2 | #HUMAN$C2 }
. UDGTABLE#
  $E2FC,$02 Jump to #R$E33B if {} is not zero.
  $E2FE,$03 Call #R$E2BA.
  $E301,$02 Jump to #R$E2CD if the human is set to start hiding.
  $E303,$03 #REGa=*#R$D3FA.
  $E306,$01 Increment #REGa by one.
  $E307,$04 Jump to #R$E2CD if #REGa is equal to #N$07.
  $E30B,$03 Write #REGa to *#R$D3FA.
  $E30E,$03 Call #R$DB7E.
  $E311,$01 Increment #REGhl by one.
  $E312,$01 #REGa=*#REGhl.
  $E313,$01 Decrease #REGhl by one.
  $E314,$03 Jump to #R$E33E if #REGa is higher than #REGb.
  $E317,$02 Write #N$62 to *#REGhl.
  $E319,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite | =h Sprite }
. { #N$C2 | #HUMAN$C2 | #HUMAN$C2,$01 }
. UDGTABLE#
  $E31B,$02 Jump to #R$E33B if {} is not zero.
  $E31D,$02 Write #N$55 to *#REGhl.
  $E31F,$01 Set the bits from #REGa.
  $E320,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C4 | #HUMAN$C4 }
. UDGTABLE#
  $E322,$02 Jump to #R$E33B if {} is not zero.
  $E324,$02 Write #N$47 to *#REGhl.
  $E326,$01 Set the bits from #REGa.
  $E327,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C6 | #HUMAN$C6 }
. UDGTABLE#
  $E329,$02 Jump to #R$E33B if {} is not zero.
  $E32B,$02 #REGa=#N$01.
  $E32D,$03 Call #R$E375.
  $E330,$02 Write #N$3E to *#REGhl.
  $E332,$01 Set the bits from #REGa.
  $E333,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C8 | #HUMAN$C8 }
. UDGTABLE#
  $E335,$02 Jump to #R$E33B if {} is not zero.
  $E337,$02 Write #N$14 to *#REGhl.
  $E339,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C2 | #HUMAN$C2 }
. UDGTABLE#
@ $E33B label=Alias_Draw_Human_Sprite
  $E33B,$03 Jump to #R$E541.
  $E33E,$02 Write #N$3A to *#REGhl.
  $E340,$01 Set the bits from #REGa.
  $E341,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C2 | #HUMAN$C2 }
. UDGTABLE#
  $E343,$02 Jump to #R$E372 if {} is not zero.
  $E345,$02 Write #N$2D to *#REGhl.
  $E347,$01 Set the bits from #REGa.
  $E348,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C4 | #HUMAN$C4 }
. UDGTABLE#
  $E34A,$02 Jump to #R$E372 if {} is not zero.
  $E34C,$02 Write #N$1F to *#REGhl.
  $E34E,$01 Set the bits from #REGa.
  $E34F,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C6 | #HUMAN$C6 }
. UDGTABLE#
  $E351,$02 Jump to #R$E372 if {} is not zero.
  $E353,$02 #REGa=#N$41.
  $E355,$03 Call #R$E375.
  $E358,$02 Write #N$18 to *#REGhl.
  $E35A,$01 Set the bits from #REGa.
  $E35B,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C8 | #HUMAN$C8 }
. UDGTABLE#
  $E35D,$02 Jump to #R$E372 if {} is not zero.
  $E35F,$02 Write #N$0A to *#REGhl.
  $E361,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C2 | #HUMAN$C2 }
. UDGTABLE#
  $E363,$02 Jump to #R$E33B.
  $E365,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C0 | #HUMAN$C0 }
. UDGTABLE#
  $E367,$02 Jump to #R$E33B if #REGa was not equal to #N$C8 on line #R$E2D0.
  $E369,$02 Jump to #R$E2F9.
N $E36B The countdown between #N$CE-#N$C9 handles the delay before #N$C8 will hide the human.
@ $E36B label=Lobber_AboutToHide
  $E36B,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C0 | #HUMAN$C0 }
. UDGTABLE#
  $E36D,$02 Jump to #R$E33B until the countdown equals #N$C8 (from line #R$E2D0).
  $E36F,$03 Jump to #R$E2C3.
  $E372,$03 Jump to #R$E535.
  $E375,$01 Stash #REGhl on the stack.
  $E376,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E377,$01 Increment #REGhl by one.
  $E378,$01 #REGc=*#REGhl.
  $E379,$01 Increment #REGhl by one.
  $E37A,$01 #REGb=*#REGhl.
  $E37B,$03 #REGhl=#R$D30A (#R$D30D-#N$03).
@ $E37E label=Lobber_FindSlot
  $E37E,$03 Increment #REGhl by three.
  $E381,$04 Jump to #R$E37E if *#REGhl is not zero.
  $E385,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E386,$01 Write #REGa to *#REGhl.
  $E387,$01 Increment #REGhl by one.
  $E388,$01 Write #REGb to *#REGhl.
  $E389,$01 Increment #REGhl by one.
  $E38A,$01 Write #REGc to *#REGhl.
  $E38B,$01 Restore #REGhl from the stack.
  $E38C,$01 Return.

c $E38D Human #N$04: Full Wave
@ $E38D label=Human_FullWave
  $E38D,$01 Restore human table pointer from the stack.
@ $E38E label=FullWave_DecreaseCountdown
  $E38E,$03 Decrease the humans action countdown by one.
  $E391,$04 Jump to #R$E3D9 if the humans action countdown (#REGa) is higher than #N$C8.
  $E395,$04 Jump to #R$E3B1 if the humans action countdown (#REGa) is equal to #N$80.
  $E399,$02 Jump to #R$E3D5 if the humans action countdown (#REGa) is lower than #N$80.
N $E39B Ensure the number is between 0-63.
  $E39B,$02,b$01 Keep only bits 0-5.
  $E39D,$04 Jump to #R$E3A9 if #REGa is higher than #N$20.
N $E3A1 Ensure the number is between 0-3.
  $E3A1,$02,b$01 Keep only bits 0-1.
  $E3A3,$04 Jump to #R$E3C1 if #REGa is lower than #N$02.
  $E3A7,$02 Jump to #R$E3C6.
N $E3A9 Ensure the number is between 0-3.
@ $E3A9 label=FullWave_Mirrored
  $E3A9,$02,b$01 Keep only bits 0-1.
  $E3AB,$04 Jump to #R$E3CB if #REGa is lower than #N$02.
  $E3AF,$02 Jump to #R$E3D0.
N $E3B1 Handle the waving, but also give a small chance the human should hide.
@ $E3B1 label=FullWave_Action
  $E3B1,$03 Call #R$E2BA.
  $E3B4,$02 Jump to #R$E38E if the human is set to start hiding.
  $E3B6,$03 Call #R$DA28.
  $E3B9,$02 Update the countdown to #N$C0.
  $E3BB,$02,b$01 Keep only bit 0.
  $E3BD,$02 Jump to #R$E3CB if the result is zero.
M $E3BB,$04 50/50 chance of jumping to #R$E3CB.
  $E3BF,$02 Write #N$A0 to *#REGhl.
N $E3C1 Print the "normal" waving sprite frame 1.
@ $E3C1 label=FullWave_LeftFrame1
  $E3C1,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C4 | #HUMAN$C4 }
. UDGTABLE#
  $E3C3,$03 Jump to #R$E541.
N $E3C6 Print the "normal" waving sprite frame 2.
@ $E3C6 label=FullWave_LeftFrame2
  $E3C6,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C8 | #HUMAN$C8 }
. UDGTABLE#
  $E3C8,$03 Jump to #R$E541.
N $E3CB Print the "mirrored" waving sprite frame 1.
@ $E3CB label=FullWave_RightFrame1
  $E3CB,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C4 | #HUMAN$C4,$01 }
. UDGTABLE#
  $E3CD,$03 Jump to #R$E535.
N $E3D0 Print the "mirrored" waving sprite frame 2.
@ $E3D0 label=FullWave_RightFrame2
  $E3D0,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C8 | #HUMAN$C8,$01 }
. UDGTABLE#
  $E3D2,$03 Jump to #R$E535.
N $E3D5 When the countdown reaches #N$0A (from #N$80), jump to #R$E3B1 to start a new cycle.
@ $E3D5 label=FullWave_EndCycle
  $E3D5,$04 Jump to #R$E3B1 if #REGa is equal to #N$0A.
N $E3D9 The countdown between #N$CE-#N$C9 handles the delay before #N$C8 will hide the human.
@ $E3D9 label=FullWave_AboutToHide
  $E3D9,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C0 | #HUMAN$C0 }
. UDGTABLE#
  $E3DB,$03 Jump to #R$E541 until the countdown equals #N$C8 (from line #R$E391).
  $E3DE,$03 Jump to #R$E2C3.

c $E3E1 Human #N$05: Waving Arms In The Air/ Distressed Human
@ $E3E1 label=Human_WavingOverHead
  $E3E1,$01 Restore human table pointer from the stack.
@ $E3E2 label=WavingOverHead_DecreaseCountdown
  $E3E2,$03 Decrease the humans action countdown by one.
  $E3E5,$04 Jump to #R$E40C if the humans action countdown (#REGa) is higher than #N$C8.
  $E3E9,$04 Jump to #R$E3F7 if the humans action countdown (#REGa) is equal to #N$80.
  $E3ED,$02 Jump to #R$E408 if the humans action countdown (#REGa) is lower than #N$80.
N $E3EF Turn the countdown into a number between 0-3 - so it's two cycles left, two cycles right.
  $E3EF,$02,b$01 Keep only bits 0-1.
  $E3F1,$04 Jump to #R$E3FE if #REGa is lower than #N$02.
  $E3F5,$02 Jump to #R$E403.
N $E3F7 Handle the waving, but also give a small chance the human should hide.
@ $E3F7 label=WavingOverHead_Action
  $E3F7,$03 Call #R$E2BA.
  $E3FA,$02 Jump to #R$E3E2 if the human is set to start hiding.
  $E3FC,$02 Update the countdown to #N$A0.
N $E3FE Print the "normal" waving sprite.
@ $E3FE label=WavingOverHead_Left
  $E3FE,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C8 | #HUMAN$C8 }
. UDGTABLE#
  $E400,$03 Jump to #R$E541.
N $E403 Print the "mirrored" waving sprite.
@ $E403 label=WavingOverHead_Right
  $E403,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C8 | #HUMAN$C8,$01 }
. UDGTABLE#
  $E405,$03 Jump to #R$E535.
N $E408 When the countdown reaches #N$0A (from #N$80), jump to #R$E3F7 to start a new cycle.
@ $E408 label=WavingOverHead_EndCycle
  $E408,$04 Jump to #R$E3F7 if #REGa is equal to #N$0A.
N $E40C The countdown between #N$CE-#N$C9 handles the delay before #N$C8 will hide the human.
@ $E40C label=WavingOverHead_AboutToHide
  $E40C,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C0 | #HUMAN$C0 }
. UDGTABLE#
  $E40E,$03 Jump to #R$E541 until the countdown equals #N$C8 (from line #R$E3E5).
  $E411,$03 Jump to #R$E2C3.

c $E414 Human #N$06: Waving Side-To-Side/ Distressed Human
@ $E414 label=Human_WavingSideToSide
  $E414,$01 Restore human table pointer from the stack.
@ $E415 label=WavingSideToSide_DecreaseCountdown
  $E415,$03 Decrease the humans action countdown by one.
  $E418,$04 Jump to #R$E43F if the humans action countdown (#REGa) is higher than #N$C8.
  $E41C,$04 Jump to #R$E42A if the humans action countdown (#REGa) is equal to #N$80.
  $E420,$02 Jump to #R$E43B if the humans action countdown (#REGa) is lower than #N$80.
N $E422 Turn the countdown into a number between 0-7 - so it's four cycles left, four cycles right.
  $E422,$02,b$01 Keep only bits 0-2.
  $E424,$04 Jump to #R$E431 if #REGa is lower than #N$04.
  $E428,$02 Jump to #R$E436.
N $E42A Handle the waving, but also give a small chance the human should hide.
@ $E42A label=WavingSideToSide_Action
  $E42A,$03 Call #R$E2BA.
  $E42D,$02 Jump to #R$E415 if the human is set to start hiding.
  $E42F,$02 Update the countdown to #N$C0.
N $E431 Print the "normal" waving sprite.
@ $E431 label=WavingSideToSide_Left
  $E431,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C4 | #HUMAN$C4 }
. UDGTABLE#
  $E433,$03 Jump to #R$E541.
N $E436 Print the "mirrored" waving sprite.
@ $E436 label=WavingSideToSide_Right
  $E436,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C4 | #HUMAN$C4,$01 }
. UDGTABLE#
  $E438,$03 Jump to #R$E535.
N $E43B When the countdown reaches #N$0A (from #N$80), jump to #R$E42A to start a new cycle.
@ $E43B label=WavingSideToSide_EndCycle
  $E43B,$04 Jump to #R$E42A if #REGa is equal to #N$0A.
N $E43F The countdown between #N$CE-#N$C9 handles the delay before #N$C8 will hide the human.
@ $E43F label=WavingSideToSide_AboutToHide
  $E43F,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C0 | #HUMAN$C0 }
. UDGTABLE#
  $E441,$03 Jump to #R$E541 until the countdown equals #N$C8 (from line #R$E418).
  $E444,$03 Jump to #R$E2C3.

c $E447 Human #N$07-#N$0C: Human With Rifle (Shooter)
@ $E447 label=Human_Shooter
  $E447,$01 Restore human table pointer from the stack.
@ $E448 label=Shooter_DecreaseCountdown
  $E448,$03 Decrease the humans action countdown by one.
  $E44B,$05 Jump to #R$E4D6 if the humans action countdown (#REGa) is higher than #N$C8.
  $E450,$04 Jump to #R$E4D2 if the humans action countdown (#REGa) is lower than #N$14.
  $E454,$02,b$01 Keep only bits 0-4.
  $E456,$02 Jump to #R$E463 if the result is zero.
  $E458,$01 #REGa=*#REGhl.
  $E459,$03 RLCA.
  $E45C,$02,b$01 Keep only bits 0-1.
  $E45E,$03 Call #R$DBD9.
  $E461,$02 Jump to #R$E474.
N $E463 Handle the action, but also give a small chance the human should hide.
@ $E463 label=Shooter_Action
  $E463,$03 Call #R$E2BA.
  $E466,$02 Jump to #R$E448 if the human is set to start hiding.
  $E468,$03 Call #R$DB7E.
  $E46B,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E46C,$02,b$01 Keep only bits 0-1.
  $E46E,$03 Rotate #REGa right three positions (bits 0 to 2 are now in positions 5 to 7).
  $E471,$02,b$01 Set bits 0-4.
  $E473,$01 Write #REGa to *#REGhl.
  $E474,$01 Increment #REGhl by one.
  $E475,$01 #REGa=*#REGhl.
  $E476,$01 Compare #REGa with #REGb.
  $E477,$01 Increment #REGhl by one.
  $E478,$01 #REGa=*#REGhl.
  $E479,$02 Decrease #REGhl by two.
  $E47B,$02 Jump to #R$E486 if #REGhl is zero.
  $E47D,$02 Jump to #R$E48B if {} is higher.
  $E47F,$03 Jump to #R$E49A if #REGa is equal to #REGc.
  $E482,$02 Jump to #R$E496 if #REGa is lower than #REGc.
  $E484,$02 Jump to #R$E49E.
  $E486,$03 Jump to #R$E492 if #REGa is lower than #REGc.
  $E489,$02 Jump to #R$E4BD.
  $E48B,$03 Jump to #R$E4B5 if #REGa is equal to #REGc.
  $E48E,$02 Jump to #R$E4B1 if #REGa is lower than #REGc.
  $E490,$02 Jump to #R$E4B9.
  $E492,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$CA | #HUMAN$CA }
. UDGTABLE#
  $E494,$02 Jump to #R$E4C1.
  $E496,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$CC | #HUMAN$CC }
. UDGTABLE#
  $E498,$02 Jump to #R$E4A0.
  $E49A,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$CE | #HUMAN$CE }
. UDGTABLE#
  $E49C,$02 Jump to #R$E4A0.
  $E49E,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$D0 | #HUMAN$D0 }
. UDGTABLE#
  $E4A0,$03 Call #R$DA28.
  $E4A3,$02 Compare #REGa with #N$04.
  $E4A5,$01 #REGa=#REGb.
  $E4A6,$03 Jump to #R$E541 if {} is higher.
  $E4A9,$02 #REGc=#N$00.
  $E4AB,$03 Call #R$E4DE.
  $E4AE,$03 Jump to #R$E541.
  $E4B1,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$CC | #HUMAN$CC }
. UDGTABLE#
  $E4B3,$02 Jump to #R$E4C1.
  $E4B5,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$CE | #HUMAN$CE }
. UDGTABLE#
  $E4B7,$02 Jump to #R$E4C1.
  $E4B9,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$D0 | #HUMAN$D0 }
. UDGTABLE#
  $E4BB,$02 Jump to #R$E4C1.
  $E4BD,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$D2 | #HUMAN$D2 }
. UDGTABLE#
  $E4BF,$02 Jump to #R$E4A0.
  $E4C1,$03 Call #R$DA28.
  $E4C4,$02 Compare #REGa with #N$04...
  $E4C6,$01 #REGa=#REGb.
  $E4C7,$03 Jump to #R$E535 if #REGa is higher than #N$04.
  $E4CA,$02 #REGc=#N$80.
  $E4CC,$03 Call #R$E4DE.
  $E4CF,$03 Jump to #R$E535.
N $E4D2 When the countdown reaches #N$0A (from #N$80), jump to #R$E463 to start a new cycle.
@ $E4D2 label=Shooter_EndCycle
  $E4D2,$04 Jump to #R$E463 if #REGa is equal to #N$0A.
N $E4D6 The countdown between #N$CE-#N$C9 handles the delay before #N$C8 will hide the human.
@ $E4D6 label=Shooter_AboutToHide
  $E4D6,$02 #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$C0 | #HUMAN$C0 }
. UDGTABLE#
  $E4D8,$03 Jump to #R$E541 until the countdown equals #N$C8 (from line #R$E44B).
  $E4DB,$03 Jump to #R$E2C3.
  $E4DE,$05 Compare *#R$D3F8 with #N$08...
  $E4E3,$01 #REGa=#REGb.
  $E4E4,$01 Return if *#R$D3F8 is equal to #N$08 on line #R$E4E1.
  $E4E5,$03 #REGde=#R$D2BC.
  $E4E8,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E4E9,$03 Increment #REGde by three.
  $E4EC,$04 Jump to #R$E4E9 if *#REGde is not zero.
  $E4F0,$01 #REGa=#REGb.
  $E4F1,$02 #REGa-=#N$C8.
  $E4F3,$01 RRCA.
  $E4F4,$01 Set the bits from #REGc.
  $E4F5,$01 Write #REGa to *#REGde.
  $E4F6,$01 Increment #REGde by one.
  $E4F7,$01 Increment #REGhl by one.
  $E4F8,$01 #REGc=*#REGhl.
  $E4F9,$01 Increment #REGhl by one.
  $E4FA,$01 #REGb=*#REGhl.
  $E4FB,$04 Jump to #R$E502 if #REGa is not equal to #N$04.
  $E4FF,$01 Increment #REGc by one.
  $E500,$02 Jump to #R$E520.
  $E502,$04 Jump to #R$E509 if #REGa is not equal to #N$82.
  $E506,$01 Increment #REGb by one.
  $E507,$02 Jump to #R$E520.
  $E509,$04 Jump to #R$E515 if #REGa is equal to #N$02.
  $E50D,$04 Jump to #R$E515 if #REGa is equal to #N$01.
  $E511,$04 Jump to #R$E519 if #REGa is not equal to #N$85.
  $E515,$01 Increment #REGb by one.
  $E516,$01 Increment #REGc by one.
  $E517,$02 Jump to #R$E520.
  $E519,$02,b$01 Keep only bits 0-1.
  $E51B,$04 Jump to #R$E520 if #REGa is not equal to #N$03.
  $E51F,$01 Increment #REGb by one.
  $E520,$02 Write #REGc to *#REGde.
  $E522,$01 Increment #REGde by one.
  $E523,$02 Write #REGb to *#REGde.
  $E525,$02 Decrease #REGhl by two.
  $E527,$07 Increment *#R$D3F8 by one.
N $E52E #AUDIO(helicopter.wav)(#INCLUDE(Helicopter))
  $E52E,$05 Write melody ID #N$02 to *#R$FF8D.
  $E533,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E534,$01 Return.

c $E535 Human: Draw Sprite
N $E535 Fetch the humans screen co-ordinates and draw the sprite to the shadow buffer.
@ $E535 label=Draw_Human_Sprite_Mirrored
  $E535,$01 Increment human table pointer by one to fetch the screen co-ordinates.
  $E536,$01 #REGc=*#REGhl.
  $E537,$01 Increment #REGhl by one.
  $E538,$01 #REGb=*#REGhl.
  $E539,$01 Increment #REGhl by one.
  $E53A,$01 Stash the human table pointer on the stack.
  $E53B,$03 Call #R$D7F6.
  $E53E,$01 Restore the human table pointer from the stack.
  $E53F,$02 Jump to #R$E550.
N $E541 Fetch the humans screen co-ordinates and draw the sprite to the shadow buffer.
@ $E541 label=Draw_Human_Sprite
  $E541,$01 Increment human table pointer by one to fetch the screen co-ordinates.
  $E542,$01 #REGc=*#REGhl.
  $E543,$01 Increment #REGhl by one.
  $E544,$01 #REGb=*#REGhl.
  $E545,$01 Increment #REGhl by one.
  $E546,$01 Stash the human table pointer on the stack.
  $E547,$03 Call #R$D6C9.
  $E54A,$01 Restore the human table pointer from the stack.
  $E54B,$02 Jump to #R$E550.

c $E54D Human: Next Table Data
N $E54D Move the human table table pointer to the next human.
@ $E54D label=Handler_Humans_Skip
  $E54D,$03 Move onto the next human table data.
N $E550 Shortcut for in-progress humans, no need to move the human table table pointer. Just update the counter.
@ $E550 label=Handler_Humans_Next
  $E550,$01 Restore the human ID from the stack.
  $E551,$01 Decrease the human ID by one.
  $E552,$03 Jump to #R$E266 until all humans have been processed.
  $E555,$01 Return.

w $E556 Jump Table: Human Types
@ $E556 label=Table_HumanTypes
D $E556 Randomly assigned human types which appear in buildings.
N $E556 See #R$E25D.
  $E556,$02 Type ID: #N($01+(#PC-$E556)/$02).
L $E556,$02,$10,$02

c $E576 Handler: Bullets
@ $E576 label=Handler_Bullets
  $E576,$02 #REGb=#N$1A (number of possible bullets).
  $E578,$03 #REGhl=#R$D2BF.
@ $E57B label=Handler_Bullets_Loop
  $E57B,$01 Stash current bullet on the stack.
  $E57C,$05 Jump to #R$E624 if this bullet is not active.
N $E581 This bullet is active so let's process it.
  $E581,$01 Increment #REGhl by one.
  $E582,$01 #REGc=*#REGhl.
  $E583,$01 Increment #REGhl by one.
  $E584,$01 #REGb=*#REGhl.
  $E585,$01 Stash the bullet table pointer on the stack.
  $E586,$05 Jump to #R$E5AC if #REGa is higher than #N$80.
  $E58B,$04 Jump to #R$E5A9 if #REGa is equal to #N$05.
  $E58F,$04 Jump to #R$E5A5 if #REGa is equal to #N$04.
  $E593,$04 Jump to #R$E5A2 if #REGa is equal to #N$03.
  $E597,$04 Jump to #R$E59E if #REGa is equal to #N$02.
  $E59B,$01 Increment #REGb by one.
  $E59C,$02 Jump to #R$E5CD.
  $E59E,$01 Increment #REGc by one.
  $E59F,$01 Increment #REGb by one.
  $E5A0,$02 Jump to #R$E5CD.
  $E5A2,$01 Increment #REGc by one.
  $E5A3,$02 Jump to #R$E5CD.
  $E5A5,$01 Decrease #REGb by one.
  $E5A6,$01 Increment #REGc by one.
  $E5A7,$02 Jump to #R$E5CD.
  $E5A9,$01 Decrease #REGb by one.
  $E5AA,$02 Jump to #R$E5CD.
  $E5AC,$02,b$01 Keep only bits 0-3.
  $E5AE,$04 Jump to #R$E5CC if #REGa is equal to #N$05.
  $E5B2,$04 Jump to #R$E5C8 if #REGa is equal to #N$04.
  $E5B6,$04 Jump to #R$E5C5 if #REGa is equal to #N$03.
  $E5BA,$04 Jump to #R$E5C1 if #REGa is equal to #N$02.
  $E5BE,$01 Increment #REGb by one.
  $E5BF,$02 Jump to #R$E5CD.
  $E5C1,$01 Decrease #REGc by one.
  $E5C2,$01 Increment #REGb by one.
  $E5C3,$02 Jump to #R$E5CD.
  $E5C5,$01 Decrease #REGc by one.
  $E5C6,$02 Jump to #R$E5CD.
  $E5C8,$01 Decrease #REGb by one.
  $E5C9,$01 Decrease #REGc by one.
  $E5CA,$02 Jump to #R$E5CD.
  $E5CC,$01 Decrease #REGb by one.
  $E5CD,$01 #REGa=#REGb.
  $E5CE,$04 Jump to #R$E600 if #REGa is higher than #N$18.
  $E5D2,$01 #REGa=#REGc.
  $E5D3,$04 Jump to #R$E600 if #REGa is higher than #N$20.
  $E5D7,$01 Stash #REGhl on the stack.
  $E5D8,$03 Call #R$DD38.
  $E5DB,$03 Jump to #R$E5F4 if #REGa is zero.
  $E5DE,$04 Jump to #R$E5F4 if #REGa is higher than #N$C1.
  $E5E2,$02,b$01 Keep only bits 0-5.
  $E5E4,$04 Jump to #R$E5F4 if #REGa is higher than #N$32.
N $E5E8 There's been a hit, find out which monster.
  $E5E8,$01 #REGa=*#REGhl.
  $E5E9,$03 Call #R$DD4D.
N $E5EC Take off one hit point from the monsters energy.
  $E5EC,$02 #REGa=#N$01 (damage).
  $E5EE,$03 Call #R$DD6C.
  $E5F1,$01 Restore #REGhl from the stack.
  $E5F2,$02 Jump to #R$E61B.
  $E5F4,$01 Restore #REGhl from the stack.
  $E5F5,$01 Write #REGb to *#REGhl.
  $E5F6,$01 Decrease #REGhl by one.
  $E5F7,$01 Write #REGc to *#REGhl.
  $E5F8,$02 #REGa=sprite ID #SPRITEID$F4.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$F4 | #SPRITE$F4 }
. UDGTABLE#
  $E5FA,$03 Call #R$D6C9.
  $E5FD,$01 Restore #REGhl from the stack.
  $E5FE,$02 Jump to #R$E626.
  $E600,$02 Decrease #REGhl by two.
  $E602,$02 Write #N$00 to *#REGhl.
  $E604,$06 Jump to #R$E614 if *#R$D3F8 is not zero.
  $E60A,$07 Decrease *#R$D3F9 by one.
  $E611,$01 Restore #REGhl from the stack.
  $E612,$02 Jump to #R$E626.
  $E614,$01 Decrease #REGa by one.
  $E615,$03 Write #REGa to *#R$D3F8.
  $E618,$01 Restore #REGhl from the stack.
  $E619,$02 Jump to #R$E626.
  $E61B,$02 #REGa=sprite ID #SPRITEID$73.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$73 | #SPRITE$73 }
. UDGTABLE#
  $E61D,$01 Stash #REGhl on the stack.
  $E61E,$03 Call #R$D6C9.
  $E621,$01 Restore #REGhl from the stack.
  $E622,$02 Jump to #R$E600.
@ $E624 label=Collision_Bullets_Next
  $E624,$03 Increment #REGhl by three.
  $E627,$01 Restore bullet ID from the stack.
  $E628,$01 Decrease bullet ID by one.
  $E629,$03 Jump to #R$E57B until all bullets have been processed.
  $E62C,$01 Return.

c $E62D
N $E62D Just instantly return if the monster is already "game over".
  $E62D,$06 Return if *#R$D244 is equal to #N$FF.
N $E633 Any states higher than #N$20 mean the monster is in the process of turning back into a human (pre-"game over").
  $E633,$04 Jump to #R$E67C if *#R$D244 is higher than #N$20.
N $E637 Handle if the monster is currently jumping.
  $E637,$03 #REGa=*#R$D248.
N $E63A Moves the monster-is-jumping flag into the carry flag.
  $E63A,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E63B,$02 Jump to #R$E67C if the carry flag is set (if bit 0 was set).
N $E63D Handle if the monster is currently climbing.
  $E63D,$03 #REGa=*#R$D246.
N $E640 Moves the monster-is-climbing flag into the carry flag.
  $E640,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E641,$02 Jump to #R$E658 if the carry flag is not set (if bit 0 was unset).
  $E643,$03 #REGde=#N$80FE.
  $E646,$02 #REGb=#N$03.
  $E648,$04 #REGc=*#R$D247.
  $E64C,$01 #REGa=#REGb.
  $E64D,$01 #REGa-=#REGc.
  $E64E,$01 #REGa-=#REGc.
  $E64F,$01 #REGa-=#REGc.
  $E650,$01 #REGc=#REGa.
  $E651,$03 Call #R$E0AD.
  $E654,$02 Jump to #R$E67C if {} is zero.
  $E656,$02 Jump to #R$E66F.
  $E658,$07 Jump to #R$E67C if *#R$D24E is equal to #N$12.
  $E65F,$02 #REGb=#N$05.
  $E661,$03 #REGa=*#R$D247.
  $E664,$02 #REGa+=#N$02.
  $E666,$01 #REGc=#REGa.
  $E667,$03 #REGde=#N$090F.
  $E66A,$03 Call #R$E0AD.
  $E66D,$02 Jump to #R$E67C if {} is not zero.
  $E66F,$08 Write #N$06 to: #LIST { *#R$D244 } { *#R$D24A } LIST#
  $E677,$05 Write #N$01 to *#R$D248.
N $E67C Using the value held in *#R$D244 jump to the correlated address from #R$EF98.
@ $E67C label=Action_JumpTable
  $E67C,$04 #REGa=*#R$D244*#N$02.
N $E680 Create an offset using #REGhl.
  $E680,$02 #REGh=#N$00.
  $E682,$01 #REGl=#REGa.
  $E683,$04 #REGhl+=#R$EF98.
N $E687 Fetch the address to jump and store it in #REGhl.
  $E687,$01 #REGa=*#REGhl.
  $E688,$01 Increment #REGhl by one.
  $E689,$01 #REGh=*#REGhl.
  $E68A,$01 #REGl=#REGa.
  $E68B,$01 Jump to the address held by *#REGhl.

c $E68C Handler: Controls
@ $E68C label=Handler_Controls
  $E68C,$03 Call #R$E179.
  $E68F,$04 Jump to #R$E950 if no keys are currently being pressed.
N $E693 Controls: Jump/ Punch.
@ $E693 label=Controls_JumpPunch
  $E693,$05 Jump to #R$E6C5 if the key for jump/ punch is not being pressed.
  $E698,$02,b$01 Flip bit 4.
  $E69A,$02 Jump to #R$E6A9 if the result is not zero.
  $E69C,$05 Write #R$EFAC(#N$0A) to *#R$D244.
  $E6A1,$05 Write #N$01 to *#R$D248.
  $E6A6,$03 Jump to #R$E67C.
  $E6A9,$06 Jump to #R$E6B7 if *#R$D246 is zero.
  $E6AF,$05 Write #R$EFB2(#N$0D) to *#R$D244.
  $E6B4,$03 Jump to #R$E67C.
  $E6B7,$06 Jump to #R$E69C if *#R$D252 is set to "computer controlled".
  $E6BD,$05 Write #R$EFB4(#N$0E) to *#R$D244.
  $E6C2,$03 Jump to #R$E67C.
N $E6C5 Controls: Up.
@ $E6C5 label=Controls_Up
  $E6C5,$05 Jump to #R$E7DE if the key for up is not being pressed.
  $E6CA,$03 #REGa=*#R$D247.
N $E6CD Moves the orientation flag into the carry flag.
  $E6CD,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E6CE,$02 Jump to #R$E6E4 if the carry flag is set.
  $E6D0,$03 #REGbc=#N$0102.
  $E6D3,$03 #REGde=#N$090F.
  $E6D6,$03 Call #R$E0AD.
  $E6D9,$02 Jump to #R$E712 if {} is zero.
  $E6DB,$03 #REGa=*#R$D248.
  $E6DE,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E6DF,$03 Jump to #R$E795 if the carry flag is set.
  $E6E2,$02 Jump to #R$E6F9.
  $E6E4,$03 #REGbc=#N$0101.
  $E6E7,$03 #REGde=#N$090F.
  $E6EA,$03 Call #R$E0AD.
  $E6ED,$02 Jump to #R$E746 if {} is zero.
  $E6EF,$03 #REGa=*#R$D248.
  $E6F2,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E6F3,$03 Jump to #R$E795 if the carry flag is set.
  $E6F6,$03 Call #R$DA61.
  $E6F9,$03 #REGa=*#R$D24E.
  $E6FC,$02 #REGa-=#N$04.
  $E6FE,$03 Write #REGa to *#R$D24E.
  $E701,$0A Write #N$00 to: #LIST { *#R$D248 } { *#R$D246 } { *#R$D24C } LIST#
  $E70B,$04 Write #R$EF9A(#N$01) to *#R$D244.
  $E70F,$03 Jump to #R$E67C.
  $E712,$03 #REGbc=#N$0202.
  $E715,$03 #REGde=#N$1113.
  $E718,$03 #REGa=*#R$D246.
  $E71B,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E71C,$02 Jump to #R$E729 if the carry flag is set.
  $E71E,$01 Increment #REGc by one.
  $E71F,$03 Call #R$E0AD.
  $E722,$02 Jump to #R$E734 if {} is zero.
  $E724,$03 Call #R$DA51.
  $E727,$02 Jump to #R$E763.
  $E729,$03 #REGa=*#R$D248.
  $E72C,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E72D,$02 Jump to #R$E71E if the carry flag is set.
  $E72F,$03 Call #R$E0AD.
  $E732,$02 Jump to #R$E763 if {} is not zero.
  $E734,$03 #REGbc=#N$0202.
  $E737,$03 #REGde=#N$1416.
  $E73A,$03 Call #R$E0AD.
  $E73D,$02 Jump to #R$E785 if {} is zero.
  $E73F,$05 Write #N$01 to *#R$D247.
  $E744,$02 Jump to #R$E763.
  $E746,$03 #REGbc=#N$0202.
  $E749,$03 #REGde=#N$1416.
  $E74C,$03 Call #R$E0AD.
  $E74F,$02 Jump to #R$E763 if {} is not zero.
  $E751,$03 #REGbc=#N$0203.
  $E754,$03 #REGde=#N$1113.
  $E757,$03 Call #R$E0AD.
  $E75A,$02 Jump to #R$E785 if {} is zero.
  $E75C,$04 Write #N$00 to *#R$D247.
  $E760,$03 Call #R$DA51.
  $E763,$03 #REGa=*#R$D246.
  $E766,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E767,$02 Jump to #R$E7AA if the carry flag is set.
  $E769,$03 #REGa=*#R$D24E.
  $E76C,$04 Jump to #R$E775 if #REGa is no equal to #N$12.
  $E770,$02 #REGa-=#N$02.
  $E772,$03 Write #REGa to *#R$D24E.
  $E775,$07 Write #N$00 to: #LIST { *#R$D248 } { *#R$D24C } LIST#
  $E77C,$04 Set *#R$D246 to "climbing" (#N$01).
  $E780,$05 Write #N$03 to *#R$D24F.
  $E785,$03 #REGa=*#R$D248.
  $E788,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E789,$02 Jump to #R$E795 if the carry flag is set.
  $E78B,$07 Write #N$00 to: #LIST { *#R$D248 } { *#R$D24C } LIST#
  $E792,$03 Jump to #R$EF86.
  $E795,$03 #REGhl=#R$D247.
  $E798,$01 #REGa=*#REGhl.
  $E799,$02,b$01 Flip bit 0.
  $E79B,$01 Increment #REGhl by one.
  $E79C,$01 Merge the bits from *#REGhl.
  $E79D,$03 Call #R$DA51 not zero.
  $E7A0,$03 #REGa=*#R$D246.
  $E7A3,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E7A4,$03 Call #R$DA69 if the carry flag is set.
  $E7A7,$03 Jump to #R$EB2F.
  $E7AA,$05 Write #N$03 to *#R$D24F.
  $E7AF,$04 #REGde=*#R$D253.
  $E7B3,$03 Call #R$DA0F.
  $E7B6,$03 #REGa=*#R$D245.
  $E7B9,$02,b$01 Keep only bit 0.
  $E7BB,$02,b$01 Flip bit 0.
  $E7BD,$03 Write #REGa to *#REGix+#N$05.
  $E7C0,$03 Call #R$DA69 zero.
  $E7C3,$05 Write #N$08 to *#REGix+#N$00.
  $E7C8,$07 Write #N$00 to: #LIST { *#R$D248 } { *#R$D24C } LIST#
  $E7CF,$04 Set *#R$D246 to "climbing" (#N$01).
  $E7D3,$08 Write #N$03 to: #LIST { *#R$D244 } { *#R$D245 } LIST#
  $E7DB,$03 Jump to #R$E67C.
N $E7DE Controls: Down.
@ $E7DE label=Controls_Down
  $E7DE,$05 Jump to #R$E8E7 if the key for down is not being pressed.
  $E7E3,$08 Jump to #R$E8CF if *#R$D24E is equal to #N$10.
  $E7EB,$03 #REGa=*#R$D247.
N $E7EE Moves the orientation flag into the carry flag.
  $E7EE,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E7EF,$02 Jump to #R$E81F if the carry flag is set.
  $E7F1,$03 #REGbc=#N$0502.
  $E7F4,$03 #REGde=#N$090F.
  $E7F7,$03 Call #R$E0AD.
  $E7FA,$02 #REGc=#N$02.
  $E7FC,$02 Jump to #R$E851 if {} is zero.
  $E7FE,$03 #REGbc=#N$0602.
  $E801,$03 #REGde=#N$1416.
  $E804,$03 Call #R$E0AD.
  $E807,$02 Jump to #R$E80E if {} is zero.
  $E809,$02 #REGa=#N$01.
  $E80B,$03 Jump to #R$E8B4.
  $E80E,$03 #REGbc=#N$0602.
  $E811,$03 #REGde=#N$1113.
  $E814,$03 Call #R$E0AD.
  $E817,$02 #REGc=#N$02.
  $E819,$02 Jump to #R$E851 if {} is zero.
  $E81B,$01 #REGa=#N$00.
  $E81C,$03 Jump to #R$E8B4.
  $E81F,$03 #REGbc=#N$0503.
  $E822,$03 #REGde=#N$090F.
  $E825,$03 Call #R$E0AD.
  $E828,$02 #REGc=#N$03.
  $E82A,$02 Jump to #R$E851 if {} is zero.
  $E82C,$03 #REGbc=#N$0603.
  $E82F,$03 #REGde=#N$1113.
  $E832,$03 Call #R$E0AD.
  $E835,$02 Jump to #R$E83D if {} is zero.
  $E837,$03 Call #R$DA51.
  $E83A,$01 #REGa=#N$00.
  $E83B,$02 Jump to #R$E8B4.
  $E83D,$03 #REGbc=#N$0603.
  $E840,$03 #REGde=#N$1416.
  $E843,$03 Call #R$E0AD.
  $E846,$02 #REGc=#N$03.
  $E848,$02 Jump to #R$E851 if {} is zero.
  $E84A,$03 Call #R$DA51.
  $E84D,$02 #REGa=#N$01.
  $E84F,$02 Jump to #R$E8B4.
  $E851,$03 #REGa=*#R$D246.
  $E854,$02,b$01 Flip bit 0.
  $E856,$02 #REGa+=#N$05.
  $E858,$01 #REGb=#REGa.
  $E859,$03 #REGde=#N$090F.
  $E85C,$03 Call #R$E0AD.
  $E85F,$02 Jump to #R$E876 if {} is zero.
  $E861,$04 Set *#R$D246 to "not climbing" (#N$00).
  $E865,$07 Write #N$01 to: #LIST { *#R$D244 } { *#R$D24F } LIST#
  $E86C,$03 #REGa=*#R$D247.
N $E86F Moves the orientation flag into the carry flag.
  $E86F,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E870,$03 Call #R$DA61 if the carry flag is not set.
  $E873,$03 Jump to #R$EF86.
  $E876,$03 #REGa=*#R$D246.
  $E879,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E87A,$03 Jump to #R$EF86 if the carry flag is not set.
  $E87D,$03 #REGbc=#N$0402.
  $E880,$03 #REGde=#N$1113.
  $E883,$03 #REGa=*#R$D247.
N $E886 Moves the orientation flag into the carry flag.
  $E886,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E887,$02 Jump to #R$E88C if the carry flag is not set.
  $E889,$03 #REGde=#N$1416.
  $E88C,$03 Call #R$E0AD.
  $E88F,$03 Jump to #R$EF86 if {} is zero.
  $E892,$05 Write #N$02 to *#R$D24F.
  $E897,$04 #REGde=*#R$D253.
  $E89B,$03 Call #R$DA0F.
  $E89E,$03 #REGa=*#R$D245.
  $E8A1,$02,b$01 Keep only bit 0.
  $E8A3,$03 Write #REGa to *#REGix+#N$05.
  $E8A6,$0B Write #N$04 to: #LIST { *#REGix+#N$00 } { *#R$D244 } { *#R$D245 } LIST#
  $E8B1,$03 Jump to #R$E67C.
  $E8B4,$03 Write #REGa to *#R$D247.
  $E8B7,$03 #REGa=*#R$D24E.
  $E8BA,$02 #REGa+=#N$04.
  $E8BC,$03 Write #REGa to *#R$D24E.
  $E8BF,$08 Write #N$03 to: #LIST { *#R$D244 } { *#R$D24F } LIST#
  $E8C7,$05 Set *#R$D246 to "climbing" (#N$01).
  $E8CC,$03 Jump to #R$E67C.
  $E8CF,$05 Write #N$12 to *#R$D24E.
  $E8D4,$05 Write #R$EF9A(#N$01) to *#R$D244.
  $E8D9,$03 #REGa=*#R$D247.
N $E8DC Moves the orientation flag into the carry flag.
  $E8DC,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E8DD,$03 Call #R$DA61 if the carry flag is not set.
  $E8E0,$04 Set *#R$D246 to "not climbing" (#N$00).
  $E8E4,$03 Jump to #R$E67C.
N $E8E7 Controls: Left.
@ $E8E7 label=Controls_Left
  $E8E7,$04 Jump to #R$E91C if the key for left is not being pressed.
  $E8EB,$03 #REGa=*#R$D246.
  $E8EE,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E8EF,$03 Jump to #R$EF86 if the carry flag is set.
  $E8F2,$05 Write #N$01 to *#R$D24F.
  $E8F7,$04 #REGde=*#R$D253.
  $E8FB,$03 Call #R$DA0F.
  $E8FE,$03 #REGa=*#R$D24D.
  $E901,$01 Decrease #REGa by one.
  $E902,$05 Jump to #R$EF86 if #REGa is equal to #N$FC.
  $E907,$03 Write #REGa to *#R$D24D.
  $E90A,$04 Write #N$00 to *#REGix+#N$05.
  $E90E,$04 Write #N$01 to *#R$D247.
  $E912,$07 Write #N$02 to: #LIST { *#REGix+#N$00 } { *#R$D244 } LIST#
  $E919,$03 Jump to #R$E67C.
N $E91C Controls: Right.
@ $E91C label=Controls_Right
  $E91C,$04 Jump to #R$E950 if the key for right is not being pressed.
  $E920,$03 #REGa=*#R$D246.
  $E923,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $E924,$03 Jump to #R$EF86 if the carry flag is set.
  $E927,$05 Write #N$01 to *#R$D24F.
  $E92C,$04 #REGde=*#R$D253.
  $E930,$03 Call #R$DA0F.
  $E933,$03 #REGa=*#R$D24D.
  $E936,$01 Increment #REGa by one.
  $E937,$05 Jump to #R$EF86 if #REGa is equal to #N$1E.
  $E93C,$03 Write #REGa to *#R$D24D.
  $E93F,$07 Write #N$00 to: #LIST { *#REGix+#N$05 } { *#R$D247 } LIST#
  $E946,$07 Write #N$01 to: #LIST { *#REGix+#N$00 } { *#R$D244 } LIST#
  $E94D,$03 Jump to #R$E67C.
N $E950 No keys are being pressed so decrease the waiting countdown.
@ $E950 label=Monster_Idle
  $E950,$07 Decrease *#R$D249 by one.
  $E957,$03 Jump to #R$EF86 if *#R$D249 is not yet zero.
N $E95A The idle countdown is finished, so reset the countdown and mark the action event.
  $E95A,$05 Write #N$19 to *#R$D249.
  $E95F,$05 Write "waiting" (#R$EFA2(#N$05)) to *#R$D244.
  $E964,$03 Jump to #R$E67C.

c $E967
  $E967,$05 Write #N$01 to *#R$D24F.
  $E96C,$03 Jump to #R$EF86.
  $E96F,$02 Jump to #R$E967.

c $E971
  $E971,$03 Call #R$DB54.
  $E974,$02 #REGa=#N$03.
  $E976,$03 Call #R$DA0F.
  $E979,$03 Call #R$D9C3.
  $E97C,$01 Return if {} is not zero.
  $E97D,$04 Write #R$EF98(#N$00) to *#R$D244.
  $E981,$01 Return.

c $E982
  $E982,$03 Call #R$DB54.
  $E985,$02 #REGa=#N$02.
  $E987,$03 Call #R$DA0F.
  $E98A,$03 Call #R$D9C3.
  $E98D,$01 Return if {} is not zero.
  $E98E,$03 Call #R$DA59.
  $E991,$05 Write #N$03 to *#R$D24F.
  $E996,$04 Write #R$EF98(#N$00) to *#R$D244.
  $E99A,$01 Return.

c $E99B Animate: Waiting
@ $E99B label=Animate_Waiting
  $E99B,$03 Call #R$E179.
  $E99E,$04 Jump to #R$E693 if any monster control has been pressed.
  $E9A2,$06 Jump to #R$E9AE if *#R$D252 is not set to "computer controlled".
N $E9A8 The monster is being controlled by the computer, so rather than wait - pick a completely random number between
.       #N$00-#N$FF and use this as the control byte.
  $E9A8,$03 Call #R$DA28.
  $E9AB,$03 Jump to #R$E693.
N $E9AE The monster is player controlled so start the action.
@ $E9AE label=Waiting_Action
  $E9AE,$03 #REGa=*#R$D246.
  $E9B1,$01 Set the carry flag if the monster is currently "climbing".
  $E9B2,$03 Jump to #R$E9EA if the carry flag is set.
N $E9B5 The monster is on the ground so select the normal body sprite.
  $E9B5,$02 #REGa=sprite ID #SPRITEID$05.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$05 | #SPRITE$05,$00,$0515 | #N$45 | #SPRITE$45,$00,$0515 | #N$85 | #SPRITE$85,$00,$0515 }
. UDGTABLE#
N $E9B7 Set the co-ordinates for where to draw.
  $E9B7,$04 #REGbc=*#R$D24D/#R$D24E.
  $E9BB,$03 Call #R$D9BB.
N $E9BE Again, set the co-ordinates for where to draw.
  $E9BE,$04 #REGbc=*#R$D24D/#R$D24E.
  $E9C2,$03 #REGa=*#R$D247.
  $E9C5,$02,b$01 Flip bit 0.
  $E9C7,$01 #REGa+=#REGc.
  $E9C8,$01 #REGc=#REGa.
N $E9C9 Overwrite the head section, as the monster turns to face the camera to "speak".
  $E9C9,$02 #REGa=sprite ID #SPRITEID$0F.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$0F | #SPRITE$0F | #N$4F | #SPRITE$4F | #N$8F | #SPRITE$8F }
. UDGTABLE#
  $E9CB,$03 Call #R$D9BB.
N $E9CE Set the co-ordinates for where to draw.
  $E9CE,$04 #REGbc=*#R$D24D/#R$D24E.
  $E9D2,$02 Increment both the X and Y positions by one to target drawing the mouth animation.
  $E9D4,$03 #REGa=*#R$D247.
  $E9D7,$02,b$01 Flip bit 0.
  $E9D9,$01 #REGa+=#REGc.
  $E9DA,$01 #REGc=#REGa.
N $E9DB Choose a frame randomly for the mouth sprite.
@ $E9DB label=DrawMonsterMouth
  $E9DB,$03 Call #R$DA28.
  $E9DE,$02,b$01 Keep only bits 0-1.
  $E9E0,$02 Jump to #R$E9DB if the result is zero.
  $E9E2,$01 Decrease #REGa by one.
M $E9DB,$08 #REGa=random number between #N$00-#N$02.
  $E9E3,$03 #REGa=#N$11+(#REGa*#N$02).
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$11 | #SPRITE$11 | #N$51 | #SPRITE$51 | #N$91 | #SPRITE$91 }
. { #N$13 | #SPRITE$13 | #N$53 | #SPRITE$53 | #N$93 | #SPRITE$93 }
. { #N$15 | #SPRITE$15 | #N$55 | #SPRITE$55 | #N$95 | #SPRITE$95 }
. UDGTABLE#
  $E9E6,$03 Call #R$D9BB.
  $E9E9,$01 Return.
N $E9EA The monster is currently climbing so use the correct body sprite.
@ $E9EA label=Climbing_Waiting
  $E9EA,$02 #REGa=sprite ID #SPRITEID$09.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$09 | #SPRITE$09 | #N$49 | #SPRITE$49 | #N$89 | #SPRITE$89 }
. UDGTABLE#
N $E9EC Set the co-ordinates for where to draw.
  $E9EC,$04 #REGbc=*#R$D24D/#R$D24E.
  $E9F0,$03 Call #R$D9BB.
N $E9F3 Again, set the co-ordinates for where to draw.
  $E9F3,$04 #REGbc=*#R$D24D/#R$D24E.
  $E9F7,$02 #REGa=sprite ID #SPRITEID$0D.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$0D | #SPRITE$0D | #N$4D | #SPRITE$4D | #N$8D | #SPRITE$8D }
. UDGTABLE#
  $E9F9,$03 Call #R$D9BB.
N $E9FC Set the co-ordinates for where to draw.
  $E9FC,$04 #REGbc=*#R$D24D/#R$D24E.
  $EA00,$02 Increment both the X and Y positions by one to target drawing the mouth animation.
  $EA02,$02 Jump to #R$E9DB.

c $EA04 Initialise Falling
@ $EA04 label=Initialise_Falling
  $EA04,$05 Write #N$06 to *#R$D24A.
  $EA09,$05 Write #R$EFA6(#N$07) to *#R$D244.
N $EA0E Check which direction the monster is currently facing.
  $EA0E,$03 #REGa=*#R$D247.
N $EA11 Moves the orientation flag into the carry flag.
  $EA11,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EA12,$03 Call #R$DA51 if the carry flag is not set.
  $EA15,$03 Jump to #R$E67C.

c $EA18 Action: Falling
@ $EA18 label=Action_Falling
D $EA18 This isn't the entire falling animation rather the "comedy" part - where the monster realises they are about to
.       fall, and cartoon-ishly they hover in the air for a few frames before falling.
  $EA18,$07 Decrease *#R$D24A by one.
  $EA1F,$02 Jump to #R$EA36 if *#R$D24A is zero.
N $EA21 The animation is in-progress so select the "Oh No" head sprite.
N $EA21 The routine at #R$D9BB handles which monster to display.
  $EA21,$02 #REGa=sprite ID #SPRITEID$19.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$19 | #SPRITE$19 | #N$59 | #SPRITE$59 | #N$99 | #SPRITE$99 }
. UDGTABLE#
N $EA23 Set the co-ordinates for where to draw.
  $EA23,$04 #REGbc=*#R$D24D/#R$D24E.
  $EA27,$03 Call #R$D9BB.
N $EA2A Again, set the co-ordinates for where to draw.
  $EA2A,$04 #REGbc=*#R$D24D/#R$D24E.
  $EA2E,$02 Increment the Y position by two to draw the lower section of the monsters body.
N $EA30 The routine at #R$D9BB handles which monster to display.
  $EA30,$02 #REGa=sprite ID #SPRITEID$23.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$23 | #SPRITE$23 | #N$63 | #SPRITE$63 | #N$A3 | #SPRITE$A3 }
. UDGTABLE#
  $EA32,$03 Call #R$D9BB.
  $EA35,$01 Return.
N $EA36 The hovering-in-the-air animation is done so progress to the next state.
@ $EA36 label=Action_Falling_Finished
  $EA36,$05 Write #N$03 to *#R$D24A.
  $EA3B,$05 Write #R$EFA8(#N$08) to *#R$D244.
  $EA40,$03 Jump to #R$E67C.

c $EA43 Animate: Falling
@ $EA43 label=Animate_Falling
N $EA43 Select the "Oh No" head sprite.
N $EA43 The routine at #R$D9BB handles which monster to display.
  $EA43,$02 #REGa=sprite ID #SPRITEID$19.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$19 | #SPRITE$19 | #N$59 | #SPRITE$59 | #N$99 | #SPRITE$99 }
. UDGTABLE#
N $EA45 Set the co-ordinates for where to draw.
  $EA45,$04 #REGbc=*#R$D24D/#R$D24E.
  $EA49,$03 Call #R$D9BB.
N $EA4C Again, set the co-ordinates for where to draw.
  $EA4C,$04 #REGbc=*#R$D24D/#R$D24E.
  $EA50,$02 Increment the Y position by two to draw the lower section of the monsters body.
N $EA52 The routine at #R$D9BB handles which monster to display.
  $EA52,$02 #REGa=sprite ID #SPRITEID$23.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$23 | #SPRITE$23 | #N$63 | #SPRITE$63 | #N$A3 | #SPRITE$A3 }
. UDGTABLE#
  $EA54,$03 Call #R$D9BB.
N $EA57 Apply gravity.
  $EA57,$03 Call #R$DA59.
  $EA5A,$04 Jump to #R$EA6E if monster Y position is equal to #N$12.
  $EA5E,$07 Decrease *#R$D24B by one.
  $EA65,$03 Return if *#R$D24B is higher than #N$12.
  $EA68,$03 Call #R$DA59.
  $EA6B,$03 Return if #REGa is not equal to #N$12.
N $EA6E Monster is now at ground level.
@ $EA6E label=Animate_HitTheFloor
  $EA6E,$05 Write #N$12 to *#R$D24E.
  $EA73,$05 Write #N$0C to *#R$D24B.
  $EA78,$04 Set *#R$D246 to "not climbing" (#N$00).
  $EA7C,$07 Jump to #R$EA88 if *#R$D244 is not equal to #R$EFD8(#N$20).
  $EA83,$02 #REGa=#R$EFDA(#N$21).
  $EA85,$03 Jump to #R$E67C.
N $EA88 The monster still has energy, so finish this animation sequence.
@ $EA88 label=HitTheFloor_Finished
  $EA88,$05 Write #R$EFAA(#N$09) to *#R$D244.
  $EA8D,$04 #REGiy=#R$D244.
N $EA91 Take off four hit points from the monsters energy.
  $EA91,$02 #REGa=#N$04.
  $EA93,$03 Call #R$DD6C.
N $EA96 Make the splat sound.
N $EA96 #AUDIO(projectile.wav)(#INCLUDE(Projectile))
  $EA96,$05 Write melody ID #N$05 to *#R$FF8D.
  $EA9B,$01 Return.

c $EA9C Event: Landed?
@ $EA9C label=Event_Landed
  $EA9C,$07 Jump to #R$EAB4 if *#R$D24B is equal to #N$19.
  $EAA3,$04 Decrease *#R$D24B by one.
  $EAA7,$02 Jump to #R$EACE if *#R$D24B is not yet zero.
N $EAA9 Not sure if this is a bug or not but this is why the player monster continually "sits down" after landing if you
.       don't touch the controls. Then again, maybe it's intentional given #R$EA9C(#N$EA9C) checks if this is #N$19.
  $EAA9,$05 Reset *#R$D24B to #N$19.
  $EAAE,$06 Jump to #R$EABA if *#R$D252 is set to "computer controlled".
N $EAB4 This monster isn't computer controlled so check if any controls have been pressed.
@ $EAB4 label=Landed_CheckControls
  $EAB4,$03 Call #R$E179.
  $EAB7,$03 Jump to #R$EACE if no controls are being pressed.
N $EABA Either a monster player control has been pressed, or this is a computer controlled monster.
@ $EABA label=Landed_GetUp
  $EABA,$03 #REGa=*#R$D247.
N $EABD Moves the orientation flag into the carry flag.
  $EABD,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EABE,$03 Call #R$DA61 if the carry flag is not set.
N $EAC1 Restart the actions jump table back to the beginning.
  $EAC1,$01 #REGa=#N$00.
  $EAC2,$03 Reset *#R$D244 back to #N$00.
N $EAC5 Set the monster flags back to "normal" states.
  $EAC5,$03 Write "not climbing" (#N$00) to *#R$D246.
  $EAC8,$03 Write "not jumping" (#N$00) to *#R$D248.
  $EACB,$03 Jump to #R$E67C.
N $EACE No controls are being pressed and *#R$D24B is not yet zero, so the monster is still flat on their ass.
N $EACE The routine at #R$D9BB handles which monster to display.
@ $EACE label=Landed_OnAss
  $EACE,$02 #REGa=sprite ID #SPRITEID$07.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$07 | #SPRITE$07,$00,$0416 | #N$47 | #SPRITE$47,$00,$0416 | #N$87 | #SPRITE$87,$00,$0416 }
. UDGTABLE#
N $EAD0 Set the co-ordinates for where to draw.
  $EAD0,$04 #REGbc=*#R$D24D/#R$D24E.
  $EAD4,$03 Call #R$D9BB.
N $EAD7 Again, set the co-ordinates for where to draw.
  $EAD7,$04 #REGbc=*#R$D24D/#R$D24E.
  $EADB,$03 Increment the Y position by two and the X position by one, to target drawing the mouth/ fist section.
N $EADE Adjust the Y position for which way the monster is facing.
  $EADE,$03 #REGa=*#R$D247.
  $EAE1,$02,b$01 Flip bit 0.
  $EAE3,$01 #REGa+=#REGc.
  $EAE4,$01 #REGc=#REGa.
N $EAE5 The routine at #R$D9BB handles which monster to display.
  $EAE5,$02 #REGa=sprite ID #SPRITEID$1B.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$1B | #SPRITE$1B | #N$5B | #SPRITE$5B | #N$9B | #SPRITE$9B }
. UDGTABLE#
  $EAE7,$03 Call #R$D9BB.
  $EAEA,$06 Return if *#R$D244 is not equal to #R$EFD8(#N$20).
  $EAF0,$05 Write #R$EFDA(#N$21) to *#R$D244.
  $EAF5,$01 Return.

c $EAF6
  $EAF6,$03 Call #R$E179.
  $EAF9,$05 Jump to #R$EB2F if #REGa is not equal to #N$08.
  $EAFE,$08 Jump to #R$EB2F if *#R$D244 is equal to #N$1C.
  $EB06,$07 Jump to #R$EB2F if *#R$D24E is higher than #N$11.
  $EB0D,$07 Jump to #R$EB18 if *#R$D24D is equal to #N$FF.
  $EB14,$04 Jump to #R$EB2F if *#R$D24D is higher than #N$1D.
  $EB18,$03 #REGhl=#R$D247.
  $EB1B,$01 #REGa=*#REGhl.
  $EB1C,$02,b$01 Flip bit 0.
  $EB1E,$01 Increment #REGhl by one.
  $EB1F,$01 Merge the bits from *#REGhl.
  $EB20,$03 Call #R$DA61 not zero.
  $EB23,$03 #REGa=*#R$D246.
  $EB26,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EB27,$03 Call #R$DA59 if the carry flag is set.
  $EB2A,$02 #REGa=#N$08.
  $EB2C,$03 Jump to #R$E6C5.
  $EB2F,$03 #REGa=*#R$D246.
  $EB32,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EB33,$02 Jump to #R$EB43 if the carry flag is not set.
  $EB35,$03 #REGhl=#R$C896.
  $EB38,$03 #REGa=*#R$D247.
N $EB3B Moves the orientation flag into the carry flag.
  $EB3B,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EB3C,$02 Jump to #R$EB4F if the carry flag is not set.
  $EB3E,$03 #REGhl=#R$C8A9.
  $EB41,$02 Jump to #R$EB4F.
  $EB43,$03 #REGhl=#R$C86E.
  $EB46,$03 #REGa=*#R$D247.
N $EB49 Moves the orientation flag into the carry flag.
  $EB49,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EB4A,$02 Jump to #R$EB4F if the carry flag is not set.
  $EB4C,$03 #REGhl=#R$C882.
  $EB4F,$04 #REGbc=*#R$D24D/#R$D24E.
  $EB53,$07 Increment *#R$D24C by one.
  $EB5A,$02 #REGd=#N$00.
  $EB5C,$01 #REGe=#REGa.
  $EB5D,$01 #REGhl+=#REGde.
  $EB5E,$03 Write #REGhl to *#R$D21E.
  $EB61,$01 #REGd=*#REGhl.
  $EB62,$04 Jump to #R$EB67 if bit 5 of #REGd is not set.
  $EB66,$01 Increment #REGc by one.
  $EB67,$04 Jump to #R$EB6C if bit 0 of #REGd is not set.
  $EB6B,$01 Increment #REGc by one.
  $EB6C,$04 Jump to #R$EB71 if bit 1 of #REGd is not set.
  $EB70,$01 Decrease #REGc by one.
  $EB71,$06 Jump to #R$EB88 if *#R$D3FF is not zero.
  $EB77,$03 #REGa=*#R$D247.
  $EB7A,$02,b$01 Flip bits 0-4.
  $EB7C,$04 Jump to #R$EC6E if #REGa is equal to #REGc.
  $EB80,$02,b$01 Flip bits 1-4.
  $EB82,$02 #REGa+=#N$FC.
  $EB84,$04 Jump to #R$EC6E if #REGa is equal to #REGc.
  $EB88,$04 Jump to #R$EB8D if bit 2 of #REGd is not set.
  $EB8C,$01 Decrease #REGb by one.
  $EB8D,$01 #REGa=#REGd.
  $EB8E,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $EB8F,$04 Jump to #R$EBDD if bit 3 of #REGd is not set.
  $EB93,$01 Increment #REGb by one.
  $EB94,$06 Jump to #R$EBDD if *#R$D3FF is not zero.
  $EB9A,$06 Jump to #R$EC52 if #REGb is equal to #N$12.
  $EBA0,$04 Write #REGb to *#R$D24E.
  $EBA4,$04 Write #REGbc to *#R$D21C.
  $EBA8,$03 #REGbc=#N$0502.
  $EBAB,$03 #REGde=#N$090F.
  $EBAE,$03 Call #R$E0AD.
  $EBB1,$04 #REGbc=*#R$D21C.
  $EBB5,$02 Jump to #R$EBDD if {} is zero.
  $EBB7,$07 Jump to #R$EBDD if *#R$D244 is equal to #N$1C.
  $EBBE,$03 #REGa=*#R$D246.
  $EBC1,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EBC2,$03 Jump to #R$EC52 if the carry flag is not set.
  $EBC5,$04 Write #REGbc to *#R$D21C.
  $EBC9,$02 #REGb=#N$05.
  $EBCB,$06 #REGc=*#R$D247*#N$04.
  $EBD1,$03 #REGde=#N$090F.
  $EBD4,$03 Call #R$E0AD.
  $EBD7,$04 #REGbc=*#R$D21C.
  $EBDB,$02 Jump to #R$EC52 if {} is not zero.
  $EBDD,$05 Return if *#R$D3FF is not zero.
  $EBE2,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $EBE3,$04 Jump to #R$EC30 if bit 4 of #REGa is not set.
  $EBE7,$01 Increment #REGb by one.
  $EBE8,$05 Return if *#R$D3FF is not zero.
  $EBED,$05 Jump to #R$EC52 if #REGb is not equal to #N$12.
  $EBF2,$01 #REGa=#REGb.
  $EBF3,$03 Write #REGa to *#R$D24E.
  $EBF6,$04 Write #REGbc to *#R$D21C.
  $EBFA,$03 #REGbc=#N$0502.
  $EBFD,$03 #REGde=#N$090F.
  $EC00,$03 Call #R$E0AD.
  $EC03,$04 #REGbc=*#R$D21C.
  $EC07,$03 Jump to #R$EC30 if {} is zero.
  $EC0A,$08 Jump to #R$EC30 if *#R$D244 is equal to #N$1C.
  $EC12,$03 #REGa=*#R$D246.
  $EC15,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EC16,$02 Jump to #R$EC52 if the carry flag is not set.
  $EC18,$04 Write #REGbc to *#R$D21C.
  $EC1C,$02 #REGb=#N$05.
  $EC1E,$06 #REGc=*#R$D247*#N$04.
  $EC24,$03 #REGde=#N$090F.
  $EC27,$03 Call #R$E0AD.
  $EC2A,$04 #REGbc=*#R$D21C.
  $EC2E,$02 Jump to #R$EC52 if {} is not zero.
  $EC30,$04 Write #REGbc to *#R$D24D.
  $EC34,$08 Jump to #R$ECE0 if *#R$D217 is higher than #N$11.
N $EC3C The routine at #R$D9BB handles which monster to display.
  $EC3C,$02 #REGa=sprite ID #SPRITEID$09.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$09 | #SPRITE$09 | #N$49 | #SPRITE$49 | #N$89 | #SPRITE$89 }
. UDGTABLE#
  $EC3E,$01 Stash the co-ordinates on the stack.
  $EC3F,$03 Call #R$D9BB.
  $EC42,$01 Restore the co-ordinates from the stack.
  $EC43,$02 Increment both the X and Y positions by one to target drawing the mouth section.
  $EC45,$03 #REGa=*#R$D247.
  $EC48,$02,b$01 Flip bit 0.
  $EC4A,$01 #REGa+=#REGc.
  $EC4B,$01 #REGc=#REGa.
N $EC4C The routine at #R$D9BB handles which monster to display.
  $EC4C,$02 #REGa=sprite ID #SPRITEID$17.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$17 | #SPRITE$17 | #N$57 | #SPRITE$57 | #N$97 | #SPRITE$97 }
. UDGTABLE#
  $EC4E,$03 Call #R$D9BB.
  $EC51,$01 Return.
  $EC52,$04 Write #REGbc to *#R$D24D.
  $EC56,$03 #REGa=*#R$D247.
N $EC59 Moves the orientation flag into the carry flag.
  $EC59,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EC5A,$03 Call #R$DA61 if the carry flag is not set.
  $EC5D,$0A Write #N$00 to: #LIST { *#R$D24C } { *#R$D246 } { *#R$D248 } LIST#
  $EC67,$01 Increment #REGa by one.
  $EC68,$03 Write #REGa to *#R$D24F.
  $EC6B,$03 Jump to #R$EF86.
  $EC6E,$04 Write #N$00 to *#R$D24C.
  $EC72,$01 Increment #REGa by one.
  $EC73,$03 Write #REGa to *#R$D244.
  $EC76,$08 Jump to #R$EF86 if *#R$D24E is equal to #N$12.
  $EC7E,$05 Write #R$EFAE(#N$0B) to *#R$D244.
  $EC83,$04 Write #REGb to *#R$D24E.
  $EC87,$03 Jump to #R$E67C.

c $EC8A
  $EC8A,$07 Jump to #R$ECC0 if *#R$D24E is equal to #N$12.
  $EC91,$07 Decrease *#R$D24B by one.
  $EC98,$04 Jump to #R$ECA3 if *#R$D24B is higher than #N$12.
  $EC9C,$03 Call #R$DA59.
  $EC9F,$04 Jump to #R$ECC0 if #REGa is equal to #N$12.
N $ECA3 The routine at #R$D9BB handles which monster to display.
  $ECA3,$02 #REGa=sprite ID #SPRITEID$09.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$09 | #SPRITE$09 | #N$49 | #SPRITE$49 | #N$89 | #SPRITE$89 }
. UDGTABLE#
N $ECA5 Set the co-ordinates for where to draw.
  $ECA5,$04 #REGbc=*#R$D24D/#R$D24E.
  $ECA9,$01 Stash the co-ordinates on the stack.
  $ECAA,$03 Call #R$D9BB.
  $ECAD,$01 Restore the co-ordinates from the stack.
  $ECAE,$02 Increment both the X and Y positions by one to target drawing the mouth section.
  $ECB0,$03 #REGa=*#R$D247.
  $ECB3,$02,b$01 Flip bit 0.
  $ECB5,$01 #REGa+=#REGc.
  $ECB6,$01 #REGc=#REGa.
N $ECB7 The routine at #R$D9BB handles which monster to display.
  $ECB7,$02 #REGa=sprite ID #SPRITEID$17.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$17 | #SPRITE$17 | #N$57 | #SPRITE$57 | #N$97 | #SPRITE$97 }
. UDGTABLE#
  $ECB9,$03 Call #R$D9BB.
  $ECBC,$03 Call #R$DA59.
  $ECBF,$01 Return.
  $ECC0,$03 #REGa=*#R$D247.
N $ECC3 Moves the orientation flag into the carry flag.
  $ECC3,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $ECC4,$03 Call #R$DA61 if the carry flag is not set.
  $ECC7,$05 Write #N$12 to *#R$D24E.
  $ECCC,$05 Write #N$19 to *#R$D24B.
  $ECD1,$07 Write #N$00 to: #LIST { *#R$D246 } { *#R$D248 } LIST#
  $ECD8,$05 Write #N$01 to *#R$D24F.
  $ECDD,$03 Jump to #R$EF86.

c $ECE0 Handler: Punching While Jumping
@ $ECE0 label=Handler_JumpPunch
  $ECE0,$03 #REGa=*#R$D217.
  $ECE3,$02,b$01 Keep only bits 0-3.
  $ECE5,$01 Store the result in #REGb.
  $ECE6,$04 Jump to #R$ECEC if bit 3 of #REGb is set.
  $ECEA,$02 Jump to #R$ED0C.
N $ECEC Handles when the monster is jumping and punches upwards.
@ $ECEC label=Handler_JumpPunchUp
  $ECEC,$03 #REGhl=#N$FE00.
  $ECEF,$03 #REGde=#N$FE03.
  $ECF2,$03 Call #R$F352.
N $ECF5 Set the co-ordinates for where to draw.
  $ECF5,$04 #REGbc=*#R$D24D/#R$D24E.
  $ECF9,$02 Decrease the Y position by two to draw the upper section of the monsters body.
N $ECFB The routine at #R$D9BB handles which monster to display.
  $ECFB,$02 #REGa=sprite ID #SPRITEID$25.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$25 | #SPRITE$25 | #N$65 | #SPRITE$65 | #N$A5 | #SPRITE$A5 }
. UDGTABLE#
  $ECFD,$03 Call #R$D9BB.
N $ED00 Again, set the co-ordinates for where to draw.
  $ED00,$04 #REGbc=*#R$D24D/#R$D24E.
  $ED04,$02 Increment the Y position by two to draw the lower section of the monsters body.
N $ED06 The routine at #R$D9BB handles which monster to display.
  $ED06,$02 #REGa=sprite ID #SPRITEID$23.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$23 | #SPRITE$23 | #N$63 | #SPRITE$63 | #N$A3 | #SPRITE$A3 }
. UDGTABLE#
  $ED08,$03 Call #R$D9BB.
  $ED0B,$01 Return.
N $ED0C Handles when the monster is jumping and punches left or right.
@ $ED0C label=Handler_JumpPunchLeftRight
  $ED0C,$03 #REGhl=#N$0103.
  $ED0F,$03 #REGde=#N$0100.
  $ED12,$03 Call #R$F352.
N $ED15 Set the co-ordinates for where to draw.
  $ED15,$04 #REGbc=*#R$D24D/#R$D24E.
  $ED19,$02 Increment the Y position by two to draw the lower section of the monsters body.
N $ED1B The routine at #R$D9BB handles which monster to display.
  $ED1B,$02 #REGa=sprite ID #SPRITEID$23.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$23 | #SPRITE$23 | #N$63 | #SPRITE$63 | #N$A3 | #SPRITE$A3 }
. UDGTABLE#
  $ED1D,$03 Call #R$D9BB.
N $ED20 Again, set the co-ordinates for where to draw.
  $ED20,$04 #REGbc=*#R$D24D/#R$D24E.
  $ED24,$04 #REGh=*#R$D247.
  $ED28,$03 #REGc-=#REGh.
N $ED2B The routine at #R$D9BB handles which monster to display.
  $ED2B,$02 #REGa=sprite ID #SPRITEID$1D.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$1D | #SPRITE$1D,$00,$0515 | #N$5D | #SPRITE$5D,$00,$0515 | #N$9D | #SPRITE$9D,$00,$0515 }
. UDGTABLE#
  $ED2D,$03 Call #R$D9BB.
  $ED30,$01 Return.

c $ED31
  $ED31,$03 #REGa=*#R$D217.
  $ED34,$02,b$01 Keep only bits 0-3.
  $ED36,$01 #REGb=#REGa.
  $ED37,$05 Jump to #R$EDA3 if bit 2 of #REGb is set.
  $ED3C,$04 Jump to #R$ED54 if bit 3 of #REGb is set.
  $ED40,$03 #REGa=*#R$D247.
N $ED43 Moves the orientation flag into the carry flag.
  $ED43,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $ED44,$02 Jump to #R$ED4D if the carry flag is set.
  $ED46,$04 Jump to #R$ED79 if bit 1 of #REGb is set.
  $ED4A,$03 Jump to #R$EF86.
  $ED4D,$04 Jump to #R$ED79 if bit 1 of #REGb is not set.
  $ED51,$03 Jump to #R$EF86.
  $ED54,$03 #REGhl=#R$FE00.
  $ED57,$03 #REGde=#N$FE03.
  $ED5A,$03 Call #R$F352.
  $ED5D,$05 Write #R$EFBC(#N$12) to *#R$D244.
N $ED62 Set the co-ordinates for where to draw.
  $ED62,$04 #REGbc=*#R$D24D/#R$D24E.
  $ED66,$02 Decrease #REGb by two.
N $ED68 The routine at #R$D9BB handles which monster to display.
  $ED68,$02 #REGa=sprite ID #SPRITEID$25.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$25 | #SPRITE$25 | #N$65 | #SPRITE$65 | #N$A5 | #SPRITE$A5 }
. UDGTABLE#
  $ED6A,$03 Call #R$D9BB.
N $ED6D Again, set the co-ordinates for where to draw.
  $ED6D,$04 #REGbc=*#R$D24D/#R$D24E.
  $ED71,$02 Increment #REGb by two.
N $ED73 The routine at #R$D9BB handles which monster to display.
  $ED73,$02 #REGa=sprite ID #SPRITEID$21.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$21 | #SPRITE$21 | #N$61 | #SPRITE$61 | #N$A1 | #SPRITE$A1 }
. UDGTABLE#
  $ED75,$03 Call #R$D9BB.
  $ED78,$01 Return.
  $ED79,$03 #REGhl=#N$0103.
  $ED7C,$03 #REGde=#N$0100.
  $ED7F,$03 Call #R$F352.
  $ED82,$05 Write #R$EFBE(#N$13) to *#R$D244.
N $ED87 Set the co-ordinates for where to draw.
  $ED87,$04 #REGbc=*#R$D24D/#R$D24E.
  $ED8B,$02 Increment #REGb by two.
N $ED8D The routine at #R$D9BB handles which monster to display.
  $ED8D,$02 #REGa=sprite ID #SPRITEID$21.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$21 | #SPRITE$21 | #N$61 | #SPRITE$61 | #N$A1 | #SPRITE$A1 }
. UDGTABLE#
  $ED8F,$03 Call #R$D9BB.
N $ED92 Again, set the co-ordinates for where to draw.
  $ED92,$04 #REGbc=*#R$D24D/#R$D24E.
  $ED96,$03 #REGa=*#R$D247.
  $ED99,$01 #REGa-=#REGc.
  $ED9A,$01 Invert the bits in #REGa.
  $ED9B,$01 Increment #REGa by one.
  $ED9C,$01 #REGc=#REGa.
N $ED9D The routine at #R$D9BB handles which monster to display.
  $ED9D,$02 #REGa=sprite ID #SPRITEID$1D.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$1D | #SPRITE$1D | #N$5D | #SPRITE$5D | #N$9D | #SPRITE$9D }
. UDGTABLE#
  $ED9F,$03 Call #R$D9BB.
  $EDA2,$01 Return.
  $EDA3,$03 #REGhl=#N$0302.
  $EDA6,$03 #REGde=#N$0301.
  $EDA9,$03 Call #R$F352.
  $EDAC,$05 Write #R$EFC2(#N$15) to *#R$D244.
N $EDB1 Set the co-ordinates for where to draw.
  $EDB1,$04 #REGbc=*#R$D24D/#R$D24E.
  $EDB5,$03 #REGa=*#R$D247.
  $EDB8,$01 #REGa-=#REGc.
  $EDB9,$01 Invert the bits in #REGa.
  $EDBA,$01 Increment #REGa by one.
  $EDBB,$01 #REGc=#REGa.
N $EDBC The routine at #R$D9BB handles which monster to display.
  $EDBC,$02 #REGa=sprite ID #SPRITEID$29.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$29 | #SPRITE$29 | #N$69 | #SPRITE$69 | #N$A9 | #SPRITE$A9 }
. UDGTABLE#
  $EDBE,$03 Call #R$D9BB.
  $EDC1,$01 Return.

c $EDC2
  $EDC2,$03 #REGa=*#R$D217.
  $EDC5,$02,b$01 Keep only bits 0-3.
  $EDC7,$01 #REGb=#REGa.
  $EDC8,$04 Jump to #R$EDE5 if bit 3 of #REGb is set.
  $EDCC,$05 Jump to #R$EE4A if bit 2 of #REGb is set.
  $EDD1,$03 #REGa=*#R$D247.
N $EDD4 Moves the orientation flag into the carry flag.
  $EDD4,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EDD5,$02 Jump to #R$EDDE if the carry flag is set.
  $EDD7,$04 Jump to #R$EE12 if bit 1 of #REGb is set.
  $EDDB,$03 Jump to #R$EF86.
  $EDDE,$04 Jump to #R$EE12 if bit 1 of #REGb is not set.
  $EDE2,$03 Jump to #R$EF86.
  $EDE5,$03 #REGhl=#N$FE01.
  $EDE8,$03 #REGde=#N$FE03.
  $EDEB,$03 Call #R$F352.
  $EDEE,$05 Write #R$EFC4(#N$16) to *#R$D244.
  $EDF3,$02 #REGh=#N$FE.
  $EDF5,$01 #REGd=#REGh.
  $EDF6,$02 #REGl=#N$01.
  $EDF8,$02 #REGe=#N$00.
  $EDFA,$03 Call #R$EF38.
N $EDFD The routine at #R$D9BB handles which monster to display.
  $EDFD,$02 #REGa=sprite ID #SPRITEID$25.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$25 | #SPRITE$25 | #N$65 | #SPRITE$65 | #N$A5 | #SPRITE$A5 }
. UDGTABLE#
  $EDFF,$03 Call #R$D9BB.
  $EE02,$02 #REGh=#N$02.
  $EE04,$02 #REGl=#N$01.
  $EE06,$01 #REGd=#REGh.
  $EE07,$02 #REGe=#N$00.
  $EE09,$03 Call #R$EF38.
N $EE0C The routine at #R$D9BB handles which monster to display.
  $EE0C,$02 #REGa=sprite ID #SPRITEID$1F.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$1F | #SPRITE$1F | #N$5F | #SPRITE$5F | #N$9F | #SPRITE$9F }
. UDGTABLE#
  $EE0E,$03 Call #R$D9BB.
  $EE11,$01 Return.
  $EE12,$03 #REGhl=#N$0104.
  $EE15,$03 #REGde=#N$0100.
  $EE18,$03 Call #R$F352.
  $EE1B,$05 Write #R$EFC6(#N$17) to *#R$D244.
N $EE20 Set the co-ordinates for where to draw.
  $EE20,$04 #REGbc=*#R$D24D/#R$D24E.
  $EE24,$02 Increment #REGb by two.
  $EE26,$03 #REGa=*#R$D247.
  $EE29,$02,b$01 Flip bit 0.
  $EE2B,$01 #REGa+=#REGc.
  $EE2C,$01 #REGc=#REGa.
N $EE2D The routine at #R$D9BB handles which monster to display.
  $EE2D,$02 #REGa=sprite ID #SPRITEID$1F.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$1F | #SPRITE$1F | #N$5F | #SPRITE$5F | #N$9F | #SPRITE$9F }
. UDGTABLE#
  $EE2F,$03 Call #R$D9BB.
N $EE32 Again, set the co-ordinates for where to draw.
  $EE32,$04 #REGbc=*#R$D24D/#R$D24E.
  $EE36,$03 #REGa=*#R$D247.
  $EE39,$01 #REGa-=#REGc.
  $EE3A,$01 Invert the bits in #REGa.
  $EE3B,$01 Increment #REGa by one.
  $EE3C,$01 #REGc=#REGa.
  $EE3D,$03 #REGa=*#R$D247.
  $EE40,$02,b$01 Flip bit 0.
  $EE42,$01 #REGa+=#REGc.
  $EE43,$01 #REGc=#REGa.
N $EE44 The routine at #R$D9BB handles which monster to display.
  $EE44,$02 #REGa=sprite ID #SPRITEID$1D.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$1D | #SPRITE$1D | #N$5D | #SPRITE$5D | #N$9D | #SPRITE$9D }
. UDGTABLE#
  $EE46,$03 Call #R$D9BB.
  $EE49,$01 Return.
  $EE4A,$03 #REGhl=#N$0303.
  $EE4D,$03 #REGde=#N$0301.
  $EE50,$03 Call #R$F352.
  $EE53,$05 Write #R$EFCA(#N$19) to *#R$D244.
N $EE58 Set the co-ordinates for where to draw.
  $EE58,$04 #REGbc=*#R$D24D/#R$D24E.
  $EE5C,$03 #REGa=*#R$D247.
  $EE5F,$01 #REGa-=#REGc.
  $EE60,$01 Invert the bits in #REGa.
  $EE61,$01 Increment #REGa by one.
  $EE62,$01 #REGc=#REGa.
  $EE63,$03 #REGa=*#R$D247.
  $EE66,$02,b$01 Flip bit 0.
  $EE68,$01 #REGa+=#REGc.
  $EE69,$01 #REGc=#REGa.
N $EE6A The routine at #R$D9BB handles which monster to display.
  $EE6A,$02 #REGa=sprite ID #SPRITEID$0B.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$0B | #SPRITE$0B | #N$4B | #SPRITE$4B | #N$8B | #SPRITE$8B }
. UDGTABLE#
  $EE6C,$03 Call #R$D9BB.
  $EE6F,$01 Return.

c $EE70 Animate: Grabbing
@ $EE70 label=Animate_Grabbing
N $EE70 *#R$D24B is set to #N$04 at ????. This is used as a countdown to display this sprite four frames.
  $EE70,$07 Decrease *#R$D24B by one.
  $EE77,$02 Jump to #R$EE8E if the animation is finished.
N $EE79 Select the "climbing" monster sprite bottom half.
N $EE79 The routine at #R$D9BB handles which monster to display.
  $EE79,$02 #REGa=sprite ID #SPRITEID$21.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$21 | #SPRITE$21 | #N$61 | #SPRITE$61 | #N$A1 | #SPRITE$A1 }
. UDGTABLE#
N $EE7B Set the co-ordinates for where to draw.
  $EE7B,$04 #REGbc=*#R$D24D/#R$D24E.
  $EE7F,$02 Increment the Y position by two to draw the lower section of the monsters body.
  $EE81,$03 Call #R$D9BB.
N $EE84 Again, set the co-ordinates for where to draw.
  $EE84,$04 #REGbc=*#R$D24D/#R$D24E.
N $EE88 Select the monster eating head sprite.
N $EE88 The routine at #R$D9BB handles which monster to display.
  $EE88,$02 #REGa=sprite ID #SPRITEID$03.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$03 | #SPRITE$03 | #N$43 | #SPRITE$43 | #N$83 | #SPRITE$83 }
. UDGTABLE#
  $EE8A,$03 Call #R$D9BB.
  $EE8D,$01 Return.
N $EE8E The animation is complete.
@ $EE8E label=Animate_Grabbing_Finished
  $EE8E,$05 Write #R$EFCE(#N$1B) to *#R$D244, this will set up #R$EE9B being called next.
  $EE93,$05 Write a new countdown of #N$06 to *#R$D24B.
  $EE98,$03 Jump to #R$E67C.

c $EE9B Animate: Eating
@ $EE9B label=Animate_Eating
N $EE9B *#R$D24B is set to #N$06 at #R$EE93. This is used as a countdown to display six frames of animation.
  $EE9B,$03 #REGa=*#R$D24B.
  $EE9E,$01 Decrease #REGa by one.
  $EE9F,$04 Jump to #R$EECA if the animation is finished.
  $EEA3,$03 Update the countdown at *#R$D24B.
N $EEA6 Select the "climbing" monster sprite.
N $EEA6 The routine at #R$D9BB handles which monster to display.
  $EEA6,$02 #REGa=sprite ID #SPRITEID$09.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$09 | #SPRITE$09 | #N$49 | #SPRITE$49 | #N$89 | #SPRITE$89 }
. UDGTABLE#
N $EEA8 Set the co-ordinates for where to draw.
  $EEA8,$04 #REGbc=*#R$D24D/#R$D24E.
  $EEAC,$03 Call #R$D9BB.
N $EEAF Again, set the co-ordinates for where to draw.
  $EEAF,$04 #REGbc=*#R$D24D/#R$D24E.
N $EEB3 Select the monster head sprite.
N $EEB3 The routine at #R$D9BB handles which monster to display.
  $EEB3,$02 #REGa=sprite ID #SPRITEID$0D.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$0D | #SPRITE$0D | #N$4D | #SPRITE$4D | #N$8D | #SPRITE$8D }
. UDGTABLE#
  $EEB5,$03 Call #R$D9BB.
N $EEB8 Now, set the co-ordinates for where to draw the mouth.
  $EEB8,$04 #REGbc=*#R$D24D/#R$D24E.
  $EEBC,$02 Increment both the X and Y positions by one to target drawing the mouth animation.
M $EEBE,$05 Using *#R$D24B, sequentially choose a frame between #N$00-#N$03.
  $EEBE,$03 #REGa=*#R$D24B.
  $EEC1,$02,b$01 Keep only bits 0-1.
N $EEC3 Calculate the sprite ID.
  $EEC3,$01 #REGa*=#N$02.
  $EEC4,$02 #REGa+=#N$2B.
. #UDGTABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,c2 George | =h,c2 Lizzy | =h,c2 Ralph }
. { =h ID | =h Sprite | =h ID | =h Sprite | =h ID | =h Sprite }
. { #N$2B | #SPRITE$2B | #N$6B | #SPRITE$6B | #N$AB | #SPRITE$AB }
. { #N$2D | #SPRITE$2D | #N$6D | #SPRITE$6D | #N$AD | #SPRITE$AD }
. { #N$2F | #SPRITE$2F | #N$6F | #SPRITE$6F | #N$AF | #SPRITE$AF }
. { #N$31 | #SPRITE$31 | #N$71 | #SPRITE$71 | #N$B1 | #SPRITE$B1 }
. UDGTABLE#
  $EEC6,$03 Call #R$D9BB.
  $EEC9,$01 Return.
N $EECA The animation is complete.
@ $EECA label=Animate_Eating_Finished
  $EECA,$04 Write #R$EF98(#N$00) to *#R$D244.
  $EECE,$05 Write #N$19 to *#R$D24B.
  $EED3,$03 Jump to #R$E67C.

c $EED6 Animate: Transform Explosion
@ $EED6 label=Animate_TransformExplosion
N $EED6 Set the co-ordinates for where to draw.
  $EED6,$04 #REGbc=*#R$D24D/#R$D24E.
  $EEDA,$01 Increment #REGb by one.
  $EEDB,$01 Increment #REGc by one.
  $EEDC,$02 #REGa=explosion sprite (#SPRITEID$77).
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$77 | #SPRITE$77 }
. UDGTABLE#
  $EEDE,$03 Call #R$D6C9.
  $EEE1,$05 Write #R$EFDC(#N$22) to *#R$D244.
  $EEE6,$04 Write #N$00 to *#R$D249.
  $EEEA,$01 Return.

c $EEEB Animate: Turn Into Human
@ $EEEB label=Animate_TurnIntoHuman
  $EEEB,$07 Jump to #R$EEFC if *#R$D24E is not equal to #N$14.
  $EEF2,$05 Write #R$EFDE(#N$23) to *#R$D244.
  $EEF7,$04 Write #N$00 to *#R$D249.
  $EEFB,$01 Return.
  $EEFC,$01 Increment #REGa by one.
  $EEFD,$03 Write #REGa to *#R$D24E.
N $EF00 Set the co-ordinates for where to draw.
  $EF00,$04 #REGbc=*#R$D24D/#R$D24E.
  $EF04,$02 #REGa=sprite ID #SPRITEID$35.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$35 | #SPRITE$35 }
. UDGTABLE#
  $EF06,$03 Call #R$D6C9.
  $EF09,$01 Return.

c $EF0A Animate: Exit Stage Right
@ $EF0A label=Animate_ExitStageRight
N $EF0A Set the co-ordinates for where to draw.
  $EF0A,$04 #REGbc=*#R$D24D/#R$D24E.
  $EF0E,$03 #REGa=*#R$D249.
  $EF11,$02,b$01 Keep only bit 0.
  $EF13,$02,b$01 Flip bit 0.
  $EF15,$03 Write #REGa to *#R$D249.
  $EF18,$02 Jump to #R$EF20 if #REGa is not zero.
  $EF1A,$02 #REGa=sprite ID #SPRITEID$37.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$37 | #SPRITE$37 }
. UDGTABLE#
  $EF1C,$03 Call #R$D6C9.
  $EF1F,$01 Return.
  $EF20,$07 Increment *#R$D24D by one.
  $EF27,$04 Jump to #R$EF32 if #REGa is equal to #N$28.
  $EF2B,$01 Increment #REGc by one.
  $EF2C,$02 #REGa=sprite ID #SPRITEID$35.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$35 | #SPRITE$35 }
. UDGTABLE#
  $EF2E,$03 Call #R$D6C9.
  $EF31,$01 Return.
  $EF32,$05 Write #N$FF to *#R$D244.
  $EF37,$01 Return.

c $EF38 Calculate Monster Position?
@ $EF38 label=Monster_CalculatePosition
R $EF38 DE 16-bit number to add to #REGhl if facing left
R $EF38 HL 16-bit number to add to #REGhl if facing right
R $EF38 O:BC The new monster co-ordinates
N $EF38 TODO; this is likely used for punching collision detection.
N $EF38 Set the co-ordinates for where to draw.
  $EF38,$04 #REGbc=*#R$D24D/#R$D24E.
N $EF3C Which number is added is determined by which direction the monster is facing.
  $EF3C,$03 #REGa=*#R$D247 (will be #N$00 or #N$01).
N $EF3F Moves the orientation flag into the carry flag.
  $EF3F,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $EF40,$02 Jump to #R$EF49 if the carry flag is set.
N $EF42 If the monster is facing right; add #REGhl to #REGbc.
  $EF42,$03 #REGb+=#REGh.
  $EF45,$03 #REGc+=#REGl.
  $EF48,$01 Return.
N $EF49 If the monster is facing left; add #REGde to #REGbc.
@ $EF49 label=Monster_CalculatePosition_FacingLeft
  $EF49,$03 #REGb+=#REGd.
  $EF4C,$03 #REGc+=#REGe.
  $EF4F,$01 Return.

c $EF50 Controller: Jump/ Punch
@ $EF50 label=Controller_JumpPunch
  $EF50,$03 Call #R$E179.
  $EF53,$02,b$01 Keep only bit 4.
  $EF55,$02 Jump to #R$EF5E if the result is not zero.
M $EF50,$07 Jump to #R$EF5E if "jump/punch" has been pressed.
  $EF57,$04 Write #R$EF98(#N$00) to *#R$D244.
  $EF5B,$03 Jump to #R$E67C.
N $EF5E Action the "jump/punch" animation.
@ $EF5E label=Controller_JumpPunch_Action
  $EF5E,$03 #REGa=*#R$D244.
  $EF61,$02 #REGa-=#N$0F.
  $EF63,$03 Create an offset in #REGhl using #REGa.
  $EF66,$01 #REGhl*=#N$02.
  $EF67,$04 #REGhl+=#R$EF70.
  $EF6B,$01 Load the low byte of the jump controller address from the "jump/punch" jump table.
  $EF6C,$01 Increment the "jump/punch" jump table pointer by one.
  $EF6D,$01 Set the high byte of the jump controller address from the "jump/punch" jump table.
  $EF6E,$01 Set low byte of the jump controller address from #REGa.
  $EF6F,$01 Jump to the address held by *#REGhl.

w $EF70
@ $EF70 label=JumpTable_JumpPunch
  $EF70,$02 ID: #N((#PC-$EF70)/$02).
L $EF70,$02,$0B

c $EF86
  $EF86,$03 Call #R$DB54.
  $EF89,$03 #REGa=*#R$D24F.
  $EF8C,$03 Call #R$DA0F.
  $EF8F,$03 Call #R$D9C3.
  $EF92,$01 Return if {} is not zero.
  $EF93,$04 Write #R$EF98(#N$00) to *#R$D244.
  $EF97,$01 Return.

w $EF98 Jump Table
@ $EF98 label=JumpTable
  $EF98,$02 ID: #N((#PC-$EF98)/$02).
L $EF98,$02,$24

c $EFE0 Handler: Buildings
@ $EFE0 label=Handler_Buildings
N $EFE0 This isn't so much a counter; it's more an address offset to select each buildings data in turn.
  $EFE0,$01 #REGa=#N$00 (building data offset).
@ $EFE1 label=Handler_Buildings_Loop
  $EFE1,$01 Stash the building data offset on the stack.
  $EFE2,$03 Create an offset using #REGde.
  $EFE5,$07 #REGix=#R$D39F+building data offset.
  $EFEC,$03 #REGa=building state (*#REGix+#N$00).
  $EFEF,$04 Jump to #R$F005 if #REGa is equal to #N$02 (crumbling).
  $EFF3,$05 Jump to #R$F05A if #REGa is equal to #N$03.
  $EFF8,$05 Jump to #R$F0AB if #REGa is equal to #N$04
@ $EFFD label=Handler_Buildings_Next
  $EFFD,$01 Restore the building data offset from the stack.
  $EFFE,$02 Move onto the next set of building data (offset+#N$0E).
N $F000 Have we accounted for all the buildings?
  $F000,$04 Jump to #R$EFE1 until #REGa is equal to #N$54.
  $F004,$01 Return.
N $F005 Handle the building crumbling.
@ $F005 label=Handler_BuildingCrumbling
  $F005,$03 Decrease *#REGix+#N$0D by one.
  $F008,$03 Jump to #R$F052 until *#REGix+#N$0D is zero.
  $F00B,$04 Write #N$02 to *#REGix+#N$0D.
  $F00F,$03 Decrease "crumbling countdown" (*#REGix+#N$0A) by one.
  $F012,$02 Jump to #R$F03C until "crumbling countdown" (*#REGix+#N$0A) is zero.
  $F014,$04 Write "collapsing" (#N$03) to building state (*#REGix+#N$00).
  $F018,$03 #REGa=*#REGix+#N$05.
  $F01B,$01 Increment #REGa by one.
  $F01C,$03 Write #REGa to "collapsing countdown" (*#REGix+#N$0B).
  $F01F,$02 #REGc=#N$07.
  $F021,$03 #REGa=*#REGix+#N$07.
  $F024,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F025,$02 Jump to #R$F029 if the carry flag is not set.
  $F027,$02 #REGc=#N$38.
  $F029,$03 #REGe=*#REGix+#N$01.
  $F02C,$03 #REGb=Building width (*#REGix+#N$06).
  $F02F,$04 #REGhl=#R$D31F+#REGde.
  $F033,$01 #REGa=*#REGhl.
  $F034,$01 Merge the bits from #REGc.
  $F035,$01 Write #REGa to *#REGhl.
  $F036,$01 Increment #REGhl by one.
  $F037,$02 Decrease counter by one and loop back to #R$F033 until counter is zero.
  $F039,$03 Jump to #R$F0AB.
@ $F03C label=Animate_Crumbling
  $F03C,$03 #REGl=Crumbling countdown (*#REGix+#N$0A).
  $F03F,$03 Call #R$F0EF.
  $F042,$01 #REGe=#REGl.
  $F043,$03 #REGb=Building width (*#REGix+#N$06).
  $F046,$02 #REGc=#N$FF.
  $F048,$01 #REGa=*#REGhl.
  $F049,$02,b$01 Set bit 7.
  $F04B,$01 Write #REGa to *#REGhl.
  $F04C,$01 #REGa=#REGc.
  $F04D,$01 Write #REGa to *#REGde.
  $F04E,$01 Increment #REGhl by one.
  $F04F,$01 Increment #REGde by one.
  $F050,$02 Decrease counter by one and loop back to #R$F048 until counter is zero.
N $F052 Plays a single building "crumbling" sound, the handler looping will keep it going until it's fallen and done.
N $F052 #AUDIO(building-crumbling.wav)(#INCLUDE(Crumbling))
@ $F052 label=Sounds_BuildingCrumbling
  $F052,$05 Write melody ID #N$09 to *#R$FF8D.
  $F057,$03 Jump to #R$F0AB.
@ $F05A label=Handler_BuildingCollapsing
  $F05A,$03 Decrease *#REGix+#N$0D by one.
  $F05D,$02 Jump to #R$F0AB until *#REGix+#N$0D is zero.
N $F05F Plays a single building "collapsing" sound, the handler looping will keep it going until it's fallen and done.
N $F05F #AUDIO(building-collapsing.wav)(#INCLUDE(Collapsing))
  $F05F,$05 Write melody ID #N$08 to *#R$FF8D.
  $F064,$04 Write #N$02 to *#REGix+#N$0D.
  $F068,$03 Decrease "collapsing countdown" (*#REGix+#N$0B) by one.
  $F06B,$02 Jump to #R$F073 until "collapsing countdown" (*#REGix+#N$0B) is zero.
  $F06D,$04 Write "rubble" (#N$04) to building state (*#REGix+#N$00).
  $F071,$02 Jump to #R$F0AB.
  $F073,$03 #REGl=*#REGix+#N$05.
  $F076,$01 Decrease #REGl by one.
  $F077,$03 Call #R$F0EF.
  $F07A,$02 #REGa+=#N$20.
  $F07C,$01 #REGe=#REGa.
  $F07D,$03 #REGb=Collapsing countdown (*#REGix+#N$0B).
  $F080,$04 Stash #REGbc, #REGhl and #REGde (twice) on the stack.
  $F084,$01 #REGd=#REGh.
  $F085,$01 #REGe=#REGl.
  $F086,$04 #REGhl+=#N($0020,$04,$04).
  $F08A,$03 #REGb=Building width (*#REGix+#N$06).
  $F08D,$01 #REGa=*#REGde.
  $F08E,$01 Write #REGa to *#REGhl.
  $F08F,$01 Increment #REGe by one.
  $F090,$01 Increment #REGl by one.
  $F091,$02 Decrease counter by one and loop back to #R$F08D until counter is zero.
  $F093,$01 Restore #REGhl from the stack.
  $F094,$03 #REGb=Building width (*#REGix+#N$06).
  $F097,$03 Write #N$FF to *#REGhl.
  $F09A,$01 Increment #REGhl by one.
  $F09B,$02 Decrease counter by one and loop back to #R$F099 until counter is zero.
  $F09D,$03 #REGbc=#N($0020,$04,$04).
  $F0A0,$01 Restore #REGhl from the stack.
  $F0A1,$01 Set flags.
  $F0A2,$02 #REGhl-=#REGbc.
  $F0A4,$01 Exchange the #REGde register with the shadow #REGhl register.
  $F0A5,$01 Restore #REGhl from the stack.
  $F0A6,$02 #REGhl-=#REGbc.
  $F0A8,$01 Restore #REGbc from the stack.
  $F0A9,$02 Decrease counter by one and loop back to #R$F080 until counter is zero.
N $F0AB Self-modifying code.
@ $F0AB label=Handler_BuildingRubble
  $F0AB,$04 Write #N$00 to *#R$F0DD.
  $F0AF,$03 Decrease *#REGix+#N$0C by one.
  $F0B2,$02 Jump to #R$F0C4 until *#REGix+#N$0C is zero.
N $F0B4 The whole animation is finished so set the state to "gone" and decrease the active buildings count.
  $F0B4,$04 Write "gone" (#N$05) to building state (*#REGix+#N$00).
  $F0B8,$07 Decrease *#R$D3F3 by one.
N $F0BF Self-modifying code.
  $F0BF,$05 Write #N$AF (XOR #REGa) to *#R$F0DD.
  $F0C4,$03 #REGl=*#REGix+#N$05.
  $F0C7,$01 Decrease #REGl by one.
  $F0C8,$03 Call #R$F0EF.
  $F0CB,$02 #REGa+=#N$20.
  $F0CD,$01 #REGl=#REGa.
  $F0CE,$01 #REGe=#REGa.
  $F0CF,$03 #REGb=Building width (*#REGix+#N$06).
  $F0D2,$01 Exchange the #REGde register with the shadow #REGhl register.
  $F0D3,$03 #REGa=*#REGix+#N$0C.
  $F0D6,$02,b$01 Keep only bit 0.
  $F0D8,$03 #REGa*=#N$08.
  $F0DB,$02 #REGa+=#N$44.
N $F0DD #HTML(The value here is self-modified at:
. #TABLE(default,centre,centre,centre) { =h Location | =h Byte Set | =h Code }
. { #R$F0AB(#N$F0AB) | #N$00 | <code>NOP</code> }
. { #R$F0BF | #N$AF | <code>XOR #REGa</code> }
. TABLE#)
  $F0DD,$01 No operation OR #REGa=#N$00 depending on the above.
  $F0DE,$02 Write #N$FF to *#REGhl.
  $F0E0,$01 Write #REGa to *#REGde.
  $F0E1,$01 Increment #REGl by one.
  $F0E2,$01 Increment #REGe by one.
  $F0E3,$01 Increment #REGa by one.
  $F0E4,$04 Jump to #R$F0EA if #REGa is not equal to #N$4D.
  $F0E8,$02 #REGa=#N$44.
  $F0EA,$02 Decrease counter by one and loop back to #R$F0DD until counter is zero.
  $F0EC,$03 Jump to #R$EFFD.
N $F0EF
  $F0EF,$02 #REGh=#N$00.
  $F0F1,$01 Decrease #REGl by one.
  $F0F2,$05 #REGhl*=#N$20.
  $F0F7,$03 #REGe=*#REGix+#N$03.
  $F0FA,$03 #REGd=*#REGix+#N$04.
  $F0FD,$01 #REGhl+=#REGde.
  $F0FE,$03 #REGa=*#REGix+#N$07.
  $F101,$06 #REGb=#N$5F+(#REGb*#N$03).
  $F107,$05 #REGd=#N$68+#REGh-#REGb
  $F10C,$01 #REGa=#REGl.
  $F10D,$01 Return.

c $F10E Helicopter Something
@ $F10E label=Something_Helicopter
  $F10E,$02 #REGb=#N$06.
  $F110,$04 #REGix=#R$D2A7.
  $F114,$05 #REGa=#N$EC-#REGb.
  $F119,$03 Write #REGa to *#R$D408.
  $F11C,$04 Write #N$00 to *#R$D247.
  $F120,$01 Stash #REGbc on the stack.
  $F121,$07 Jump to #R$F27D if *#REGix+#N$00 is zero.
  $F128,$03 #REGa=*#REGix+#N$00.
  $F12B,$03 #REGc=*#REGix+#N$01.
  $F12E,$03 #REGe=*#REGix+#N$02.
  $F131,$03 #REGb=*#REGix+#N$03.
  $F134,$02,b$01 Flip bit 0.
  $F136,$03 Write #REGa to *#REGix+#N$00.
  $F139,$02,b$01 Keep only bit 0.
  $F13B,$01 #REGd=#REGa.
  $F13C,$03 #REGa=*#REGix+#N$00.
  $F13F,$01 RRCA.
  $F140,$02,b$01 Keep only bits 0-2.
  $F142,$04 Jump to #R$F161 if #REGa is equal to #N$01.
  $F146,$04 Jump to #R$F1A0 if #REGa is equal to #N$02.
  $F14A,$05 Jump to #R$F1BE if #REGa is equal to #N$03.
  $F14F,$05 Jump to #R$F22E if #REGa is equal to #N$04.
  $F154,$05 Jump to #R$F254 if #REGa is equal to #N$05.
  $F159,$05 Jump to #R$F161 if #REGa is equal to #N$06.
  $F15E,$03 Jump to #R$F1A0.
  $F161,$04 Jump to #R$F16A if #REGe is not equal to #REGc.
  $F165,$03 Increment *#REGix+#N$02 by one.
  $F168,$02 Jump to #R$F17A.
  $F16A,$01 #REGa=#REGd.
  $F16B,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F16C,$02 #REGa=#N$E8.
  $F16E,$03 Jump to #R$F276 if the carry flag is not set.
  $F171,$01 Increment #REGc by one.
  $F172,$03 Write #REGc to *#REGix+#N$01.
  $F175,$02 #REGa=#N$E6.
  $F177,$03 Jump to #R$F276.
  $F17A,$03 #REGa=*#REGix+#N$00.
  $F17D,$02,b$01 Keep only bits 0-6.
  $F17F,$04 Jump to #R$F191 if #REGa is lower than #N$08.
  $F183,$04 Write #N$00 to *#REGix+#N$00.
  $F187,$07 Decrease *#R$D3F6 by one.
  $F18E,$03 Jump to #R$F27D.
  $F191,$04 Write #N$06 to *#REGix+#N$00.
  $F195,$03 Write #REGb to *#REGix+#N$01.
  $F198,$04 Write #N$01 to *#REGix+#N$03.
  $F19C,$01 Restore #REGbc from the stack.
  $F19D,$03 Jump to #R$F114.
  $F1A0,$05 Write #N$01 to *#R$D247.
  $F1A5,$04 Jump to #R$F1AE if #REGe is not equal to #REGc.
  $F1A9,$03 Increment *#REGix+#N$02 by one.
  $F1AC,$02 Jump to #R$F17A.
  $F1AE,$01 #REGa=#REGd.
  $F1AF,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F1B0,$02 #REGa=#N$E8.
  $F1B2,$03 Jump to #R$F276 if the carry flag is not set.
  $F1B5,$01 Decrease #REGc by one.
  $F1B6,$03 Write #REGc to *#REGix+#N$01.
  $F1B9,$02 #REGa=#N$E6.
  $F1BB,$03 Jump to #R$F276.
  $F1BE,$04 Jump to #R$F1D4 if #REGb is equal to #REGc.
  $F1C2,$01 #REGb=#REGc.
  $F1C3,$01 #REGc=#REGe.
  $F1C4,$01 #REGa=#REGd.
  $F1C5,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F1C6,$02 #REGa=#N$EC.
  $F1C8,$03 Jump to #R$F276 if the carry flag is not set.
  $F1CB,$01 Decrease #REGb by one.
  $F1CC,$03 Write #REGb to *#REGix+#N$01.
  $F1CF,$02 #REGa=#N$EA.
  $F1D1,$03 Jump to #R$F276.
  $F1D4,$01 #REGa=#REGe.
  $F1D5,$04 Jump to #R$F1E9 if #REGa is higher than #N$10.
  $F1D9,$04 Write #N$08 to *#REGix+#N$00.
  $F1DD,$03 #REGc=*#REGix+#N$02.
  $F1E0,$03 Decrease *#REGix+#N$02 by one.
  $F1E3,$02 Increment #REGc by two.
  $F1E5,$02 #REGd=#N$02.
  $F1E7,$02 Jump to #R$F1F2.
  $F1E9,$04 Write #N$0A to *#REGix+#N$00.
  $F1ED,$03 #REGc=*#REGix+#N$02.
  $F1F0,$02 #REGd=#N$82.
  $F1F2,$04 Write #N$12 to *#REGix+#N$03.
  $F1F6,$02 #REGb=#N$04.
  $F1F8,$03 Call #R$F1FF.
  $F1FB,$01 Restore #REGbc from the stack.
  $F1FC,$03 Jump to #R$F114.
  $F1FF,$03 #REGa=*#R$D3F9.
  $F202,$03 Return if #REGa is higher than #N$10.
  $F205,$02 #REGa+=#N$03.
  $F207,$03 Write #REGa to *#R$D3F9.
  $F20A,$03 #REGhl=#R$D2BC.
  $F20D,$03 Increment #REGhl by three.
  $F210,$04 Jump to #R$F20D if *#REGhl is not zero.
  $F214,$02 #REGe=#N$03.
  $F216,$01 Write #REGd to *#REGhl.
  $F217,$01 Increment #REGhl by one.
  $F218,$01 Write #REGc to *#REGhl.
  $F219,$01 Increment #REGhl by one.
  $F21A,$01 Write #REGb to *#REGhl.
  $F21B,$01 Increment #REGhl by one.
  $F21C,$01 Increment #REGb by one.
  $F21D,$01 Increment #REGc by one.
  $F21E,$05 Jump to #R$F225 if #REGd is equal to #N$02.
  $F223,$02 Decrease #REGc by two.
  $F225,$01 Decrease #REGe by one.
  $F226,$02 Jump to #R$F216 until #REGe is zero.
N $F228 #AUDIO(helicopter.wav)(#INCLUDE(Helicopter))
  $F228,$05 Write melody ID #N$02 to *#R$FF8D.
  $F22D,$01 Return.
  $F22E,$05 Write #N$01 to *#R$D247.
  $F233,$04 Jump to #R$F245 if #REGb is equal to #REGc.
  $F237,$02 #REGa=#N$EE.
  $F239,$01 Increment #REGc by one.
  $F23A,$03 Write #REGc to *#REGix+#N$01.
  $F23D,$01 Increment #REGe by one.
  $F23E,$03 Write #REGe to *#REGix+#N$02.
  $F241,$01 #REGb=#REGc.
  $F242,$01 #REGc=#REGe.
  $F243,$02 Jump to #R$F276.
  $F245,$04 Write #N$0C to *#REGix+#N$00.
  $F249,$03 Write #REGe to *#REGix+#N$01.
  $F24C,$04 Write #N$22 to *#REGix+#N$02.
  $F250,$01 Restore #REGbc from the stack.
  $F251,$03 Jump to #R$F114.
  $F254,$04 Jump to #R$F266 if #REGb is equal to #REGc.
  $F258,$02 #REGa=#N$EE.
  $F25A,$01 Increment #REGc by one.
  $F25B,$03 Write #REGc to *#REGix+#N$01.
  $F25E,$01 Decrease #REGe by one.
  $F25F,$03 Write #REGe to *#REGix+#N$02.
  $F262,$01 #REGb=#REGc.
  $F263,$01 #REGc=#REGe.
  $F264,$02 Jump to #R$F276.
  $F266,$04 Write #N$0E to *#REGix+#N$00.
  $F26A,$01 Decrease #REGe by one.
  $F26B,$03 Write #REGe to *#REGix+#N$01.
  $F26E,$04 Write #N$FA to *#REGix+#N$02.
  $F272,$01 Restore #REGbc from the stack.
  $F273,$03 Jump to #R$F114.
  $F276,$03 Call #R$D6C9.
  $F279,$04 Write #N$00 to *#R$D247.
  $F27D,$08 Increment #REGix by four.
  $F285,$01 Restore #REGbc from the stack.
  $F286,$01 Decrease #REGb by one.
  $F287,$03 Jump to #R$F114 until #REGb is zero.
  $F28A,$01 Return.

c $F28B Handler: Spawn Helicopters
@ $F28B label=Handler_SpawnHelicopters
N $F28B Just return if the number of active helicopters is already at the maximum amount for this level.
  $F28B,$09 Return if *#R$D3F5 is equal to *#R$D212.
N $F294 Add a hint of randomness to whether we proceed or not. Roughly 50% chance.
  $F294,$03 #REGa=random number between #N$00-#N$FF.
  $F297,$03 Return if #REGa is higher than #N$80.
N $F29A Loop to find an empty slot.
  $F29A,$03 #REGhl=#R$D292 (#R$D295-#N$03).
@ $F29D label=Handler_SpawnHelicopters_FindSlot
  $F29D,$03 Move the table pointer to the next helicopter table data.
  $F2A0,$04 Jump to #R$F29D if this helicopter is already active.
N $F2A4 50/50 chance of jumping to #R$F2B2.
  $F2A4,$03 Call #R$DA28.
  $F2A7,$02,b$01 Keep only bit 0.
M $F2A4,$05 Get a random number of either zero or one.
  $F2A9,$02 Jump to #R$F2B2 if the result is zero.
N $F2AB Creates a background helicopter.
  $F2AB,$02 Write #N$40 (background) to helicopter state.
  $F2AD,$01 Increment the helicopter table pointer by one.
  $F2AE,$02 Write #N$FC to helicopter X position.
  $F2B0,$02 Jump to #R$F2B7.
N $F2B2 Creates a foreground helicopter.
@ $F2B2 label=Handler_SpawnForegroundHelicopter
  $F2B2,$02 Write #N$80 (foreground) to helicopter state.
  $F2B4,$01 Increment the helicopter table pointer by one.
  $F2B5,$02 Write #N$24 to helicopter X position.
@ $F2B7 label=Handler_Helicopter_SetYPos
  $F2B7,$01 Increment the helicopter table pointer by one.
  $F2B8,$02 Write #N$03 to helicopter Y position.
N $F2BA 25% chance of jumping to #R$F2C2.
  $F2BA,$03 Call #R$DA28.
  $F2BD,$02,b$01 Keep only bits 0-1.
M $F2BA,$05 Get a random number between 0-3.
  $F2BF,$02 Jump to #R$F2C2 if the random number is 0.
  $F2C1,$01 Write the random number to helicopter Y position.
N $F2C2 Keep track of the number of active helicopters.
@ $F2C2 label=Helicopter_Update_Count
  $F2C2,$07 Increment *#R$D3F5 by one.
  $F2C9,$01 Return.

c $F2CA Handler: Energy Bar
@ $F2CA label=Handler_EnergyBar
N $F2CA #UDGTABLE(default,centre)
. { #PUSHS
. #SIM(start=$F916,stop=$F924)
. #SIM(start=$DE80,stop=$DE86)
. #SIM(start=$DEB0,stop=$DEB6) #SCR$02,$00,$00,$20,$07(energy-pixel)
. #POPS }
. UDGTABLE#
  $F2CA,$03 #REGhl=#R$5F20.
  $F2CD,$03 #REGde=#R$6820.
  $F2D0,$02 #REGb=#N$20.
  $F2D2,$02 #REGc=#N$00.
  $F2D4,$02 #REGa=#N$FF.
  $F2D6,$01 Write #REGc to *#REGhl.
  $F2D7,$01 Write #REGa to *#REGde.
  $F2D8,$01 Increment #REGl by one.
  $F2D9,$01 Increment #REGe by one.
  $F2DA,$02 Decrease counter by one and loop back to #R$F2D6 until counter is zero.
N $F2DC George:
  $F2DC,$02 #REGc=horizontal co-ordinate (#N$22).
  $F2DE,$02 #REGh=#COLOUR$6A.
  $F2E0,$03 #REGa=*#R$CFDE.
  $F2E3,$03 Call #R$F2FB.
N $F2E6 Lizzy:
  $F2E6,$02 #REGc=horizontal co-ordinate (#N$2C).
  $F2E8,$02 #REGh=#COLOUR$6C.
  $F2EA,$03 #REGa=*#R$D00D.
  $F2ED,$03 Call #R$F2FB.
N $F2F0 Ralph:
  $F2F0,$02 #REGc=horizontal co-ordinate (#N$36).
  $F2F2,$02 #REGh=#COLOUR$6F.
  $F2F4,$03 #REGa=*#R$D03C.
  $F2F7,$03 Call #R$F2FB.
  $F2FA,$01 Return.
  $F2FB,$02 #REGb=#N$00.
  $F2FD,$01 #REGd=#REGb.
  $F2FE,$02 Return if the monsters energy is at zero.
  $F300,$02 Subtract #N$08 from the monsters energy held by #REGa.
  $F302,$02 Jump to #R$F30E if #REGa was lower than #N$08.
  $F304,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $F305,$02 #REGe=#N$34.
  $F307,$03 Call #R$DA3D.
  $F30A,$01 Exchange the shadow #REGaf register back to the normal #REGaf register.
  $F30B,$01 Increment #REGc by one.
  $F30C,$02 Jump to #R$F2FB.
  $F30E,$02 #REGa+=#N$08.
  $F310,$01 #REGe=#REGa.
  $F311,$02 #REGa=#N$08.
  $F313,$01 #REGa-=#REGe.
  $F314,$02 #REGa+=#N$35.
  $F316,$01 #REGe=#REGa.
  $F317,$03 Call #R$DA3D.
  $F31A,$01 Increment #REGc by one.
  $F31B,$01 Return.

c $F31C Handler: Energy Bar Attributes
@ $F31C label=Handler_EnergyBarAttributes
N $F31C #UDGTABLE(default,centre)
. { #PUSHS
. #SIM(start=$F916,stop=$F924)
. #SIM(start=$DE80,stop=$DE89)
. #SIM(start=$DEB0,stop=$DEB6) #SCR$02,$00,$00,$20,$07(energy)
. #POPS }
. UDGTABLE#
N $F31C George:
  $F31C,$02 #REGc=horizontal co-ordinate (#N$22).
  $F31E,$02 #REGh=#COLOUR$6A.
  $F320,$03 #REGa=*#R$CFDE.
  $F323,$03 Call #R$F33B.
N $F326 Lizzy:
  $F326,$02 #REGc=horizontal co-ordinate (#N$2C).
  $F328,$02 #REGh=#COLOUR$6C.
  $F32A,$03 #REGa=*#R$D00D.
  $F32D,$03 Call #R$F33B.
N $F330 Ralph:
  $F330,$02 #REGc=horizontal co-ordinate (#N$36).
  $F332,$02 #REGh=#COLOUR$6F.
  $F334,$03 #REGa=*#R$D03C.
  $F337,$03 Call #R$F33B.
  $F33A,$01 Return.
N $F33B f
@ $F33B label=WriteEnergyBar_AttributesLoop
  $F33B,$02 #REGb=#N$00.
  $F33D,$01 #REGd=#REGb.
  $F33E,$02 Return if the monsters energy is at zero.
  $F340,$02 Subtract #N$08 from the monsters energy held by #REGa.
  $F342,$02 Jump to #R$F34C if #REGa was lower than #N$08.
N $F344 Stash the monsters energy while #REGa is being used for writing to the buffer.
  $F344,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $F345,$03 Call #R$F34C.
  $F348,$01 Exchange the shadow #REGaf register back to the normal #REGaf register.
  $F349,$01 Increment the horizontal co-ordinate by one.
  $F34A,$02 Jump to #R$F33B.
N $F34C Write the energy bar to the buffer.
@ $F34C label=WriteEnergyBar_Attributes
  $F34C,$02 #REGd=vertical co-ordinate (#N$83).
  $F34E,$01 #REGe=horizontal co-ordinate for the current monster held in #REGc.
  $F34F,$01 #REGa=bar colour held in #REGh.
  $F350,$01 Write #REGa to *#REGde.
  $F351,$01 Return.

c $F352
  $F352,$03 Call #R$EF38.
  $F355,$03 #REGhl=*#R$D224.
  $F358,$01 Write #REGb to *#REGhl.
  $F359,$01 Increment #REGhl by one.
  $F35A,$01 Write #REGc to *#REGhl.
  $F35B,$01 Increment #REGhl by one.
  $F35C,$03 #REGa=*#R$D246.
  $F35F,$01 Write #REGa to *#REGhl.
  $F360,$01 Increment #REGhl by one.
  $F361,$03 #REGa=*#R$D248.
  $F364,$01 Write #REGa to *#REGhl.
  $F365,$01 Increment #REGhl by one.
  $F366,$03 #REGa=*#R$D244.
  $F369,$01 Write #REGa to *#REGhl.
  $F36A,$01 Increment #REGhl by one.
  $F36B,$03 #REGa=*#R$D247.
  $F36E,$01 Write #REGa to *#REGhl.
  $F36F,$01 Increment #REGhl by one.
  $F370,$03 Write #REGhl to *#R$D224.
  $F373,$03 Call #R$DD38.
  $F376,$01 #REGb=#REGa.
  $F377,$02 #REGc=#N$00.
  $F379,$01 #REGa=*#REGhl.
  $F37A,$04 Jump to #R$F38B if #REGa is higher than #N$C1.
  $F37E,$02,b$01 Keep only bits 0-5.
  $F380,$04 Jump to #R$F38B if #REGa is higher than #N$32.
  $F384,$01 #REGa=*#REGhl.
  $F385,$02,b$01 Keep only bits 6-7.
  $F387,$02 Rotate #REGa left two positions (bits 6 to 7 are now in positions 0 to 1).
  $F389,$01 Increment #REGa by one.
  $F38A,$01 #REGc=#REGa.
  $F38B,$03 Call #R$F3AF.
  $F38E,$01 Increment #REGhl by one.
  $F38F,$03 Call #R$F3AF.
  $F392,$02 #REGe=#N$1F.
  $F394,$01 #REGhl+=#REGde.
  $F395,$03 Call #R$F3AF.
  $F398,$01 Increment #REGhl by one.
  $F399,$03 Call #R$F3AF.
  $F39C,$05 Return if *#R$D3FB is not zero.
  $F3A1,$03 #REGhl=*#R$D226.
  $F3A4,$01 Write #REGb to *#REGhl.
  $F3A5,$01 Increment #REGhl by one.
  $F3A6,$03 Write #REGhl to *#R$D226.
  $F3A9,$05 Write #N$01 to *#R$D218.
  $F3AE,$01 Return.
  $F3AF,$04 Jump to #R$F3C5 if *#REGhl is zero.
  $F3B3,$04 Jump to #R$F3C5 if #REGa is equal to #N$FF.
  $F3B7,$02 Return if #REGa is equal to #REGb.
  $F3B9,$04 Jump to #R$F3C5 if #REGc is zero.
  $F3BD,$01 #REGa=*#REGhl.
  $F3BE,$02,b$01 Keep only bits 6-7.
  $F3C0,$02 Rotate #REGa left two positions (bits 6 to 7 are now in positions 0 to 1).
  $F3C2,$01 Increment #REGa by one.
  $F3C3,$02 Return if #REGa is equal to #REGc.
  $F3C5,$01 Restore #REGde from the stack.
  $F3C6,$02 #REGb=#N$00.
  $F3C8,$02 Jump to #R$F39C.

c $F3CA
  $F3CA,$03 #REGa=*#R$D218.
  $F3CD,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F3CE,$02 Jump to #R$F3EA if the carry flag is set.
  $F3D0,$03 #REGhl=*#R$D224.
  $F3D3,$02 #REGa=#N$FF.
  $F3D5,$02 Write #N$FF to *#REGhl.
  $F3D7,$06 Increment #REGhl by six.
  $F3DD,$03 Write #REGhl to *#R$D224.
  $F3E0,$03 #REGhl=*#R$D226.
  $F3E3,$02 Write #N$00 to *#REGhl.
  $F3E5,$01 Increment #REGhl by one.
  $F3E6,$03 Write #REGhl to *#R$D226.
  $F3E9,$01 Return.
  $F3EA,$04 Write #N$00 to *#R$D218.
  $F3EE,$01 Return.

c $F3EF
  $F3EF,$03 #REGhl=#R$D22C.
  $F3F2,$02 #REGb=#N$03.
  $F3F4,$01 Stash #REGbc on the stack.
  $F3F5,$05 Jump to #R$F40B if *#REGhl is equal to #N$FF.
  $F3FA,$01 #REGb=#REGa.
  $F3FB,$01 Increment #REGhl by one.
  $F3FC,$01 #REGc=*#REGhl.
  $F3FD,$01 Stash #REGhl on the stack.
  $F3FE,$03 Call #R$F373.
  $F401,$01 Restore #REGhl from the stack.
  $F402,$05 Increment #REGhl by five.
  $F407,$01 Restore #REGbc from the stack.
  $F408,$02 Decrease counter by one and loop back to #R$F3F4 until counter is zero.
  $F40A,$01 Return.
  $F40B,$04 #REGde=*#R$D226.
  $F40F,$02 Write #N$00 to *#REGde.
  $F411,$01 Increment #REGde by one.
  $F412,$04 Write #REGde to *#R$D226.
  $F416,$01 Increment #REGhl by one.
  $F417,$03 Jump to #R$F402.

c $F41A
  $F41A,$04 Return if *#REGhl is equal to #N$FF.
  $F41E,$03 Return if *#REGde is not zero.
  $F421,$01 #REGb=*#REGhl.
  $F422,$01 Increment #REGhl by one.
  $F423,$01 #REGc=*#REGhl.
  $F424,$01 Stash #REGde on the stack.
  $F425,$05 Write #N$01 to *#R$D3FB.
  $F42A,$03 Call #R$F373.
  $F42D,$04 Write #N$00 to *#R$D3FB.
  $F431,$01 Restore #REGhl from the stack.
  $F432,$01 Write #REGb to *#REGhl.
  $F433,$01 Return.

c $F434 Process Monsters
@ $F434 label=ProcessMonsters
  $F434,$03 #REGhl=#R$D238.
N $F437 Work backwards from Ralph to George.
  $F437,$05 Write #N$03 (Ralph) to *#R$DF45.
@ $F439 label=ProcessMonsters_Loop
  $F43C,$02 Stash the current monster ID and #REGhl on the stack.
  $F43E,$06 If *#REGhl is not at the terminator jump to #R$F450.
  $F444,$02 Restore #REGhl and the current monster ID from the stack.
  $F446,$06 Decrease #REGhl by six.
  $F44C,$01 Decrease current monster ID by one.
  $F44D,$02 Jump to #R$F439 until all monsters have been processed.
  $F44F,$01 Return.

c $F450
  $F450,$01 #REGb=#REGa.
  $F451,$01 Increment #REGhl by one.
  $F452,$01 #REGc=*#REGhl.
  $F453,$01 Increment #REGhl by one.
  $F454,$01 #REGa=*#REGhl.
  $F455,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F456,$01 Return if the carry flag is not set.
  $F457,$01 Increment #REGhl by one.
  $F458,$01 #REGa=*#REGhl.
  $F459,$01 Rotate #REGa left one position, setting the carry flag if bit 0 was set.
  $F45A,$01 Return if the carry flag is set.
  $F45B,$04 Write #REGbc to *#R$D228.
  $F45F,$02 #REGh=#N$00.
  $F461,$01 #REGl=#REGb.
  $F462,$01 #REGd=#REGh.
  $F463,$01 #REGe=#REGc.
  $F464,$06 #REGhl*=#N$20+#REGde.
  $F46A,$02 #REGa=#N$01.
  $F46C,$03 Write #REGa to *#R$D3FB.
  $F46F,$03 Write #REGhl to *#R$D22A.
  $F472,$03 #REGde=#N$013F.
  $F475,$03 Call #R$E0CF.
  $F478,$03 #REGa=*#R$D3FC.
  $F47B,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F47C,$02 Jump to #R$F480 if the carry flag is set.
  $F47E,$02 Jump to #R$F488 if #REGa is zero.
  $F480,$03 #REGbc=#N($0000,$04,$04).
  $F483,$02 #REGe=#N$01.
  $F485,$03 Call #R$F543.
  $F488,$03 #REGa=*#R$D215.
  $F48B,$04 Jump to #R$F4E6 if #REGa is lower than #N$4D.
  $F48F,$02 #REGa-=#N$4C.
  $F491,$02,b$01 Keep only bits 0-1.
  $F493,$04 Jump to #R$F4E6 if #REGa is not equal to #N$01.
  $F497,$05 Write #N$01 to *#R$D3FC.
  $F49C,$03 #REGa=*#R$D215.
  $F49F,$02 #REGa-=#N$4D.
  $F4A1,$04 Shift #REGa right twice.
  $F4A5,$04 Jump to #R$F4B8 if #REGa is lower than #N$08.
  $F4A9,$02,b$01 Keep only bits 0-1.
  $F4AB,$01 Increment #REGa by one.
  $F4AC,$01 #REGa+=#REGa.
  $F4AD,$01 #REGd=#REGa.
  $F4AE,$02 #REGe=#N$03.
  $F4B0,$03 #REGa=*#R$DF45.
  $F4B3,$03 Call #R$DD97.
  $F4B6,$02 Jump to #R$F4DC.

c $F4B8 Handler: Eating
N $F4B8 Monster has eaten something, work out what.
@ $F4B8 label=Handler_Eating
  $F4B8,$04 Anything with an ID lower than #N$04 is food, if so jump to #R$F4D1.
N $F4BC Else it's something inedible so fetch the monster state and handle it.
  $F4BC,$03 #REGa=*#R$DF45.
  $F4BF,$03 Call #R$DD52.
N $F4C2 Take #N$06 away from the monsters energy level.
  $F4C2,$02 #REGa=#N$06.
  $F4C4,$03 Call #R$DD6C.
  $F4C7,$04 Write #N$1D to monster state (*#REGiy+#N$00).
  $F4CB,$04 Write #N$04 to *#REGiy+#N$07.
  $F4CF,$02 Jump to #R$F472.

c $F4D1 Handler: Eaten Food
@ $F4D1 label=Handler_EatFood
  $F4D1,$03 #REGa=*#R$DF45.
  $F4D4,$03 Call #R$DD52.
N $F4D7 Add #N$08 to the monsters energy level.
  $F4D7,$02 #REGa=#N$08.
  $F4D9,$03 Call #R$DD89.
@ $F4DC label=Handler_EatFood_SetState
  $F4DC,$04 Write "eating" (#N$1A) to monster state (*#REGiy+#N$00).
  $F4E0,$04 Write #N$04 to *#REGiy+#N$07.
  $F4E4,$02 Jump to #R$F472.

c $F4E6
  $F4E6,$03 #REGde=#N$013F.
  $F4E9,$04 #REGbc=*#R$D228.
  $F4ED,$01 Increment #REGc by one.
  $F4EE,$03 Call #R$E0CF.
  $F4F1,$03 #REGa=*#R$D3FC.
  $F4F4,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F4F5,$02 Jump to #R$F4F9 if the carry flag is set.
  $F4F7,$02 Jump to #R$F501 if #REGa is zero.
  $F4F9,$03 #REGbc=#N($0001,$04,$04).
  $F4FC,$02 #REGe=#N$02.
  $F4FE,$03 Call #R$F543.
  $F501,$03 #REGde=#N$013F.
  $F504,$04 #REGbc=*#R$D228.
  $F508,$01 Increment #REGb by one.
  $F509,$03 Call #R$E0CF.
  $F50C,$03 #REGa=*#R$D3FC.
  $F50F,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F510,$02 Jump to #R$F514 if the carry flag is set.
  $F512,$02 Jump to #R$F51C if #REGa is zero.
  $F514,$03 #REGbc=#N($0020,$04,$04).
  $F517,$02 #REGe=#N$03.
  $F519,$03 Call #R$F543.
  $F51C,$03 #REGde=#N$013F.
  $F51F,$04 #REGbc=*#R$D228.
  $F523,$01 Increment #REGb by one.
  $F524,$01 Increment #REGc by one.
  $F525,$03 Call #R$E0CF.
  $F528,$03 #REGa=*#R$D3FC.
  $F52B,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F52C,$02 Jump to #R$F530 if the carry flag is set.
  $F52E,$02 Jump to #R$F538 if #REGa is zero.
  $F530,$03 #REGbc=#N($0021,$04,$04).
  $F533,$02 #REGe=#N$04.
  $F535,$03 Call #R$F543.
  $F538,$0A Write #N$00 to: #LIST { *#R$D3FB } { *#R$D3FC } { *#R$D219 } LIST#
  $F542,$01 Return.
  $F543,$03 #REGa=*#R$D3FC.
  $F546,$01 Rotate #REGa right one position, setting the carry flag if bit 0 was set.
  $F547,$03 #REGa=*#R$D215.
  $F54A,$02 Jump to #R$F551 if the carry flag is not set.
  $F54C,$02 #REGa=#N$10.
  $F54E,$03 Write #REGa to *#R$D215.
  $F551,$02 Return if #REGa is zero.
  $F553,$04 Jump to #R$F56A if #REGa is lower than #N$09.
  $F557,$04 Jump to #R$F565 if #REGa is higher than #N$0E.
  $F55B,$01 #REGa=#REGe.
  $F55C,$02,b$01 Keep only bit 0.
  $F55E,$02,b$01 Flip bit 0.
  $F560,$02 #REGa+=#N$0E.
  $F562,$03 Jump to #R$F61F.
  $F565,$05 Jump to #R$F5E6 if #REGa is not equal to #N$10.
  $F56A,$01 #REGa=#REGe.
  $F56B,$04 Jump to #R$F572 if #REGa is not equal to #N$01.
  $F56F,$03 Write #REGa to *#R$D219.
  $F572,$04 Jump to #R$F59E if #REGa is not equal to #N$04.
  $F576,$06 Jump to #R$F59E if *#R$D219 is zero.
  $F57C,$06 Jump to #R$F59E if *#R$D3FC is not zero.
  $F582,$01 Stash #REGde on the stack.
  $F583,$03 Call #R$DA28.
  $F586,$01 Restore #REGde from the stack.
  $F587,$05 Jump to #R$F59E if #REGa is higher than #N$10.
  $F58C,$03 #REGa=*#R$D3F7.
  $F58F,$04 Jump to #R$F59E if #REGa is equal to #N$08.
  $F593,$01 Increment #REGa by one.
  $F594,$03 Write #REGa to *#R$D3F7.
  $F597,$01 Stash #REGde on the stack.
  $F598,$03 Call #R$F5A4.
  $F59B,$01 Restore #REGde from the stack.
  $F59C,$02 Jump to #R$F538.
  $F59E,$01 #REGa=#REGe.
  $F59F,$02 #REGa+=#N$2F.
  $F5A1,$03 Jump to #R$F61F.
  $F5A4,$03 Call #R$DA28.
  $F5A7,$02,b$01 Keep only bits 0-1.
M $F5A4,$05 Get a random number between 0-3.
  $F5A9,$04 Jump to #R$F5A4 if #REGa is equal to #N$03.
  $F5AD,$03 #REGc=#REGa*#N$04.
  $F5B0,$03 Call #R$DA28.
  $F5B3,$02,b$01 Keep only bits 0-1.
M $F5B0,$05 Get a random number between 0-3.
  $F5B5,$01 Set the bits from #REGc.
  $F5B6,$05 #REGe=#N$4D+#REGa*#N$04.
  $F5BB,$04 #REGd=*#R$D218.
  $F5BF,$04 #REGbc=*#R$D22A.
  $F5C3,$03 Call #R$F5D8.
  $F5C6,$01 Increment #REGc by one.
  $F5C7,$03 Call #R$F5D8.
  $F5CA,$03 #REGhl=#N($001F,$04,$04).
  $F5CD,$01 #REGhl+=#REGbc.
  $F5CE,$01 #REGb=#REGh.
  $F5CF,$01 #REGc=#REGl.
  $F5D0,$03 Call #R$F5D8.
  $F5D3,$01 Increment #REGc by one.
  $F5D4,$03 Call #R$F5D8.
  $F5D7,$01 Return.
  $F5D8,$02 Stash #REGde and #REGbc on the stack.
  $F5DA,$03 Call #R$DA3D.
  $F5DD,$02 Restore #REGbc and #REGde from the stack.
  $F5DF,$01 Increment #REGe by one.
N $F5E0 #AUDIO(test.wav)(#INCLUDE(Unknown1))
  $F5E0,$05 Write melody ID #N$01 to *#R$FF8D.
  $F5E5,$01 Return.
  $F5E6,$04 Jump to #R$F5F4 if #REGa is not equal to #N$11.
  $F5EA,$01 #REGa=#REGe.
  $F5EB,$02 Compare #REGa with #N$03...
  $F5ED,$02 #REGa=#N$13.
  $F5EF,$02 Jump to #R$F61F if #REGa was higher than #N$03 on line #R$F5EB.
  $F5F1,$01 Decrease #REGa by one.
  $F5F2,$02 Jump to #R$F61F.
  $F5F4,$03 Return if #REGa is equal to #N$0E.
  $F5F7,$03 Return if #REGa is equal to #N$0F.
  $F5FA,$03 Return if #REGa is equal to #N$12.
  $F5FD,$03 Return if #REGa is equal to #N$13.
  $F600,$03 Return if #REGa is equal to #N$15.
  $F603,$03 Return if #REGa is equal to #N$16.
  $F606,$04 Jump to #R$F614 if #REGa is not equal to #N$14.
  $F60A,$01 #REGa=#REGe.
  $F60B,$02 Compare #REGa with #N$03...
  $F60D,$02 #REGa=#N$16.
  $F60F,$02 Jump to #R$F61F #REGa was higher than #N$03 on line #R$F60B.
  $F611,$01 Decrease #REGa by one.
  $F612,$02 Jump to #R$F61F.
  $F614,$05 Jump to #R$F56A if #REGa is lower than #N$30.
  $F619,$05 Jump to #R$F56A if #REGa is higher than #N$34.
  $F61E,$01 Return.
  $F61F,$01 #REGe=#REGa.
  $F620,$02 Stash #REGbc and #REGde on the stack.
  $F622,$04 #REGbc=*#R$D228.
  $F626,$03 Call #R$F63E.
  $F629,$02 Restore #REGde and #REGbc from the stack.
  $F62B,$03 #REGhl=*#R$D22A.
  $F62E,$01 #REGhl+=#REGbc.
  $F62F,$01 #REGb=#REGh.
  $F630,$01 #REGc=#REGl.
  $F631,$04 #REGd=*#R$D218.
  $F635,$03 Call #R$DA3D.
N $F638 #AUDIO(test.wav)(#INCLUDE(Unknown1))
  $F638,$05 Write melody ID #N$01 to *#R$FF8D.
  $F63D,$01 Return.
  $F63E,$03 #REGhl=#R$D31F.
  $F641,$02 #REGd=#N$00.
  $F643,$01 #REGe=#REGc.
  $F644,$01 #REGhl+=#REGde.
  $F645,$01 #REGa=*#REGhl.
  $F646,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $F647,$02 #REGe=#N$01.
  $F649,$01 #REGa=*#REGhl.
  $F64A,$04 Jump to #R$F654 if #REGa is lower than #N$08.
  $F64E,$03 RRCA.
  $F651,$02,b$01 Keep only bits 0-2.
  $F653,$01 Increment #REGe by one.
  $F654,$03 #REGhl=#R$D218.
  $F657,$01 Write #REGe to *#REGhl.
  $F658,$01 Decrease #REGa by one.
  $F659,$01 #REGa+=#REGa.
  $F65A,$01 #REGh=#REGa.
  $F65B,$01 #REGa+=#REGa.
  $F65C,$01 #REGl=#REGa.
  $F65D,$01 #REGa+=#REGa.
  $F65E,$01 #REGa+=#REGh.
  $F65F,$01 #REGa+=#REGl.
  $F660,$01 #REGe=#REGa.
  $F661,$04 #REGix=#R$D39F.
  $F665,$02 #REGix+=#REGde.
  $F667,$03 #REGa=*#REGix+#N$00.
  $F66A,$03 Return if #REGa is higher than #N$03.
  $F66D,$02 #REGa=#N$13.
  $F66F,$03 #REGa-=*#REGix+#N$05.
  $F672,$01 #REGb=#REGa.
  $F673,$03 #REGa=*#R$D229.
  $F676,$01 Decrease #REGa by one.
  $F677,$03 Jump to #R$F681 if #REGa is higher than #REGb.
  $F67A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $F67B,$02,b$01 Keep only bits 0-2.
  $F67D,$02 #REGe=#N$01.
  $F67F,$02 Jump to #R$F654.
  $F681,$03 #REGa=*#REGix+#N$09.
  $F684,$02 #REGa-=#N$02.
  $F686,$03 Write #REGa to *#REGix+#N$09.
  $F689,$02 Jump to #R$F694 if {} is higher.
  $F68B,$04 Write #N$00 to *#REGix+#N$09.
  $F68F,$04 Write #N$02 to *#REGix+#N$00.
  $F693,$01 Return.
  $F694,$02 #REGd=#N$01.
  $F696,$02 #REGe=#N$02.
  $F698,$03 #REGa=*#R$DF45.
  $F69B,$03 Call #R$DD97.
  $F69E,$01 Return.

c $F69F Handler: Projectiles
@ $F69F label=Handler_Projectiles
  $F69F,$02 #REGb=#N$06 (number of possible projectiles).
  $F6A1,$03 #REGhl=#R$D30D.
@ $F6A4 label=Handler_Projectiles_Loop
  $F6A4,$01 Stash current projectile on the stack.
  $F6A5,$04 Jump to #R$F711 if this projectile is not active.
N $F6A9 This projectile is active so let's process it.
  $F6A9,$01 Increment #REGa by one.
  $F6AA,$01 Write #REGa to *#REGhl.
  $F6AB,$01 #REGe=#REGa.
  $F6AC,$01 Increment #REGhl by one.
  $F6AD,$01 #REGb=*#REGhl.
  $F6AE,$01 Stash #REGhl on the stack.
  $F6AF,$01 Increment #REGhl by one.
  $F6B0,$01 #REGc=*#REGhl.
  $F6B1,$04 Jump to #R$F6BA if #REGa is higher than #N$41.
  $F6B5,$03 #REGhl=#R$C8A9.
  $F6B8,$02 Jump to #R$F6BD.
  $F6BA,$03 #REGhl=#R$C896.
  $F6BD,$05 Write #N$01 to *#R$D3FF.
  $F6C2,$01 #REGa=#REGe.
  $F6C3,$02,b$01 Keep only bits 0-5.
  $F6C5,$01 Decrease #REGa by one.
  $F6C6,$03 Call #R$EB5A.
  $F6C9,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $F6CA,$04 Jump to #R$F6CF if bit 4 of #REGa is not set.
  $F6CE,$01 Increment #REGb by one.
  $F6CF,$04 Write #N$00 to *#R$D3FF.
  $F6D3,$01 Restore #REGhl from the stack.
  $F6D4,$01 #REGa=#REGc.
  $F6D5,$04 Jump to #R$F707 if #REGa is higher than #N$20.
  $F6D9,$01 #REGa=#REGb.
  $F6DA,$04 Jump to #R$F707 if #REGa is higher than #N$18.
  $F6DE,$01 Stash #REGhl on the stack.
  $F6DF,$03 Call #R$DD38.
  $F6E2,$03 Jump to #R$F6FA if #REGa is zero.
  $F6E5,$04 Jump to #R$F6FA if #REGa is higher than #N$C1.
  $F6E9,$02,b$01 Keep only bits 0-5.
  $F6EB,$04 Jump to #R$F6FA if #REGa is higher than #N$32.
N $F6EF There's been a hit, find out which monster.
  $F6EF,$01 #REGa=*#REGhl.
  $F6F0,$03 Call #R$DD4D.
N $F6F3 Take off two hit points from the monsters energy.
  $F6F3,$02 #REGa=#N$02 (damage).
  $F6F5,$03 Call #R$DD6C.
  $F6F8,$02 Jump to #R$F719.
N $F6FA Draw the projectile to the buffer.
@ $F6FA label=DrawProjectile
  $F6FA,$01 Restore #REGhl from the stack.
  $F6FB,$03 Update the co-ordinates in the projectile table data.
  $F6FE,$01 Stash #REGhl on the stack.
  $F6FF,$02 #REGa=sprite ID #SPRITEID$F6.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$F6 | #SPRITE$F6 }
. UDGTABLE#
  $F701,$03 Call #R$D6C9.
  $F704,$01 Restore #REGhl from the stack.
  $F705,$02 Jump to #R$F713.
N $F707 The projectile has either made a hit, or not, either way the journey is over - so remove it.
@ $F707 label=RemoveProjectile
  $F707,$01 Decrease #REGhl by one.
  $F708,$02 Write #N$00 to the projectile state.
  $F70A,$07 Decrease *#R$D3FA by one.
@ $F711 label=Collision_Projectiles_Next
@ $F713 label=Collision_Projectiles_Skip
  $F711,$03 Move onto the next projectile table data.
  $F714,$01 Restore projectile ID from the stack.
  $F715,$01 Decrease projectile ID by one.
  $F716,$02 Jump to #R$F6A4 until all projectiles have been processed.
  $F718,$01 Return.

c $F719 Sounds: Projectile "Hit"
N $F719 #AUDIO(projectile.wav)(#INCLUDE(Projectile))
@ $F719 label=Audio_Projectiles_Hit
  $F719,$05 Write melody ID #N$05 to *#R$FF8D.
  $F71E,$02 #REGa=sprite ID #SPRITEID$75.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$75 | #SPRITE$75 }
. UDGTABLE#
  $F720,$03 Call #R$D6C9.
  $F723,$01 Restore #REGhl from the stack.
  $F724,$02 Jump to #R$F707.

c $F726 Print Banner
@ $F726 label=PrintBanner
N $F726 #UDGTABLE(default,centre)
. { #PUSHS #POKES$D030,$FF
. #SIM(start=$F916,stop=$F924)
. #SIM(start=$DE8C,stop=$DE8F)
. #SIM(start=$DEB0,stop=$DEB6) #SCR$02,$00,$00,$20,$07(banner)
. #POPS }
. UDGTABLE#
N $F726 Handle George.
N $F726 Monster state #N$FF means the player is ("Game Over").
  $F726,$07 Jump to #R$F732 if *#R$CFD2 is not equal to #N$FF.
N $F72D George is "Game Over"...
  $F72D,$02 #REGc=#N$22 (screen co-ordinate).
  $F72F,$03 Call #R$F775.
N $F732 Displays "George" and George's score.
@ $F732 label=PrintBanner_George
  $F732,$02 #REGc=#N$02 (screen co-ordinate).
  $F734,$03 #REGhl=#R$D066.
  $F737,$03 #REGde=#R$D05F.
  $F73A,$03 #REGa=*#R$CFE0.
  $F73D,$03 Call #R$F77E.
N $F740 Handle Lizzy.
N $F740 Monster state #N$FF means the player is ("Game Over").
  $F740,$07 Jump to #R$F74C if *#R$D001 is not equal to #N$FF.
N $F747 Lizzy is "Game Over"...
  $F747,$02 #REGc=#N$2C (screen co-ordinate).
  $F749,$03 Call #R$F775.
N $F74C Displays "Lizzy" and Lizzy's score.
@ $F74C label=PrintBanner_Lizzy
  $F74C,$02 #REGc=#N$0C (screen co-ordinate).
  $F74E,$03 #REGhl=#R$D074.
  $F751,$03 #REGde=#R$D06D.
  $F754,$03 #REGa=*#R$D00F.
  $F757,$03 Call #R$F77E.
N $F75A Handle Ralph.
N $F75A Monster state #N$FF means the player is ("Game Over").
  $F75A,$07 Jump to #R$F766 if *#R$D030 is not equal to #N$FF.
N $F761 Ralph is "Game Over"...
  $F761,$02 #REGc=#N$36 (screen co-ordinate).
  $F763,$03 Call #R$F775.
N $F766 Displays "Ralph" and Ralph's score.
@ $F766 label=PrintBanner_Ralph
  $F766,$02 #REGc=#N$16 (screen co-ordinate).
  $F768,$03 #REGhl=#R$D082.
  $F76B,$03 #REGde=#R$D07B.
  $F76E,$03 #REGa=*#R$D03E.
  $F771,$03 Call #R$F77E.
  $F774,$01 Return.
N $F775 Instead of the monsters score, display "Game Over".
@ $F775 label=PrintBanner_GameOver
  $F775,$03 #REGhl=#R$D18F.
  $F778,$02 #REGb=#N$00 (screen co-ordinate).
  $F77A,$03 Call #R$FB5B.
  $F77D,$01 Return.
N $F77E Not actually a "flash" but the display alternates between the players score and their name.
@ $F77E label=PrintBanner_Flash
  $F77E,$02 #REGb=#N$00 (screen co-ordinate).
  $F780,$03 Jump to #R$F784 if #REGa is not zero.
N $F783 #REGde holds the monsters name and #REGhl contains their score.
  $F783,$01 Switch the #REGde and #REGhl registers.
@ $F784 label=PrintBanner_Print
  $F784,$03 Call #R$FB5B.
  $F787,$01 Return.

c $F788
  $F788,$03 #REGhl=#R$D243.
  $F78B,$03 Call #R$F795.
  $F78E,$03 #REGhl=#R$D240.
  $F791,$03 Call #R$F795.
  $F794,$01 Return.

c $F795 Handler: Collision Monsters?
@ $F795 label=Handler_CollisionMonsters
R $F795 HL Either #R$D243 or #R$D240
N $F795 #REGb is used as the "currently processed monster ID"; we work backwards from Ralph, to Lizzy and last George.
  $F795,$02 #REGb=#N$03 (total number of monsters/ players).
@ $F797 label=Handler_CollisionMonsters_Loop
  $F797,$01 #REGa=*#REGhl.
  $F798,$03 Jump to #R$F7DA if #REGa is zero.
  $F79B,$04 Jump to #R$F7DE if #REGa is higher than #N$C1.
  $F79F,$02,b$01 Keep only bits 0-5.
  $F7A1,$04 Jump to #R$F7DE if #REGa is higher than #N$32.
  $F7A5,$01 #REGa=currently processed monster ID.
  $F7A6,$03 Call #R$DD52.
N $F7A9 #REGix now contains a pointer to the currently processed monster state data.
  $F7A9,$04 #REGix=#REGiy using the stack.
  $F7AD,$01 #REGa=*#REGhl.
  $F7AE,$03 Call #R$DD4D, on return - #REGa will contain the action monster ID and #REGiy the monster state.
N $F7B1 Is the action targeting the currently processed monster?
  $F7B1,$03 Jump to #R$F7DA if the action is for the monster currently being processed.
  $F7B4,$06 Jump to #R$F7C8 if *#REGiy+#N$02 is not zero.
  $F7BA,$03 #REGa=*#REGiy+#N$03.
  $F7BD,$03
  $F7C0,$02 Jump to #R$F7C8 if the result is zero.
  $F7C2,$03 #REGa=*#REGix+#N$03.
  $F7C5,$03 Write #REGa to *#REGiy+#N$03.
@ $F7C8 label=Handler_CollisionMonsters_Punched
  $F7C8,$04 Write #N$0A to *#REGiy+#N$00.
  $F7CC,$04 Write #N$01 to *#REGiy+#N$04.
N $F7D0 Take off two hit points from the monsters energy.
  $F7D0,$02 #REGa=#N$02.
  $F7D2,$03 Call #R$DD6C.
N $F7D5 #AUDIO(punched.wav)(#INCLUDE(Punched))
  $F7D5,$05 Write melody ID #N$06 to *#R$FF8D.
@ $F7DA label=Handler_CollisionMonsters_Next
  $F7DA,$01 Decrease #REGhl by one.
  $F7DB,$02 Decrease counter by one and loop back to #R$F797 until counter is zero.
  $F7DD,$01 Return.
  $F7DE,$01 #REGa=*#REGhl.
  $F7DF,$02 Stash #REGhl and #REGbc on the stack.
  $F7E1,$04 Jump to #R$F804 if #REGa is equal to #N$05.
  $F7E5,$04 Jump to #R$F808 if #REGa is lower than #N$40.
  $F7E9,$04 Jump to #R$F82B if #REGa is equal to #N$79.
  $F7ED,$04 Jump to #R$F804 if #REGa is equal to #N$7B.
  $F7F1,$04 Jump to #R$F804 if #REGa is equal to #N$7F.
  $F7F5,$04 Jump to #R$F804 if #REGa is equal to #N$75.
  $F7F9,$04 Jump to #R$F804 if #REGa is equal to #N$77.
  $F7FD,$04 Jump to #R$F851 if #REGa is lower than #N$DD.
  $F801,$03 Jump to #R$F878.
N $F804 Tidies the stack before moving onto the next monster.
@ $F804 label=Housekeeping_CollisionMonsters_Next
  $F804,$02 Restore #REGbc and #REGhl from the stack.
  $F806,$02 Jump to #R$F7DA.
N $F808 Handles when a vehicle has been punched.
@ $F808 label=Handler_Vehicle_Punched
  $F808,$05 Reset *#R$D401 back to #N$18.
  $F80D,$01 #REGa=currently processed monster ID.
  $F80E,$03 #REGde=#N$0503.
  $F811,$03 Call #R$DD97.
  $F814,$03 #REGa=*#R$D404.
  $F817,$02,b$01 Keep only bits 0-5.
  $F819,$01 Increment #REGa by one.
  $F81A,$01 #REGb=#REGa.
  $F81B,$04 #REGc=*#R$D403.
  $F81F,$02 #REGa=explosion sprite (#SPRITEID$77).
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$77 | #SPRITE$77 }
. UDGTABLE#
  $F821,$03 Call #R$D6C9.
N $F824 #AUDIO(punched.wav)(#INCLUDE(Punched))
  $F824,$05 Write melody ID #N$06 to *#R$FF8D.
  $F829,$02 Jump to #R$F804.
  $F82B,$01 #REGa=#REGb.
  $F82C,$03 Call #R$DD52.
  $F82F,$03 #REGa=*#R$D406.
  $F832,$02 #REGa-=#N$04.
  $F834,$03 Compare #REGa with *#REGiy+#N$09.
  $F837,$03 #REGa=*#R$D407.
  $F83A,$02 Jump to #R$F83E if {} is higher.
  $F83C,$02,b$01 Flip bit 7.
  $F83E,$02,b$01 Set bit 6.
  $F840,$03 Write #REGa to *#R$D407.
  $F843,$01 #REGa=#REGb.
  $F844,$03 #REGde=#N$0203.
  $F847,$03 Call #R$DD97.
N $F84A #AUDIO(punched.wav)(#INCLUDE(Punched))
  $F84A,$05 Write melody ID #N$06 to *#R$FF8D.
  $F84F,$02 Jump to #R$F804.
  $F851,$01 #REGa=#REGb.
  $F852,$03 Call #R$DD52.
  $F855,$06 Jump to #R$F804 if *#REGiy+#N$04 is not zero.
  $F85B,$06 Jump to #R$F804 if *#REGiy+#N$02 is zero.
  $F861,$04 Write #N$1A to *#REGiy+#N$00.
  $F865,$04 Write #N$04 to *#REGiy+#N$07.
  $F869,$01 #REGa=#REGb.
  $F86A,$02 #REGd=#N$01.
  $F86C,$02 #REGe=#N$03.
  $F86E,$03 Call #R$DD97.
N $F871 #AUDIO(punched.wav)(#INCLUDE(Punched))
  $F871,$05 Write melody ID #N$06 to *#R$FF8D.
  $F876,$02 Jump to #R$F804.
N $F878 Handles when a helicopter has been punched.
@ $F878 label=Handler_Helicopter_Punched
  $F878,$01 Stash #REGaf on the stack.
  $F879,$01 #REGa=#REGb.
  $F87A,$02 #REGd=#N$05.
  $F87C,$02 #REGe=#N$03.
  $F87E,$03 Call #R$DD97.
  $F881,$01 Restore #REGaf from the stack.
  $F882,$02 #REGa-=#N$E6.
  $F884,$02 #REGa*=#N$04.
  $F886,$02 #REGh=#N$00.
  $F888,$01 #REGl=#REGa.
  $F889,$04 #REGhl+=#R$D2A7.
  $F88D,$05 Jump to #R$F804 if *#REGhl is zero.
  $F892,$07 Decrease *#R$D3F6 by one.
  $F899,$01 #REGa=*#REGhl.
  $F89A,$02 Write #N$00 to *#REGhl.
  $F89C,$01 Increment #REGhl by one.
  $F89D,$01 RRCA.
  $F89E,$02,b$01 Keep only bits 0-2.
  $F8A0,$04 Jump to #R$F8B8 if #REGa is lower than #N$03.
  $F8A4,$04 Jump to #R$F8B8 if #REGa is higher than #N$06.
N $F8A8 Set #REGbc to the screen co-ordinates for the explosion.
  $F8A8,$01 #REGb=*#REGhl.
  $F8A9,$01 Increment #REGhl by one.
  $F8AA,$01 #REGc=*#REGhl.
N $F8AB Displays an explosion sprite.
@ $F8AB label=Handler_Helicopter_Explosion
  $F8AB,$02 #REGa=explosion sprite (#SPRITEID$77).
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$77 | #SPRITE$77 }
. UDGTABLE#
  $F8AD,$03 Call #R$D6C9.
N $F8B0 #AUDIO(punched.wav)(#INCLUDE(Punched))
  $F8B0,$05 Write melody ID #N$06 to *#R$FF8D.
  $F8B5,$03 Jump to #R$F804.
N $F8B8 Set #REGbc to the screen co-ordinates for the explosion.
@ $F8B8 label=SetExplosionCoordinates
  $F8B8,$01 #REGc=*#REGhl.
  $F8B9,$02 Increment #REGhl by two.
  $F8BB,$01 #REGb=*#REGhl.
  $F8BC,$02 Jump to #R$F8AB.

c $F8BE
  $F8BE,$06 Write #R$D22C to *#R$D224.
  $F8C4,$06 Write #R$D23E to *#R$D226.
  $F8CA,$04 Write #N$00 to *#R$D218.
  $F8CE,$01 Return.

c $F8CF Controls: Pause/ Quit Game
@ $F8CF label=Controls_PauseQuit
N $F8CF In-game Holding down "SHIFT" and pressing 1, 2 or 3 has the following effect:
. #TABLE(default,centre,centre,centre)
. { =h Key 1 | =h Key 2 | Action }
. { "SHIFT" | "1" | Pause }
. { "SHIFT" | "2" | Resume }
. { "SHIFT" | "3" | Quite }
. TABLE#
  $F8CF,$02 #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$FE | SHIFT | Z | X | C | V }
. TABLE#
  $F8D1,$03 Call #R$F910.
  $F8D4,$03 Return if "SHIFT" is not being pressed.
N $F8D7 "SHIFT" is being held down here. Test for the number keys.
  $F8D7,$03 Call #R$F90E.
  $F8DA,$04 Jump to #R$F8F3 if "3" is being pressed.
  $F8DE,$03 Return if "1" is not being pressed.
N $F8E1 If "1" is being pressed - this is where the "in-game pause" loop begins.
@ $F8E1 label=PauseGame_Loop
  $F8E1,$02 #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$FE | SHIFT | Z | X | C | V }
. TABLE#
  $F8E3,$03 Call #R$F910.
  $F8E6,$02 Test for "SHIFT"...
  $F8E8,$02 #REGb=#N$06.
  $F8EA,$02 Jump to #R$F902 if "SHIFT" is not being pressed.
  $F8EC,$03 Call #R$F90E.
  $F8EF,$04 Jump to #R$F8FC if "3" (quit) is not being pressed.
N $F8F3 Action quitting the game.
@ $F8F3 label=QuitGame
  $F8F3,$05 Write #N$01 to *#R$D3FD.
N $F8F8 To resume the game we just reset the border colour and RETurn from the pause loop.
@ $F8F8 label=ResumeGame
  $F8F8,$03 Set the border to BLACK.
  $F8FB,$01 Return.
N $F8FC The game is in the pause loop so test if we want to resume.
@ $F8FC label=TestFor_ResumeGame
  $F8FC,$04 Jump to #R$F8F8 if "2" is being pressed.
  $F900,$02 #REGb=#N$06.
N $F902 Creates a nice border pattern.
@ $F902 label=GamePaused
  $F902,$01 #REGa=#REGb.
  $F903,$04 #HTML(Change border <em>very quickly</em> to create a rainbow effect.)
  $F907,$02 Decrease counter by one and loop back to #R$F902 until counter is zero.
  $F909,$03 Call #R$F90E.
  $F90C,$02 Loop back to #R$F8E1.
N $F90E Testing for the number keys.
@ $F90E label=ReadKeyboard_1234
  $F90E,$02 #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$F7 | 1 | 2 | 3 | 4 | 5 }
. TABLE#
@ $F910 label=ReadKeyboard
  $F910,$02 Read from the keyboard.
  $F912,$01 Invert the bits in #REGa.
  $F913,$02,b$01 Keep only bits 0-3.
  $F915,$01 Return.

c $F916 Selection Screen
@ $F916 label=SelectionScreen
N $F916 This routine builds the game selection screen.
N $F916 #PUSHS #SIM(start=$F916,stop=$F92A) #SIM(start=$F96D,stop=$F973) #SCR$02(select-screen) #POPS
  $F916,$03 Set border colour to BLACK.
  $F919,$03 Call #R$FBDB.
N $F91C The admin screens show the right-hand side of level 2.
  $F91C,$02 #REGa=level #N$02.
  $F91E,$03 Call #R$DF90.
  $F921,$03 Call #R$D409.
  $F924,$03 Call #R$FB8E.
  $F927,$03 Call #R$F981.
N $F92A The selection page displays for a period of time, and then the game cycles through playareas.
  $F92A,$02 #REGb=#N$FF (counter).
  $F92C,$01 Halt operation (suspend CPU until the next interrupt).
  $F92D,$01 Stash #REGbc on the stack.
  $F92E,$03 Call #R$DDC0.
  $F931,$01 Restore #REGbc from the stack.
  $F932,$02 Jump to #R$F954 if {} is not zero.
  $F934,$05 Jump to #R$F954 if #REGd is equal to #N$FF.
  $F939,$03 Return if #REGa is equal to #N$1E.
  $F93C,$04 Jump to #R$F92C if #REGa is not equal to #N$0F.
N $F940 Removes the print termination bit from the entire table at #R$FBF2.
  $F940,$03 #REGhl=#R$FBF2.
  $F943,$02 #REGb=#N$28 (length).
@ $F945 label=StripPrintTerminationBit_Loop
  $F945,$01 #REGa=*#REGhl.
  $F946,$02,b$01 Keep only bits 0-6.
  $F948,$01 Write #REGa to *#REGhl.
  $F949,$01 Increment #REGhl by one.
  $F94A,$02 Decrease counter by one and loop back to #R$F945 until counter is zero.
  $F94C,$03 Call #R$FB8E.
  $F94F,$03 Call #R$F9BF.
  $F952,$02 Jump to #R$F916.
  $F954,$02 Decrease counter by one and loop back to #R$F92C until counter is zero.
  $F956,$03 Call #R$FBC8.
  $F959,$02 Jump to #R$F916 if {} is not zero.
N $F95B This loops over some level playareas until a key is pressed or we reach level #N$0B.
  $F95B,$02 #REGb=level #N$01.
@ $F95D label=DisplayLevels_Loop
  $F95D,$02 Stash the current level on the stack twice.
  $F95F,$03 Call #R$FBDB.
  $F962,$01 Restore current level from the stack.
  $F963,$01 #REGa=current level to display.
  $F964,$03 Call #R$DF90.
  $F967,$03 Call #R$D409.
  $F96A,$03 Call #R$FC1A.
  $F96D,$03 Call #R$D604.
  $F970,$03 Call #R$D5F8.
  $F973,$03 Call #R$FBC8.
  $F976,$01 Restore current level from the stack.
  $F977,$02 Jump to #R$F916 if any key has been pressed.
  $F979,$01 Increment current level by one.
N $F97A Only display levels #N$00-#N$0A.
  $F97A,$05 Loop back to #R$F95D until #REGb is equal to #N$0B.
N $F97F Display the selection screen options.
  $F97F,$02 Jump to #R$F916.

c $F981 Print Selection Screen
@ $F981 label=Print_SelectionScreen
  $F981,$03 #REGhl=#R$D089.
  $F984,$03 #REGbc=#N$0F00 (screen co-ordinates).
@ $F987 label=SelectionScreen_CreditsLoop
  $F987,$01 Stash #REGbc on the stack.
  $F988,$03 Call #R$FB5B.
  $F98B,$01 Restore #REGbc from the stack.
  $F98C,$01 Move onto the start of the next message.
  $F98D,$01 Move down one screen row.
N $F98E Check if all lines of #R$D089 have been printed.
  $F98E,$05 Jump to #R$F987 if #REGb is not equal to #N$17.
N $F993 Now display #R$D110 (which doesn't use the same mechanism as the lines aren't sequential).
  $F993,$03 #REGhl=#R$D110.
N $F996 Prints "#STR($D110)".
  $F996,$03 #REGbc=#N$0501 (screen co-ordinates).
  $F999,$03 Call #R$FB5B.
  $F99C,$01 Move onto the start of the next message.
N $F99D Prints "#STR($D119)".
  $F99D,$03 #REGbc=#N$0605 (screen co-ordinates).
  $F9A0,$03 Call #R$FB5B.
  $F9A3,$01 Move onto the start of the next message.
N $F9A4 Prints "#STR($D11D)".
  $F9A4,$03 #REGbc=#N$0901 (screen co-ordinates).
  $F9A7,$03 Call #R$FB5B.
  $F9AA,$01 Move onto the start of the next message.
N $F9AB Prints "#STR($D127)".
  $F9AB,$03 #REGbc=#N$0A05 (screen co-ordinates).
  $F9AE,$03 Call #R$FB5B.
N $F9B1 Prints "#STR($D12B)".
  $F9B1,$03 #REGbc=#N$0B05 (screen co-ordinates).
  $F9B4,$01 Move onto the start of the next message.
  $F9B5,$03 Call #R$FB5B.
N $F9B8 Output to the screen buffer.
  $F9B8,$03 Call #R$D604.
  $F9BB,$03 Call #R$D5F8.
  $F9BE,$01 Return.

c $F9BF Change Controls
@ $F9BF label=ChangeControls
  $F9BF,$03 Call #R$FBD4.
  $F9C2,$02 Loop back to #R$F9BF until a key is pressed.
N $F9C4 Reset the control type for all monsters.
  $F9C4,$0B Write #N$FF to: #LIST { *#R$CFE0 } { *#R$D00F } { *#R$D03E } LIST#
N $F9CF Set up a count for how many players will be using the keyboard (see #R$FA53).
  $F9CF,$05 Write #N$03 to *#R$FB5A.
N $F9D4 Create a "change controls" page for George:
N $F9D4 #UDGTABLE(default,centre)
. { #PUSHS #SIM(start=$F916,stop=$F924) #SIM(start=#PC,stop=$FA33) #SCR$02(controls-george) #POPS }
. UDGTABLE#
  $F9D4,$03 Call #R$FB8E.
  $F9D7,$03 #REGhl=#R$D05F.
  $F9DA,$04 #REGix=#R$CFD2.
  $F9DE,$03 Call #R$F9FC.
N $F9E1 Create a "change controls" page for Lizzy.
N $F9E1 #UDGTABLE(default,centre)
. { #PUSHS #SIM(start=$F916,stop=$F924) #SIM(start=#PC,stop=$FA33) #SCR$02(controls-lizzy) #POPS }
. UDGTABLE#
  $F9E1,$03 Call #R$FB8E.
  $F9E4,$04 #REGix=#R$D001.
  $F9E8,$03 #REGhl=#R$D06D.
  $F9EB,$03 Call #R$F9FC.
N $F9EE Create a "change controls" page for Ralph.
N $F9EE #UDGTABLE(default,centre)
. { #PUSHS #SIM(start=$F916,stop=$F924) #SIM(start=#PC,stop=$FA33) #SCR$02(controls-ralph) #POPS }
. UDGTABLE#
  $F9EE,$03 Call #R$FB8E.
  $F9F1,$04 #REGix=#R$D030.
  $F9F5,$03 #REGhl=#R$D07B.
  $F9F8,$03 Call #R$F9FC.
  $F9FB,$01 Return.
N $F9FC Print the monster name.
@ $F9FC label=ChangeControls_Action
  $F9FC,$03 #REGbc=#N$0804 (screen co-ordinates).
  $F9FF,$03 Call #R$FB5B.
N $FA02 Prints "#STR($D0D5) #STR($D0DF)".
  $FA02,$03 #REGhl=#R$D0D5.
  $FA05,$03 #REGbc=#N$0303 (screen co-ordinates).
  $FA08,$03 Call #R$FB5B.
  $FA0B,$01 Move onto the start of the next message.
  $FA0C,$03 #REGbc=#N$0502 (screen co-ordinates).
  $FA0F,$03 Call #R$FB5B.
N $FA12 Programmatically display all the #R$D133 options.
  $FA12,$03 #REGhl=#R$D133.
  $FA15,$01 #REGa=#N$00 (option counter).
@ $FA16 label=ChangeControls_PrintLoop
  $FA16,$01 Stash the option counter on the stack.
N $FA17 The options are two lines apart and start from row #N$0B.
  $FA17,$04 #REGb=#N$0B+#REGa*#N$02.
  $FA1B,$02 #REGc=#N$01 (screen co-ordinates).
  $FA1D,$03 Call #R$FB5B.
  $FA20,$01 Move onto the start of the next message.
  $FA21,$01 Restore the option counter from the stack.
  $FA22,$01 Increment the option counter by one.
N $FA23 Note we only show five options "#STR($D181)" is never used.
  $FA23,$04 Jump to #R$FA16 until the option counter is equal to #N$05.
N $FA27 Prints the last line manually "#STR($D173)" (as it's the second line of the option before it).
  $FA27,$03 #REGbc=#N$1401 (screen co-ordinates).
  $FA2A,$03 Call #R$FB5B.
N $FA2D Output to the screen buffer.
  $FA2D,$03 Call #R$D604.
  $FA30,$03 Call #R$D5F8.
@ $FA33 label=ChangeControls_Input
  $FA33,$03 Call #R$DDC0.
  $FA36,$02 Loop back to #R$FA33 until an option has been selected.
N $FA38 Process the selected option.
  $FA38,$01 #REGa=control option.
  $FA39,$04 Jump to #R$FA33 if the control option is invalid.
  $FA3D,$04 Jump to #R$FA53 if "K" was pressed.
  $FA41,$04 Jump to #R$FA78 if "1" was pressed.
  $FA45,$04 Jump to #R$FA7C if "2" was pressed.
  $FA49,$04 Jump to #R$FA80 if "3" was pressed.
  $FA4D,$04 Jump to #R$FA8B if "C" was pressed.
  $FA51,$02 Jump to #R$FA33.
N $FA53 Set "Keyboard" as the control method.
@ $FA53 label=ChangeControls_Keyboard
  $FA53,$03 Call #R$FAA8.
N $FA56 Each set of user defined keys will have a different control method ID starting from #N$04.
  $FA56,$03 #REGa=*#R$FB5A.
  $FA59,$01 Increment #REGa by one.
  $FA5A,$03 Write #REGa to *#R$FB5A.
  $FA5D,$03 Write #REGa to *#REGix+#N$0E (monster control type).
N $FA60 Calculate where the user defined keys will be stored.
  $FA60,$02 #REGa-=#N$04.
  $FA62,$01 #REGa*=#N$02.
  $FA63,$01 #REGd=#REGa.
  $FA64,$02 #REGa*=#N$04.
  $FA66,$01 #REGa+=#REGd.
  $FA67,$03 Create an offset using #REGhl.
  $FA6A,$04 #REGhl+=#R$C850.
  $FA6E,$01 Exchange the #REGde and #REGhl registers.
  $FA6F,$03 #REGhl=#R$FB4E.
  $FA72,$03 #REGbc=#N($000A,$04,$04).
  $FA75,$02 Copy selected keys to monster config.
  $FA77,$01 Return.
N $FA78 Set "Sinclair Interface 2" (port 1) as the control method.
@ $FA78 label=ChangeControls_Sinclair1
  $FA78,$02 #REGd=#N$02.
  $FA7A,$02 Jump to #R$FA82.
N $FA7C Set "Sinclair Interface 2" (port 2) as the control method.
@ $FA7C label=ChangeControls_Sinclair2
  $FA7C,$02 #REGd=#N$01.
  $FA7E,$02 Jump to #R$FA82.
N $FA80 Set "Kempston Joystick" as the control method.
@ $FA80 label=ChangeControls_Kempston
  $FA80,$02 #REGd=#N$03.
@ $FA82 label=SetControlType
  $FA82,$03 Call #R$FA95.
  $FA85,$02 Jump to #R$FA33 if the control type is already selected by another monster.
  $FA87,$03 Write the control type to *#REGix+#N$0E (monster control type).
  $FA8A,$01 Return.
N $FA8B Set "Computer Controlled" as the control method.
@ $FA8B label=ChangeControls_Computer
  $FA8B,$04 Write #N$00 to *#REGix+#N$0E (monster control type).
@ $FA8F label=ChangeControls_Computer_KeyPress
  $FA8F,$03 Call #R$FBD4.
  $FA92,$02 Loop back to #R$FA8F until a key has been pressed.
  $FA94,$01 Return.
N $FA95 Monsters can't use the same controllers, this is verified here.
@ $FA95 label=CheckExistingControls
  $FA95,$05 Return if *#R$CFE0 is equal to the currently selected control method.
  $FA9A,$05 Return if *#R$D00F is equal to the currently selected control method.
  $FA9F,$05 Return if *#R$D03E is equal to the currently selected control method.
N $FAA4 Ensure ZERO flag is not set for the return.
  $FAA4,$02 #REGa=#N$01.
  $FAA6,$01 Set the bits from #REGa.
  $FAA7,$01 Return.

c $FAA8 User Defined Keys
@ $FAA8 label=UserDefinedKeys
  $FAA8,$03 Call #R$FB8E.
  $FAAB,$03 Call #R$FBD4.
  $FAAE,$02 Loop back to #R$FAA8 until the pressed key is released.
  $FAB0,$06 Write #R$FB4E to *#R$FB58.
N $FAB6 Print "#STR($D0D5) #STR($D0DF)".
  $FAB6,$03 #REGhl=#R$D0D5.
  $FAB9,$03 #REGbc=#N$0403 (screen co-ordinates).
  $FABC,$03 Call #R$FB5B.
  $FABF,$01 Move onto the start of the next message.
  $FAC0,$03 #REGbc=#N$0602 (screen co-ordinates).
  $FAC3,$03 Call #R$FB5B.
N $FAC6 Programmatically display all the #R$D0EB options.
  $FAC6,$03 #REGhl=#R$D0EB.
  $FAC9,$03 #REGbc=#N$0804 (screen co-ordinates).
  $FACC,$02 #REGa=#N$05 (control counter).
@ $FACE label=UserDefinedKeys_PrintLoop
  $FACE,$02 Stash the control counter and current screen co-ordinates on the stack.
  $FAD0,$03 Call #R$FB5B.
  $FAD3,$02 Restore the current screen co-ordinates and control counter from the stack.
  $FAD5,$01 Move onto the start of the next message.
N $FAD6 The options are two lines apart.
  $FAD6,$02 Increment #REGb by two.
  $FAD8,$01 Decrease the control counter by one.
  $FAD9,$02 Jump to #R$FACE until all controls have been printed.
N $FADB Prints the last line manually "#STR($D0FF)" (as it's the second line of the option before it).
  $FADB,$01 Decrease #REGb by one.
  $FADC,$03 Call #R$FB5B.
N $FADF Set up displaying the "?" indicator to request the user defined keypress.
  $FADF,$03 #REGbc=#N$080B (screen co-ordinates).
@ $FAE2 label=UserDefinedKeys_Request
  $FAE2,$02 Stash #REGbc on the stack twice.
  $FAE4,$03 #REGhl=#R$D104.
  $FAE7,$03 Call #R$FB5B.
N $FAEA Output to the screen buffer.
  $FAEA,$03 Call #R$D604.
  $FAED,$03 Call #R$D5F8.
@ $FAF0 label=UserDefinedKeys_Input
  $FAF0,$03 Call #R$DDC0.
  $FAF3,$02 Loop back to #R$FAF0 until an option has been selected.
  $FAF5,$01 #REGa=keypress.
  $FAF6,$04 Jump to #R$FAF0 if the keypress is invalid.
  $FAFA,$01 Exchange the #REGde and #REGhl registers.
  $FAFB,$03 #REGhl=#R$FBF2.
  $FAFE,$03 Create an offset using #REGbc.
  $FB01,$01 #REGhl+=#REGbc.
  $FB02,$01 #REGa=*#REGhl.
  $FB03,$04 Jump to #R$FAF0 if #REGa is higher than #N$80.
N $FB07 Set a print terminator.
  $FB07,$02,b$01 Set bit 7.
  $FB09,$01 Write #REGa to *#REGhl.
  $FB0A,$03 #REGhl=#R$D106.
N $FB0D Remove the print terminator and write to the buffer.
  $FB0D,$02,b$01 Keep only bits 0-6.
  $FB0F,$01 Write #REGa to *#REGhl.
N $FB10 If "special keys" (e.g. Caps Shift/ Symbol Shift/ Enter/ Space) are selected, provide a means to show that these
.       have been selected.
  $FB10,$04 Jump to #R$FB17 if #REGa is not equal to #N$21.
  $FB14,$03 #REGhl=#R$D10E.
@ $FB17 label=UserDefinedKeys_CheckIfCapsShift
  $FB17,$04 Jump to #R$FB1E if #REGa is not equal to #N$27.
  $FB1B,$03 #REGhl=#R$D108.
@ $FB1E label=UserDefinedKeys_CheckIfSymbolShift
  $FB1E,$04 Jump to #R$FB25 if #REGa is not equal to #N$18.
  $FB22,$03 #REGhl=#R$D10A.
@ $FB25 label=UserDefinedKeys_CheckIfSpace
  $FB25,$04 Jump to #R$FB2C if #REGa is not equal to #N$20.
  $FB29,$03 #REGhl=#R$D10C.
N $FB2C Print the user defined key on the screen in the appropriate location.
@ $FB2C label=UserDefinedKeys_PrintKey
  $FB2C,$01 Restore #REGbc from the stack.
  $FB2D,$01 Stash #REGde on the stack.
  $FB2E,$03 Call #R$FB5B.
  $FB31,$01 Restore #REGde from the stack.
N $FB32 Store the keypress port and value in the buffer.
  $FB32,$03 #REGhl=*#R$FB58.
  $FB35,$01 Write #REGe to *#REGhl.
  $FB36,$01 Increment #REGhl by one.
  $FB37,$01 Write #REGd to *#REGhl.
  $FB38,$01 Move onto the next buffer location.
  $FB39,$03 Update the stored buffer at *#R$FB58.
  $FB3C,$01 Restore #REGbc from the stack.
N $FB3D Move down two lines onto the next option.
  $FB3D,$02 Increment #REGb by two.
N $FB3F Check if we've reached the end?
  $FB3F,$05 Jump to #R$FAE2 until #REGb is equal to #N$12.
N $FB44 Output to the screen buffer.
  $FB44,$03 Call #R$D604.
  $FB47,$03 Call #R$D5F8.
  $FB4A,$03 Call #R$FBEC.
  $FB4D,$01 Return.

g $FB4E User Defined Keys Buffer
@ $FB4E label=UserDefinedKeys_Buffer
D $FB4E Used by the routines at #R$F9BF and #R$FAA8.
B $FB4E,$0A,$02 Stores in the following format:
. #TABLE(default,centre,centre)
. { =h Port | =h Bits } #FOR$00,$04(n,{ #N(#PEEK(#PC+n*$02)) | #EVAL(#PEEK(#PC+$01+n*$02),$02,$08) }, )
. TABLE#

g $FB58 User Defined Keys Pointer
@ $FB58 label=UserDefinedKeys_Pointer
W $FB58,$02

g $FB5A Keyboard Control Count
@ $FB5A label=Keyboard_Control_Count
B $FB5A,$01

c $FB5B Print String
@ $FB5B label=PrintString
R $FB5B BC Screen co-ordinate
R $FB5B HL Pointer to string data
  $FB5B,$01 Fetch the character.
  $FB5C,$02,b$01 Keep only bits 0-6.
  $FB5E,$01 Stash #REGhl on the stack.
  $FB5F,$02 #REGa-=#N$20.
  $FB61,$03 Create an offset using #REGhl.
  $FB64,$03 #REGhl*=#N$08.
  $FB67,$04 #REGh+=#N$3D.
  $FB6B,$01 #REGa=#REGb.
  $FB6C,$02,b$01 Keep only bits 3-7.
  $FB6E,$02 #REGa+=#N$6B.
  $FB70,$01 #REGd=#REGa.
  $FB71,$01 #REGa=#REGb.
  $FB72,$02,b$01 Keep only bits 0-2.
  $FB74,$03 RRCA.
  $FB77,$01 #REGa+=#REGc.
  $FB78,$01 #REGe=#REGa.
  $FB79,$01 Stash #REGbc on the stack.
  $FB7A,$02 #REGb=#N$08.
@ $FB7C label=PrintString_Loop
  $FB7C,$01 #REGa=*#REGhl.
  $FB7D,$02 Shift #REGa right.
  $FB7F,$01 Set the bits from *#REGhl.
  $FB80,$01 Write #REGa to *#REGde.
  $FB81,$01 Increment #REGhl by one.
  $FB82,$01 Increment #REGd by one.
  $FB83,$02 Decrease counter by one and loop back to #R$FB7C until counter is zero.
  $FB85,$01 Restore #REGbc from the stack.
  $FB86,$01 Increment #REGc by one.
  $FB87,$01 Restore #REGhl from the stack.
  $FB88,$03 Return if bit 7 of *#REGhl is set.
  $FB8B,$01 Increment #REGhl by one.
  $FB8C,$02 Jump to #R$FB5B.

c $FB8E Create Admin Page Template
@ $FB8E label=CreateAdminPageTemplate
  $FB8E,$02 #REGc=#N$11 (width).
N $FB90 Blank half the shadow screen buffer.
  $FB90,$03 #REGhl=#R$6B00.
  $FB93,$02 #REGd=#N$83 (height/ where to stop - relates to the end of #R$6B00).
  $FB95,$02 #REGe=#N$00 (value to write).
  $FB97,$03 Call #R$FBAE.
N $FB9A Blank half the shadow attribute buffer.
  $FB9A,$03 #REGhl=#R$8300.
  $FB9D,$02 #REGd=#N$86 (height/ where to stop - relates to the end of #R$8300).
  $FB9F,$02 #REGe=#N$46 #COLOUR$46 (value to write).
  $FBA1,$03 Call #R$FBAE.
N $FBA4 Prints "Rampage tm".
  $FBA4,$03 #REGhl=#R$D0CB.
  $FBA7,$03 #REGbc=#N$0103 (screen co-ordinates).
  $FBAA,$03 Call #R$FB5B.
  $FBAD,$01 Return.

c $FBAE Blank Left-Half Shadow Buffers
@ $FBAE label=BlankHalfShadowBuffers
N $FBAE Used both to blank the left-hand side of the screen shadow buffer, and also to add the rainbow attributes for
.       the attributes shadow buffer.
R $FBAE C Width
R $FBAE D Height (where to stop)
R $FBAE E Value to write
R $FBAE HL Buffer location
  $FBAE,$01 #REGb=width.
  $FBAF,$01 #REGa=#N$00.
@ $FBB0 label=BlankHalfOfScreen_Row
  $FBB0,$01 Write the value pass in #REGe to the buffer.
  $FBB1,$01 Increment the buffer pointer by one.
  $FBB2,$02 Decrease counter by one and loop back to #R$FBB0 until counter is zero.
N $FBB4 Move down one row.
  $FBB4,$01 #REGhl+=#REGbc.
  $FBB5,$02 Decrease #REGhl by two (because we always enter with the width being #N$11, so #N$11*#N$02=#N$22 and one row
.           contains only #N$20 bytes).
N $FBB7 When writing the attributes, this handles the INK rainbow colouring.
  $FBB7,$01 #REGa=#REGe.
  $FBB8,$02,b$01 Keep only the INK colour bits.
  $FBBA,$02 Jump to #R$FBC3 if the result is zero (if this is the screen buffer loop and not for the attribute buffer).
N $FBBC Cycle through the INK colours.
  $FBBC,$01 Increment the value to write by one.
  $FBBD,$04 Jump to #R$FBC3 if #REGa is not equal to #N$07 (#COLOUR$07).
N $FBC1 Reset the attribute colour to write (the range is #N42-#N$47).
  $FBC1,$02 #REGe=#N$42 (#COLOUR$42).
N $FBC3 The height parameter isn't a "height" as such, it's where to stop e.g. the end of #R$6B00 or the end of #R$8300.
@ $FBC3 label=BlankHalfOfScreen_CheckEnd
  $FBC3,$04 Jump to #R$FBAE if #REGd is not equal to #REGh.
  $FBC7,$01 Return.

c $FBC8 Press Any Key/ Pause
@ $FBC8 label=PressAnyKey_Pause
N $FBC8 This routine will return on a keypress, or if the counter reaches #N$FF.
  $FBC8,$02 #REGb=#N$FF (counter).
@ $FBCA label=PressAnyKey_Loop
  $FBCA,$03 Call #R$FBD4.
  $FBCD,$02 Jump to #R$FBD0 if no key has been pressed.
N $FBCF A keypress has occurred so return.
  $FBCF,$01 Return.
N $FBD0 There's not been a keypress, so issue a HALT and loop back round.
@ $FBD0 label=Pause_Loop
  $FBD0,$01 Halt operation (suspend CPU until the next interrupt).
  $FBD1,$02 Decrease counter by one and loop back to #R$FBCA until counter is zero.
N $FBD3 The pause counter has expired so just return.
  $FBD3,$01 Return.

c $FBD4 Get Keypress
@ $FBD4 label=GetKeypress
  $FBD4,$01 #REGa=#N$00.
  $FBD5,$02 Read from the keyboard;
. #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$FE | SHIFT | Z | X | C | V }
. TABLE#
  $FBD7,$01 Invert the bits in #REGa.
  $FBD8,$02,b$01 Keep only bits 0-4.
  $FBDA,$01 Return.

c $FBDB Update XXXXX Buffer
@ $FBDB label=UpdateXXXXXBuffer
N $FBDB Todo: Find out what this specific buffer does.
  $FBDB,$03 Call #R$D5D8.
  $FBDE,$03 #REGhl=#R$6800.
  $FBE1,$03 #REGde=#N$6801.
  $FBE4,$03 #REGbc=#N$02FF.
  $FBE7,$02 Write #N$FF to *#REGhl.
  $FBE9,$02 Copy #N$02FF bytes from #REGhl to #REGde.
  $FBEB,$01 Return.

c $FBEC Short Pause
@ $FBEC label=ShortPause
  $FBEC,$02 #REGb=#N$4B (counter).
@ $FBEE label=ShortPause_Loop
  $FBEE,$01 Halt operation (suspend CPU until the next interrupt).
  $FBEF,$02 Decrease counter by one and loop back to #R$FBEE until counter is zero.
  $FBF1,$01 Return.

b $FBF2 ASCII Table
@ $FBF2 label=Table_ASCII
  $FBF2,$01 "#STR(#PC,$00,$01)".
L $FBF2,$01,$28

c $FC1A Scene: Display Carpet
@ $FC1A label=Scene_DisplayCarpet
N $FC1A Return if this scene doesn't contain the carpet.
  $FC1A,$05 Return if *#R$D3FE is #N$00.
  $FC1F,$03 #REGbc=#N$1506 (screen co-ordinates).
N $FC22 The carpet, or whatever it is, has two different positions.
  $FC22,$04 Jump to #R$FC28 if *#R$D3FE is #N$01.
  $FC26,$02 Update the X position to #N$16.
N $FC28 Draw the carpet to the buffer.
@ $FC28 label=DrawCarpet
  $FC28,$02 #REGa=sprite ID #SPRITEID$7F.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$7F | #SPRITE$7F }
. UDGTABLE#
  $FC2A,$01 Stash co-ordinates on the stack.
  $FC2B,$03 Call #R$D6C9.
  $FC2E,$01 Restore co-ordinates from the stack.
  $FC2F,$04 Add #N$04 to the X position to draw the next section of the carpet.
  $FC33,$02 #REGa=sprite ID #SPRITEID$7F.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$7F | #SPRITE$7F,$01 }
. UDGTABLE#
  $FC35,$03 Call #R$D7F6.
  $FC38,$01 Return.

c $FC39 Handler: Vehicle
@ $FC39 label=Handler_Vehicle
R $FC39 O:B Vehicle Y sprite co-ordinates (if active)
R $FC39 O:C Vehicle X sprite co-ordinates (if active)
N $FC39 Are vehicles permitted to be spawned on this level?
  $FC39,$06 Return if vehicle spawning is set to be off (*#R$D401 is equal to #N$FE).
N $FC3F Just return if a a vehicle is already being displayed.
  $FC3F,$04 Jump to #R$FC72 if a vehicle is already active (*#R$D401 is equal to #N$FF).
N $FC43 Else the counter is a counter, so count it down.
  $FC43,$04 Decrease *#R$D401 by one.
  $FC47,$01 Return if *#R$D401 is still in progress.
N $FC48 Else the countdown is complete so set the counter/ state that a vehicle is spawned and spawn a random vehicle!
  $FC48,$05 Write #N$FF to *#R$D401.
N $FC4D Spawn a new vehicle:
N $FC4D There are four vehicle types.
  $FC4D,$03 Call #R$DA28.
  $FC50,$02,b$01 Keep only bits 0-1.
M $FC4D,$05 Get a random number between 0-3.
  $FC52,$03 Write #REGa to *#R$D402.
N $FC55 Randomly bring the vehicle in from either the left or right hand side of the play area.
  $FC55,$03 Call #R$DA28.
  $FC58,$02,b$01 Keep only bit 0.
M $FC55,$05 Get a random number which is either zero or one.
  $FC5A,$02 Jump to #R$FC68 if the random number is one.
N $FC5C Vehicle moves from left-to-right.
  $FC5C,$05 Write #N$14 to *#R$D404.
  $FC61,$05 Write #N$FA to *#R$D403.
  $FC66,$02 Jump to #R$FC72.
N $FC68 Bit 7 signifies that this vehicle moves from right-to-left.
@ $FC68 label=Handler_SpawnVehicleRight
  $FC68,$05 Write #N$94 (#N$14 + bit 7 set) to *#R$D404.
  $FC6D,$05 Write #N$20 to *#R$D403.
@ $FC72 label=Handler_Vehicle_Movement
  $FC72,$03 #REGa=*#R$D404.
  $FC75,$04 Jump to #R$FC97 if #REGa is higher than #N$80 (if bit 7 is set).
  $FC79,$01 #REGb=vehicle Y position.
N $FC7A Handles moving the vehicle from the left-to-right hand side of the play area.
  $FC7A,$03 #REGa=*#R$D403.
  $FC7D,$01 Increment #REGa by one.
@ $FC7E label=Handler_Vehicle_SetXPos
  $FC7E,$03 Write #REGa to *#R$D403.
N $FC81 Check if the vehicle is off-screen.
  $FC81,$04 Jump to #R$FCA7 if #REGa is equal to #N$20.
  $FC85,$01 #REGc=vehicle X position.
N $FC86 Has the vehicle been destroyed?
  $FC86,$03 #REGa=*#R$D402.
  $FC89,$03 Return if the vehicle has been destroyed (*#R$D402 is equal to #N$03).
  $FC8C,$03 #REGa=#N$3B+(#REGa*#N$02).
. #UDGTABLE(default,centre,centre,centre)
. { =h Vehicle Type | =h Vehicle | =h Sprite ID | =h Sprite }
. { #N$00 | Tank | #SPRITEID$3B | #SPRITE$3B }
. { #N$01 | Car | #SPRITEID$3D | #SPRITE$3D }
. { #N$02 | Police car | #SPRITEID$3F | #SPRITE$3F }
. UDGTABLE#
  $FC8F,$03 Call #R$D6C9.
  $FC92,$04 Write #N$00 to *#R$D247.
  $FC96,$01 Return.
N $FC97 Handles moving the vehicle from the right-to-left hand side of the play area.
@ $FC97 label=Handler_MoveVehicle_RightToLeft
  $FC97,$02,b$01 Strip off the right-to-left flag.
  $FC99,$01 #REGb=vehicle Y position.
  $FC9A,$05 Write #N$01 to *#R$D247.
  $FC9F,$03 #REGa=*#R$D403.
  $FCA2,$01 Decrease #REGa by one.
N $FCA3 Check if the vehicle is off-screen.
  $FCA3,$04 Jump to #R$FC7E if #REGa is not equal to #N$FA.
N $FCA7 Initialise a new countdown.
@ $FCA7 label=Handler_Vehicle_SetCountdown
  $FCA7,$03 Call #R$DA28.
  $FCAA,$02,b$01 Keep only bits 0-3.
  $FCAC,$02 #REGa+=#N$08.
M $FCA7,$07 Get a random number between 8-23.
  $FCAE,$03 Write the random number to *#R$D401.
  $FCB1,$04 Write #N$00 to *#R$D247.
  $FCB5,$01 Return.

c $FCB6 Handler: Train
@ $FCB6 label=Handler_Train
  $FCB6,$06 Return if train spawning is set to be off (*#R$D405 is equal to #N$FE).
  $FCBC,$04 Jump to #R$FCE7 if a train is already active (*#R$D405 is equal to #N$FF).
N $FCC0 Else the counter is a counter, so count it down.
  $FCC0,$04 Decrease *#R$D405 by one.
  $FCC4,$01 Return if *#R$D405 is still in progress.
N $FCC5 Else the countdown is complete so set the counter/ state to indicate that a train has been spawned and then
.       spawn a train!
  $FCC5,$05 Write #N$FF to *#R$D405.
N $FCCA Randomly bring the train in from either the left or right hand side of the play area.
  $FCCA,$03 Call #R$DA28.
  $FCCD,$02,b$01 Keep only bit 0.
M $FCCA,$05 Get a random number of either zero or one.
  $FCCF,$02 Jump to #R$FCDD if the random number is one.
N $FCD1 Train moves from left-to-right.
  $FCD1,$05 Write #N$13 to *#R$D407.
  $FCD6,$05 Write #N$F0 to *#R$D406.
  $FCDB,$02 Jump to #R$FCE7.
N $FCDD Bit 7 signifies that this train moves from right-to-left.
@ $FCDD label=Handler_SpawnTrainRight
  $FCDD,$05 Write #N$93 (#N$13 + bit 7 set) to *#R$D407.
  $FCE2,$05 Write #N$20 to *#R$D406.
@ $FCE7 label=Handler_Train_Movement
  $FCE7,$03 #REGa=*#R$D407.
  $FCEA,$02,b$01 Keep only bit 6.
N $FCEC Set the carry flag according to bit 6.
  $FCEC,$02 Rotate #REGa left twice, moving bit 6 to bit 0 and setting the carry flag if bit 0 was set.
  $FCEE,$01 #REGc=#REGa.
N $FCEF Which direction should the train be moving in?
  $FCEF,$07 Jump to #R$FD21 if *#R$D407 is higher than #N$80 (bit 7 is set).
N $FCF6 Handles moving the train from the left-to-right hand side of the play area.
  $FCF6,$02,b$01 Strip off the right-to-left flag.
  $FCF8,$01 #REGb=train Y position.
  $FCF9,$03 #REGa=*#R$D406.
  $FCFC,$01 Increment #REGa by one.
  $FCFD,$01 #REGa+=#REGc.
N $FCFE Draw the train.
@ $FCFE label=DrawTrain
  $FCFE,$03 Write #REGa to *#R$D406.
  $FD01,$01 #REGc=train X position.
  $FD02,$02 #REGa=sprite ID #SPRITEID$79.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$79 | #SPRITE$79 }
. UDGTABLE#
  $FD04,$01 Stash the train position on the stack.
  $FD05,$03 Call #R$D6C9.
  $FD08,$01 Restore the train position from the stack.
N $FD09 Draws the centre sprite of the train three times.
  $FD09,$02 #REGa=#N$03 (counter).
@ $FD0B label=DrawTrain_Loop
  $FD0B,$01 Stash the counter on the stack.
  $FD0C,$02 Increment the X position by two to draw the next section of the train.
  $FD0E,$02 #REGa=sprite ID #SPRITEID$7B.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #SPRITEID$7B | #SPRITE$7B }
. UDGTABLE#
  $FD10,$01 Stash the train position on the stack.
  $FD11,$03 Call #R$D6C9.
  $FD14,$02 Restore the train position and counter from the stack.
  $FD16,$01 Decrease the counter held by #REGa by one.
  $FD17,$02 Jump to #R$FD0B until all centre sprites have been drawn.
N $FD19 Now draw the rear section of the train.
  $FD19,$02 Increment the X position by two to draw the next section of the train.
  $FD1B,$02 #REGa=sprite ID #SPRITEID$79.
. #UDGTABLE(default,centre,centre)
. { =h ID | =h Sprite }
. { #N$79 | #SPRITE$79,$01 }
. UDGTABLE#
  $FD1D,$03 Call #R$D7F6.
  $FD20,$01 Return.
N $FD21 Handles moving the train from the right-to-left hand side of the play area.
@ $FD21 label=Handler_MoveTrain_RightToLeft
  $FD21,$02,b$01 Strip off the right-to-left flag.
  $FD23,$01 #REGb=train Y position.
  $FD24,$03 #REGa=*#R$D406.
  $FD27,$01 Decrease #REGa by one.
  $FD28,$01 #REGa-=#REGc.
  $FD29,$02 Jump to #R$FCFE.

c $FD2B Play Telecast Intro
@ $FD2B label=PlayTelecastIntro
  $FD2B,$03 Call #R$FBDB.
  $FD2E,$03 #REGa=*#R$CFD2.
  $FD31,$03 Call #R$FD64.
  $FD34,$03 #REGa=*#R$D001.
  $FD37,$03 Call #R$FD86.
  $FD3A,$03 #REGa=*#R$D030.
  $FD3D,$03 Call #R$FD86.
  $FD40,$03 Set the border colour to BLACK.
  $FD43,$01 Return.

c $FD44 Print Ticker
@ $FD44 label=Print_Ticker
  $FD44,$03 #REGde=#R$6100.
  $FD47,$03 #REGbc=#R$FEDF.
@ $FD4A label=Print_Ticker_Loop
  $FD4A,$01 #REGa=*#REGbc.
N $FD4B Check if the character is the terminator.
  $FD4B,$03 Return if #REGa is equal to #N$FF.
  $FD4E,$01 Stash #REGde on the stack.
  $FD4F,$03 #REGa*=#N$08.
N $FD52 #REGhl will point to the set of eight bytes of data starting from #R$D198(#N$D198).
  $FD52,$03 Create an offset using #REGhl.
  $FD55,$04 #REGhl+=#R$D198.
  $FD59,$01 Restore #REGde from the stack.
  $FD5A,$01 Stash #REGbc on the stack.
  $FD5B,$05 Copy #N($0008,$04,$04) bytes of data from #REGhl to #REGde.
  $FD60,$01 Restore #REGbc from the stack.
  $FD61,$01 Increment #REGbc by one.
  $FD62,$02 Jump to #R$FD4A.

c $FD64 Handler: Ticker News
@ $FD64 label=Handler_TickerNews
  $FD64,$03 Call #R$FD44.
  $FD67,$03 #REGhl=#R$6A00.
  $FD6A,$03 #REGde=#N$6A01.
  $FD6D,$03 #REGbc=#N($00FF,$04,$04).
  $FD70,$01 Write #REGc to *#REGhl.
  $FD71,$02
  $FD73,$03 Call #R$D409.
  $FD76,$03 Call #R$FD9E.
  $FD79,$03 Call #R$D604.
  $FD7C,$03 Call #R$D5F8.
  $FD7F,$03 Call #R$DA28.
  $FD82,$03 Call #R$FDC4.
  $FD85,$01 Return.

c $FD86 Shift Up Ticker News
@ $FD86 label=ShiftUpTickerNews
N $FD86 This creates the ticker "scrolling" effect, where the initial news moves to the middle, and then the bottom two
.       news stories move to the top.
  $FD86,$03 #REGhl=#R$7300.
  $FD89,$03 #REGde=#R$6B00.
  $FD8C,$03 #REGbc=#N$1000.
  $FD8F,$02 Copy the bottom two-thirds of the shadow screen buffer "up" to the top of the buffer.
  $FD91,$03 #REGhl=#R$8400.
  $FD94,$03 #REGde=#R$8300.
  $FD97,$03 #REGbc=#N$0200.
  $FD9A,$02 Copy the bottom two-thirds of the shadow attribute buffer "up" to the top of the buffer.
  $FD9C,$02 Jump to #R$FD64.

c $FD9E Print Ticker News Copy
@ $FD9E label=Print_TickerNewsCopy
  $FD9E,$03 Call #R$DA28.
  $FDA1,$02,b$01 Keep only bits 0-2.
M $FD9E,$05 Get a random number between 0-7.
N $FDA3 Multiply the random number by two, as the messages are address pointers
.       in a table (so two bytes in length each).
  $FDA3,$01 #REGa*=#N$02.
  $FDA4,$03 Create an offset in #REGhl.
  $FDA7,$04 #REGhl+=#R$FECF.
  $FDAB,$04 Grab the ticker news messaging address.
N $FDAF Print the three lines of the ticker news data to the screen.
  $FDAF,$03 #REGbc=#N$1207 (screen co-ordinates).
  $FDB2,$03 Call #R$FB5B.
  $FDB5,$03 #REGbc=#N$1407 (screen co-ordinates).
  $FDB8,$01 Move onto the start of the next message.
  $FDB9,$03 Call #R$FB5B.
  $FDBC,$03 #REGbc=#N$1607 (screen co-ordinates).
  $FDBF,$01 Move onto the start of the next message.
  $FDC0,$03 Call #R$FB5B.
  $FDC3,$01 Return.

c $FDC4 Sounds: Annoying Telecast Beeping
@ $FDC4 label=Sounds_Telecast
N $FDC4 #AUDIO(telecast.wav)(#INCLUDE(Telecast))
  $FDC4,$02 #REGb=#N$0A (counter).
@ $FDC6 label=Sounds_Telecast_Loop
M $FDC6,$05 Get a random number which is either #N$00 or #N$01.
  $FDC6,$03 Call #R$DA28.
  $FDC9,$02,b$01 Keep only bit 0.
N $FDCB There's a 50/50 chance of playing either melody #N$03 or melody #N$07.
  $FDCB,$02 #REGa=melody #N$07.
  $FDCD,$02 Jump to #R$FDD1 if the random number was #N$00.
  $FDCF,$02 #REGa=melody #N$03.
@ $FDD1 label=Sounds_Telecast_Write
  $FDD1,$03 Write melody ID to #R$FF8D.
  $FDD4,$01 Stash the note counter on the stack.
  $FDD5,$03 Call #R$FF00.
  $FDD8,$01 Restore the note counter from the stack.
  $FDD9,$02 Halt operation (suspend CPU until the next interrupt, and do this twice).
  $FDDB,$02 Decrease counter by one and loop back to #R$FDC6 until counter is zero.
  $FDDD,$01 Return.

t $FDDE Messaging: Ticker News
@ $FDDE label=Messaging_TickerNews_1
  $FDDE,$0C,$0B:$01 "#STR(#PC)".
  $FDEA,$0B,$0A:$01 "#STR(#PC)".
  $FDF5,$0B,$0A:$01 "#STR(#PC)".
@ $FE00 label=Messaging_TickerNews_2
  $FE00,$0B,$0A:$01 "#STR(#PC)".
  $FE0B,$0A,$09:$01 "#STR(#PC)".
  $FE15,$0B,$0A:$01 "#STR(#PC)".
@ $FE20 label=Messaging_TickerNews_3
  $FE20,$0C,$0B:$01 "#STR(#PC)".
  $FE2C,$0C,$0B:$01 "#STR(#PC)".
  $FE38,$0B,$0A:$01 "#STR(#PC)".
@ $FE43 label=Messaging_TickerNews_4
  $FE43,$0F,$0E:$01 "#STR(#PC)".
  $FE52,$0F,$0E:$01 "#STR(#PC)".
  $FE61,$01,$00:$01 "#STR(#PC)".
@ $FE62 label=Messaging_TickerNews_5
  $FE62,$0F,$0E:$01 "#STR(#PC)".
  $FE71,$0E,$0D:$01 "#STR(#PC)".
  $FE7F,$01,$00:$01 "#STR(#PC)".
@ $FE80 label=Messaging_TickerNews_6
  $FE80,$0E,$0D:$01 "#STR(#PC)".
  $FE8E,$0C,$0B:$01 "#STR(#PC)".
  $FE9A,$0D,$0C:$01 "#STR(#PC)".
@ $FEA7 label=Messaging_TickerNews_7
  $FEA7,$0C,$0B:$01 "#STR(#PC)".
  $FEB3,$05,$04:$01 "#STR(#PC)".
  $FEB8,$01,$00:$01 "#STR(#PC)".
@ $FEB9 label=Messaging_TickerNews_8
  $FEB9,$0C,$0B:$01 "#STR(#PC)".
  $FEC5,$09,$08:$01 "#STR(#PC)".
  $FECE,$01,$00:$01 "#STR(#PC)".

w $FECF Table: Ticker News
@ $FECF label=Table_TickerNews
  $FECF,$10

g $FEDF Data: Ticker
@ $FEDF label=Data_Ticker
D $FEDF See #R$FD44.
B $FEDF,$01 #R($D198+#PEEK(#PC)*$08)(#N($D198+#PEEK(#PC)*$08)).
L $FEDF,$01,$20
B $FEFF,$01 Terminator.

c $FF00 Play Sounds
@ $FF00 label=PlaySounds
  $FF00,$05 Return if no sound(s) are set to play (via *#R$FF8D).
  $FF05,$01 Store the melody ID in #REGl temporarily.
N $FF06 Reset the *#R$FF8D (so it doesn't carry on playing).
  $FF06,$04 Write #N$00 to *#R$FF8D.
  $FF0A,$01 Restore the melody ID back to #REGa.
N $FF0B Handle special cases for the in-game buildings crumbling and then collapsing.
  $FF0B,$04 Jump to #R$FF6B if the melody is for the building collapsing (#N$08).
  $FF0F,$04 Jump to #R$FF72 if the melody is for the building crumbling (#N$09).
N $FF13 Fetch the melody data using the melody ID as an offset.
  $FF13,$01 Decrease the melody ID by one for the table lookup.
  $FF14,$03 Multiple the melody ID by #N$08 as the table holds eight bytes of data for the melodies.
  $FF17,$03 Create an offset using #REGhl.
  $FF1A,$04 #REGhl+=#R$FF8E.
  $FF1E,$03 #REGde=#R$FF85.
  $FF21,$03 #REGbc=#N($0008,$04,$04).
  $FF24,$02 Copy the selected melody data into #R$FF85.
  $FF26,$07 Jump to #R$FF2D if *#R$FF8C is equal to #N$02.
@ $FF2D label=PlaySounds_Loop
  $FF2D,$06 Jump to #R$FF67 if *#R$FF8B is zero.
  $FF33,$01 Decrease #REGa by one.
  $FF34,$03 Write #REGa to *#R$FF8B.
  $FF37,$03 Call #R$FF55.
  $FF3A,$01 #REGhl+=#REGbc.
  $FF3B,$03 Write #REGhl to *#R$FF85.
  $FF3E,$02 Jump to #R$FF2D.
@ $FF40 label=Unused_PlaySound_Loop
  $FF40,$06 Jump to #R$FF67 if *#R$FF8B is zero.
  $FF46,$01 Decrease #REGa by one.
  $FF47,$03 Write #REGa to *#R$FF8B.
  $FF4A,$03 Call #R$FF55.
  $FF4D,$01 Set the bits from #REGa.
  $FF4E,$02 #REGhl-=#REGbc.
  $FF50,$03 Write #REGhl to *#R$FF85.
  $FF53,$02 Jump to #R$FF40.
@ $FF55 label=PlayBeeper
  $FF55,$03 #REGhl=Loop delay parameter (*#R$FF85(#N$FF85)).
  $FF58,$04 #REGde=Number of passes to make through the sound generation loop (*#R$FF87).
  $FF5C,$03 #HTML(Call <a href="https://skoolkit.ca/disassemblies/rom/hex/asm/03B5.html">BEEPER</a>.)
  $FF5F,$03 #REGhl=*#R$FF85.
  $FF62,$04 #REGbc=*#R$FF89.
  $FF66,$01 Return.
N $FF67 Flip speaker off (unset bit 4).
@ $FF67 label=Sounds_SpeakerOff
  $FF67,$03 Speaker off.
  $FF6A,$01 Return.
@ $FF6B label=InitSound_BuildingCollapsing
  $FF6B,$03 #REGhl=#N($007D,$04,$04).
  $FF6E,$02 #REGc=#N$64.
  $FF70,$02 Jump to #R$FF77.
@ $FF72 label=InitSound_BuildingCrumbling
  $FF72,$03 #REGhl=#N($00FA,$04,$04).
  $FF75,$02 #REGc=#N$19.
@ $FF77 label=PlaySounds_Building_Loop
  $FF77,$01 #REGa=*#REGhl.
  $FF78,$02,b$01 Keep only bits 3-7.
  $FF7A,$02 OUT #N$FE
  $FF7C,$01 #REGb=#REGc.
@ $FF7D label=PlaySounds_Building_Delay
  $FF7D,$02 Decrease counter by one and loop back to #R$FF7D until counter is zero.
  $FF7F,$01 Decrease #REGhl by one.
  $FF80,$04 Jump to #R$FF77 until #REGhl is zero.
  $FF84,$01 Return.
@ $FF85 label=MelodyBuffer
B $FF85,$08,$02
B $FF8B
B $FF8C
@ $FF8D label=MelodyID
B $FF8D
@ $FF8E label=Table_Melodies
B $FF8E
