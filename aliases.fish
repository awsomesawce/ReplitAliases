#!/usr/bin/env fish
# General fish aliases and functions

# chtsh for fish that accepts multiple args.
function cht -d "chtsh for fish"
    set -f chturl https://cht.sh # chtsh url
    set -f cnt (count $argv) # Number of args

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
        echo "No args specified" >&2
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
alias gitst="git status"
alias pm=pacman
alias adoc=asciidoctor

# deno specific aliases are only set if deno is installed.
if command -q deno
    alias dr="deno run"
    alias dra="deno run --allow-all"
    alias ddoc="deno doc"
    alias dlint="deno lint"
    alias dfmt="deno fmt"
end

# Added command checks 04/12/2024
if command -q poetry
    alias poe="poetry"
end

if command -q invoke
    alias inv=invoke
else
    alias inv="python -m invoke"
end

alias pydoc="python -m pydoc"
alias fire="python -m fire"

function pysysconfig -d "Output of sysconfig module"
    command -q python; and command python -m sysconfig
end

function rich_md -d "Using rich.markdown from the commandline"
    if not command -q python
        echo "python not installed dummy!" >&2
        return 2
    end

    echo "You have $(count $argv) args on this function!"
    python -m rich.markdown $argv
end