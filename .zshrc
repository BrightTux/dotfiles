# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=10000
SAVEHIST=50000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

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

# Tranfer sh function
transfer(){
  if [ $# -eq 0 ]; then
    echo "No arguments specified.\nUsage:\ntransfer <file|directory>\ntransfer <file_name>">&2;
    return 1;
  fi;
  if tty -s; then
    file="$1";
    file_name=$(basename "$file");
    if [ ! -e "$file" ]; then
      echo "$file: No such file or directory">&2;
      return 1;
    fi;
    if [ -d "$file" ]; then
      file_name="$file_name.zip";
      (cd "$file"&&zip -r -q - .) | curl -H "Max-Downloads: 1" -H "Max-Days: 1" -X PUT --upload-file "-" "http://transfer.sh/$file_name" | tee /dev/null;
    else
      cat "$file" | gpg -ac -o- | curl -H "Max-Downloads: 1" -H "Max-Days: 1" -X PUT --upload-file "-" "http://transfer.sh/$file_name" | tee /dev/null;
    fi;
  else file_name=$1;
    cat $1 | gpg -ac -o- | curl -H "Max-Downloads: 1" -H "Max-Days: 1" -X PUT --upload-file "-" "http://transfer.sh/$file_name" | tee /dev/null;
  fi;
}

alias gen_pw='< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c 15 | xclip -sel clip'

## Colorize the ls output ##
alias ls='ls --color=auto'
alias la='ls -la'


stty -ixon # disable ctrl-S halting terminal
# alias vim='/usr/bin/nvim'
export EDITOR=nvim
export VISUAL=nvim
alias f2b='sudo fail2ban-client status sshd'
alias sd='systemctl status sshd'
alias f='grep --line-buffered -r "" * | fzf'
alias o='xdg-open'
alias ff='w3m $(fzf --height 50%)'
alias vt='nvim +terminal'
alias vd='nvim -d'
alias test='cd /home/tux/ScratchPad'

alias -s md=nvim
alias -s wiki=nvim

alias nn='nvim -u NONE'
alias n='nvim'

alias icat="kitty +kitten icat"


# ---------- temp alias ------------
alias uv='cd ~/Documents/uvlight; source ~/Documents/uvlight/uv/bin/activate'
alias rep='cd ~/Desktop/wfh/tand/tandd; source ~/Desktop/wfh/ir_cam/clarence_venv/bin/activate'
alias pid='cd /home/tux/Desktop/wfh/person_reid; source myenv/bin/activate'


# ----- source files in ~/bin/
export PATH="$PATH:/home/tux/bin"

# esc then v to edit in vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

export FBFONT=/usr/share/kbd/consolefonts/ter-216n.psf.gz

alias gp='source ~/ScratchPad/coingecko/bin/activate; python ~/ScratchPad/get_price.py; deactivate'


# Run tmux on bash startup & attach is session exist
# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

# Should be at the end of the file
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
