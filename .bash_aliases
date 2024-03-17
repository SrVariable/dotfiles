# Config
#alias cbash='vim ~/.bashrc && source ~/.bashrc'
#alias cabash='vim ~/.bash_aliases && source ~/.bash_aliases'
alias ci3='vim ~/.config/i3/config'
alias cpolybar='vim ~/.config/polybar/config'
alias calacritty='vim ~/.config/alacritty/alacritty.toml'
alias cvim='vim ~/.vimrc'
alias ccvim='vim ~/.vim/colors/'
alias ctmux='vim ~/.config/tmux/tmux.conf'
alias czsh='vim ~/.zshrc && source ~/.zshrc'
alias cazsh='vim ~/.zsh_aliases && source ~/.zsh_aliases'

# Git
alias grt='git remote -v'
alias grs='git restore'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gcl='git clone --depth=1'
alias gl='git log --decorate --graph --all --oneline'
alias gls='git ls-files'
alias gp='git push'
alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias gsw='git switch'

# Python
alias py='python3'

# Sync
alias obsync='cd ~/ObsidianVault && git pull origin master && git add . && git commit -m "PC Manual Sync $(date)" && git push && cd -'

# System
alias install='sudo apt install -y'
alias remove='sudo apt remove --purge -y'
alias update='sudo apt update && sudo apt upgrade'

# Flyctl
alias flyctl='$HOME/.fly/bin/flyctl'

# Scripts
alias convert='$HOME/GitRepos/Scripts/Bash/convert_to_mp4.sh'
alias wrs='$HOME/GitRepos/Scripts/Bash/WordReferenceScrapper.sh'
alias gcmy='$HOME/GitRepos/Scripts/Bash/git_clone_my.sh'

# FZF
alias fzfd='cd "$(find ~/* -type d | fzf)"'

# Gnome Text Editor
alias gte='gnome-text-editor'

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
