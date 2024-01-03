; Copyright Activision 1986, 2023 ArcadeGeek LTD.
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

b $C850

b $C8BA

b $CDE2

g $CFD2 Data: George
@ $CFD2 label=George_State
  $CFD2,$01 #TABLE(default,centre,centre) { =h Value | =h Meaning } { #N$05 | Waiting } { #N$FF | Game Over } TABLE#
@ $CFD7 label=George_Countdown
  $CFD7,$01
@ $CFDA label=George_X_Position
  $CFDA,$01
@ $CFDB label=George_Y_Position
  $CFDB,$01
@ $CFDE label=George_Energy
  $CFDE,$01
  $CFDF,$01
@ $CFE0 label=George_Banner_Counter
  $CFE0,$01
W $CFE1,$02
  $CFE3,$1B,$03

g $D001 Data: Lizzy
@ $D001 label=Lizzy_State
  $D001,$01 #TABLE(default,centre,centre) { =h Value | =h Meaning } { #N$05 | Waiting } { #N$FF | Game Over } TABLE#
@ $D006 label=Lizzy_Countdown
  $D006,$01
@ $D009 label=Lizzy_X_Position
  $D009,$01
@ $D00A label=Lizzy_Y_Position
  $D00A,$01
@ $D00D label=Lizzy_Energy
  $D00D,$01
  $D00E,$01
@ $D00F label=Lizzy_Banner_Counter
  $D00F,$01
W $D010,$02

g $D030 Data: Ralph
@ $D030 label=Ralph_State
  $D030,$01 #TABLE(default,centre,centre) { =h Value | =h Meaning } { #N$05 | Waiting } { #N$FF | Game Over } TABLE#
@ $D035 label=Ralph_Countdown
  $D035,$01
@ $D038 label=Ralph_X_Position
  $D038,$01
@ $D039 label=Ralph_Y_Position
  $D039,$01
@ $D03C label=Ralph_Energy
  $D03C,$01
  $D03D,$01
@ $D03E label=Ralph_Banner_Counter
  $D03E,$01
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
  $D0EB,$04,$03:$01 "#STR(#PC)".
  $D0EF,$05,$04:$01 "#STR(#PC)".
  $D0F4,$02,$01:$01 "#STR(#PC)".
  $D0F6,$04,$03:$01 "#STR(#PC)".
  $D0FA,$05,$04:$01 "#STR(#PC)".
  $D0FF,$05,$04:$01 "#STR(#PC)".
  $D104,$02,$01:$01 "#STR(#PC)".
  $D106,$02,$01:$01 "#STR(#PC)".
  $D108,$02,$01:$01 "#STR(#PC)".
  $D10A,$02,$01:$01 "#STR(#PC)".
  $D10C,$02,$01:$01 "#STR(#PC)".
  $D10E,$02,$01:$01 "#STR(#PC)".

t $D110 Messaging: Select Menu
@ $D110 label=Messaging_SelectMenu
  $D110,$09,$08:$01 "#STR(#PC)".
  $D119,$04,$03:$01 "#STR(#PC)".
  $D11D,$0A,$09:$01 "#STR(#PC)".
  $D127,$04,$03:$01 "#STR(#PC)".
  $D12B,$08,$07:$01 "#STR(#PC)".

t $D133 Messaging: Start Game
@ $D133 label=Messaging_StartGame
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

b $D215

b $D216

g $D218

g $D21A
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

g $D247

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
  $D3FD
  $D3FE
  $D400
  $D401
  $D402
  $D403
  $D404
  $D405

