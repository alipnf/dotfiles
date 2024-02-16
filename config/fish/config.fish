if status is-interactive
    # Commands to run in interactive sessions can go here
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
    alias code="codium"
    alias ll="exa --long --header -a"
    alias bl="sudo systemctl enable bluetooth.service"
    alias wlan="networkmanager_dmenu"
    alias v="nvim"
    alias sxs="sudo xampp start"
    alias sp="spotifyctl"
    alias pkglist="pacman -Qqe > package_list.txt"
    alias t="tmux"
end

starship init fish | source
