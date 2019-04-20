/me's { echo it worked! }

/deop {
  if ($1- == $nill) { /mode $chan -o $me }
  elseif ($me isop $chan) { /mode $chan -oooo $1- }
  elseif ($2 == $nill) { /cs deop $chan $1 }
  elseif ($3 == $nill) { /cs deop $chan $1 | /cs deop $chan $2 }
  elseif ($4 == $nill) { /cs deop $chan $1 | /cs deop $chan $2 | /cs deop $chan $3 }
  elseif ($4 != $nill) { /cs deop $chan $1 | /cs deop $chan $2 | /cs deop $chan $3 | /cs deop $chan $4 }
}

/devoice {
  if ($1- == $nill) { /cs devoice $chan $me }
  elseif ($me isop $chan) { /mode $chan -vvvv $1- }
  elseif ($2 == $nill) { /cs devoice $chan $1 }
  elseif ($3 == $nill) { /cs devoice $chan $1 | /cs devoice $chan $2 }
  elseif ($4 == $nill) { /cs devoice $chan $1 | /cs devoice $chan $2 | /cs devoice $chan $3 }
  elseif ($4 != $nill) { /cs devoice $chan $1 | /cs devoice $chan $2 | /cs devoice $chan $3 | /cs devoice $chan $4 }
}

/op {
  if ($1- == $nill) { /cs op $chan $me }
  elseif ($me isop $chan) { /mode $chan +oooo $1- }
  elseif ($2 == $nill) { /cs op $chan $1 }
  elseif ($3 == $nill) { /cs op $chan $1 | /cs op $chan $2 }
  elseif ($4 == $nill) { /cs op $chan $1 | /cs op $chan $2 | /cs op $chan $3 }
  elseif ($4 != $nill) { /cs op $chan $1 | /cs op $chan $2 | /cs op $chan $3 | /cs op $chan $4 }
}

/voice {
  if ($1- == $nill) { /cs voice $chan $me }
  elseif ($me isop $chan) { /mode $chan +vvvv $1- }
  elseif ($2 == $nill) { /cs voice $chan $1 }
  elseif ($3 == $nill) { /cs voice $chan $1 | /cs voice $chan $2 }
  elseif ($4 == $nill) { /cs voice $chan $1 | /cs voice $chan $2 | /cs voice $chan $3 }
  elseif ($4 != $nill) { /cs voice $chan $1 | /cs voice $chan $2 | /cs voice $chan $3 | /cs voice $chan $4 }
}
