; Credit to KindOne for helping with this.
;
; Ok, so there is 2 different versions for this.
; One version is if you have spaces.dll and the
; other is if you don't. Depending on which one
; you have, take that version. 
;
; As an important note, when mIRC updates, the
; spaces.dll version is likely to brake and you
; WILL need to use the version with out
; spaces.dll until the dll is updated.
;
;
; Spaces.dll Version
; This is the version to use if you have
; spaces.dll. In short, spaces.dll is something
; what keeps the spaces mIRC sometimes misses
; out with scripts. You can get spaces.dll from
; http://www.xise.nl/mirc/
; In short, it turns: (none spaces.dll version)
;
; <ChanServ> Entry Nickname/Host Flags
; <ChanServ> ----- ---------------------- -----
; <ChanServ> 1 Chiyo +AFRVfiorstv [modified 1 week, 1 day, 04:08:01 ago]
;
; To: 
;
; <ChanServ> Entry Nickname/Host          Flags
; <ChanServ> ----- ---------------------- -----
; <ChanServ> 1     Chiyo                  +AFRVfiorstv [modified 1 week, 1 day, 04:09:58 ago]

on ^*:notice:*:?: { 
  if ($istok(AuthServ BotServ ChanServ GameServ Global GroupServ HelpServ HostServ InfoServ MemoServ NickServ OperServ ProxyScan Q QuoteServ SaslServ StatServ Alis,$nick,32)) {
    haltdef 
    if (!$query($nick)) {
      query $nick
    }                
    $dll(spaces.dll, echo, -lmnrt $nick  $chr(60) $+ $nick $+ $chr(62) $regsubex($rawmsg,/.+? :(.+)/,\1))
  }
}

; Without Spaces.dll
; This is the same script as the one above,
; however,it lacks the ability to keep the
; spaces in messages. Use this version if you
; don't have spaces.dll. 

on ^*:notice:*:?: { 
  if ($istok(ALIS AuthServ BotServ ChanServ GameServ Global GroupServ HelpServ HostServ InfoServ MemoServ NickServ OperServ ProxyScan Q QuoteServ SaslServ StatServ,$nick,32)) {
    haltdef 
    if (!$query($nick)) {
      query $nick
    }                
    echo -lmnrt $nick $chr(60) $+ $nick $+ $chr(62) $spaces($gettok($rawmsg,2-,58))
  }
}
alias spaces { returnex $replace($1,$chr(160),$chr(32)) }
