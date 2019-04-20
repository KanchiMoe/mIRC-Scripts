; Lists
alias -l AllowedWolfgameChannels return #wolfgame ##werewolf ##werewolf-test
alias WolfgameBotNicks return lykosmas lycanthrope lykos pywolf Aelita lykost lykos2014

; Start of game detection
ON *:TEXT:$(* $+ $me $+ * Welcome to Werewolf, the $+ * ):#: {
  if ($istok($WolfgameBotNicks,$nick,32)) && ($istok($AllowedWolfgameChannels,$chan,32)) {
    set %WolfgameChannel $chan
    hmake Wolfgame
} }

; Role marking aliases.
alias seer { .guser -a WG-Specials $1 2 | /echo %WolfgameChannel 2*** Marked $1 as the 3Seer. | hadd Wolfgame $1 Seer }
alias harlot { .guser -a WG-Specials $1 2 | /echo %WolfgameChannel 2*** Marked $1 as the 3Harlot. | hadd Wolfgame $1 Harlot }
alias drunk { .guser -a WG-Specials $1 2 | /echo %WolfgameChannel 2*** Marked $1 as the 3Drunk. | hadd Wolfgame $1 Drunk }
alias gunner { ./guser -a WG-Specials $1 2 | /echo %WolfgameChannel 2*** Marked $1 as the 3Gunner. | set %WolfgameGunner $1 }
alias ga { ./guser -a WG-Specials $1 2 | /echo %WolfgameChannel 2*** Marked $1 as the 3Guardian Angel. | hadd Wolfgame $1 GA }
alias det { ./guser -a WG-Specials $1 2 | /echo %WolfgameChannel 2*** Marked $1 as the 3Detective. | hadd Wolfgame $1 Detective }
alias wolf { ./guser -a WG-Wolf $1 2 | /echo %WolfgameChannel 2*** Marked $1 as a 4Wolf. | hadd Wolfgame $1 Wolf | WolfVars $1 }
alias traitor { ./guser -a WG-Wolf $1 2 | /echo %WolfgameChannel 2*** Marked $1 as a 4Traitor. | hadd Wolfgame $1 Traitor }
alias crow { ./guser -a WG-Wolf $1 2 | /echo %WolfgameChannel 2*** Marked $1 as a 4Werecrow. | hadd Wolfgame $1 Werecrow }
alias halfsafe { ./guser -a WG-HalfSafe $1 2 | /echo %WolfgameChannel 2*** Marked $1 as a 7Half-safe. | hadd Wolfgame $1 HalfSafe | HalfVars $1 }
alias safe { ./guser -a WG-Safe $1 2 | /echo %WolfgameChannel 2*** Marked $1 as a 10Full safe. | hadd Wolfgame $1 Safe | SafeVars $1 }

; Special aliases for roles what can have several people.
alias -l WolfVars { if (%WolfgameWolves == $nill) { set %WolfgameWolves $1 } 
else { set %WolfgameWolves %WolfgameWolves $+ , $1 } }

alias -l HalfVars { if (%WolfgameHalfSafes == $nill) { set %WolfgameHalfSafes $1 }
else { set %WolfgameHalfSafes %WolfgameHalfSafes $+ , $1 } }

alias -l SafeVars { if (%WolfgameFullSafes == $nill) { set %WolfgameFullSafes $1 }
else { set %WolfgameFullSafes %WolfgameFullSafes $+ , $1 } }

