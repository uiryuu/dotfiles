set -x LC_ALL en_US.UTF-8

set -gx GPG_TTY (tty)

if status is-interactive
    set -Ux EDITOR nvim
    fish_vi_key_bindings

    if not set -q TMUX
        set -g TMUX tmux new-session -d -s Chore
        eval $TMUX
        tmux attach-session -d
    end
end
