#!/bin/bash

export PAGER="less" # TODO: Move this piece of code.
export dnstd=https://deno.land/std@0.220.1

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -alhF'

# Deno specific

alias dr='deno run'
alias dra='deno run --allow-all'
alias ddoc='deno doc'
alias dadd="deno add"
alias dfmt="deno fmt"
alias dcheck="deno check"
alias

# * Is it necessary to have this?
# * Don't most systems have curl installed?
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

# chtsh for bash
# 
chtsh() {
  local _VERSION_="0.1.0"
  local cht="https://cht.sh"
  if [ "$#" -eq 0 ]; then
    command curl "$cht"
    echo "No args" >&2
    return 1
  elif [ "$#" -gt 1 ]; then
    echo "WARNING: More than one arg" >&2
    for i; do
      curl "$cht/$i"
    done
    return 0
  else
    echo "Looking up $*" 2>&1
  fi
  curl "$cht/$1"
  return 0
}


