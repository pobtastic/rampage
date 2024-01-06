; Copyright Activision 1986, 2024 ArcadeGeek LTD.
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

b $6100

b $6B00 Shadow Buffer
@ $6B00 label=ShadowScreenBuffer
  $6B00,$1800,$20 Pixels.
@ $8300 label=ShadowAttributeBuffer
  $8300,$0300,$20 Attributes.

b $8600
D $8600 #UDGARRAY$20,step=$20;(#PC)-(#PC+$100)-$01-$100(test)
  $8600,$1800,$20 Pixels.

b $9E00
  $9E00,$08 #UDG(#PC)
L $9E00,$08,$180

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

b $C8BA
  $C8BA,$08 #UDG(#PC)
L $C8BA,$08,$A5

b $C99E

b $C9F9

b $CA57

b $CB29

b $CDE2 Data: Scenes
@ $CDE2 label=Scene_Data
D $CDE2 For usage see #R$DF90.
  $CDE2,$01 Terminator.
  $CDE3,$09 Scene #N$01.
  $CDEC,$01 Terminator.
  $CDED,$0B Scene #N$02.
  $CDF8,$01 Terminator.
  $CDF9,$0D Scene #N$03.
  $CE06,$01 Terminator.
  $CE07,$0D Scene #N$04.
  $CE14,$01 Terminator.
  $CE15,$0B Scene #N$05.
  $CE20,$01 Terminator.
  $CE21,$0B Scene #N$06.
  $CE2C,$01 Terminator.
  $CE2D,$0D Scene #N$07.
  $CE3A,$01 Terminator.
  $CE3B,$0B Scene #N$08.
  $CE46,$01 Terminator.
  $CE47,$0D Scene #N$09.
  $CE54,$01 Terminator.
  $CE55,$09 Scene #N$0A.
  $CE5E,$01 Terminator.
  $CE5F,$0D Scene #N$0B.
  $CE6C,$01 Terminator.
  $CE6D,$0B Scene #N$0C.
  $CE78,$01 Terminator.
  $CE79,$0D Scene #N$0D.
  $CE86,$01 Terminator.
  $CE87,$09 Scene #N$0E.
  $CE90,$01 Terminator.
  $CE91,$0B Scene #N$0F.
  $CE9C,$01 Terminator.
  $CE9D,$0B Scene #N$10.
  $CEA8,$01 Terminator.
  $CEA9,$0D Scene #N$11.
  $CEB6,$01 Terminator.
  $CEB7,$0B Scene #N$12.
  $CEC2,$01 Terminator.
  $CEC3,$0D Scene #N$13.
  $CED0,$01 Terminator.
  $CED1,$0B Scene #N$14.
  $CEDC,$01 Terminator.
  $CEDD,$0B Scene #N$15.
  $CEE8,$01 Terminator.
  $CEE9,$0D Scene #N$16.
  $CEF6,$01 Terminator.
  $CEF7,$0D Scene #N$17.
  $CF04,$01 Terminator.
  $CF05,$0D Scene #N$18.
  $CF12,$01 Terminator.
  $CF13,$0D Scene #N$19.
  $CF20,$01 Terminator.
  $CF21,$0B Scene #N$1A.
  $CF2C,$01 Terminator.
  $CF2D,$0F Scene #N$1B.
  $CF3C,$01 Terminator.
  $CF3D,$0D Scene #N$1C.
  $CF4A,$01 Terminator.
  $CF4B,$0B Scene #N$1D.
  $CF56,$01 Terminator.
  $CF57,$09 Scene #N$1E.
  $CF60,$01 Terminator.
  $CF61,$0B Scene #N$1F.
  $CF6C,$01 Terminator.
  $CF6D,$0B Scene #N$20.
  $CF78,$01 Terminator.
  $CF79,$0B Scene #N$21.
  $CF84,$01 Terminator.
  $CF85,$0B Scene #N$22.
  $CF90,$01 Terminator.
  $CF91,$09 Scene #N$23.
  $CF9A,$01 Terminator.
  $CF9B,$07 Scene #N$24.
  $CFA2,$01 Terminator.
  $CFA3,$0B Scene #N$25.
  $CFAE,$01 Terminator.
  $CFAF,$05 Scene #N$26.
  $CFB4,$01 Terminator.
  $CFB5,$0D Scene #N$27.
  $CFC2,$01 Terminator.

g $CFD2 Data: George
@ $CFD2 label=George_State
  $CFD2,$01 #TABLE(default,centre,centre) { =h Value | =h Meaning } { #N$05 | Waiting } { #N$FF | Game Over } TABLE#
@ $CFD7 label=George_Countdown
  $CFD7,$01
@ $CFDB label=George_X_Position
  $CFDB,$01
@ $CFDC label=George_Y_Position
  $CFDC,$01
@ $CFDE label=George_Energy
  $CFDE,$01
@ $CFDF label=George_Banner_Counter
  $CFDF,$01
@ $CFE0 label=George_Control_Type
  $CFE0,$01 #TABLE(default,centre,centre) { =h Value | =h Meaning }
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
  $CFE3,$1B,$03

g $D001 Data: Lizzy
@ $D001 label=Lizzy_State
  $D001,$01 #TABLE(default,centre,centre) { =h Value | =h Meaning } { #N$05 | Waiting } { #N$FF | Game Over } TABLE#
@ $D006 label=Lizzy_Countdown
  $D006,$01
@ $D00A label=Lizzy_X_Position
  $D00A,$01
@ $D00B label=Lizzy_Y_Position
  $D00B,$01
@ $D00D label=Lizzy_Energy
  $D00D,$01
@ $D00E label=Lizzy_Banner_Counter
  $D00E,$01
@ $D00F label=Lizzy_Control_Type
  $D00F,$01 #TABLE(default,centre,centre) { =h Value | =h Meaning }
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

g $D030 Data: Ralph
@ $D030 label=Ralph_State
  $D030,$01 #TABLE(default,centre,centre) { =h Value | =h Meaning } { #N$05 | Waiting } { #N$FF | Game Over } TABLE#
@ $D035 label=Ralph_Countdown
  $D035,$01
@ $D039 label=Ralph_X_Position
  $D039,$01
@ $D03A label=Ralph_Y_Position
  $D03A,$01
@ $D03C label=Ralph_Energy
  $D03C,$01
@ $D03D label=Ralph_Banner_Counter
  $D03D,$01
@ $D03E label=Ralph_Control_Type
  $D03E,$01 #TABLE(default,centre,centre) { =h Value | =h Meaning }
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
  $D198,$08 #UDG(#PC)
L $D198,$08,$0F

b $D211

b $D212

b $D213

b $D214

b $D215

b $D216

g $D218

