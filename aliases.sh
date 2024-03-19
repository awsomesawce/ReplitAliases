#!/bin/bash

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -alhF'

# Deno specific

alias dr='deno run'
alias dra='deno run --allow-all'
alias ddoc='deno doc'

has_curl() {
if command -v curl > /dev/null; then
  return 0
else
  return 1
fi
}

# Get deno doc from module in stdlib
# TODO: Include getopt/getopts
ddoc_std() {
  local std=https://deno.land/std
  if [[ "$#" -eq 0 ]]; then
    echo "Usage: ddoc_std <moduleName>" >&2
    return 1
  fi
  deno doc "$std/$1/mod.ts"
  return 0
}

chtsh() {
  local cht="https://cht.sh"
  if [ "$#" -eq 0 ]; then
    curl "$cht"
    echo "No args" >&2
    return 1
  fi
  curl "$cht/$1"
  return 0
}


