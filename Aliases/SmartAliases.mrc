/deop {
  if ($1 == $nill) { /mode $chan -o $me }
  else { if ($me isop $chan) { /mode $chan -o $1 }
    else { /cs deop $chan $1 }
  }
}

/op { 
  if ($1 == $nill) { /cs op $chan $me }
  else { /cs op $chan $1 } 
}
