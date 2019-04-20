on *:TEXT:*cake*:#: {
  ; Sets vars with the results
  var %cake.Enabled $hget(cake.enabled, $network $+ . $+ $chan)
  var %cake.Amount $hget(cake.amount, $network $+ . $+ $chan)
  var %cake.Reset $hget(cake.reset, $network $+ . $+ $chan)

  ; Sets if script has already been ran
  var %cake.AmountCounter = $($+(%,cake.,$network,.,$chan),2)

  ; Starts running the script
  if (%cake.Enabled == d) { halt }
  if (%cake.Enabled == $null) { cakeNIT $1- }
  if (%cake.Enabled == e) {
    if (!%cake.AmountCounter) set -u $+ %cake.Reset % $+ cake. $+ $network $+ . $+ $chan 1
    else set -k % $+ cake. $+ $network $+ . $+ $chan $calc($(% $+ cake. $+ $network $+ . $+ $chan) + 1)
    if ($($+(%,cake.,$network,.,$chan),2) > %cake.Amount) return 
    msg $chan 04,01C07A08K09E 11I12S 13A 04L07I08E
    /window -ng1 @cakelog  0 0 555 338 
    /flash @cakelog
    /echo @cakelog $timestamp $chan $+(<,$nick,>) $replace($1-, cake, $+($chr(3), 4, cake, $chr(3)))
  }
}

alias cake {
  if ($1 == e) { 
    set -u1 %cake.Operation $1 | set -u1 %cake.Channel $2 | set -u1 %cake.AmountVar $3 | set -u1 %cake.ResetVar $4
    if (%cake.AmountVar == $null) { .set -u5 %cake.AmountVar 2 }
    if (%cake.ResetVar == $null) { .set -u5 %cake.ResetVar 300 }
    if (!%cake.Channel) { CakeFailure | halt }
    hadd cake.enabled $network $+ . $+ %cake.Channel e
    hadd cake.reset $network $+ . $+ %cake.Channel %cake.ResetVar
    hadd cake.amount $network $+ . $+ %cake.Channel %cake.AmountVar
  CakeSucess }
  if ($1 == d) {
    set -u1 %cake.Operation $1 | set -u1 %cake.Channel $2 
    if (!%cake.Channel) { CakeFailure | halt }
    hadd cake.enabled $network $+ . $+ %cake.Channel d
    hdel cake.reset $network $+ . $+ %cake.Channel
    hdel cake.amount $network $+ . $+ %cake.Channel
  CakeSucess }
if ($1 == $null) { /msg $chan 04,01C07A08K09E 11I12S 13A 04L07I08E } }

; Cake Not In Table
alias -l cakeNIT { 
  /window -eg1 @cakelog  0 0 1000 338 
  /flash @cakelog
  /echo @cakelog 5 $+ $timestamp Notice: Someone said cake in  $+ $chan $+  on the network  $+ $network $+ .
  /echo @cakelog 5 $+ $timestamp However, this channel is not currently in the database for  $+ $network $+ .
  /echo @cakelog 5 $+ $timestamp To disable this channel, please type 4 $+ /cake d $chan
  /echo @cakelog 5 $+ $timestamp To enable this channel, please type 3 $+ /cake e $chan [Amount] [Reset time]
}

alias -l CakeSucess {
  if (%cake.Operation == d) { var %cake.Echo 4DISABLE 5 $+ %cake.Channel $+  was disabled on  $+ $network $+ . }
  if (%cake.Operation == e) { var %cake.Echo 3ENABLE5 %cake.Channel $+  was enabled on  $+ $network $+ . ( $+ %cake.AmountVar trigger(s) in %cake.ResetVar seconds.) }
  /window -eg1 @cakelog  0 0 1000 338 
  /echo @cakelog 5 $+ $timestamp %cake.Echo
  .timerCakeD 1 03 /window -c @cakelog
}

alias -l CakeFailure {
  /window -eg1 @cakelog  0 0 1000 338 
  /echo @cakelog 5 $+ $timestamp *** Error: No chanenl given.
}

; Aliases to find the hash table files
alias -l cake.enabled { return $+(",$scriptdirtables\cake.enabled.dat,") }
alias -l cake.reset { return $+(",$scriptdirtables\cake.reset.dat,") }
alias -l cake.amount { return $+(",$scriptdirtables\cake.amount.dat,") }

; Loads/populates tables on start
on *:start:{
  if (!$hget(cake.cake.enabled)) { hmake cake.enabled 200 }
  if (!$hget(cake.reset)) { hmake cake.reset 200 }
  if (!$hget(cake.amount)) { hmake cake.amount 200 }
  if ($isfile($cake.enabled)) { hload cake.enabled $cake.enabled }
  if ($isfile($cake.reset)) { hload cake.reset $cake.reset }
  if ($isfile($cake.amount)) { hload cake.amount $cake.amount }
}

; Loads/populates tables on load
on *:load: {
  hmake cake.enabled 200
  hmake cake.reset 200
  hmake cake.amount 200
  if ($isfile($cake.enabled)) { hload cake.enabled $cake.enabled }
  if ($isfile($cake.reset)) { hload cake.reset $cake.reset }  
  if ($isfile($cake.amount)) { hload cake.amount $cake.amount }
}

; Saves table data on exit
on *:exit: { 
  hsave cake.enabled $cake.enabled
  hsave cake.reset $cake.reset
  hsave cake.amount $cake.amount
}
