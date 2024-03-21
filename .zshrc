# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Custom config

# Allow vim mode
bindkey -v

# Set jk to go to normal mode
bindkey 'jk' vi-cmd-mode
bindkey -M viins '^[[Z' reverse-menu-complete


if [ -f ~/.zsh_aliases ]; then
	source ~/.zsh_aliases
fi

# Color Makefile and Markdown files
export LS_COLORS='*Makefile=38;5;172:*.md=38;5;207:'

# Function to parse the current Git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt setup
set_prompt() {
  exit_status=$?
  if [[ "$PWD" == "$HOME" ]]; then
    if [[ "$exit_status" -ne 0 ]]; then
      PROMPT="%F{red}➜ %F{blue}$VIRTUAL_ENV_PROMPT~%F{green}$(parse_git_branch)%f "
    else
      PROMPT="%F{green}➜ %F{blue}$VIRTUAL_ENV_PROMPT~%F{green}$(parse_git_branch)%f "
    fi
  else
    if [[ "$exit_status" -ne 0 ]]; then
      PROMPT="%F{red}➜ %F{blue}$VIRTUAL_ENV_PROMPT%1~%F{green}$(parse_git_branch)%f "
    else
      PROMPT="%F{green}➜ %F{blue}$VIRTUAL_ENV_PROMPT%1~%F{green}$(parse_git_branch)%f "
    fi
  fi
}

# Using precmd() hook function to set prompt before each command
precmd_functions+=(set_prompt)

# Start using tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]]\
        && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
        $HOME/.config/Scripts/tmux_session.sh
fi

eval "$(zoxide init zsh)"
