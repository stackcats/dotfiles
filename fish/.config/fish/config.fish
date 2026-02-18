if status is-interactive
    if not set -q TMUX
        tmux attach -t main 2>/dev/null; or tmux new -s main
    end
end

abbr vi "nvim"
abbr gst "git status"

if type -q asdf
    fish_add_path ~/.asdf/shims
end

if type -q cargo
    fish_add_path ~/.cargo/bin
end

if type -q opam
    source /home/john/.opam/opam-init/init.fish > /dev/null 2> /dev/null;
end

if type -q starship
    starship init fish | source
end