c $D409
  $D409,$03 #REGbc=#N($0000,$04,$04).
  $D40C,$02 #REGa=#N$6B.
  $D40E,$03 Write #REGa to *#R$D474(#N$D475).
  $D411,$03 Write #REGa to *#R$D4B5(#N$D4B6).
  $D414,$03 Call #R$D42A.
  $D417,$02 #REGa=#N$73.
  $D419,$03 Write #REGa to *#R$D474(#N$D475).
  $D41C,$03 Write #REGa to *#R$D4B5(#N$D4B6).
  $D41F,$03 Call #R$D42A.
  $D422,$02 #REGa=#N$7B.
  $D424,$03 Write #REGa to *#R$D474(#N$D475).
  $D427,$03 Write #REGa to *#R$D4B5(#N$D4B6).
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
  $D468,$01 #REGhl+=#REGhl.
  $D469,$01 #REGhl+=#REGhl.
  $D46A,$01 #REGhl+=#REGhl.
  $D46B,$01 #REGhl+=#REGde.
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
  $D4B3,$01 Switch to the shadow registers.
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
  $D502,$03 #REGa=*#R$D220.
  $D505,$01 #REGc=#REGa.
  $D506,$01 #REGhl+=#REGbc.
  $D507,$01 #REGa=*#REGhl.
  $D508,$01 Switch to the shadow registers.
  $D509,$01 Write #REGa to *#REGde.
  $D50A,$01 Increment #REGhl by one.
  $D50B,$01 Return.
  $D50C,$01 Set the bits from #REGa.
  $D50D,$02 Shift #REGa left (with carry).
  $D50F,$01 #REGl=#REGa.
  $D510,$01 RLA.
  $D511,$02,b$01 Keep only bit 0.
  $D513,$01 #REGh=#REGa.
  $D514,$03 #REGde=#R$C700.
  $D517,$01 #REGhl+=#REGde.
  $D518,$01 Exchange the #REGde register with the shadow #REGhl register.
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
  $D52A,$02 Jump to #R$D525 if {} is not zero.
  $D52C,$01 #REGa=*#REGde.
  $D52D,$01 Set flags.
  $D52E,$02 Jump to #R$D550 if {} is zero.
  $D530,$01 Stash #REGhl on the stack.
  $D531,$03 #REGhl=#R$C800.
  $D534,$01 #REGe=#REGa.
  $D535,$01 #REGa=*#REGhl.
  $D536,$01 Increment #REGhl by one.
  $D537,$02 Compare #REGa with #N$80.
  $D539,$03 Jump to #R$D535 if {} is lower.
  $D53C,$01 Decrease #REGe by one.
  $D53D,$03 Jump to #R$D535 if {} is not zero.
  $D540,$01 Exchange the #REGde register with the shadow #REGhl register.
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
  $D555,$01 #REGa=#REGl.
  $D556,$02 Compare #REGa with #N$60.
  $D558,$02 Jump to #R$D51F if {} is not zero.
  $D55A,$01 Return.
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
  $D586,$01 Exchange the #REGde register with the shadow #REGhl register.
  $D587,$01 Restore #REGhl from the stack.
  $D588,$01 Decrease #REGc by one.
  $D589,$02 Jump to #R$D57A if {} is not zero.
  $D58B,$01 Restore #REGde from the stack.
  $D58C,$02 Increment #REGe by two.
  $D58E,$01 Restore #REGhl from the stack.
  $D58F,$01 Increment #REGhl by one.
  $D590,$02 Decrease counter by one and loop back to #R$D567 until counter is zero.
  $D592,$01 Return.
  $D593,$01 #REGe=#REGa.
  $D594,$02 Compare #REGa with #N$06.
  $D596,$02 Jump to #R$D59C if {} is not zero.
  $D598,$02 #REGa=#N$01.
  $D59A,$02 Jump to #R$D5A5.
  $D59C,$02 Compare #REGa with #N$07.
  $D59E,$02 Jump to #R$D5A4 if {} is not zero.
  $D5A0,$02 #REGa=#N$02.
  $D5A2,$02 Jump to #R$D5A5.
  $D5A4,$01 Reset the bits from #REGa.
  $D5A5,$03 Write #REGa to *#R$D3FE.
  $D5A8,$01 #REGa=#REGe.
  $D5A9,$01 Decrease #REGa by one.
  $D5AA,$01 #REGa+=#REGa.
  $D5AB,$01 #REGa+=#REGa.
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
  $D5BF,$01 #REGa+=#REGa.
  $D5C0,$01 #REGa+=#REGa.
  $D5C1,$01 #REGa+=#REGa.
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
  $D5D1,$02 Jump to #R$D5CC if {} is not zero.
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

  $D5F2,$03 #REGbc=#N$02FF.
  $D5F5,$02 Copy.
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

c $D7F6

c $DA28
  $DA28,$04 #REGde=*#R$D21A.
  $DA2C,$01 Increment #REGde by one.
  $DA2D,$05 If #REGd is #N$28 then jump to #R$DA38.
  $DA32,$04 Write #REGde back to *#R$D21A.
  $DA36,$01 #REGa=*#REGde.
  $DA37,$01 Return.
  $DA38,$02 #REGd=#N$00.
  $DA3A,$03 Jump to #R$DA32.

c $DA3D

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

c $DDC0
  $DDC0,$03 #REGde=#N$FF2F.
  $DDC3,$03 #REGbc=#N$FEFE.
  $DDC6,$02 Read from the keyboard;
