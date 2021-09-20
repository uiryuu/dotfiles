set -x LC_ALL en_US.UTF-8
set -x PATH /opt/homebrew/bin $PATH

alias ibrew='arch -x86_64 /usr/local/bin/brew'

if status is-interactive
    set -Ux EDITOR nvim
    fish_vi_key_bindings

    status --is-interactive; and source (rbenv init -|psub)
    status --is-interactive; and source (pyenv init -|psub)

    if not set -q TMUX
        set -g TMUX tmux new-session -d -s Chore
        eval $TMUX
        tmux attach-session -d
    end
end
