# Aliases
alias ls='ls --color=auto'

# History
HISTFILE=~/.history-zsh
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt inc_append_history
setopt hist_expire_dups_first

# Misc
setopt interactive_comments

# Pure-prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
