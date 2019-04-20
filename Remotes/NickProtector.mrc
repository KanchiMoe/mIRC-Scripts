alias nickprotector.nicks return [] ^ Chiyo Chiyo-chan
alias nickprotector.hosts.trusted return *!*@pdpc/supporter/active/chiyo

alias nickprotector.isprotected {
  if ($1 == $me) {
    return $false
  }
  if ($istok($nickprotector.nicks, $1, 32)) {
    if ($istok($nickprotector.hosts.trusted, $wildsite, 32)) {
      return $false
    }
    return $true
  }
  return $false
}

alias nickprotector.command return .msg NickServ release $1

on *:JOIN:#: {
  if ($nickprotector.isprotected($nick)) {
    $nickprotector.command($nick)
  }
}

on *:NICK: {
  if ($nick == $me) {
    halt
  }
  if ($nickprotector.isprotected($newnick)) {
    $nickprotector.command($newnick)
  }
}
