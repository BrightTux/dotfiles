# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt CASE_GLOB
setopt correct # autocorrects?
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tux/.zshrc'

autoload -Uz compinit
compinit
# zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'
# End of lines added by compinstall
autoload -Uz promptinit
promptinit
# End of lines added by promptinit
autoload -U bashcompinit
bashcompinit

# -----------------------------  Custom Setup  ---------------------------------
export FZF_COMPLETION_TRIGGER='**' # default is **

## Colorize the ls output ##
alias ls='ls --color=auto'
alias la='ls -la'


stty -ixon # disable ctrl-S halting terminal
export EDITOR='nvim'
alias vim='nvim'
alias f2b='sudo fail2ban-client status sshd'
alias sd='systemctl status sshd'
alias f='grep --line-buffered -r "" * | fzf'
alias o='xdg-open'


# ---------- temp alias ------------
alias uv='cd ~/Documents/uvlight; source ~/Documents/uvlight/uv/bin/activate'


# ----- source files in ~/bin/
export PATH="$PATH:/home/tux/bin"

# esc then v to edit in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Run tmux on bash startup & attach is session exist
# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

# Should be at the end of the file
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
