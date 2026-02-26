function dtu --description "dash to underscore"
    for arg in $argv
        echo (string replace -a '-' '_' -- $arg)
    end
end