g $D21A Game Clock
@ $D21A label=Game_Clock
D $D21A Counts up while the game plays, used as a random number generator (as it's never reset).
W $D21A,$02

g $D220

g $D222

g $D224
W $D224,$02

g $D226
W $D226,$02

g $D22C

g $D238

g $D23E

g $D240

g $D243

g $D244

g $D247

g $D24D

g $D24E

g $D24F

g $D253
W $D253

g $D255

b $D2BC

b $D30A

b $D31F

b $D39F

b $D3F3

b $D3F8

b $D3FA
  $D3FA
  $D3FB
  $D3FC

g $D3FD Game State
@ $D3FD label=Game_State
D $D3FD #TABLE(default,centre,centre)
. { =h Value | =h Meaning }
. { #N$00 | In-Play }
. { #N$01 | Game Over }
. TABLE#
B $D3FD,$01

b $D3FE
  $D3FF
  $D400
  $D401
  $D402
  $D403
  $D404
  $D405
  $D406
  $D407

c $D409
  $D409,$03 #REGbc=#N($0000,$04,$04).
  $D40C,$08 Write #N$6B to: #LIST { *#R$D474(#N$D475) } { *#R$D4B5(#N$D4B6) } LIST#
  $D414,$03 Call #R$D42A.
  $D417,$08 Write #N$73 to: #LIST { *#R$D474(#N$D475) } { *#R$D4B5(#N$D4B6) } LIST#
  $D41F,$03 Call #R$D42A.
  $D422,$08 Write #N$7B to: #LIST { *#R$D474(#N$D475) } { *#R$D4B5(#N$D4B6) } LIST#
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
  $D45F,$02,b$01 Keep only bits 0-6.
  $D461,$01 #REGe=#REGa.
  $D462,$01 #REGa=*#REGhl.
  $D463,$03 Write #REGa to *#R$D222.
  $D466,$01 #REGh=#REGd.
  $D467,$01 #REGl=#REGe.
  $D468,$04 #REGhl*=#N$08+#REGde.
  $D46C,$02 Compare #REGa with #N$80.
  $D46E,$03 Jump to #R$D49A if {} is higher.
  $D471,$03 Call #R$D4E8.
  $D474,$02 #REGd=#N$00.
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
  $D4A6,$01 #REGa+=#REGa.
  $D4A7,$01 #REGa+=#REGa.
  $D4A8,$01 #REGa+=#REGa.
  $D4A9,$01 #REGa+=#REGc.
  $D4AA,$02 #REGb=#N$00.
  $D4AC,$01 #REGc=#REGa.
  $D4AD,$03 #REGhl=#R$8B40.
  $D4B0,$01 #REGhl+=#REGbc.
  $D4B1,$01 Increment #REGl by one.
  $D4B2,$01 Stash #REGhl on the stack.
  $D4B3,$01 Switch back to the normal registers.
  $D4B4,$01 Restore #REGbc from the stack.
  $D4B5,$02 #REGd=#N$00.
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
  $D4E8,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D4E9,$01 #REGa+=#REGh.
  $D4EA,$01 #REGh=#REGa.
  $D4EB,$01 #REGa=#REGb.
  $D4EC,$02 #REGa+=#N$83.
  $D4EE,$01 #REGd=#REGa.
  $D4EF,$01 #REGe=#REGc.
  $D4F0,$03 #REGa=*#R$D220.
  $D4F3,$01 Set flags.
  $D4F4,$01 #REGa=*#REGhl.
  $D4F5,$02 Jump to #R$D509 if {} is zero.
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
  $D510,$01 Rotate #REGa left through the carry flag (bit 7 to the carry flag, the carry flag to bit 0).
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
  $D547,$02 Test bit 7 of #REGa.
  $D549,$02 Jump to #R$D550 if {} is not zero.
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

c $D5D8
  $D5D8,$02 #REGa=#N$03.
  $D5DA,$01 Stash #REGaf on the stack.
  $D5DB,$03 Call #R$D5E6.
  $D5DE,$01 Restore #REGaf from the stack.
  $D5DF,$01 Decrease #REGa by one.
  $D5E0,$02 Jump to #R$D5DA until #REGa is zero.
  $D5E2,$03 Call #R$D5E6.
  $D5E5,$01 Return.

c $D5E6
  $D5E6,$01 #REGh=#REGa.
  $D5E7,$01 #REGa+=#REGa.
  $D5E8,$01 #REGa+=#REGh.
  $D5E9,$02 #REGa+=#N$5F.
  $D5EB,$01 #REGh=#REGa.
  $D5EC,$01 #REGd=#REGa.
  $D5ED,$02 #REGl=#N$00.
  $D5EF,$02 #REGe=#N$01.
  $D5F1,$01 Write #REGl to *#REGhl.
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
@ $D61C label=CopyShadowBufferToScreen
  $D61C,$01 Stash #REGhl on the stack.
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
  $D656,$01 Restore #REGhl from the stack.
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

c $D6C9
  $D6C9,$03 Write #REGa to *#R$D214.
  $D6CC,$01 Stash #REGbc on the stack.
  $D6CD,$03 Call #R$D9A9.
  $D6D0,$01 Restore #REGbc from the stack.
  $D6D1,$01 #REGd=#REGa.
  $D6D2,$03 #REGa=*#R$D247.
  $D6D5,$01 RRCA.
  $D6D6,$03 Jump to #R$D800 if {} is lower.
  $D6D9,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D6DA,$01 #REGe=#REGa.
  $D6DB,$01 #REGl=#REGc.
  $D6DC,$01 Switch to the shadow registers.
  $D6DD,$01 #REGa=*#REGhl.
  $D6DE,$01 Increment #REGhl by one.
  $D6DF,$01 #REGh=*#REGhl.
  $D6E0,$01 #REGl=#REGa.
  $D6E1,$01 Switch to the shadow registers.
  $D6E2,$01 #REGa=#REGc.
  $D6E3,$01 Compare #REGa with #REGl.
  $D6E4,$03 Jump to #R$D6FC if {} is not zero.
  $D6E7,$01 #REGa=#REGb.
  $D6E8,$02,b$01 Keep only bits 3-7.
  $D6EA,$02 #REGa+=#N$6B.
  $D6EC,$01 #REGh=#REGa.
  $D6ED,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D6EE,$01 #REGa=#REGb.
  $D6EF,$02,b$01 Keep only bits 0-2.
  $D6F1,$01 RRCA.
  $D6F2,$01 RRCA.
  $D6F3,$01 RRCA.
  $D6F4,$01 #REGa+=#REGc.
  $D6F5,$01 Switch to the shadow registers.
  $D6F6,$01 #REGc=#REGa.
  $D6F7,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $D6F8,$01 #REGb=#REGa.
  $D6F9,$03 Jump to #R$D700.
  $D6FC,$01 #REGa=#REGh.
  $D6FD,$01 Switch to the shadow registers.
  $D6FE,$01 Increment #REGc by one.
  $D6FF,$01 #REGb=#REGa.
  $D700,$01 Switch to the shadow registers.
  $D701,$01 #REGa=#REGc.
  $D702,$05 Jump to #R$D7A5 if #REGa is higher than #N$20.
  $D707,$01 #REGa=#REGb.
  $D708,$05 Jump to #R$D7A5 if #REGa is higher than #N$18.
  $D70D,$01 Switch to the shadow registers.
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
  $D768,$01 #REGa=#REGe.
  $D769,$01 Compare #REGa with #REGc.
  $D76A,$01 Switch to the shadow registers.
  $D76B,$03 Jump to #R$D6E1 if {} is not zero.
  $D76E,$01 Switch to the shadow registers.
  $D76F,$01 #REGc=#REGl.
  $D770,$01 Increment #REGb by one.
  $D771,$01 #REGa=#REGd.
  $D772,$01 Compare #REGa with #REGb.
  $D773,$01 Switch to the shadow registers.
  $D774,$03 Jump to #R$D6E1 if {} is not zero.
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

c $D7F6

c $DA28 Random Number
@ $DA28 label=RandomNumber
R $DA28 A Random number
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

c $DA51
  $DA51,$03 #REGa=*#R$D24D.
  $DA54,$01 Increment #REGa by one.
  $DA55,$03 Write #REGa to *#R$D24D.
  $DA58,$01 Return.

c $DA59
  $DA59,$03 #REGa=*#R$D24E.
  $DA5C,$01 Increment #REGa by one.
  $DA5D,$03 Write #REGa to *#R$D24E.
  $DA60,$01 Return.

c $DA61
  $DA61,$03 #REGa=*#R$D24D.
  $DA64,$01 Decrease #REGa by one.
  $DA65,$03 Write #REGa to *#R$D24D.
  $DA68,$01 Return.

c $DA69
  $DA69,$03 #REGa=*#R$D24E.
  $DA6C,$01 Decrease #REGa by one.
  $DA6D,$03 Write #REGa to *#R$D24E.
  $DA70,$01 Return.

c $DA71
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
  $DAA4,$01 RLCA.
  $DAA5,$01 RLCA.
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

c $DB7E
  $DB7E,$04 Write #N$00 to *#R$D214.
M $DB82,$05 Get a random number between 0-3.
  $DB85,$02,b$01
  $DB87,$03 Call #R$DBB4.
  $DB8A,$04 Jump to #R$DB96 if #REGa is lower than #N$C8.
  $DB8E,$05 Write #N$80 to *#R$D214.
  $DB93,$01 #REGa=#REGb.
  $DB94,$02 Jump to #R$DB87.
  $DB96,$03 #REGa=*#R$D214.
  $DB99,$01 Set the bits from #REGb.
  $DB9A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $DB9B,$01 #REGa=*#REGde.
  $DB9C,$02 Increment #REGa by two.
  $DB9E,$01 #REGb=#REGa.
  $DB9F,$04 Jump to #R$DBA5 if #REGa is lower than #N$64.
  $DBA3,$02 #REGb=#N$00.
  $DBA5,$01 Increment #REGde by one.
  $DBA6,$01 #REGa=*#REGde.
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

c $DBE5

c $DCA1

c $DD6C
  $DD6C,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $DD6D,$06 Return if *#REGiy+#N$00 is higher than #N$21.
  $DD73,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $DD74,$03 Decrease *#REGiy+#N$0C by one.
  $DD77,$01 Decrease #REGa by one.
  $DD78,$02 Jump to #R$DD74 until #REGa is zero.
  $DD7A,$06 Return if *#REGiy+#N$0C is lower than #N$C8.
  $DD80,$04 Write #N$00 to *#REGiy+#N$0C.
  $DD84,$04 Write #N$21 to *#REGiy+#N$00.
  $DD88,$01 Return.

c $DD89

c $DD97

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
D $DE00 #SIM(start=$DE06,stop=$DE11) #UDGTABLE { #SCR$02(splash-screen) } UDGTABLE#
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
  $DE34,$06 Jump to #R$DE19 if *#R$D3FD is not zero.
  $DE3A,$04 #HTML(Write #N$00 to <a href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
  $DE3E,$07 Jump to #R$DE53 if *#R$CFD2 is not equal to #N$FF (in-play).
  $DE45,$07 Jump to #R$DE53 if *#R$D001 is not equal to #N$FF (in-play).
  $DE4C,$07 Jump to #R$DE19 if *#R$D030 is equal to #N$FF (in-play).
  $DE53,$06 Jump to #R$DE77 if *#R$D3F3 is not zero.
  $DE59,$03 #REGa=*#R$D216.
  $DE5C,$01 Decrease #REGa by one.
  $DE5D,$03 Write #REGa to *#R$D216.
  $DE60,$02 Jump to #R$DE77 if #REGa is not zero.
  $DE62,$03 #REGa=*#R$DF44.
  $DE65,$01 Increment #REGa by one.
  $DE66,$04 Jump to #R$DE6C if #REGa is not equal to #N$29.
  $DE6A,$05 Write #N$01 to *#R$DF44.
  $DE6F,$03 Call #R$FD2B.
  $DE72,$03 Call #R$DF46.
  $DE75,$02 Jump to #R$DE28.

c $DE77
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
  $DEBC,$03 #HTML(#REGhl=<a href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
  $DEBF,$04
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
  $DEE1,$01 #REGa=#N$00.
  $DEE2,$04 #REGiy=#R$CFD2.
  $DEE6,$03 Call #R$DF1F.
  $DEE9,$04 Write #N$01 to *#REGiy+#N$03.
  $DEED,$04 Write #N$15 to *#REGiy+#N$09.
  $DEF1,$04 #REGiy=#R$D001.
  $DEF5,$03 Call #R$DF1F.
  $DEF8,$04 Write #N$FD to *#REGiy+#N$09.
  $DEFC,$04 #REGiy=#R$D030.
  $DF00,$03 Call #R$DF1F.
  $DF03,$04 Write #N$08 to *#REGiy+#N$09.
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
R $DF1F A
N $DF1F See: #R$CFD2, #R$D001, #R$D030.
  $DF1F,$04 Write #N$1C (falling?) to #REGiy+#N$00 (monster state).
  $DF23,$09 Write #REGa to: #LIST { #REGiy+#N$02 } { #REGiy+#N$03 } { #REGiy+#N$08 } LIST#
  $DF2C,$04 Write #N$01 to #REGiy+#N$04.
  $DF30,$04 Write #N$FE to #REGiy+#N$0A.
  $DF34,$04 Write #N$40 to #REGiy+#N$0C.
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

b $DF45

c $DF46 Set Monster Defaults
@ $DF46 label=MonsterDefaults
  $DF46,$04 #REGiy=#R$CFD2.
  $DF4A,$03 Call #R$DF68.
  $DF4D,$04 Write #N$01 to #R$CFDB (*#REGiy+#N$09).
  $DF51,$04 #REGiy=#R$D001.
  $DF55,$03 Call #R$DF68.
  $DF58,$04 Write #N$0D to #R$D00A (*#REGiy+#N$09).
  $DF5C,$04 #REGiy=#R$D030.
  $DF60,$03 Call #R$DF68.
  $DF63,$04 Write #N$19 to #R$D039 (*#REGiy+#N$09).
  $DF67,$01 Return.
@ $DF68 label=SetMonsterDefaults
  $DF68,$06 Return if the monster state (#REGiy+#N$00) is "No Monster".
  $DF6E,$07 Write #N$00 to: #LIST { #REGiy+#N$00 } { #REGiy+#N$02 } LIST#
  $DF75,$04 Write #N$01 to #REGiy+#N$03.
  $DF79,$03 Write #N$00 to #REGiy+#N$04.
  $DF7C,$04 Write #N$19 to #REGiy+#N$05.
  $DF80,$04 Write #N$03 to #REGiy+#N$06.
  $DF84,$04 Write #N$19 to #REGiy+#N$07.
  $DF88,$03 Write #N$00 to #REGiy+#N$08.
  $DF8B,$04 Write #N$12 to #REGiy+#N$0A.
  $DF8F,$01 Return.

c $DF90
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
  $DFA4,$01 #REGa=*#REGhl.
  $DFA5,$01 Stash #REGhl on the stack.
  $DFA6,$03 Call #R$D55B.
  $DFA9,$01 Restore #REGhl from the stack.
  $DFAA,$01 Increment #REGhl by one.
  $DFAB,$01 #REGa=*#REGhl.
  $DFAC,$02,b$01 Keep only bits 3-6.
  $DFAE,$03 Rotate #REGa right three positions (bits 3 to 6 are now in positions 0 to 3).
  $DFB1,$01 Stash #REGhl on the stack.
  $DFB2,$03 Write #REGa to *#R$D400.
  $DFB5,$03 Call #R$D593.
  $DFB8,$01 Restore #REGhl from the stack.
  $DFB9,$07 Write #N$00 to: #LIST { *#R$D220 } { *#R$D222 } LIST#
  $DFC0,$01 #REGa=*#REGhl.
  $DFC1,$02,b$01 Keep only bits 0-2.
  $DFC3,$03 Write #REGa to *#R$D3F3.
  $DFC6,$01 Increment #REGhl by one.
  $DFC7,$02 Stash #REGaf and #REGhl on the stack.
  $DFC9,$03 #REGhl=#R$D39F.
  $DFCC,$03 #REGa=*#R$D220.
  $DFCF,$02 #REGd=#N$00.
  $DFD1,$01 #REGe=#REGa.
  $DFD2,$01 #REGhl+=#REGde.
  $DFD3,$01 Stash #REGhl on the stack.
  $DFD4,$02 Restore #REGix from the stack.
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
  $DFF1,$03 Rotate #REGa left three positions (bits 5 to 7 are now in positions 2 to 4).
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
  $E052,$02 #REGb=#N$20.
  $E054,$01 #REGa=*#REGde.
  $E055,$01 RLCA.
  $E056,$01 RLCA.
  $E057,$01 RLCA.
  $E058,$01 Set the bits from *#REGhl.
  $E059,$01 Write #REGa to *#REGhl.
  $E05A,$01 Increment #REGhl by one.
  $E05B,$01 Increment #REGde by one.
  $E05C,$02 Decrease counter by one and loop back to #R$E054 until counter is zero.
  $E05E,$05 Write #N$FE to *#R$D405.
  $E063,$07 Jump to #R$E099 if *#R$D400 is equal to #N$02.
  $E06A,$04 Jump to #R$E09E if #REGa is equal to #N$05.
  $E06E,$05 Write #N$18 to *#R$D401.
  $E073,$03 #REGa=*#R$DF44.
  $E076,$01 RRCA.
  $E077,$01 RRCA.
  $E078,$01 RRCA.
  $E079,$02,b$01 Keep only bits 0-2.
  $E07B,$02 #REGa+=#N$02.
  $E07D,$04 Jump to #R$E083 if #REGa is lower than #N$07.
  $E081,$02 #REGa=#N$06.
  $E083,$03 Write #REGa to *#R$D212.
  $E086,$03 #REGa=*#R$DF44.
  $E089,$01 RRCA.
  $E08A,$01 RRCA.
  $E08B,$02,b$01 Keep only bits 0-3.
  $E08D,$02 #REGa+=#N$06.
  $E08F,$04 Jump to #R$E095 if #REGa is lower than #N$11.
  $E093,$05 Write #N$10 to *#R$D211.
  $E098,$01 Return.
  $E099,$05 Write #N$20 to *#R$D405.
  $E09E,$05 Write #N$FE to *#R$D401.
  $E0A3,$02 Jump to #R$E073.
B $E0A5
  $E0CF,$01 #REGa=#REGc.
  $E0D0,$04 Jump to #R$E10A if #REGa is higher than #N$20.
  $E0D4,$01 #REGa=#REGb.
  $E0D5,$04 Jump to #R$E10A if #REGa is higher than #N$18.
  $E0D9,$01 RRCA.
  $E0DA,$01 RRCA.
  $E0DB,$01 RRCA.
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

c $E119

c $E25D
  $E25D,$02 #REGb=#N$10.
  $E25F,$04 Write #N$00 to *#R$D247.
  $E263,$03 #REGhl=#R$D255.
  $E266,$01 Stash #REGbc on the stack.
  $E267,$01 #REGa=*#REGhl.
  $E268,$01 Increment #REGhl by one.
  $E269,$04 Jump to #R$E54D if #REGa is zero.
  $E26D,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E26E,$01 Stash #REGhl on the stack.
  $E26F,$01 Increment #REGhl by one.
  $E270,$01 #REGc=*#REGhl.
  $E271,$01 Increment #REGhl by one.
  $E272,$01 #REGb=*#REGhl.
  $E273,$03 #REGde=#N($0108,$04,$04).
  $E276,$03 Call #R$E0CF.
  $E279,$02 Jump to #R$E286 if {} is not zero.
  $E27B,$01 Restore #REGhl from the stack.
  $E27C,$01 Decrease #REGhl by one.
  $E27D,$01 Reset the bits from #REGa.
  $E27E,$01 Write #REGa to *#REGhl.
  $E27F,$04 Increment #REGhl by four.
  $E283,$03 Jump to #R$E550.
  $E286,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E287,$01 Decrease #REGa by one.
  $E288,$01 #REGa+=#REGa.
  $E289,$02 #REGd=#N$00.
  $E28B,$01 #REGe=#REGa.
  $E28C,$03 #REGhl=#R$E556.
  $E28F,$01 #REGhl+=#REGde.
  $E290,$01 #REGa=*#REGhl.
  $E291,$01 Increment #REGhl by one.
  $E292,$01 #REGh=*#REGhl.
  $E293,$01 #REGl=#REGa.
  $E294,$01 Jump to *#REGhl.
  $E295,$01 Restore #REGhl from the stack.
  $E296,$01 #REGa=*#REGhl.
  $E297,$01 Decrease #REGa by one.
  $E298,$01 Write #REGa to *#REGhl.
  $E299,$03 Jump to #R$E54D if {} is not zero.
  $E29C,$02 Write #N$10 to *#REGhl.
  $E29E,$01 Decrease #REGhl by one.
  $E29F,$02 Write #N$02 to *#REGhl.
  $E2A1,$01 Restore #REGbc from the stack.
  $E2A2,$03 Jump to #R$E266.
  $E2A5,$01 Restore #REGhl from the stack.
  $E2A6,$01 #REGa=*#REGhl.
  $E2A7,$01 Decrease #REGa by one.
  $E2A8,$01 Write #REGa to *#REGhl.
  $E2A9,$03 Jump to #R$E54D if {} is not zero.
  $E2AC,$02 Write #N$0E to *#REGhl.
  $E2AE,$01 Decrease #REGhl by one.
  $E2AF,$03 Call #R$DA28.
  $E2B2,$02,b$01 Keep only bits 0-3.
  $E2B4,$01 Increment #REGa by one.
  $E2B5,$01 Write #REGa to *#REGhl.
  $E2B6,$01 Restore #REGbc from the stack.
  $E2B7,$03 Jump to #R$E266.
  $E2BA,$03 Call #R$DA28.
  $E2BD,$03 Return if #REGa is higher than #N$08.
  $E2C0,$02 Write #N$CE to *#REGhl.
  $E2C2,$01 Return.
  $E2C3,$02 Write #N$20 to *#REGhl.
  $E2C5,$01 Decrease #REGhl by one.
  $E2C6,$02 Write #N$01 to *#REGhl.
  $E2C8,$01 Restore #REGbc from the stack.
  $E2C9,$03 Jump to #R$E266.
  $E2CC,$01 Restore #REGhl from the stack.
  $E2CD,$01 #REGa=*#REGhl.
  $E2CE,$01 Decrease #REGa by one.
  $E2CF,$01 Write #REGa to *#REGhl.
  $E2D0,$05 Jump to #R$E36B if #REGa is higher than #N$C8.
  $E2D5,$04 Jump to #R$E319 if #REGa is higher than #N$5A.
  $E2D9,$04 Jump to #R$E320 if #REGa is higher than #N$50.
  $E2DD,$04 Jump to #R$E327 if #REGa is higher than #N$46.
  $E2E1,$04 Jump to #R$E333 if #REGa is higher than #N$3C.
  $E2E5,$04 Jump to #R$E341 if #REGa is higher than #N$32.
  $E2E9,$04 Jump to #R$E348 if #REGa is higher than #N$28.
  $E2ED,$04 Jump to #R$E34F if #REGa is higher than #N$1E.
  $E2F1,$04 Jump to #R$E35B if #REGa is higher than #N$14.
  $E2F5,$04 Jump to #R$E365 if #REGa is higher than #N$0A.
  $E2F9,$01 Set flags.
  $E2FA,$02 #REGa=#N$C2.
  $E2FC,$02 Jump to #R$E33B if {} is not zero.
  $E2FE,$03 Call #R$E2BA.
  $E301,$02 Jump to #R$E2CD if {} is lower.
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
  $E319,$02 #REGa=#N$C2.
  $E31B,$02 Jump to #R$E33B if {} is not zero.
  $E31D,$02 Write #N$55 to *#REGhl.
  $E31F,$01 Set the bits from #REGa.
  $E320,$02 #REGa=#N$C4.
  $E322,$02 Jump to #R$E33B if {} is not zero.
  $E324,$02 Write #N$47 to *#REGhl.
  $E326,$01 Set the bits from #REGa.
  $E327,$02 #REGa=#N$C6.
  $E329,$02 Jump to #R$E33B if {} is not zero.
  $E32B,$02 #REGa=#N$01.
  $E32D,$03 Call #R$E375.
  $E330,$02 Write #N$3E to *#REGhl.
  $E332,$01 Set the bits from #REGa.
  $E333,$02 #REGa=#N$C8.
  $E335,$02 Jump to #R$E33B if {} is not zero.
  $E337,$02 Write #N$14 to *#REGhl.
  $E339,$02 #REGa=#N$C2.
  $E33B,$03 Jump to #R$E541.
  $E33E,$02 Write #N$3A to *#REGhl.
  $E340,$01 Set the bits from #REGa.
  $E341,$02 #REGa=#N$C2.
  $E343,$02 Jump to #R$E372 if {} is not zero.
  $E345,$02 Write #N$2D to *#REGhl.
  $E347,$01 Set the bits from #REGa.
  $E348,$02 #REGa=#N$C4.
  $E34A,$02 Jump to #R$E372 if {} is not zero.
  $E34C,$02 Write #N$1F to *#REGhl.
  $E34E,$01 Set the bits from #REGa.
  $E34F,$02 #REGa=#N$C6.
  $E351,$02 Jump to #R$E372 if {} is not zero.
  $E353,$02 #REGa=#N$41.
  $E355,$03 Call #R$E375.
  $E358,$02 Write #N$18 to *#REGhl.
  $E35A,$01 Set the bits from #REGa.
  $E35B,$02 #REGa=#N$C8.
  $E35D,$02 Jump to #R$E372 if {} is not zero.
  $E35F,$02 Write #N$0A to *#REGhl.
  $E361,$02 #REGa=#N$C2.
  $E363,$02 Jump to #R$E33B.
  $E365,$02 #REGa=#N$C0.
  $E367,$02 Jump to #R$E33B if {} is not zero.
  $E369,$02 Jump to #R$E2F9.
  $E36B,$02 #REGa=#N$C0.
  $E36D,$02 Jump to #R$E33B if {} is not zero.
  $E36F,$03 Jump to #R$E2C3.
  $E372,$03 Jump to #R$E535.
  $E375,$01 Stash #REGhl on the stack.
  $E376,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E377,$01 Increment #REGhl by one.
  $E378,$01 #REGc=*#REGhl.
  $E379,$01 Increment #REGhl by one.
  $E37A,$01 #REGb=*#REGhl.
  $E37B,$03 #REGhl=#R$D30A.
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
  $E38D,$01 Restore #REGhl from the stack.
  $E38E,$01 #REGa=*#REGhl.
  $E38F,$01 Decrease #REGa by one.
  $E390,$01 Write #REGa to *#REGhl.
  $E391,$04 Jump to #R$E3D9 if #REGa is higher than #N$C8.
  $E395,$04 Jump to #R$E3B1 if #REGa is equal to #N$80.
  $E399,$02 Jump to #R$E3D5 if {} is lower.
  $E39B,$02,b$01 Keep only bits 0-5.
  $E39D,$04 Jump to #R$E3A9 if #REGa is higher than #N$20.
  $E3A1,$02,b$01 Keep only bits 0-1.
  $E3A3,$04 Jump to #R$E3C1 if #REGa is lower than #N$02.
  $E3A7,$02 Jump to #R$E3C6.
  $E3A9,$02,b$01 Keep only bits 0-1.
  $E3AB,$04 Jump to #R$E3CB if #REGa is lower than #N$02.
  $E3AF,$02 Jump to #R$E3D0.
  $E3B1,$03 Call #R$E2BA.
  $E3B4,$02 Jump to #R$E38E if {} is lower.
  $E3B6,$03 Call #R$DA28.
  $E3B9,$02 Write #N$C0 to *#REGhl.
  $E3BB,$02,b$01 Keep only bit 0.
  $E3BD,$02 Jump to #R$E3CB if the result is zero.
  $E3BF,$02 Write #N$A0 to *#REGhl.
  $E3C1,$02 #REGa=#N$C4.
  $E3C3,$03 Jump to #R$E541.
  $E3C6,$02 #REGa=#N$C8.
  $E3C8,$03 Jump to #R$E541.
  $E3CB,$02 #REGa=#N$C4.
  $E3CD,$03 Jump to #R$E535.
  $E3D0,$02 #REGa=#N$C8.
  $E3D2,$03 Jump to #R$E535.
  $E3D5,$04 Jump to #R$E3B1 if #REGa is equal to #N$0A.
  $E3D9,$02 #REGa=#N$C0.
  $E3DB,$03 Jump to #R$E541 if {} is not zero.
  $E3DE,$03 Jump to #R$E2C3.
  $E3E1,$01 Restore #REGhl from the stack.
  $E3E2,$01 #REGa=*#REGhl.
  $E3E3,$01 Decrease #REGa by one.
  $E3E4,$01 Write #REGa to *#REGhl.
  $E3E5,$04 Jump to #R$E40C if #REGa is higher than #N$C8.
  $E3E9,$04 Jump to #R$E3F7 if #REGa is equal to #N$80.
  $E3ED,$02 Jump to #R$E408 if {} is lower.
  $E3EF,$02,b$01 Keep only bits 0-1.
  $E3F1,$04 Jump to #R$E3FE if #REGa is lower than #N$02.
  $E3F5,$02 Jump to #R$E403.
  $E3F7,$03 Call #R$E2BA.
  $E3FA,$02 Jump to #R$E3E2 if {} is lower.
  $E3FC,$02 Write #N$A0 to *#REGhl.
  $E3FE,$02 #REGa=#N$C8.
  $E400,$03 Jump to #R$E541.
  $E403,$02 #REGa=#N$C8.
  $E405,$03 Jump to #R$E535.
  $E408,$04 Jump to #R$E3F7 if #REGa is equal to #N$0A.
  $E40C,$02 #REGa=#N$C0.
  $E40E,$03 Jump to #R$E541 if {} is not zero.
  $E411,$03 Jump to #R$E2C3.
  $E414,$01 Restore #REGhl from the stack.
  $E415,$01 #REGa=*#REGhl.
  $E416,$01 Decrease #REGa by one.
  $E417,$01 Write #REGa to *#REGhl.
  $E418,$04 Jump to #R$E43F if #REGa is higher than #N$C8.
  $E41C,$04 Jump to #R$E42A if #REGa is equal to #N$80.
  $E420,$02 Jump to #R$E43B if {} is lower.
  $E422,$02,b$01 Keep only bits 0-2.
  $E424,$04 Jump to #R$E431 if #REGa is lower than #N$04.
  $E428,$02 Jump to #R$E436.
  $E42A,$03 Call #R$E2BA.
  $E42D,$02 Jump to #R$E415 if {} is lower.
  $E42F,$02 Write #N$C0 to *#REGhl.
  $E431,$02 #REGa=#N$C4.
  $E433,$03 Jump to #R$E541.
  $E436,$02 #REGa=#N$C4.
  $E438,$03 Jump to #R$E535.
  $E43B,$04 Jump to #R$E42A if #REGa is equal to #N$0A.
  $E43F,$02 #REGa=#N$C0.
  $E441,$03 Jump to #R$E541 if {} is not zero.
  $E444,$03 Jump to #R$E2C3.
  $E447,$01 Restore #REGhl from the stack.
  $E448,$01 #REGa=*#REGhl.
  $E449,$01 Decrease #REGa by one.
  $E44A,$01 Write #REGa to *#REGhl.
  $E44B,$02 Compare #REGa with #N$C8.
  $E44D,$03 Jump to #R$E4D6 if {} is higher.
  $E450,$02 Compare #REGa with #N$14.
  $E452,$02 Jump to #R$E4D2 if {} is lower.
  $E454,$02,b$01 Keep only bits 0-4.
  $E456,$02 Jump to #R$E463 if {} is zero.
  $E458,$01 #REGa=*#REGhl.
  $E459,$01 RLCA.
  $E45A,$01 RLCA.
  $E45B,$01 RLCA.
  $E45C,$02,b$01 Keep only bits 0-1.
  $E45E,$03 Call #R$DBD9.
  $E461,$02 Jump to #R$E474.
  $E463,$03 Call #R$E2BA.
  $E466,$02 Jump to #R$E448 if {} is lower.
  $E468,$03 Call #R$DB7E.
  $E46B,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E46C,$02,b$01 Keep only bits 0-1.
  $E46E,$01 RRCA.
  $E46F,$01 RRCA.
  $E470,$01 RRCA.
  $E471,$02,b$01 Set bits 0-4.
  $E473,$01 Write #REGa to *#REGhl.
  $E474,$01 Increment #REGhl by one.
  $E475,$01 #REGa=*#REGhl.
  $E476,$01 Compare #REGa with #REGb.
  $E477,$01 Increment #REGhl by one.
  $E478,$01 #REGa=*#REGhl.
  $E479,$02 Decrease #REGhl by two.
  $E47B,$02 Jump to #R$E486 if {} is zero.
  $E47D,$02 Jump to #R$E48B if {} is higher.
  $E47F,$01 Compare #REGa with #REGc.
  $E480,$02 Jump to #R$E49A if {} is zero.
  $E482,$02 Jump to #R$E496 if {} is lower.
  $E484,$02 Jump to #R$E49E.
  $E486,$01 Compare #REGa with #REGc.
  $E487,$02 Jump to #R$E492 if {} is lower.
  $E489,$02 Jump to #R$E4BD.
  $E48B,$01 Compare #REGa with #REGc.
  $E48C,$02 Jump to #R$E4B5 if {} is zero.
  $E48E,$02 Jump to #R$E4B1 if {} is lower.
  $E490,$02 Jump to #R$E4B9.
  $E492,$02 #REGb=#N$CA.
  $E494,$02 Jump to #R$E4C1.
  $E496,$02 #REGb=#N$CC.
  $E498,$02 Jump to #R$E4A0.
  $E49A,$02 #REGb=#N$CE.
  $E49C,$02 Jump to #R$E4A0.
  $E49E,$02 #REGb=#N$D0.
  $E4A0,$03 Call #R$DA28.
  $E4A3,$02 Compare #REGa with #N$04.
  $E4A5,$01 #REGa=#REGb.
  $E4A6,$03 Jump to #R$E541 if {} is higher.
  $E4A9,$02 #REGc=#N$00.
  $E4AB,$03 Call #R$E4DE.
  $E4AE,$03 Jump to #R$E541.
  $E4B1,$02 #REGb=#N$CC.
  $E4B3,$02 Jump to #R$E4C1.
  $E4B5,$02 #REGb=#N$CE.
  $E4B7,$02 Jump to #R$E4C1.
  $E4B9,$02 #REGb=#N$D0.
  $E4BB,$02 Jump to #R$E4C1.
  $E4BD,$02 #REGb=#N$D2.
  $E4BF,$02 Jump to #R$E4A0.
  $E4C1,$03 Call #R$DA28.
  $E4C4,$02 Compare #REGa with #N$04.
  $E4C6,$01 #REGa=#REGb.
  $E4C7,$03 Jump to #R$E535 if {} is higher.
  $E4CA,$02 #REGc=#N$80.
  $E4CC,$03 Call #R$E4DE.
  $E4CF,$03 Jump to #R$E535.
  $E4D2,$02 Compare #REGa with #N$0A.
  $E4D4,$02 Jump to #R$E463 if {} is zero.
  $E4D6,$02 #REGa=#N$C0.
  $E4D8,$03 Jump to #R$E541 if {} is not zero.
  $E4DB,$03 Jump to #R$E2C3.
  $E4DE,$03 #REGa=*#R$D3F8.
  $E4E1,$02 Compare #REGa with #N$08.
  $E4E3,$01 #REGa=#REGb.
  $E4E4,$01 Return if {} is zero.
  $E4E5,$03 #REGde=#R$D2BC.
  $E4E8,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E4E9,$03 Increment #REGde by three.
  $E4EC,$01 #REGa=*#REGde.
  $E4ED,$01 Set flags.
  $E4EE,$02 Jump to #R$E4E9 if {} is not zero.
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
  $E4FB,$02 Compare #REGa with #N$04.
  $E4FD,$02 Jump to #R$E502 if {} is not zero.
  $E4FF,$01 Increment #REGc by one.
  $E500,$02 Jump to #R$E520.
  $E502,$02 Compare #REGa with #N$82.
  $E504,$02 Jump to #R$E509 if {} is not zero.
  $E506,$01 Increment #REGb by one.
  $E507,$02 Jump to #R$E520.
  $E509,$02 Compare #REGa with #N$02.
  $E50B,$02 Jump to #R$E515 if {} is zero.
  $E50D,$02 Compare #REGa with #N$01.
  $E50F,$02 Jump to #R$E515 if {} is zero.
  $E511,$02 Compare #REGa with #N$85.
  $E513,$02 Jump to #R$E519 if {} is not zero.
  $E515,$01 Increment #REGb by one.
  $E516,$01 Increment #REGc by one.
  $E517,$02 Jump to #R$E520.
  $E519,$02,b$01 Keep only bits 0-1.
  $E51B,$02 Compare #REGa with #N$03.
  $E51D,$02 Jump to #R$E520 if {} is not zero.
  $E51F,$01 Increment #REGb by one.
  $E520,$01 #REGa=#REGc.
  $E521,$01 Write #REGa to *#REGde.
  $E522,$01 Increment #REGde by one.
  $E523,$01 #REGa=#REGb.
  $E524,$01 Write #REGa to *#REGde.
  $E525,$02 Decrease #REGhl by two.
  $E527,$03 #REGa=*#R$D3F8.
  $E52A,$01 Increment #REGa by one.
  $E52B,$03 Write #REGa to *#R$D3F8.
  $E52E,$02 #REGa=#N$02.
  $E530,$03 Write #REGa to *#R$FF8D.
  $E533,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E534,$01 Return.
  $E535,$01 Increment #REGhl by one.
  $E536,$01 #REGc=*#REGhl.
  $E537,$01 Increment #REGhl by one.
  $E538,$01 #REGb=*#REGhl.
  $E539,$01 Increment #REGhl by one.
  $E53A,$01 Stash #REGhl on the stack.
  $E53B,$03 Call #R$D7F6.
  $E53E,$01 Restore #REGhl from the stack.
  $E53F,$02 Jump to #R$E550.
  $E541,$01 Increment #REGhl by one.
  $E542,$01 #REGc=*#REGhl.
  $E543,$01 Increment #REGhl by one.
  $E544,$01 #REGb=*#REGhl.
  $E545,$01 Increment #REGhl by one.
  $E546,$01 Stash #REGhl on the stack.
  $E547,$03 Call #R$D6C9.
  $E54A,$01 Restore #REGhl from the stack.
  $E54B,$02 Jump to #R$E550.
  $E54D,$03 Increment #REGhl by three.
  $E550,$01 Restore #REGbc from the stack.
  $E551,$01 Decrease #REGb by one.
  $E552,$03 Jump to #R$E266 if {} is not zero.
  $E555,$01 Return.

w $E556 Jump Table

c $E576

c $E62D

B $EF50

c $EF86
  $EF86,$03 Call #R$DB54.
  $EF89,$03 #REGa=*#R$D24F.
  $EF8C,$03 Call #R$DA0F.
  $EF8F,$03 Call #R$D9C3.
  $EF92,$01 Return if {} is not zero.
  $EF93,$04 Write #N$00 to *#R$D244.
  $EF97,$01 Return.

b $EF98

c $EFE0
  $EFE0,$01 #REGa=#N$00.
  $EFE1,$01 Stash #REGaf on the stack.
  $EFE2,$02 #REGd=#N$00.
  $EFE4,$01 #REGe=#REGa.
  $EFE5,$03 #REGhl=#R$D39F.
  $EFE8,$01 #REGhl+=#REGde.
  $EFE9,$01 Stash #REGhl on the stack.
  $EFEA,$02 Restore #REGix from the stack.
  $EFEC,$03 #REGa=*#REGix+#N$00.
  $EFEF,$04 Jump to #R$F005 if #REGa is equal to #N$02.
  $EFF3,$05 Jump to #R$F05A if #REGa is equal to #N$03.
  $EFF8,$05 Jump to #R$F0AB if #REGa is equal to #N$04
  $EFFD,$01 Restore #REGaf from the stack.
  $EFFE,$02 #REGa+=#N$0E.
  $F000,$04 Jump to #R$EFE1 if #REGa is not equal to #N$54.
  $F004,$01 Return.
  $F005,$03 Decrease *#REGix+#N$0D by one.
  $F008,$03 Jump to #R$F052 until *#REGix+#N$0D is zero.
  $F00B,$04 Write #N$0D to *#REGix+#N$0D.
  $F00F,$03 Decrease *#REGix+#N$0A by one.
  $F012,$02 Jump to #R$F03C until *#REGix+#N$0A is zero.
  $F014,$04 Write #N$03 to *#REGix+#N$00.
  $F018,$03 #REGa=*#REGix+#N$05.
  $F01B,$01 Increment #REGa by one.
  $F01C,$03 Write #REGa to *#REGix+#N$0B.
  $F01F,$02 #REGc=#N$07.
  $F021,$03 #REGa=*#REGix+#N$07.
  $F024,$01 RRCA.
  $F025,$02 Jump to #R$F029 if {} is higher.
  $F027,$02 #REGc=#N$38.
  $F029,$03 #REGe=*#REGix+#N$01.
  $F02C,$03 #REGb=*#REGix+#N$06.
  $F02F,$03 #REGhl=#R$D31F.
  $F032,$01 #REGhl+=#REGde.
  $F033,$01 #REGa=*#REGhl.
  $F034,$01 Merge the bits from #REGc.
  $F035,$01 Write #REGa to *#REGhl.
  $F036,$01 Increment #REGhl by one.
  $F037,$02 Decrease counter by one and loop back to #R$F033 until counter is zero.
  $F039,$03 Jump to #R$F0AB.
  $F03C,$03 #REGl=*#REGix+#N$0A.
  $F03F,$03 Call #R$F0EF.
  $F042,$01 #REGe=#REGl.
  $F043,$03 #REGb=*#REGix+#N$06.
  $F046,$02 #REGc=#N$FF.
  $F048,$01 #REGa=*#REGhl.
  $F049,$02,b$01 Set bit 7.
  $F04B,$01 Write #REGa to *#REGhl.
  $F04C,$01 #REGa=#REGc.
  $F04D,$01 Write #REGa to *#REGde.
  $F04E,$01 Increment #REGhl by one.
  $F04F,$01 Increment #REGde by one.
  $F050,$02 Decrease counter by one and loop back to #R$F048 until counter is zero.
  $F052,$02 #REGa=#N$09.
  $F054,$03 Write #REGa to *#R$FF8D.
  $F057,$03 Jump to #R$F0AB.
  $F05A,$03 Decrease *#REGix+#N$0D by one.
  $F05D,$02 Jump to #R$F0AB until *#REGix+#N$0D is zero.
  $F05F,$02 #REGa=#N$08.
  $F061,$03 Write #REGa to *#R$FF8D.
  $F064,$04 Write #N$02 to *#REGix+#N$0D.
  $F068,$03 Decrease *#REGix+#N$0B by one.
  $F06B,$02 Jump to #R$F073 until *#REGix+#N$0B is zero.
  $F06D,$04 Write #N$04 to *#REGix+#N$00.
  $F071,$02 Jump to #R$F0AB.
  $F073,$03 #REGl=*#REGix+#N$05.
  $F076,$01 Decrease #REGl by one.
  $F077,$03 Call #R$F0EF.
  $F07A,$02 #REGa+=#N$20.
  $F07C,$01 #REGe=#REGa.
  $F07D,$03 #REGb=*#REGix+#N$0B.
  $F080,$04 Stash #REGbc, #REGhl, #REGde and #REGde on the stack.
  $F084,$01 #REGd=#REGh.
  $F085,$01 #REGe=#REGl.
  $F086,$04 #REGhl+=#N($0020,$04,$04).
  $F08A,$03 #REGb=*#REGix+#N$06.
  $F08D,$01 #REGa=*#REGde.
  $F08E,$01 Write #REGa to *#REGhl.
  $F08F,$01 Increment #REGe by one.
  $F090,$01 Increment #REGl by one.
  $F091,$02 Decrease counter by one and loop back to #R$F08D until counter is zero.
  $F093,$01 Restore #REGhl from the stack.
  $F094,$03 #REGb=*#REGix+#N$06.
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
  $F0AB,$04 Write #N$00 to *#R$F0DD.
  $F0AF,$03 Decrease *#REGix+#N$0C by one.
  $F0B2,$02 Jump to #R$F0C4 until *#REGix+#N$0C is zero.
  $F0B4,$04 Write #N$00 to *#REGix+#N$00.
  $F0B8,$03 #REGa=*#R$D3F3.
  $F0BB,$01 Decrease #REGa by one.
  $F0BC,$03 Write #REGa to *#R$D3F3.
  $F0BF,$02 #REGa=#N$AF.
  $F0C1,$03 Write #REGa to *#R$F0DD.
  $F0C4,$03 #REGl=*#REGix+#N$05.
  $F0C7,$01 Decrease #REGl by one.
  $F0C8,$03 Call #R$F0EF.
  $F0CB,$02 #REGa+=#N$20.
  $F0CD,$01 #REGl=#REGa.
  $F0CE,$01 #REGe=#REGa.
  $F0CF,$03 #REGb=*#REGix+#N$06.
  $F0D2,$01 Exchange the #REGde register with the shadow #REGhl register.
  $F0D3,$03 #REGa=*#REGix+#N$0C.
  $F0D6,$02,b$01 Keep only bit 0.
  $F0D8,$03 #REGa*=#N$08.
  $F0DB,$02 #REGa+=#N$44.
  $F0DD,$01 No operation?
  $F0DE,$02 Write #N$FF to *#REGhl.
  $F0E0,$01 Write #REGa to *#REGde.
  $F0E1,$01 Increment #REGl by one.
  $F0E2,$01 Increment #REGe by one.
  $F0E3,$01 Increment #REGa by one.
  $F0E4,$04 Jump to #R$F0EA if #REGa is not equal to #N$4D.
  $F0E8,$02 #REGa=#N$44.
  $F0EA,$02 Decrease counter by one and loop back to #R$F0DD until counter is zero.
  $F0EC,$03 Jump to #R$EFFD.
  $F0EF,$02 #REGh=#N$00.
  $F0F1,$01 Decrease #REGl by one.
  $F0F2,$01 #REGhl+=#REGhl.
  $F0F3,$01 #REGhl+=#REGhl.
  $F0F4,$01 #REGhl+=#REGhl.
  $F0F5,$01 #REGhl+=#REGhl.
  $F0F6,$01 #REGhl+=#REGhl.
  $F0F7,$03 #REGe=*#REGix+#N$03.
  $F0FA,$03 #REGd=*#REGix+#N$04.
  $F0FD,$01 #REGhl+=#REGde.
  $F0FE,$03 #REGa=*#REGix+#N$07.
  $F101,$01 #REGb=#REGa.
  $F102,$01 #REGa+=#REGa.
  $F103,$01 #REGa+=#REGb.
  $F104,$02 #REGa+=#N$5F.
  $F106,$01 #REGb=#REGa.
  $F107,$01 #REGa=#REGh.
  $F108,$01 #REGa-=#REGb.
  $F109,$02 #REGa+=#N$68.
  $F10B,$01 #REGd=#REGa.
  $F10C,$01 #REGa=#REGl.
  $F10D,$01 Return.

c $F10E

c $F28B

c $F2CA Handler: Energy
@ $F2CA label=Handler_Energy
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
  $F2DC,$02 #REGc=#N$22.
  $F2DE,$02 #REGh=#N$6A.
  $F2E0,$03 #REGa=*#R$CFDE.
  $F2E3,$03 Call #R$F2FB.
  $F2E6,$02 #REGc=#N$2C.
  $F2E8,$02 #REGh=#N$6C.
  $F2EA,$03 #REGa=*#R$D00D.
  $F2ED,$03 Call #R$F2FB.
  $F2F0,$02 #REGc=#N$36.
  $F2F2,$02 #REGh=#N$6F.
  $F2F4,$03 #REGa=*#R$D03C.
  $F2F7,$03 Call #R$F2FB.
  $F2FA,$01 Return.
  $F2FB,$02 #REGb=#N$00.
  $F2FD,$01 #REGd=#REGb.
  $F2FE,$02 Return if #REGa is zero.
  $F300,$02 #REGa-=#N$08.
  $F302,$02 Jump to #R$F30E if {} is lower.
  $F304,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $F305,$02 #REGe=#N$34.
  $F307,$03 Call #R$DA3D.
  $F30A,$01 Exchange the #REGaf register with the shadow #REGaf register.
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

c $F31C
  $F31C,$02 #REGc=#N$22.
  $F31E,$02 #REGh=#N$6A.
  $F320,$03 #REGa=*#R$CFDE.
  $F323,$03 Call #R$F33B.
  $F326,$02 #REGc=#N$2C.
  $F328,$02 #REGh=#N$6C.
  $F32A,$03 #REGa=*#R$D00D.
  $F32D,$03 Call #R$F33B.
  $F330,$02 #REGc=#N$36.
  $F332,$02 #REGh=#N$6F.
  $F334,$03 #REGa=*#R$D03C.
  $F337,$03 Call #R$F33B.
  $F33A,$01 Return.
  $F33B,$02 #REGb=#N$00.
  $F33D,$01 #REGd=#REGb.
  $F33E,$02 Return if #REGa is zero.
  $F340,$02 #REGa-=#N$08.
  $F342,$02 Jump to #R$F34C if {} is lower.
  $F344,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $F345,$03 Call #R$F34C.
  $F348,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $F349,$01 Increment #REGc by one.
  $F34A,$02 Jump to #R$F33B.
  $F34C,$02 #REGd=#N$83.
  $F34E,$01 #REGe=#REGc.
  $F34F,$01 #REGa=#REGh.
  $F350,$01 Write #REGa to *#REGde.
  $F351,$01 Return.

c $F352

c $F3EF

c $F434
  $F434,$03 #REGhl=#R$D238.
  $F437,$05 Write #N$03 to *#R$DF45.
  $F43C,$02 Stash #REGaf and #REGhl on the stack.
  $F43E,$06 If *#REGhl is not at the terminator jump to #R$F450.
  $F444,$02 Restore #REGhl and #REGaf from the stack.
  $F446,$06 Decrease #REGhl by six.
  $F44C,$01 Decrease #REGa by one.
  $F44D,$02 Jump to #R$F439 until #REGa is zero.
  $F44F,$01 Return.

c $F450

c $F69F

c $F726 Print Banner
@ $F726 label=PrintBanner
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

c $F795
  $F795,$02 #REGb=#N$03.

c $F8BE
  $F8BE,$06 Write #R$D22C to #R$D224.
  $F8C4,$06 Write #R$D23E to #R$D226.
  $F8CA,$04 Write #N$00 to #R$D218.
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
N $F9D4 George.
  $F9D4,$03 Call #R$FB8E.
  $F9D7,$03 #REGhl=#R$D05F.
  $F9DA,$04 #REGix=#R$CFD2.
  $F9DE,$03 Call #R$F9FC.
N $F9E1 Lizzy.
  $F9E1,$03 Call #R$FB8E.
  $F9E4,$04 #REGix=#R$D001.
  $F9E8,$03 #REGhl=#R$D06D.
  $F9EB,$03 Call #R$F9FC.
N $F9EE Ralph.
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
  $FB8E,$02 #REGc=#N$11.
  $FB90,$03 #REGhl=#R$6B00.
  $FB93,$02 #REGd=#N$83.
  $FB95,$02 #REGe=#N$00.
  $FB97,$03 Call #R$FBAE.
  $FB9A,$03 #REGhl=#R$8300.
  $FB9D,$02 #REGd=#N$86.
  $FB9F,$02 #REGe=#N$46.
  $FBA1,$03 Call #R$FBAE.
N $FBA4 Prints "Rampage tm".
  $FBA4,$03 #REGhl=#R$D0CB.
  $FBA7,$03 #REGbc=#N$0103 (screen co-ordinates).
  $FBAA,$03 Call #R$FB5B.
  $FBAD,$01 Return.

c $FBAE
R $FBAE C Width
R $FBAE D Height
R $FBAE E Value to write
R $FBAE HL Buffer location
  $FBAE,$01 #REGb=#REGc.
  $FBAF,$01 #REGa=#N$00.
  $FBB0,$01 Write #REGe to *#REGhl.
  $FBB1,$01 Increment #REGhl by one.
  $FBB2,$02 Decrease counter by one and loop back to #R$FBB0 until counter is zero.
  $FBB4,$01 #REGhl+=#REGbc.
  $FBB5,$02 Decrease #REGhl by two.
  $FBB7,$01 #REGa=#REGe.
  $FBB8,$02,b$01 Keep only bits 0-2.
  $FBBA,$02 Jump to #R$FBC3 if the result is zero.
  $FBBC,$01 Increment #REGe by one.
  $FBBD,$04 Jump to #R$FBC3 if #REGa is not equal to #N$07.
  $FBC1,$02 #REGe=#N$42.
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

c $FBDB
  $FBDB,$03 Call #R$D5D8.
  $FBDE,$03 #REGhl=#R$6800.
  $FBE1,$03 #REGde=#N$6801.
  $FBE4,$03 #REGbc=#N$02FF.
  $FBE7,$02 Write #N$FF to *#REGhl.
  $FBE9,$02 Copy.
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

c $FC1A
  $FC1A,$05 Return if *#R$D3FE is zero.
  $FC1F,$03 #REGbc=#N$1506.
  $FC22,$04 Jump to #R$FC28 if *#R$D3FE is #N$01.
  $FC26,$02 #REGc=#N$16.
  $FC28,$02 #REGa=#N$7F.
  $FC2A,$01 Stash #REGbc on the stack.
  $FC2B,$03 Call #R$D6C9.
  $FC2E,$01 Restore #REGbc from the stack.
  $FC2F,$04 #REGc+=#N$04.
  $FC33,$02 #REGa=#N$7F.
  $FC35,$03 Call #R$D7F6.
  $FC38,$01 Return.

c $FC39
  $FC39,$06 Return if *#R$D401 is equal to #N$FE.
  $FC3F,$04 Jump to #R$FC72 if *#R$D401 is equal to #N$FF.
  $FC43,$01 Decrease #REGa by one.
  $FC44,$03 Write #REGa back to *#R$D401.
  $FC47,$01 Return if #REGa is not zero.
  $FC48,$05 Write #N$FF to *#R$D401.
  $FC4D,$03 Call #R$DA28.
  $FC50,$02,b$01 Keep only bits 0-1.
  $FC52,$03 Write #REGa to *#R$D402.
  $FC55,$03 Call #R$DA28.
  $FC58,$02,b$01 Keep only bit 0.
  $FC5A,$02 Jump to #R$FC68 if the result is not zero.
  $FC5C,$05 Write #N$14 to *#R$D404.
  $FC61,$05 Write #N$FA to *#R$D403.
  $FC66,$02 Jump to #R$FC72.
  $FC68,$05 Write #N$94 to *#R$D404.
  $FC6D,$05 Write #N$20 to *#R$D403.
  $FC72,$03 #REGa=*#R$D404.
  $FC75,$02 Compare #REGa with #N$80.
  $FC77,$02 Jump to #R$FC97 if {} is higher.
  $FC79,$01 #REGb=#REGa.
  $FC7A,$03 #REGa=*#R$D403.
  $FC7D,$01 Increment #REGa by one.
  $FC7E,$03 Write #REGa to *#R$D403.
  $FC81,$04 Jump to #R$FCA7 if #REGa is equal to #N$20.
  $FC85,$01 #REGc=#REGa.
  $FC86,$03 #REGa=*#R$D402.
  $FC89,$03 Return if #REGa is equal to #N$03.
  $FC8C,$01 #REGa+=#REGa.
  $FC8D,$02 #REGa+=#N$3B.
  $FC8F,$03 Call #R$D6C9.
  $FC92,$01 Reset the bits from #REGa.
  $FC93,$03 Write #REGa to *#R$D247.
  $FC96,$01 Return.
  $FC97,$02,b$01 Keep only bits 0-6.
  $FC99,$01 #REGb=#REGa.
  $FC9A,$05 Write #N$01 to *#R$D247.
  $FC9F,$03 #REGa=*#R$D403.
  $FCA2,$01 Decrease #REGa by one.
  $FCA3,$04 Jump to #R$FC7E if #REGa is not equal to #N$FA.
  $FCA7,$03 Call #R$DA28.
  $FCAA,$02,b$01 Keep only bits 0-3.
  $FCAC,$02 #REGa+=#N$08.
  $FCAE,$03 Write #REGa to *#R$D401.
  $FCB1,$01 Reset the bits from #REGa.
  $FCB2,$03 Write #REGa to *#R$D247.
  $FCB5,$01 Return.

c $FCB6
  $FCB6,$06 Return if *#R$D405 is equal to #N$FE.
  $FCBC,$04 Jump to #R$FCE7 if it is equal to #N$FF.
  $FCC0,$01 Decrease #REGa by one.
  $FCC1,$03 Write #REGa to *#R$D405.
  $FCC4,$01 Return if #REGa is not zero.
  $FCC5,$05 Write #N$FF to *#R$D405.
  $FCCA,$03 Call #R$DA28.
  $FCCD,$02,b$01 Keep only bit 0.
  $FCCF,$02 Jump to #R$FCDD if the result is not zero.
  $FCD1,$05 Write #N$13 to *#R$D407.
  $FCD6,$05 Write #N$F0 to *#R$D406.
  $FCDB,$02 Jump to #R$FCE7.
  $FCDD,$05 Write #N$93 to *#R$D407.
  $FCE2,$05 Write #N$20 to *#R$D406.
  $FCE7,$03 #REGa=*#R$D407.
  $FCEA,$02,b$01 Keep only bit 6.
  $FCEC,$02 RLCA.
  $FCEE,$01 #REGc=#REGa.
  $FCEF,$07 Jump to #R$FD21 if *#R$D407 is higher than #N$80.
  $FCF6,$02,b$01 Keep only bits 0-5.
  $FCF8,$01 #REGb=#REGa.
  $FCF9,$03 #REGa=*#R$D406.
  $FCFC,$01 Increment #REGa by one.
  $FCFD,$01 #REGa+=#REGc.
  $FCFE,$03 Write #REGa to *#R$D406.
  $FD01,$01 #REGc=#REGa.
  $FD02,$02 #REGa=#N$79.
  $FD04,$01 Stash #REGbc on the stack.
  $FD05,$03 Call #R$D6C9.
  $FD08,$01 Restore #REGbc from the stack.
  $FD09,$02 #REGa=#N$03.
  $FD0B,$01 Stash #REGaf on the stack.
  $FD0C,$02 Increment #REGc by two.
  $FD0E,$02 #REGa=#N$7B.
  $FD10,$01 Stash #REGbc on the stack.
  $FD11,$03 Call #R$D6C9.
  $FD14,$02 Restore #REGbc and #REGaf from the stack.
  $FD16,$01 Decrease #REGa by one.
  $FD17,$02 Jump to #R$FD0B until #REGa is zero.
  $FD19,$02 Increment #REGc by two.
  $FD1B,$02 #REGa=#N$79.
  $FD1D,$03 Call #R$D7F6.
  $FD20,$01 Return.
  $FD21,$02,b$01 Keep only bits 0-5.
  $FD23,$01 #REGb=#REGa.
  $FD24,$03 #REGa=*#R$D406.
  $FD27,$01 Decrease #REGa by one.
  $FD28,$01 #REGa-=#REGc.
  $FD29,$02 Jump to #R$FCFE.

c $FD2B
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
  $FDC6,$03 Call #R$DA28.
  $FDC9,$02,b$01 Keep only bit 0.
  $FDCB,$02 #REGa=#N$07.
  $FDCD,$02
  $FDCF,$05 Write #N$03 to #R$FF8D.
  $FDD4,$01 Stash #REGbc on the stack.
  $FDD5,$03 Call #R$FF00.
  $FDD8,$01 Restore #REGbc from the stack.
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

b $FEDF Data: Ticker
@ $FEDF label=Data_Ticker
  $FEDF,$01 #R($D198+#PEEK(#PC)*$08)(#N($D198+#PEEK(#PC)*$08)).
L $FEDF,$01,$20
  $FEFF,$01 Terminator.

c $FF00
  $FF00,$05 Return if *#R$FF8D is zero.
  $FF05,$01 #REGl=#REGa.
  $FF06,$04 Write #N$00 to *#R$FF8D.
  $FF0A,$01 #REGa=#REGl.
  $FF0B,$04 Jump to #R$FF6B if #REGa is equal to #N$08.
  $FF0F,$04 Jump to #R$FF72 if #REGa is equal to #N$09.
  $FF13,$01 Decrease #REGa by one.
  $FF14,$03 #REGa*=#N$08.
  $FF17,$02 #REGh=#N$00.
  $FF19,$01 #REGl=#REGa.
  $FF1A,$04 #REGhl+=#R$FF8E.
  $FF1E,$03 #REGde=#R$FF85.
  $FF21,$03 #REGbc=#N($0008,$04,$04).
  $FF24,$02 LDIR.
  $FF26,$07 Jump to #R$FF2D if *#R$FF8C is equal to #N$02.
  $FF2D,$06 Jump to #R$FF67 if *#R$FF8B is zero.
  $FF33,$01 Decrease #REGa by one.
  $FF34,$03 Write #REGa to *#R$FF8B.
  $FF37,$03 Call #R$FF55.
  $FF3A,$01 #REGhl+=#REGbc.
  $FF3B,$03 Write #REGhl to *#R$FF85.
  $FF3E,$02 Jump to #R$FF2D.
  $FF40,$06 Jump to #R$FF67 if *#R$FF8B is zero.
  $FF46,$01 Decrease #REGa by one.
  $FF47,$03 Write #REGa to *#R$FF8B.
  $FF4A,$03 Call #R$FF55.
  $FF4D,$01 Set the bits from #REGa.
  $FF4E,$02 #REGhl-=#REGbc.
  $FF50,$03 Write #REGhl to *#R$FF85.
  $FF53,$02 Jump to #R$FF40.
  $FF55,$03 #REGhl=*#R$FF85.
  $FF58,$04 #REGde=*#R$FF87.
  $FF5C,$03 #HTML(Call <a href="https://skoolkit.ca/disassemblies/rom/hex/asm/03B5.html">BEEPER</a>.)
  $FF5F,$03 #REGhl=*#R$FF85.
  $FF62,$04 #REGbc=*#R$FF89.
  $FF66,$01 Return.
N $FF67 Flip speaker off (unset bit 4).
@ $FF67 label=Sounds_SpeakerOff
  $FF67,$03 Speaker off.
  $FF6A,$01 Return.
  $FF6B,$03 #REGhl=#N($007D,$04,$04).
  $FF6E,$02 #REGc=#N$64.
  $FF70,$02 Jump to #R$FF77.
  $FF72,$03 #REGhl=#N($00FA,$04,$04).
  $FF75,$02 #REGc=#N$19.
  $FF77,$01 #REGa=*#REGhl.
  $FF78,$02,b$01 Keep only bits 3-7.
  $FF7A,$02 OUT #N$FE
  $FF7C,$01 #REGb=#REGc.
  $FF7D,$02 Decrease counter by one and loop back to #R$FF7D until counter is zero.
  $FF7F,$01 Decrease #REGhl by one.
  $FF80,$04 Jump to #R$FF77 until #REGhl is zero.
  $FF84,$01 Return.
W $FF85,$02
W $FF87,$02
W $FF89,$02
B $FF8B
B $FF8C
B $FF8D
B $FF8E
