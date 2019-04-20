; INDEX
; Highlights (Text)
; Highlights (Action)
; Notice (User/DLL)
; Notice (Channel)
; Disable Tips

; Highlights (Text)
on *:TEXT:*:*: {
  if ($1- !isnum) && ($highlight($1-)) { 
    /window -ng1 @Highlights
/echo -ht @Highlights $chr(91) $+ $network $+ $chr(93) $chr(91) $+ $chan $+ $chr(93) $chr(60) $+ $nick $+ $chr(62) $1- } }

; Highlights (Action)
on *:ACTION:*:*: {
  if ($1- !isnum) && ($highlight($1-)) {
    /window -ng1 @Highlights
/echo -ht @Highlights $chr(91) $+ $network $+ $chr(93) $chr(91) $+ $chan $+ $chr(93) 6 $+ * $nick $1- } }

; Notices (User/DLL)
; To do, make a non-spaces.dll version of this
;ON ^*:NOTICE:*:?: { 
;  if ($istok(AuthServ BotServ ChanServ GameServ Global GroupServ HelpServ HostServ InfoServ MemoServ NickServ OperServ ProxyScan Q QuoteServ SaslServ StatServ Alis eir,$nick,32)) {
;    haltdef 
;    if (!$query($nick)) { query $nick }                
;    $dll(spaces.dll, echo, -lmnrt $nick $chr(60) $+ $nick $+ $chr(62) $regsubex($rawmsg,/.+? :(.+)/,\1))
;  }
;else {
;  if ($istok(jenni Aelita,$nick,32)) { ;### Comment this line off if you want to force Notice->Query for all users.
;    haltdef
;    if (!$query($nick)) { query $nick }
;    $dll(spaces.dll, echo, -lmnrt $nick 5 $+ $chr(60) $+ $nick $+ $chr(62) $regsubex($rawmsg,/.+? :(.+)/,\1))
;    ; beep 5 100
;    ;if ($appstate == minimized) || ($appactive == $false) {
;    ;noop $tip(UNotice,Private Notice $crlf $network, $nick notice: $1- , 20)
;    ;if ($1- !isnum) && ($highlight($1-)) { /window -ng1 @Highlights
;    ;/echo -ht @Highlights $chr(91) $+ $network $+ $chr(93) $chr(91) $+ $chan $+ $chr(93) $chr(60) $+ $nick $+ $chr(62) $1- }
;    ;}
;  }
;  if ($1- !isnum) && ($highlight($1-)) { /window -ng1 @Highlights
;  /echo -ht @Highlights $chr(91) $+ $network $+ $chr(93) $chr(91) $+ $chan $+ $chr(93) $chr(60) $+ $nick $+ $chr(62) $1- }
;} | ; ### Comment this line off if you want to force Notice->Query for all users. 
;}

; ============================== Notices (User/non-dll) TO DO
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
; ==============================

; Notice (Channel)
ON ^*:NOTICE:*:#: {
  ;  haltdef
  ; beep 5 100
  window -ng1 @Notices
  echo -h @Notices 5 $+ $timestamp $chr(91) $+ $network $+ $chr(93) $chr(91) $+  $+ $chan $+ $chr(93) $chr(60) $+ $nick $+ $chr(62) $+  $1-
  ;echo $chan 5 $+ $timestamp - $+ $nick $+ : $+ $chan $+ - $1-
  ;  if ($appstate == minimized) || ($appactive == $false) {
  ;    noop $tip(CNotice,Channel Notice $crlf $network, $nick on $chan notice: $1- , 20)
  if ($1- !isnum) && ($highlight($1-)) { /window -ng1 @Highlights
  /echo -ht @Highlights $chr(91) $+ $network $+ $chr(93) $chr(91) $+ $chan $+ $chr(93) $chr(60) $+ $nick $+ $chr(62) $1- } 
}
;}

; Disable tips
ON *:APPACTIVE: {
  if ($tip(CNotice)) tip -c CNotice
  if ($tip(UNotice)) tip -c UNotice
}
