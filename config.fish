set -x LC_ALL en_US.UTF-8
set -x PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
set -x TERM xterm-256color

set -gx GPG_TTY (tty)

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
