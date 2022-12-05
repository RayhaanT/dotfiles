set -g theme_display_virtualenv yes
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -g theme_show_exit_status yes
set -gx PATH /home/rayhaan/bin /home/rayhaan/.nvm/versions/node/v17.0.1/bin /home/rayhaan/clang+llvm/bin /home/rayhaan/ccls/Release /home/rayhaan/.local/bin /home/rayhaan/.cargo/bin $PATH

set GPG_TTY (tty)
export GPG_TTY
#[ -f "/home/$user/.ghcup/env" ] && source "/home/$user/.ghcup/env" # ghcup-env

setxkbmap -option caps:escape

# Useful aliases
# Add git ssh key
function gssh
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
end

# Git shorthand
alias gf="git fetch"
alias gp="git pull"
alias ga="git add --all; git status"
alias gs="git status"
alias gd="git difftool"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Commit shorthand
function gc
    git commit -m "$argv"
end

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

function b
    sudo brightnessctl s "$argv"
end

function uml
    java -jar ~/Downloads/plantuml.jar -tpdf "$argv" > /dev/null
end

xset r rate 250 40

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/rayhaan/.ghcup/bin # ghcup-env

thefuck --alias | source

function 246
    cd ~/Documents/CS-246e
end
function 245
    cd ~/Documents/CS-245e
end
function 241
    cd ~/Documents/CS-241e
end
function 240
    cd ~/Documents/STAT-240
end
function 250
    cd ~/Documents/AMATH-250
end

function anyconnect
    /opt/cisco/anyconnect/bin/vpnui
end
