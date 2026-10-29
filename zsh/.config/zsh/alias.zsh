
# tmux
alias ta='tmux attach -t'
alias tl='tmux list-sessions'

# for esp-idf
alias idf6='source ~/.espressif/tools/activate_idf_release-v6.0.sh'
alias idf5='source ~/.espressif/tools/activate_idf_release-v5.0.sh'

# Load InferYard credentials only for this command's subprocess.
inferyard() (
    set -a
    source "$HOME/.config/inferyard/manager.env" || return
    set +a
    command inferyard "$@"
)
