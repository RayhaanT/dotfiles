set -g theme_display_virtualenv yes
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -gx PATH /home/rayhaan/bin /home/rayhaan/.nvm/versions/node/v17.0.1/bin /home/rayhaan/clang+llvm/bin /home/rayhaan/ccls/Release /home/rayhaan/.local/bin /home/rayhaan/.cargo/bin $PATH

set GPG_TTY (tty)
export GPG_TTY
[ -f "/home/$user/.ghcup/env" ] && source "/home/$user/.ghcup/env" # ghcup-env

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
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Commit shorthand
function gc
    git commit -m "$argv"
end
