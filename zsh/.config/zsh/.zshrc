
if [[ $OSTYPE = (darwin)* ]]; then
    export PATH=/opt/homebrew/bin:$PATH
fi

# Starship prompt
eval "$(starship init zsh)"

# Lazy-load antidote and generate the static load file only when needed
zsh_plugins=${ZDOTDIR:-$HOME}/zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
    source ${ZDOTDIR:-$HOME}/antidote/antidote.zsh
    antidote bundle < ${zsh_plugins}.txt > ${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

source $ZDOTDIR/alias.zsh
source $ZDOTDIR/bindkeys.zsh

export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH

[[ -f ~/.zsh_secrets ]] && source ~/.zsh_secrets

