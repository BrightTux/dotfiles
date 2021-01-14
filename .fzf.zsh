# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tux/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/tux/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tux/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/tux/.fzf/shell/key-bindings.zsh"
