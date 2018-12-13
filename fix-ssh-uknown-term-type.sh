# Problem
# 'rxvt-unicode-256color': unknown terminal type.

# Solution
# export TERM to some compatible terminal
export TERM='xterm-256color'
# copy db file to remote server
scp /usr/share/terminfo/r/rxvt-unicode-256color user@server:.terminfo/r
