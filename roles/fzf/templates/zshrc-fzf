# Setup fzf
# ---------
if [[ ! "$PATH" == *{{ user.home }}/.fzf/bin* ]]; then
  export PATH="$PATH:{{ user.home }}/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *{{ user.home }}/.fzf/man* && -d "{{ user.home }}/.fzf/man" ]]; then
  export MANPATH="$MANPATH:{{ user.home }}/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "{{ user.home }}/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "{{ user.home }}/.fzf/shell/key-bindings.zsh"
