if [[ -n $HOMEBREW_PREFIX ]]; then
  FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# History file for zsh
HISTFILE=~/.cache/zsh/history
[[ -d ${HISTFILE:h} ]] || mkdir -p ${HISTFILE:h}

# How many commands to store in history
HISTSIZE=10000
SAVEHIST=10000

# 1: Share history in every terminal session
# 2: Do not save duplicate commands to history
# 3: Ignore commands that start with a space
setopt SHARE_HISTORY #1
setopt HIST_IGNORE_ALL_DUPS #2
setopt HIST_IGNORE_SPACE #3

# Vi mode:
bindkey -v
export KEYTIMEOUT=1

# fnm (Node version manager)
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

eval "$(starship init zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
