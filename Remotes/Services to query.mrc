; Credit to KindOne for helping with this.
;
; Like the spaces.dll version, except if you don't have it or mIRC has updated and it doesn't work.

on ^*:notice:*:?: { 
  if ($istok(ALIS AuthServ BotServ ChanServ GameServ Global GroupServ HelpServ HostServ InfoServ MemoServ NickServ OperServ ProxyScan Q QuoteServ SaslServ StatServ,$nick,32)) {
    haltdef 
    if (!$query($nick)) {
      query $nick
    }                
    echo -lmnrt $nick $chr(60) $+ $nick $+ $chr(62) $spaces($gettok($rawmsg,2-,58))
  }
}
alias -l spaces { returnex $replace($1,$chr(160),$chr(32)) }
