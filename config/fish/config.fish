# global
set -gx EDITOR nvim
set fish_greeting ""

# git
alias g="git"
alias gf="git fetch"
alias gp="git pull"
alias ga="git add"
alias gst="git status"
alias gci="git commit -m"
alias gcim="git commit -am"
alias gco="git checkout"
alias gbr="git branch"
alias gps="git push"

# editor
alias v="nvim"
alias code="codium"

# file
alias ld="eza -lD"
alias lh="eza -dl .* --group-directories-first"
alias ll="eza -al --group-directories-first"
alias ls="eza -alf --color=always --sort=size | grep -v /"
alias lt="eza -al --sort=modified"
alias yz="yazi"

# terminal
alias t="tmux"

# system
alias bl="sudo systemctl enable bluetooth.service"
alias pkglist="pacman -Qqen > pkglist-official.txt && pacman -Qqem > pkglist-aur.txt"
# restore official: sudo pacman -S - < pkglist-official.txt
# restore aur:      yay -S - < pkglist-aur.txt

# network
alias wlan="~/.scripts/rofi-wifi-menu.sh"

# apps
alias sp="spotifyctl"

# shell
starship init fish | source
zoxide init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/alipnf/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