; Automaticlly detect your role
ON *:TEXT:$(You * seer $+ *):?: { if ($istok($WolfgameBotNicks,$nick,32)) { 
    if ($hget(Wolfgame, $me) != $null) { halt } 
else { seer $me } } }
ON *:TEXT:$(You * harlot $+ *):?: { if ($istok($WolfgameBotNicks,$nick,32)) {
    if ($hget(Wolfgame, $me) != $null) { halt } 
else { harlot $me } } }
ON *:TEXT:$(You * village drunk $+ *):?: { if ($istok($WolfgameBotNicks,$nick,32)) {
    if ($hget(Wolfgame, $me) != $null) { halt } 
else { drunk $me } } }
ON *:TEXT:$(You * gun *):?: { if ($istok($WolfgameBotNicks,$nick,32)) { gunner $me } } 
ON *:TEXT:$(You * guardian angel $+ *):?: { if ($istok($WolfgameBotNicks,$nick,32)) {
    if ($hget(Wolfgame, $me) != $null) { halt } 
else { ga $me } } }
ON *:TEXT:$(You * detective $+ *):?: { if ($istok($WolfgameBotNicks,$nick,32)) {
    if ($hget(Wolfgame, $me) != $null) { halt } 
else { det $me } } }
ON *:TEXT:$(You * wolf $+ *):?: { if ($istok($WolfgameBotNicks,$nick,32)) {
    if ($hget(Wolfgame, $me) != $null) { halt } 
else { wolf $me } } }
ON *:TEXT:$(You * traitor $+ *):?: { if ($istok($WolfgameBotNicks,$nick,32)) {
    if ($hget(Wolfgame, $me) != $null) { halt } 
else { traitor $me } } }
ON *:TEXT:$(You * werecrow $+ *):?: { if ($istok($WolfgameBotNicks,$nick,32)) {
    if ($hget(Wolfgame, $me) != $null) { halt } 
else { crow $me } } }

; End of game detection
ON *:TEXT:$(*Game lasted *):#:{
  if ($istok($WolfgameBotNicks,$nick,32)) && ($istok($AllowedWolfgameChannels,$chan,32)) && (%WolfgameChannel == $chan) {
    EndOfGame
} }
; End of Game Sequance
alias EndOfGame {
  clearcolours
  hfree Wolfgame
  unset %Wolfgame*
  unset %WolfgameRole*
}

; Remove the colours from nicks.
alias clearcolours {
  ./rlevel -r WG-Specials
  ./rlevel -r WG-HalfSafe
  ./rlevel -r WG-Safe
  ./rlevel -r WG-Wolf
  echo %WolfgameChannel 5*** Colours have been cleared.
} 

alias WGRoles {
  ; Safe Team
  set %WolfgameRoleSeer $hfind(Wolfgame, Seer, 1, w).data
  set %WolfgameRoleHarlot $hfind(Wolfgame, Harlot, 1, w).data
  set %WolfgameRoleDrunk $hfind(Wolfgame, Drunk, 1, w).data
  set %WolfgameRoleGunner %WolfgameGunner
  set %WolfgameRoleGA $hfind(Wolfgame, GA, 1, w).data
  set %WolfgameRoleDet $hfind(Wolfgame, Detective, 1, w).data

  ; Wolf Team
  set %WolfgameRoleTraitor $hfind(Wolfgame, Traitor, 1, w).data
  set %WolfgameRoleWerecrow $hfind(Wolfgame, Werecrow, 1, w).data

  set %WolfgameRoleWolf $hfind(WolfgameWolves, *Wolf, 0, w)


  /AnnounceWGRoles
} 

alias -l AnnounceWGRoles {
  /msg %WolfgameChannel The safe team: %WolfgameRoleSeer (seer) %WolfgameRoleHarlot (harlot) %WolfgameRoleDrunk (drunk) %WolfgameRoleGunner (gunner) %WolfgameRoleGA (GA) %WolfgameRoleDet (det)
  /msg %wolfgameChannel %WolfgameRoleTraitor (traitor) %WolfgameRoleWerecrow (crow)
}





















; ================================================================================
; ANTI IDLE
on *:TEXT:$(* $+ $me $+ * You have been $+ *):#: { 
  if ($nick == pywolf) || ($nick == lykos) || ($nick == lycanthrope) {
    var  %WolfgameRandomTimer $rand(2,6)
    echo %WolfgameChannel 5*** Anti-idle script will be triggered in %WolfgameRandomTimer seconds.
    .timerWolfClock 1 %WolfgameRandomTimer /msg %WolfgameChannel .
  }
}
