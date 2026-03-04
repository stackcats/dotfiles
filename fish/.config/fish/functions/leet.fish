function leet
    if test (count $argv) -eq 0
        echo "Usage: leet <filename>"
        return 1
    end

    set filename (dtu $argv[1])
    nvim $filename
end
