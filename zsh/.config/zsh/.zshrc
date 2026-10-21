
if [[ $OSTYPE = (darwin)* ]]; then
    export PATH=/opt/homebrew/bin:$PATH
    # pnpm
    export PNPM_HOME="/Users/garytu/Library/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
fi

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

# Lazy-load antidote and generate the static load file only when needed.
# Regenerate when the cache is missing, empty, or stale. The empty check
# matters: a failed bundle (no network, antidote submodule not checked out)
# used to leave a zero-byte file newer than zsh_plugins.txt, so it looked
# up-to-date forever and silently dropped every plugin and git alias.
zsh_plugins=${ZDOTDIR:-$HOME}/zsh_plugins
if [[ ! -s ${zsh_plugins}.zsh || ${zsh_plugins}.txt -nt ${zsh_plugins}.zsh ]]; then
  if [[ ! -f ${ZDOTDIR:-$HOME}/antidote/antidote.zsh ]]; then
    print -u2 "zsh: antidote missing, run 'git submodule update --init' in ~/dotfiles"
  else
    # Capture first, write only on success, so a failure keeps the last good cache.
    if bundle=$(source ${ZDOTDIR:-$HOME}/antidote/antidote.zsh && antidote bundle < ${zsh_plugins}.txt) && [[ -n $bundle ]]; then
      print -r -- "$bundle" > ${zsh_plugins}.zsh
    else
      print -u2 "zsh: antidote bundle failed, plugins not loaded ($(wc -c < ${zsh_plugins}.zsh) byte cache in use)"
    fi
  fi
fi
[[ -s ${zsh_plugins}.zsh ]] && source ${zsh_plugins}.zsh

source $ZDOTDIR/alias.zsh
source $ZDOTDIR/bindkeys.zsh

export PATH=$HOME/.local/bin:$HOME/.local/share/mise/shims:$HOME/.cargo/bin:$PATH

[[ -f ~/.zsh_secrets ]] && source ~/.zsh_secrets

