; ========== Minimise Freenode Channels ========== 
; Credit to Talon (#msl/SwiftIRC)
alias minimisefreenodechannels {
  .timer101 1 01 /mincurnet
  .timer102 1 03 /fnhomechannels
}

; -------------------- Minimisers --------------------
; Credit to Talon (#msl/SwiftIRC)
alias minall { //scon -a tokenize 44 $!regsubex($str($chr(44),$({,$window(*,0))),//g,$qt($window(*,\n))) $(|) window -n $!* }
alias mincurnet { //tokenize 44 $regsubex($str($chr(44),$({,$window(*,0))),//g,$qt($window(*,\n))) | window -n $* }

; -------------------- Maximisers --------------------
alias maxall { //scon -a tokenize 44 $!regsubex($str($chr(44),$({,$window(*,0))),//g,$qt($window(*,\n))) $(|) window -r $!* }
alias maxcurnet { //tokenize 44 $regsubex($str($chr(44),$({,$window(*,0))),//g,$qt($window(*,\n))) | window -r $* }

; -------------------- Fix (freenode) Channels --------------------
alias fixfnchans {
  .timer01 1 01 /maxcurnet
  .timer02 1 03 /minall
  .timer03 1 06 /fnhomechannels
}
; -------------------- Fix (all) Channels --------------------
alias fixchans { fixchannels }
alias fixchannels { .timer01 1 01 /minall | .timer02 1 02 /scon -a /fixchans.a }
alias -l fixchans.a { if ($network == freenode) { /fnhomechannels } } 

