# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Display the name of the branch
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Format the prompt
set_prompt() {
	exit_status=$?
	arrow_prompt="\[\033[1;32m\]➜ "
	if [ "$exit_status" -ne 0 ]; then
	    arrow_prompt="\[\033[1;31m\]➜\[\033[0m\] "
	fi

	venv_prompt="\[\033[1;35m\]($VIRTUAL_ENV_PROMPT)\[\033[0m\] "
	if [ "$VIRTUAL_ENV_PROMPT" == "" ]; then
	    venv_prompt=""
	fi

	if [ $(pwd | grep $HOME) ]; then
	    current_dir="\[\033[1;34m\]~${PWD##$HOME}"
	else
	    current_dir="\[\033[1;34m\]$PWD"
	fi

	branch_prompt="\[\033[1;32m\]$(parse_git_branch)\[\033[0m\] "

	PS1="$arrow_prompt$venv_prompt$current_dir$branch_prompt\[\033[0m\]"
}

# Terminal prompt display
PROMPT_COMMAND='set_prompt'; export PROMPT_COMMAND

export PATH=$PATH:$HOME/.local/bin
export EDITOR=nvim

alias v=nvim
alias vim=nvim
alias rg="rg --vimgrep"
alias bat="batcat"
alias diff="diff --color"
function create() {
    mkdir -p $1
    cd $1
}

alias virt-manager="GDK_SCALE=1 GDK_DPI_SCALE=1.25 virt-manager"

alias tmp="v $(mktemp)"

alias calacritty="nvim ~/.config/alacritty/alacritty.toml"
alias ci3="nvim ~/.config/i3/config"
alias ci3status="nvim ~/.config/i3status/config"
alias ctmux="nvim ~/.config/tmux/tmux.conf"
alias cbash="nvim ~/.bashrc && source ~/.bashrc"
alias i3lock="i3lock -c 222222 -e -f"
alias fd="fdfind -H"
alias ls="ls -h --color"
alias lastpic="ls -dt --color=never $HOME/Pictures/Screenshots/* | head -1"

alias preview="live-server --port=9876 --no-browser &> /dev/null &  echo 'Previewing http://localhost9876, remember to pkill $!' && zen --private-window http://localhost:9876 &"

. "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(zoxide init bash --cmd j)"

# Start using tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]]\
	&& [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	    $HOME/.config/tmux/tmux_session.sh
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$PATH:$HOME/Downloads/flutter/bin"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Added by flyctl installer
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
