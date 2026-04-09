default:
    @just --list

init:
    @git submodule update --init --recursive

install:
    stow -t "$HOME" gdb ghostty starship tmux zsh
