set -g theme_display_virtualenv yes
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -gx PATH /home/rayhaan/bin /home/rayhaan/.nvm/versions/node/v17.0.1/bin /home/rayhaan/clang+llvm/bin /home/rayhaan/ccls/Release /home/rayhaan/.local/bin $PATH

set GPG_TTY (tty)
export GPG_TTY
[ -f "/home/$user/.ghcup/env" ] && source "/home/$user/.ghcup/env" # ghcup-env
source /usr/share/nvm/init-nvm.sh

set -gx LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/rayhaan/clang+llvm/include
setxkbmap -option caps:escape
clear
