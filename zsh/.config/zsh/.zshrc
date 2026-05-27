
# History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.

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

if [[ $OSTYPE = (darwin)* ]]; then
    export PATH=/opt/homebrew/bin:$PATH
fi
export PATH=$HOME/.local/bin:$HOME/.local/share/mise/shims:$HOME/.cargo/bin:$PATH

[[ -f ~/.zsh_secrets ]] && source ~/.zsh_secrets

