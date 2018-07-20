# root user hasn't got password for security reasons
# urxvt -> st by me(neg-serg fork)
# compton
# new xresources
# dmenu -> rofi
# run-or-raise with ~/bin/ror.py
# xdotool for x11 windows managing(find by class/instance, etc)

! ===========================================================================
! URXVT
! ===========================================================================
URxvt.geometry:                115x40
URxvt.utf8: 1

! Font
URxvt.letterSpace: -2
!URxvt.font: xft:Source Code Pro:pixelsize=14
URxvt.font: xft:Liberation Mono:pixelsize=13
!:antialias=false:hinting=true
URxvt.depth: 24
URxvt.borderless: 1
URxvt.scrollBar: false
URxvt.scrollBar_right: false
URxvt.saveLines: 2000
URxvt.transparent: true
URxvt.shading: 2

! Meta modifier for keybindings
!URxvt.modifier: super

! perl extensions (offed: tabbed)
URxvt.perl-ext-common: default,url-select,selection-to-clipboard,font-size

! url-select (part of urxvt-perls package)
URxvt.keysym.M-u:           perl:url-select:select_next
URxvt.url-select.autocopy:  true
URxvt.url-select.button:    2
URxvt.url-select.launcher:  chromium
URxvt.url-select.underline: true

! Keybindings
URxvt.keysym.Shift-Up: command:\033]720;1\007
URxvt.keysym.Shift-Down: command:\033]721;1\007
URxvt.keysym.Control-Shift-V: eval:paste_clipboard
URxvt.keysym.Control-Shift-C: eval:selection_to_clipboard
URxvt.keysym.C-equal:     font-size:increase
URxvt.keysym.C-minus:   font-size:decrease
URxvt.keysym.C-plus:   font-size:incglobal
URxvt.keysym.C-underscore: font-size:decglobal
URxvt.keysym.Control-Up:   \033[1;5A
URxvt.keysym.Control-Down:    \033[1;5B
URxvt.keysym.Control-Left:    \033[1;5D
URxvt.keysym.Control-Right:    \033[1;5C

! disable the stupid ctrl+shift 'feature'
URxvt.iso14755: false
URxvt.iso14755_52: false

! ===========================================================================
! URxvt color scheme
! ===========================================================================
URxvt.background: #2B2B2B
URxvt.foreground: #DEDEDE
!URxvt.colorUL: #86a2b0
! black
URxvt.color0  : #2E3436
URxvt.color8  : #555753
! red
URxvt.color1  : #CC0000
URxvt.color9  : #EF2929
! green
URxvt.color2  : #4E9A06
URxvt.color10 : #8AE234
! yellow
URxvt.color3  : #C4A000
URxvt.color11 : #FCE94F
! blue
URxvt.color4  : #3465A4
URxvt.color12 : #729FCF
! magenta
URxvt.color5  : #75507B
URxvt.color13 : #AD7FA8
! cyan
URxvt.color6  : #06989A
URxvt.color14 : #34E2E2
! white
URxvt.color7  : #D3D7CF
URxvt.color15 : #EEEEEC

