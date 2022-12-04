set -g theme_display_virtualenv yes
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -gx PATH /home/rayhaan/bin /home/rayhaan/.nvm/versions/node/v17.0.1/bin /home/rayhaan/clang+llvm/bin /home/rayhaan/ccls/Release /home/rayhaan/.local/bin /home/rayhaan/.cargo/bin /home/rayhaan/.local/share/coursier/bin $PATH

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

function uml
    java -jar ~/Downloads/plantuml.jar -tpdf "$argv" > /dev/null 2>&1
end

xset r rate 200 40

function cisco
    /opt/cisco/anyconnect/bin/vpnui
end

export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/rayhaan/.ghcup/bin # ghcup-env
