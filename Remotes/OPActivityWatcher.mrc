r; ========== MODE CHANGES ==========

; ========================= BAN WATCHER =========================
; ===== BAN =====
on *:BAN:#:{
  /window -ng1 @OPActivity 0 0 1000 338 
  /flash @OPActivity
  /echo -ht @OPActivity 4BAN 2 $+ $nick $+  banned 2 $+ $banmask $+  from 2 $+ $chan $+  on 2 $+ $network $+ 
}

; ===== UNBAN ===== 
on *:UNBAN:#:{
  /window -ng1 @OPActivity 0 0 1000 338 
  /flash @OPActivity
  /echo -ht @OPActivity 12UNBAN 2 $+ $nick $+  unbanned 2 $+ $banmask $+  from 2 $+ $chan $+  on 2 $+ $network $+ 
}

; ===== KICK =====
on *:KICK:#:{
  /window -ng1 @OPActivity 0 0 1000 338 
  /flash @OPActivity
  /echo -ht @OPActivity 7KICK 2 $+ $nick $+  kicked 2 $+ $knick $+  from 2 $+ $chan $+  reason: 2 $+ $1- $+   on 2 $+ $network $+ 
}

; ===== QUIET/UNQUIET =====

on *:signal:rmode: {
  if ($1 === +q) {
    if (%%nick != GLyKOS) && (%%nick != lycan) && (%%nick != lykos) && (%%nick != Lugaru)  {
      /window -ng1 @OPActivity 0 0 1000 338 
      /flash @OPActivity
      /echo -h @OPActivity $timestamp 7QUIET 2 $+ %%nick $+  quieted 2 $+ $2 $+  in 2 $+ %%chan $+  on 2 $+ $network $+ 
    }
  }
  elseif ($1 === -q) {
    if (%%nick != GLyKOS) && (%%nick != lycan) && (%%nick != lykos) && (%%nick != Lugaru) {
      /window -ng1 @OPActivity 0 0 1000 338 
      /flash @OPActivity
      /echo -h @OPActivity $timestamp 12UNQUIET 2 $+ %%nick $+  unquieted 2 $+ $2 $+  in 2 $+ %%chan $+  on 2 $+ $network $+ 
    }
  }
  elseif ($1 === +c) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +c $+  2 $+ %%nick $+  disabled colours in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === -c) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ -c $+  2 $+ %%nick $+  allowed colours in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === +C) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +C $+  2 $+ %%nick $+  disabled CTCP in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === -C) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ -C $+  2 $+ %%nick $+  allowed CTCP in 2 $+ %%chan $+  on 2 $+ $network $+ 
  } 
  elseif ($1 === +e) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +e $+  2 $+ %%nick $+  added a ban exemption on 2 $+ $2 $+  in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === -e) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ -e $+  2 $+ %%nick $+  removed a ban exemption on 2 $+ $2 $+  in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === +F) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +F $+  2 $+ %%nick $+  set free forwarding in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === -F) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +F $+  2 $+ %%nick $+  unset free forwarding in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === +f) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +f $+  2 $+ %%nick $+  set forwarding to 2 $+ $2 $+  in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === -f) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ -f $+  2 $+ %%nick $+  removed forwarding in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === +g) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +g $+  2 $+ %%nick $+  set free invite in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === -g) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ -g $+  2 $+ %%nick $+  removed free invite in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === +i) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +i $+  2 $+ %%nick $+  set 2 $+ %%chan $+  to invite only on 2 $+ $network $+ 
  }
  elseif ($1 === -i) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ -i $+  2 $+ %%nick $+  removed invite only on 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === +I) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +I $+  2 $+ %%nick $+  set an invite exemption on 2 $+ $2 $+  in 2 $+ %%chan $+  on 2 $+ $network $+  
  }
  elseif ($1 === -I) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ -I $+  2 $+ %%nick $+  removed an invite exemption on 2 $+ $2 $+  in 2 $+ %%chan $+  on 2 $+ $network $+   
  }
  elseif ($1 === +j) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +j $+  2 $+ %%nick $+  set a join throttle of 2 $+ $gettok($2,1,58) joins $+  in 2 $+ $gettok($2,2,58) seconds $+  in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === -j) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ -j $+  2 $+ %%nick $+  removed the join throttle on 2 $+ %%chan $+  on 2 $+ $network $+   
  }
  elseif ($1 === +k) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ +k $+  2 $+ %%nick $+  set a key of 2 $+ $2 $+  in 2 $+ %%chan $+  on 2 $+ $network $+ 
  }
  elseif ($1 === -k) {
    /window -ng1 @OPActivity 0 0 1000 338
    /flash @OPActivity
    /echo -ht @OPActivity 12 $+ -k $+  2 $+ %%nick $+  removed they key on 2 $+ %%chan $+  on 2 $+ $network $+  
  }

  ; L,l,m,n,o,p,P,q,Q,r,s,t,z

}

; ===== REMOVE =====
on *:PART:#: {
  if ($1 == requested) {
    /window -ng1 @OPActivity 0 0 1000 338 
    /flash @OPActivity
    /echo -h @OPActivity $timestamp 7REMOVE 2 $+ $3 $+  removed 2 $+ $nick $+  from 2 $+ $chan $+  reason 2 $+ $4- $+  on 2 $+ $network $+ 
  }
}

; # ===== KLINE/KILLED =====
on *:QUIT: {
  if ($1- == K-Lined) {
    /window -ng1 @OPActivity  0 0 1000 338 
    /flash @OPActivity
    /echo -h @OPActivity 4K-LINE $nick ( $+ $ial($nick).host $+ ) on 2 $+ $network $+ 
    /
  }
  if (Killed * iswm $1-) {
    /window -ng1 @OPActivity  0 0 1000 338 
    /flash @OPActivity
    /echo -h @OPActivity 4KILLED $nick ( $+ $ial($nick).host $+ ) ( $+ $1- $+ ) on 2 $+ $network $+ 
  }
}
