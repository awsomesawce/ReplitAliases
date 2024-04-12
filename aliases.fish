#!/usr/bin/env fish
# General fish aliases and functions

function cht -d "chtsh for fish"
    set -f chturl https://cht.sh
    set -f cnt (count $argv)

    # Test whether curl is installed
    if not command -q curl
        echo "curl not installed.  Install it."
        return 2
    end

    if test $cnt -gt 1
        for i in $argv
            echo "Looking up $i"
            curl -sS "$chturl/$i"
        end
    else if test $cnt -eq 1
        command -q curl
        and command curl -sS "$chturl/$argv"
    else
        echo "No args specified"
        command curl -sS "$chturl"
    end

end

function ll -d "ls long"
    command -q lsd; and lsd -l $argv; or ls -l $argv
    if command -v eza > /dev/null
        echo "Found eza"
    end
end

function e -d "eza shortcut" -a
    # Use `and` and `or` instead of if statements or `&&` and `||`.

    begin
        if not command -q eza
            echo "eza not found, defaulting to ls"
        end
    end

    command -q eza; and command eza $argv; or command ls $argv
end

alias g=git
alias pm=pacman
alias adoc=asciidoctor
alias dr="deno run"
alias dra="deno run --allow-all"
alias ddoc="deno doc"
alias dlint="deno lint"
alias dfmt="deno fmt"