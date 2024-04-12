#!/usr/bin/env fish
# fish aliases

function cht -d "chtsh for fish"
  set -f url "https://cht.sh"
  set -f cnt (count $argv)
  if test $cnt -gt 1
    echo "More than one arg"
    for i in $argv
      command curl -sS "$url/$i"
    end
  else
    command -q curl; and curl -sS "$url/$argv"
  end
end

function pydoc -d "pydoc for fish"
  python -m pydoc "$argv"
end

alias poe="poetry"
alias invoke="python -m invoke"
alias inv='python -m invoke'
alias fire='python -m fire'

alias gitst="git status"
