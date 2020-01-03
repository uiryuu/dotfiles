set -x LC_ALL en_US.UTF-8

set -Ux EDITOR nvim
fish_vi_key_bindings

status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (pyenv init -|psub)