. #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Port Number | =h,c5 Bit }
. { =h 0 | =h 1 | =h 2 | =h 3 | =h 4 }
. { #N$FE | SHIFT | Z | X | C | V }
. TABLE#
  $DDC8,$01 Invert the bits in #REGa.
  $DDC9,$02,b$01 Keep only bits 0-4.
  $DDCB,$02 Jump to #R$DDDA if {} is zero.
  $DDCD,$01 Increment #REGd by one.
  $DDCE,$01 Return if {} is not zero.
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
c $DE00 Game Entry Point
D $DE00 #SIM(start=$DE06,stop=$DE11) #UDGTABLE { #SCR$02(splash-screen) } UDGTABLE#
@ $DE00 label=GameEntryPoint
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

c $DE19
  $DE19,$03 Call #R$F916.
  $DE1C,$03 Call #R$FD2B.
  $DE1F,$03 Set the border colour to BLACK.
  $DE22,$03 Call #R$DF46.
  $DE25,$03 Call #R$DEE1.
  $DE28,$03 Call #R$DEC6.
  $DE2B,$03 #REGa=*#R$DF44.
  $DE2E,$03 Call #R$DF90.
N $DE31 Main game loop
@ $DE31 label=MainLoop
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

b $DF44
  $DF44
  $DF45

c $DF46
  $DF46,$04 #REGiy=#R$CFD2.
  $DF4A,$03 Call #R$DF68.
  $DF4D,$04 Write #N$01 to *#REGiy+#N$09.
  $DF51,$04 #REGiy=#R$D001.
  $DF55,$03 Call #R$DF68.
  $DF58,$04 Write #N$0D to *#REGiy+#N$09.
  $DF5C,$04 #REGiy=#R$D030.
  $DF60,$03 Call #R$DF68.
  $DF63,$04 Write #N$19 to *#REGiy+#N$09.
  $DF67,$01 Return.

  $DF68,$06 Return if *#REGiy=#N$00 is #N$FF.
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
  $DF90,$01 #REGe=#REGa.
  $DF91,$03 #REGhl=#R$CDE2.
  $DF94,$01 #REGa=*#REGhl.
  $DF95,$01 Increment #REGhl by one.
  $DF96,$02 Compare #REGa with #N$FF.
  $DF98,$02 Jump to #R$DF94 if {} is not zero.
  $DF9A,$01 Decrease #REGe by one.
  $DF9B,$02 Jump to #R$DF94 if {} is not zero.
  $DF9D,$01 #REGa=*#REGhl.
  $DF9E,$01 Stash #REGhl on the stack.
  $DF9F,$03 Call #R$D50C.
  $DFA2,$01 Restore #REGhl from the stack.
  $DFA3,$01 Increment #REGhl by one.
  $DFA4,$01 #REGa=*#REGhl.
  $DFA5,$01 Stash #REGhl on the stack.
  $DFA6,$03 Call #R$D55B.
  $DFA9,$01 Restore #REGhl from the stack.
  $DFAA,$01 Increment #REGhl by one.
  $DFAB,$01 #REGa=*#REGhl.
  $DFAC,$02,b$01 Keep only bits 3-6.
  $DFAE,$01 RRCA.
  $DFAF,$01 RRCA.
  $DFB0,$01 RRCA.
  $DFB1,$01 Stash #REGhl on the stack.
  $DFB2,$03 Write #REGa to *#R$D400.
  $DFB5,$03 Call #R$D593.
  $DFB8,$01 Restore #REGhl from the stack.
  $DFB9,$01 Reset the bits from #REGa.
  $DFBA,$03 Write #REGa to *#R$D220.
  $DFBD,$03 Write #REGa to *#R$D222.
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
  $DFEA,$01 RLCA.
  $DFEB,$01 Increment #REGa by one.
  $DFEC,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $DFED,$01 Increment #REGhl by one.
  $DFEE,$01 #REGa=*#REGhl.
  $DFEF,$02,b$01 Keep only bits 5-7.
  $DFF1,$01 RLCA.
  $DFF2,$01 RLCA.
  $DFF3,$01 RLCA.
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
  $E00F,$02 Jump to #R$E00C if {} is higher.
  $E011,$02 Rotate #REGc right (with carry).
  $E013,$02 Rotate #REGc right (with carry).
  $E015,$02 Rotate #REGc right (with carry).
  $E017,$01 #REGhl+=#REGbc.
  $E018,$01 #REGb=#REGh.
  $E019,$01 #REGc=#REGl.
  $E01A,$01 Exchange the #REGaf register with the shadow #REGaf register.
  $E01B,$03 Call #R$DA71.
  $E01E,$03 #REGhl=#R$D31F.
  $E021,$03 #REGa=*#REGix+#N$07.
  $E024,$01 RRCA.
  $E025,$02 Jump to #R$E02A if {} is lower.
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
  $E049,$03 Jump to #R$DFC7 if {} is not zero.
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
  $E05E,$02 #REGa=#N$FE.
  $E060,$03 Write #REGa to *#R$D405.
  $E063,$03 #REGa=*#R$D400.
  $E066,$02 Compare #REGa with #N$02.
  $E068,$02 Jump to #R$E099 if {} is zero.
  $E06A,$02 Compare #REGa with #N$05.
  $E06C,$02 Jump to #R$E09E if {} is zero.
  $E06E,$02 #REGa=#N$18.
  $E070,$03 Write #REGa to *#R$D401.
  $E073,$03 #REGa=*#R$DF44.
  $E076,$01 RRCA.
  $E077,$01 RRCA.
  $E078,$01 RRCA.
  $E079,$02,b$01 Keep only bits 0-2.
  $E07B,$02 #REGa+=#N$02.
  $E07D,$02 Compare #REGa with #N$07.
  $E07F,$02 Jump to #R$E083 if {} is lower.
  $E081,$02 #REGa=#N$06.
  $E083,$03 Write #REGa to *#R$D212.
  $E086,$03 #REGa=*#R$DF44.
  $E089,$01 RRCA.
  $E08A,$01 RRCA.
  $E08B,$02,b$01 Keep only bits 0-3.
  $E08D,$02 #REGa+=#N$06.
  $E08F,$02 Compare #REGa with #N$11.
  $E091,$02 Jump to #R$E095 if {} is lower.
  $E093,$02 #REGa=#N$10.
  $E095,$03 Write #REGa to *#R$D211.
  $E098,$01 Return.
  $E099,$02 #REGa=#N$20.
  $E09B,$03 Write #REGa to *#R$D405.
  $E09E,$02 #REGa=#N$FE.
  $E0A0,$03 Write #REGa to *#R$D401.
  $E0A3,$02 Jump to #R$E073.
B $E0A5
  $E0CF,$01 #REGa=#REGc.
  $E0D0,$02 Compare #REGa with #N$20.
  $E0D2,$02 Jump to #R$E10A if {} is higher.
  $E0D4,$01 #REGa=#REGb.
  $E0D5,$02 Compare #REGa with #N$18.
  $E0D7,$02 Jump to #R$E10A if {} is higher.
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
  $E0E7,$01 #REGa=*#REGhl.
  $E0E8,$01 Set flags.
  $E0E9,$02 Jump to #R$E0FE if {} is not zero.
  $E0EB,$03 Decrease #REGh by three.
  $E0EE,$01 #REGa=*#REGhl.
  $E0EF,$01 Set flags.
  $E0F0,$02 Jump to #R$E0FE if {} is not zero.
  $E0F2,$01 #REGa=#REGd.
  $E0F3,$02 Compare #REGa with #N$3D.
  $E0F5,$02 Jump to #R$E113 if {} is not zero.
  $E0F7,$03 Decrease #REGh by three.
  $E0FA,$01 #REGa=*#REGhl.
  $E0FB,$01 Set flags.
  $E0FC,$02 Jump to #R$E114 if {} is zero.
  $E0FE,$01 Compare #REGa with #REGd.
  $E0FF,$02 Jump to #R$E114 if {} is lower.
  $E101,$01 Increment #REGe by one.
  $E102,$01 Compare #REGa with #REGe.
  $E103,$02 Jump to #R$E114 if {} is higher.
  $E105,$03 Write #REGa to *#R$D215.
  $E108,$01 Set the bits from #REGa.
  $E109,$01 Return.
  $E10A,$01 Restore #REGhl from the stack.
  $E10B,$03 #REGa=*#R$D3FB.
  $E10E,$01 Set flags.
  $E10F,$03 Jump to #R$EF86 if {} is zero.
  $E112,$01 Stash #REGhl on the stack.
  $E113,$01 Reset the bits from #REGa.
  $E114,$03 Write #REGa to *#R$D215.
  $E117,$01 Reset the bits from #REGa.
  $E118,$01 Return.

c $E119

c $E25D
  $E25D,$02 #REGb=#N$10.
  $E25F,$01 Reset the bits from #REGa.
  $E260,$03 Write #REGa to *#R$D247.
  $E263,$03 #REGhl=#R$D255.
  $E266,$01 Stash #REGbc on the stack.
  $E267,$01 #REGa=*#REGhl.
  $E268,$01 Increment #REGhl by one.
  $E269,$01 Set flags.
  $E26A,$03 Jump to #R$E54D if {} is zero.
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
  $E2BD,$02 Compare #REGa with #N$08.
  $E2BF,$01 Return if {} is higher.
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
  $E2D0,$02 Compare #REGa with #N$C8.
  $E2D2,$03 Jump to #R$E36B if {} is higher.
  $E2D5,$02 Compare #REGa with #N$5A.
  $E2D7,$02 Jump to #R$E319 if {} is higher.
  $E2D9,$02 Compare #REGa with #N$50.
  $E2DB,$02 Jump to #R$E320 if {} is higher.
  $E2DD,$02 Compare #REGa with #N$46.
  $E2DF,$02 Jump to #R$E327 if {} is higher.
  $E2E1,$02 Compare #REGa with #N$3C.
  $E2E3,$02 Jump to #R$E333 if {} is higher.
  $E2E5,$02 Compare #REGa with #N$32.
  $E2E7,$02 Jump to #R$E341 if {} is higher.
  $E2E9,$02 Compare #REGa with #N$28.
  $E2EB,$02 Jump to #R$E348 if {} is higher.
  $E2ED,$02 Compare #REGa with #N$1E.
  $E2EF,$02 Jump to #R$E34F if {} is higher.
  $E2F1,$02 Compare #REGa with #N$14.
  $E2F3,$02 Jump to #R$E35B if {} is higher.
  $E2F5,$02 Compare #REGa with #N$0A.
  $E2F7,$02 Jump to #R$E365 if {} is higher.
  $E2F9,$01 Set flags.
  $E2FA,$02 #REGa=#N$C2.
  $E2FC,$02 Jump to #R$E33B if {} is not zero.
  $E2FE,$03 Call #R$E2BA.
  $E301,$02 Jump to #R$E2CD if {} is lower.
  $E303,$03 #REGa=*#R$D3FA.
  $E306,$01 Increment #REGa by one.
  $E307,$02 Compare #REGa with #N$07.
  $E309,$02 Jump to #R$E2CD if {} is zero.
  $E30B,$03 Write #REGa to *#R$D3FA.
  $E30E,$03 Call #R$DB7E.
  $E311,$01 Increment #REGhl by one.
  $E312,$01 #REGa=*#REGhl.
  $E313,$01 Decrease #REGhl by one.
  $E314,$01 Compare #REGa with #REGb.
  $E315,$02 Jump to #R$E33E if {} is higher.
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
  $E381,$01 #REGa=*#REGhl.
  $E382,$01 Set flags.
  $E383,$02 Jump to #R$E37E if {} is not zero.
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
  $E391,$02 Compare #REGa with #N$C8.
  $E393,$02 Jump to #R$E3D9 if {} is higher.
  $E395,$02 Compare #REGa with #N$80.
  $E397,$02 Jump to #R$E3B1 if {} is zero.
  $E399,$02 Jump to #R$E3D5 if {} is lower.
  $E39B,$02,b$01 Keep only bits 0-5.
  $E39D,$02 Compare #REGa with #N$20.
  $E39F,$02 Jump to #R$E3A9 if {} is higher.
  $E3A1,$02,b$01 Keep only bits 0-1.
  $E3A3,$02 Compare #REGa with #N$02.
  $E3A5,$02 Jump to #R$E3C1 if {} is lower.
  $E3A7,$02 Jump to #R$E3C6.
  $E3A9,$02,b$01 Keep only bits 0-1.
  $E3AB,$02 Compare #REGa with #N$02.
  $E3AD,$02 Jump to #R$E3CB if {} is lower.
  $E3AF,$02 Jump to #R$E3D0.
  $E3B1,$03 Call #R$E2BA.
  $E3B4,$02 Jump to #R$E38E if {} is lower.
  $E3B6,$03 Call #R$DA28.
  $E3B9,$02 Write #N$C0 to *#REGhl.
  $E3BB,$02,b$01 Keep only bit 0.
  $E3BD,$02 Jump to #R$E3CB if {} is zero.
  $E3BF,$02 Write #N$A0 to *#REGhl.
  $E3C1,$02 #REGa=#N$C4.
  $E3C3,$03 Jump to #R$E541.
  $E3C6,$02 #REGa=#N$C8.
  $E3C8,$03 Jump to #R$E541.
  $E3CB,$02 #REGa=#N$C4.
  $E3CD,$03 Jump to #R$E535.
  $E3D0,$02 #REGa=#N$C8.
  $E3D2,$03 Jump to #R$E535.
  $E3D5,$02 Compare #REGa with #N$0A.
  $E3D7,$02 Jump to #R$E3B1 if {} is zero.
  $E3D9,$02 #REGa=#N$C0.
  $E3DB,$03 Jump to #R$E541 if {} is not zero.
  $E3DE,$03 Jump to #R$E2C3.
  $E3E1,$01 Restore #REGhl from the stack.
  $E3E2,$01 #REGa=*#REGhl.
  $E3E3,$01 Decrease #REGa by one.
  $E3E4,$01 Write #REGa to *#REGhl.
  $E3E5,$02 Compare #REGa with #N$C8.
  $E3E7,$02 Jump to #R$E40C if {} is higher.
  $E3E9,$02 Compare #REGa with #N$80.
  $E3EB,$02 Jump to #R$E3F7 if {} is zero.
  $E3ED,$02 Jump to #R$E408 if {} is lower.
  $E3EF,$02,b$01 Keep only bits 0-1.
  $E3F1,$02 Compare #REGa with #N$02.
  $E3F3,$02 Jump to #R$E3FE if {} is lower.
  $E3F5,$02 Jump to #R$E403.
  $E3F7,$03 Call #R$E2BA.
  $E3FA,$02 Jump to #R$E3E2 if {} is lower.
  $E3FC,$02 Write #N$A0 to *#REGhl.
  $E3FE,$02 #REGa=#N$C8.
  $E400,$03 Jump to #R$E541.
  $E403,$02 #REGa=#N$C8.
  $E405,$03 Jump to #R$E535.
  $E408,$02 Compare #REGa with #N$0A.
  $E40A,$02 Jump to #R$E3F7 if {} is zero.
  $E40C,$02 #REGa=#N$C0.
  $E40E,$03 Jump to #R$E541 if {} is not zero.
  $E411,$03 Jump to #R$E2C3.
  $E414,$01 Restore #REGhl from the stack.
  $E415,$01 #REGa=*#REGhl.
  $E416,$01 Decrease #REGa by one.
  $E417,$01 Write #REGa to *#REGhl.
  $E418,$02 Compare #REGa with #N$C8.
  $E41A,$02 Jump to #R$E43F if {} is higher.
  $E41C,$02 Compare #REGa with #N$80.
  $E41E,$02 Jump to #R$E42A if {} is zero.
  $E420,$02 Jump to #R$E43B if {} is lower.
  $E422,$02,b$01 Keep only bits 0-2.
  $E424,$02 Compare #REGa with #N$04.
  $E426,$02 Jump to #R$E431 if {} is lower.
  $E428,$02 Jump to #R$E436.
  $E42A,$03 Call #R$E2BA.
  $E42D,$02 Jump to #R$E415 if {} is lower.
  $E42F,$02 Write #N$C0 to *#REGhl.
  $E431,$02 #REGa=#N$C4.
  $E433,$03 Jump to #R$E541.
  $E436,$02 #REGa=#N$C4.
  $E438,$03 Jump to #R$E535.
  $E43B,$02 Compare #REGa with #N$0A.
  $E43D,$02 Jump to #R$E42A if {} is zero.
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
B $EF50
c $EF86
B $EF98

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

c $F8CF

c $F916
  $F916,$03 Set border colour to BLACK.
  $F919,$03 Call #R$FBDB.
  $F91C,$02 #REGa=#N$02.
  $F91E,$03 Call #R$DF90.
  $F921,$03 Call #R$D409.
  $F924,$03 Call #R$FB8E.
  $F927,$03 Call #R$F981.
  $F92A,$02 #REGb=#N$FF.
  $F92C,$01 CPU halt.
  $F92D,$01 Stash #REGbc on the stack.
  $F92E,$03 Call #R$DDC0.
  $F931,$01 Restore #REGbc from the stack.
  $F932,$02

  $F946,$02,b$01 Keep only bits 0-6.

  $F94C,$03 Call #R$FB8E.
  $F94F,$03 Call #R$F9BF.
  $F952,$02 Jump to #R$F916.

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

c $F9BF
  $F9BF,$03 Call #R$FBD4.
  $F9C2,$02 Jump to #R$F9BF if #REGa is not zero.
N $F9C4 Reset the "flash" counters for all monsters.
  $F9C4,$0B Write #N$FF to: #LIST { *#R$CFE0 } { *#R$D00F } { *#R$D03E } LIST#
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
  $F9FC,$03 #REGbc=#N$0804 (screen co-ordinates).
  $F9FF,$03 Call #R$FB5B.
  $FA02,$03 #REGhl=#R$D0D5.
  $FA05,$03 #REGbc=#N$0303 (screen co-ordinates).
  $FA08,$03 Call #R$FB5B.
  $FA0B,$01 Increment #REGhl by one.
  $FA0C,$03 #REGbc=#N$0502 (screen co-ordinates).
  $FA0F,$03 Call #R$FB5B.
  $FA12,$03 #REGhl=#R$D133.
  $FA15,$01 #REGa=#N$00.
  $FA16,$01 Stash #REGaf on the stack.
  $FA17,$04 #REGb=#N$0B+#REGa*#N$02.
  $FA1B,$02 #REGc=#N$01.
  $FA1D,$03 Call #R$FB5B.
  $FA20,$01 Increment #REGhl by one.
  $FA21,$01 Restore #REGaf from the stack.
  $FA22,$01 Increment #REGa by one.
  $FA23,$04 Jump to #R$FA16 until #REGa is equal to #N$05.
  $FA27,$03 #REGbc=#N$1401 (screen co-ordinates).
  $FA2A,$03 Call #R$FB5B.
  $FA2D,$03 Call #R$D604.
  $FA30,$03 Call #R$D5F8.
  $FA33,$03 Call #R$DDC0.
  $FA36,$02 Jump to #R$FA33 if #REGa is not zero.
  $FA38,$01 #REGa=#REGd.
  $FA39,$04 Jump to #R$FA33 if #REGa is equal to #N$FF.
  $FA3D,$04 Jump to #R$FA53 if #REGa is equal to #N$11.
  $FA41,$04 Jump to #R$FA78 if #REGa is equal to #N$24.
  $FA45,$04 Jump to #R$FA7C if #REGa is equal to #N$1C.
  $FA49,$04 Jump to #R$FA80 if #REGa is equal to #N$14.
  $FA4D,$04 Jump to #R$FA8B if #REGa is equal to #N$0F.
  $FA51,$02 Jump to #R$FA33.
  $FA53,$03 Call #R$FAA8.
  $FA56,$03 #REGa=*#R$FB5A.
  $FA59,$01 Increment #REGa by one.
  $FA5A,$03 Write #REGa to *#R$FB5A.
  $FA5D,$03 Write #REGa to *#REGix+#N$0E.
  $FA60,$02 #REGa-=#N$04.
  $FA62,$01 #REGa+=#REGa.
  $FA63,$01 #REGd=#REGa.
  $FA64,$01 #REGa+=#REGa.
  $FA65,$01 #REGa+=#REGa.
  $FA66,$01 #REGa+=#REGd.
  $FA67,$02 #REGh=#N$00.
  $FA69,$01 #REGl=#REGa.
  $FA6A,$03 #REGde=#R$C850.
  $FA6D,$01 #REGhl+=#REGde.
  $FA6E,$01 Exchange the #REGde register with the shadow #REGhl register.
  $FA6F,$03 #REGhl=#R$FB4E.
  $FA72,$03 #REGbc=#N($000A,$04,$04).
  $FA75,$02 LDIR.
  $FA77,$01 Return.
  $FA78,$02 #REGd=#N$02.
  $FA7A,$02 Jump to #R$FA82.
  $FA7C,$02 #REGd=#N$01.
  $FA7E,$02 Jump to #R$FA82.
  $FA80,$02 #REGd=#N$03.
  $FA82,$03 Call #R$FA95.
  $FA85,$02 Jump to #R$FA33 if {} is zero.
  $FA87,$03 Write #REGd to *#REGix+#N$0E.
  $FA8A,$01 Return.
  $FA8B,$04 Write #N$0E to *#REGix+#N$0E.
  $FA8F,$03 Call #R$FBD4.
  $FA92,$02 Jump to #R$FA8F if {} is not zero.
  $FA94,$01 Return.
  $FA95,$05 Return if *#R$CFE0 is equal to #REGd.
  $FA9A,$05 Return if *#R$D00F is equal to #REGd.
  $FA9F,$05 Return if *#R$D03E is equal to #REGd.
  $FAA4,$02 #REGa=#N$01.
  $FAA6,$01 Set the bits from #REGa.
  $FAA7,$01 Return.
  $FAA8,$03 Call #R$FB8E.
  $FAAB,$03 Call #R$FBD4.
  $FAAE,$02 Jump to #R$FAA8 if {} is not zero.
  $FAB0,$06 Write #R$FB4E to *#R$FB58.
  $FAB6,$03 #REGhl=#R$D0D5.
  $FAB9,$03 #REGbc=#N$0403.
  $FABC,$03 Call #R$FB5B.
  $FABF,$01 Increment #REGhl by one.
  $FAC0,$03 #REGbc=#N$0602.
  $FAC3,$03 Call #R$FB5B.
  $FAC6,$03 #REGhl=#R$D0EB.
  $FAC9,$03 #REGbc=#N$0804.
  $FACC,$02 #REGa=#N$05.
  $FACE,$02 Stash #REGaf and #REGbc on the stack.
  $FAD0,$03 Call #R$FB5B.
  $FAD3,$02 Restore #REGbc and #REGaf from the stack.
  $FAD5,$01 Increment #REGhl by one.
  $FAD6,$02 Increment #REGb by two.
  $FAD8,$01 Decrease #REGa by one.
  $FAD9,$02 Jump to #R$FACE until #REGa is zero.
  $FADB,$01 Decrease #REGb by one.
  $FADC,$03 Call #R$FB5B.
  $FADF,$03 #REGbc=#N$080B.
  $FAE2,$02 Stash #REGbc and #REGbc on the stack.
  $FAE4,$03 #REGhl=#R$D104.
  $FAE7,$03 Call #R$FB5B.
  $FAEA,$03 Call #R$D604.
  $FAED,$03 Call #R$D5F8.
  $FAF0,$03 Call #R$DDC0.
  $FAF3,$02 Jump to #R$FAF0 if {} is not zero.
  $FAF5,$01 #REGa=#REGd.
  $FAF6,$02 Compare #REGa with #N$FF.
  $FAF8,$02 Jump to #R$FAF0 if {} is zero.
  $FAFA,$01 Exchange the #REGde register with the shadow #REGhl register.
  $FAFB,$03 #REGhl=#R$FBF2.
  $FAFE,$02 #REGb=#N$00.
  $FB00,$01 #REGc=#REGa.
  $FB01,$01 #REGhl+=#REGbc.
  $FB02,$01 #REGa=*#REGhl.
  $FB03,$02 Compare #REGa with #N$80.
  $FB05,$02 Jump to #R$FAF0 if {} is higher.
  $FB07,$02,b$01 Set bits 7.
  $FB09,$01 Write #REGa to *#REGhl.
  $FB0A,$03 #REGhl=#R$D106.
  $FB0D,$02,b$01 Keep only bits 0-6.
  $FB0F,$01 Write #REGa to *#REGhl.
  $FB10,$02 Compare #REGa with #N$21.
  $FB12,$02 Jump to #R$FB17 if {} is not zero.
  $FB14,$03 #REGhl=#R$D10E.
  $FB17,$02 Compare #REGa with #N$27.
  $FB19,$02 Jump to #R$FB1E if {} is not zero.
  $FB1B,$03 #REGhl=#R$D108.
  $FB1E,$02 Compare #REGa with #N$18.
  $FB20,$02 Jump to #R$FB25 if {} is not zero.
  $FB22,$03 #REGhl=#R$D10A.
  $FB25,$02 Compare #REGa with #N$20.
  $FB27,$02 Jump to #R$FB2C if {} is not zero.
  $FB29,$03 #REGhl=#R$D10C.
  $FB2C,$01 Restore #REGbc from the stack.
  $FB2D,$01 Stash #REGde on the stack.
  $FB2E,$03 Call #R$FB5B.
  $FB31,$01 Restore #REGde from the stack.
  $FB32,$03 #REGhl=*#R$FB58.
  $FB35,$01 Write #REGe to *#REGhl.
  $FB36,$01 Increment #REGhl by one.
  $FB37,$01 Write #REGd to *#REGhl.
  $FB38,$01 Increment #REGhl by one.
  $FB39,$03 Write #REGhl to *#R$FB58.
  $FB3C,$01 Restore #REGbc from the stack.
  $FB3D,$02 Increment #REGb by two.
  $FB3F,$01 #REGa=#REGb.
  $FB40,$02 Compare #REGa with #N$12.
  $FB42,$02 Jump to #R$FAE2 if {} is not zero.
  $FB44,$03 Call #R$D604.
  $FB47,$03 Call #R$D5F8.
  $FB4A,$03 Call #R$FBEC.
  $FB4D,$01 Return.

b $FB4E
  $FB4E,$0D,$01

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

c $FB8E
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

c $FBC8
  $FBC8,$02 #REGb=#N$FF.
  $FBCA,$03 Call #R$FBD4.
  $FBCD,$02 Jump to #R$FBD0 if #REGa is zero.
  $FBCF,$01 Return.
  $FBD0,$01 Halt operation (suspend CPU until the next interrupt).
  $FBD1,$02 Decrease counter by one and loop back to #R$FBCA until counter is zero.
  $FBD3,$01 Return.

c $FBD4
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
  $FBEE,$01 CPU halt.
  $FBEF,$02 Decrease counter by one and loop back to #R$FBEE until counter is zero.
  $FBF1,$01 Return.

b $FBF2

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

c $FD44
@ $FD44 label=Print_Ticker
  $FD44,$03 #REGde=#R$6100.
  $FD47,$03 #REGbc=#R$FEDF.
@ $FD4A label=Print_Ticker_Loop
  $FD4A,$01 #REGa=*#REGbc.
N $FD4B Check if the character is the terminator.
  $FD4B,$03 Return if #REGa is equal to #N$FF.
  $FD4E,$01 Stash #REGde on the stack.
  $FD4F,$03 #REGa*=#N$08.
  $FD52,$03 Create an offset using #REGhl.
  $FD55,$04 #REGhl+=#R$D198.
  $FD59,$01 Restore #REGde from the stack.
  $FD5A,$01 Stash #REGbc on the stack.
  $FD5B,$05 Copy #N($0008,$04,$04) bytes of data from #REGhl to #REGde.
  $FD60,$01 Restore #REGbc from the stack.
  $FD61,$01 Increment #REGbc by one.
  $FD62,$02 Jump to #R$FD4A.

c $FD64
  $FD64,$03 Call #R$FD44.
  $FD67,$03 #REGhl=#N$6A00.
  $FD6A,$03 #REGde=#N$6A01.
  $FD6D,$03 #REGbc=#N$00FF.
  $FD70,$01
  $FD71,$02
  $FD73,$03 Call #R$D409.
  $FD76,$03 Call #R$FD9E.
  $FD79,$03 Call #R$D604.
  $FD7C,$03 Call #R$D5F8.
  $FD7F,$03 Call #R$DA28.
  $FD82,$03 Call #R$FDC4.
  $FD85,$01 Return.

c $FD86
  $FD86,$03 #REGhl=#R$7300.
  $FD89,$03 #REGde=#R$6B00.
  $FD8C,$03 #REGbc=#N$1000.
  $FD8F,$02 Copy.
  $FD91,$03 #REGhl=#R$8400.
  $FD94,$03 #REGde=#R$8300.
  $FD97,$03 #REGbc=#N$0200.
  $FD9A,$02 Copy.
  $FD9C,$02 Jump to #R$FD64.

c $FD9E Handler: Display Ticker News
@ $FD9E label=Handler_DisplayTickerNews
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
  $FDD9,$02 CPU halt (twice).
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

b $FEDF
@ $FEDF label=Data_Ticker
  $FEDF,$08 #FOR($00,$07)||n|#UDG($D198+#PEEK(#PC+n)*$08)||
L $FEDF,$08,$04
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
