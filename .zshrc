# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
bindkey '^R' history-incremental-search-backward

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rayhaan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/.local/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Enable cargo environment
. "$HOME/.cargo/env"

# GPG password prompt in terminal
GPG_TTY=$(tty)
export GPG_TTY

# Case insensitive autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Git shorthand
alias gf="git fetch"
alias gp="git pull"
alias ga="git add --all; git status"
alias gs="git status"
alias gd="git difftool"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

function gc() {
    git commit -m "$argv"
}

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setxkbmap -option caps:escape &> /dev/null

# To enable screen recording:
# /usr/lib/xdg-desktop-portal -r & /usr/lib/xdg-desktop-portal-wlr
export XDG_CURRENT_DESKTOP=sway
export MOZ_ENABLE_WAYLAND=1
