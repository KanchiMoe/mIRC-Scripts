; Credit to KindOne for helping with this.
;
; This is the version to use if you have spaces.dll. 
; This may break if mIRC updates, in which case use the non-dll version.

on ^*:notice:*:?: { 
  if ($istok(AuthServ BotServ ChanServ GameServ Global GroupServ HelpServ HostServ InfoServ MemoServ NickServ OperServ ProxyScan Q QuoteServ SaslServ StatServ Alis,$nick,32)) {
    haltdef 
    if (!$query($nick)) {
      query $nick
    }                
    $dll(spaces.dll, echo, -lmnrt $nick  $chr(60) $+ $nick $+ $chr(62) $regsubex($rawmsg,/.+? :(.+)/,\1))
  }
}
