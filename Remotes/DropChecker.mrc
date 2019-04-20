alias nc { nickcheck $1 }
alias nickcheck {
  .set %nickchecking $true
  .set %nickcheck $1
  .set %nick_frozen 3No

  .msg NickServ info $1
}

on *:NOTICE:*:?: {
  if ($nick == NickServ) {
    if (%nickchecking) {
      if ($1 == Registered) {
        set %registered_date $7-
      }

      ; If they are online now
      if ($($1 $2 $4) == Last seen now) {
        set %last_seen Online $4
      }

      ; If they have the private flag
      if ($($1 $2 $4) == Last seen $+($chr(40), about)) {
        set %last_seen $4-
      }

      ; If they are not online
      if ($($1 $2 $8) == Last seen $right($8, 2)) {
        ;($8 iswm $chr(40) $+ $8- ) 
        set %last_seen $8-
      }

      if ($1 == Flags) {
        ; If they have the hold flag
        if (Hold isin $3-) { set %nick_hold  4Yes }
        else { set %nick_hold 3No }

        ; If they have the private flag
        if (Private isin $3-) { set %nick_private 7Yes }
        else { set %nick_private No }
      }

      ; If the nick is frozen
      if ($($2 $3 $4) == has been frozen) { set %nick_frozen 4Yes }

      .timer01 1 01 window -g1 @test  0 0 555 338 
      .timer02 1 02 echo -h @test   5*** Checking the nick availability for %nickcheck $+ .
      .timer03 1 02 echo -h @test   5*** Do not try another check until the data bas been erased.
      .timer04 1 02 echo -h @test  Registered: %registered_date
      .timer05 1 02 echo -h @test  Last Seen: %last_seen
      .timer08 1 02 echo -h @test  Private: %nick_private
      .timer09 1 02 echo -h @test  Hold: %nick_hold
      .timer10 1 02 echo -h @test  Frozen: %nick_frozen

      .timer20 1 10 unsetall %*1
      .timer21 1 10 echo -h @test 5*** Data Cleared
    }
  }
}
