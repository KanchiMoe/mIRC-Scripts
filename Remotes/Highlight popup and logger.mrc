; ======================================
; This script uses colours! Please see the
; notice located at: 
; https://github.com/Chiyo-chan/mIRC-Scripts/blob/master/README.md
; for why this is important.
; ======================================
; Credit to the guys in #msl on SwiftIRC. 
;
; Ok, so what this script does is, whenever
; you get highlighted, the window "@Highlight"
; is made and the highlight is sent to that
; window, it includes the timestamp, network,
; and channel. The window doesn't "pop up" at
; you when you are highlighted but it will make
; a window appear which you can open up if you
; wish.
;
; [01:23:45 A] [Network] [#Example] <Foobar> Hey Chiyo!
;
; It works out if you have been highlighted
; by reading what is in your highlight list
; (Alt+B > Highlight). 
;
; The timestamp depends on how you have your
; timestamps set up will look different to how
; it is displayed above.
;
; If you are highlighted in a query, the channel
; part will become "[]" and if you are
; highlighted when someone uses /me, the text
; will be purple (colour 6).
;
; [01:23:45 A] [Network] [] <Foobar> Hey Chiyo!
; [01:23:45 A] [Network] [#Example] * Foobar waves to Chiyo!
;
; In order to get the window to log, you will need to do
; /log on @Highlight
; and everything what appears in the window will be logged.

on *:TEXT:*:* {
  if ($1- !isnum) && ($highlight($1-)) { 
    /window -ng1 @Highlight
    /echo -ht @Highlight $chr(91) $+ $network $+ $chr(93) $chr(91) $+ $chan $+ $chr(93) $chr(60) $+ $nick $+ $chr(62) $1-
  }
}
on *:ACTION:*:* {
  if ($1- !isnum) && ($highlight($1-)) {
    /window -ng1 @Highlight
    /echo -ht @Highlight $chr(91) $+ $network $+ $chr(93) $chr(91) $+ $chan $+ $chr(93) 6 $+ * $nick $1-
  }
}
