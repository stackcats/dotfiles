if status is-interactive
end

abbr vi "nvim"
abbr gst "git status"

fish_add_path ~/.asdf/shims
fish_add_path ~/.cargo/bin

# opam
source /home/john/.opam/opam-init/init.fish > /dev/null 2> /dev/null;

starship init fish | source
