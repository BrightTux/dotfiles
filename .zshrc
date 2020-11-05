# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=10000
setopt autocd extendedglob nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tux/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# -----------------------------  Custom Setup  ---------------------------------
export FZF_COMPLETION_TRIGGER='x' # default is **


stty -ixon # disable ctrl-S halting terminal
export EDITOR='nvim'
alias vim='nvim'
alias f2b='sudo fail2ban-client status sshd'
alias sd='systemctl status sshd'
alias f='grep --line-buffered -r "" * | fzf'
alias o='xdg-open'

# esc then v to edit in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Run tmux on bash startup & attach is session exist
# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

# Should be at the end of the file
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
