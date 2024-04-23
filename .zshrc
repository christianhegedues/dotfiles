if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  zstyle ':completion:*' menu select
  zmodload zsh/complist
  compinit
  _comp_options+=(globdots)
fi

# History file for zsh
HISTFILE=~/.cache/zsh/history

# How many commands to store in history
HISTSIZE=10000
SAVEHIST=10000

# 1: Share history in every terminal session
# 2: Do not save duplicate commands to history
setopt SHARE_HISTORY #1
setopt HIST_IGNORE_ALL_DUPS #2

# Vi mdoe:
bindkey -v
export KEYTIMEOUT=1

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

eval "$(starship init zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
