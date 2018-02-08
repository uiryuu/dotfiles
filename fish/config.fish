# thefuck configuration
thefuck --alias | source
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# OPAM configuration
source /Users/alejx/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
