; ========================================= ban check
alias banlist {
  if ($1 == $nill) { /echo -a 5*** Error: No channel given. }
  else {
    set %ModeListOn true
    set %ModeListChannel $1
    set %ModeListMode b
    /window -eg1l @ModeList
    /aline @ModeList $timestamp 5 $+ $chr(124) *** Ban List (+ $+ %ModeListMode $+ ) For %ModeListChannel ***
    /aline @ModeList $timestamp 5 $+ $chr(124) Applied on $chr(124) By $chr(124) Time Stamp
    /mode %ModeListChannel +b
  }
}

raw 367:*: {
  if (%ModeListOn) {
    haltdef
    /aline @ModeList $timestamp 5 $+ $chr(124) $+   $3 5 $+ $chr(124) $+  $4-
  }
}

raw 368:*: {
  if (%ModeListOn) {
    haltdef
    /aline @ModeList $timestamp 5*** End of Ban List (+b) for %ModeListChannel ***
    unset %ModeList*
  }
}