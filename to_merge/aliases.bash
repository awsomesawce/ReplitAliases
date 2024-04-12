#!/bin/bash

alias poe=poetry
alias ll="ls -l"
alias la="ls -la"
alias fsh="fish"

# callable python modules

# Call pydoc as module if not on path
pydoc() {
  if ! command -v pydoc > /dev/null; then
    command python -m pydoc "$@"
    return 0
  else
    pydoc "$@"
    return 0
  fi
}

alias invoke="python -m invoke"
alias inv='python -m invoke'
alias fire='python -m fire'

# query cht.sh
chtsh() {
  local url="https://cht.sh"
  if [[ "$#" -gt 1 ]]; then
    echo "Usage: chtsh [command]"
    return 1
  else
    if ! command -v curl > /dev/null; then
      echo "curl is not installed." >&2
      return 2
    else
      command curl -sS "$url/$1"
      return 0
    fi
  fi
}
