  $FD44,$03 #REGde=#R$6100.
  $FD47,$03 #REGbc=#R$FEDF.
  $FD4A,$01 #REGa=*#REGbc.
  $FD4B,$02 Compare #REGa with #N$FF.
  $FD4D,$01 Return if {} is zero.
  $FD4E,$01 Stash #REGde on the stack.
  $FD4F,$01 #REGa+=#REGa.
  $FD50,$01 #REGa+=#REGa.
  $FD51,$01 #REGa+=#REGa.
  $FD52,$02 #REGh=#N$00.
  $FD54,$01 #REGl=#REGa.
  $FD55,$03 #REGde=#R$D198.
  $FD58,$01 #REGhl+=#REGde.
  $FD59,$01 Restore #REGde from the stack.
  $FD5A,$01 Stash #REGbc on the stack.
  $FD5B,$03 #REGbc=#N($0008,$04,$04).
  $FD5E,$02 LDIR.
  $FD60,$01 Restore #REGbc from the stack.
  $FD61,$01 Increment #REGbc by one.
  $FD62,$02 Jump to #R$FD4A.