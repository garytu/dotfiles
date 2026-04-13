default:
    @just --list

init:
    @git submodule update --init --recursive

install:
    stow -t "$HOME" gdb ghostty starship tmux zsh

rm-nvim:
    rm ~/.config/nvim
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak}