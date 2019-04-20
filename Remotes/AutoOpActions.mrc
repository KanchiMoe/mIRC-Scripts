alias -l opme { .msg ChanServ op $chan $me }
alias -l deopme { .mode $chan -o $me }

alias om { omode $1- }
alias omode {
  if ($1- == $null) { /echo $chan 5*** Error: No modes included. }
  elseif (+* iswm $1-) || (-* iswm $1-) { 
  set %cmd1 mode $chan $1- | opme }
  else { /echo $chan 5*** Error: No + or - included. Attempted command: /omode $1-  }
}

alias ok { okick $1- }
alias okick {
  if ($1- == $null) { /echo $chan 5*** Error: No user to kick. }
  elseif ($1 ison $chan) { set %cmd1 kick $1 $2- | opme }
  else { /echo $chan 5*** Error: $1 is not on $chan  } 
}

alias or { oremove $1- }
alias oremove {
  if ($1- == $null) { /echo $chan 5*** Error: No user to remove. }
  elseif ($1 ison $chan) { set %cmd1 quote remove $chan $1 : $+ $2- | opme }
  else { /echo $chan 5*** Error: $1 is not on $chan  } 
}

alias oq { oquiet $1- }
alias oquiet {
  if ($1 == $null) { /echo $chan 5*** Error: No ban mask provided. }
  elseif ($chr(64) isin $1) {
    if ($1 != $null) && ($2- == $null) { set %cmd1 mode $chan +q $1- | opme }
    elseif ($2 != $null) && ($3- == $null) { set %cmd1 mode $chan +qq $1- | opme }
    elseif ($3 != $null) && ($4- == $null) { set %cmd1 mode $chan +qqq $1- | opme }
    elseif ($4 != $null) { set %cmd1 mode $chan +qqqq $1- | opme }
  }
  elseif ($1 ison $chan) { 
    if ($1 != $null) && ($2- == $null) { set %cmd1 mode $chan +q $address($1,2) | opme }
    elseif ($2 != $null) && ($3- == $null) { set %cmd1 mode $chan +qq $address($1,2) $address($2,2) | opme }
    elseif ($3 != $null) && ($4- == $null) { set %cmd1 mode $chan +qqq $address($1,2) $address($2,2) $address($3,2) | opme }
    elseif ($4 != $null) { set %cmd1 mode $chan +qqqq $address($1,2) $address($2,2) $address($3,2) $address($4,2) | opme }
  }
  else { /echo $chan 5*** Error: $1 is not on $chan  } 
}

alias ouq { ouquiet $1- }
alias ouquiet {
  if ($1 == $null) { /echo $chan 5*** Error: No ban mask provided. }
  elseif ($chr(64) isin $1) {
    if ($1 != $null) && ($2- == $null) { set %cmd1 mode $chan -q $1- | opme }
    elseif ($2 != $null) && ($3- == $null) { set %cmd1 mode $chan -qq $1- | opme }
    elseif ($3 != $null) && ($4- == $null) { set %cmd1 mode $chan -qqq $1- | opme }
    elseif ($4 != $null) { set %cmd1 mode $chan -qqqq $1- | opme }
  }
  elseif ($1 ison $chan) { 
    if ($1 != $null) && ($2- == $null) { set %cmd1 mode $chan -q $address($1,2) | opme }
    elseif ($2 != $null) && ($3- == $null) { set %cmd1 mode $chan -qq $address($1,2) $address($2,2) | opme }
    elseif ($3 != $null) && ($4- == $null) { set %cmd1 mode $chan -qqq $address($1,2) $address($2,2) $address($3,2) | opme }
    elseif ($4 != $null) { set %cmd1 mode $chan -qqqq $address($1,2) $address($2,2) $address($3,2) $address($4,2) | opme }
  }
  else { /echo $chan 5*** Error: $1 is not on $chan  } 

}

alias ob { oban $1- }
alias oban {
  if ($1 == $null) { /echo $chan 5*** Error: No ban mask provided. }
  elseif ($chr(64) isin $1) {
    if ($1 != $null) && ($2- == $null) { set %cmd1 mode $chan +b $1- | opme }
    elseif ($2 != $null) && ($3- == $null) { set %cmd1 mode $chan +bb $1- | opme }
    elseif ($3 != $null) && ($4- == $null) { set %cmd1 mode $chan +bbb $1- | opme }
    elseif ($4 != $null) { set %cmd1 mode $chan +bbbb $1- | opme }
  }
  elseif ($1 ison $chan) { 
    if ($1 != $null) && ($2- == $null) { set %cmd1 mode $chan +b $address($1,2) | opme }
    elseif ($2 != $null) && ($3- == $null) { set %cmd1 mode $chan +bb $address($1,2) $address($2,2) | opme }
    elseif ($3 != $null) && ($4- == $null) { set %cmd1 mode $chan +bbb $address($1,2) $address($2,2) $address($3,2) | opme }
    elseif ($4 != $null) { set %cmd1 mode $chan +bbbb $address($1,2) $address($2,2) $address($3,2) $address($4,2) | opme }
  }
  else { /echo $chan 5*** Error: $1 is not on $chan  } 

}

;okban

alias bn { obotnet $1- }
alias obn { obotnet $1-  }
alias obotnet {  
  if ($1 == $null) { /echo $chan 5*** Error: No nick provided. }
  else { set %cmd1 mode $chan +b $address($1-,2) $+ $chr(36) $+ ##not-a-honeypot | set %cmd2 remove $1- Possible botnet. Please /msg if this is incorrect. | opme } }

ON *:OP:#:{
  if (($opnick == $me) && (%cmd1)) {
    %cmd1
    %cmd2
    %cmd3
    unset %cmd*
    deopme
  } 
}

