#!/usr/bin/env nu

export alias g = git
export alias ll = ls -l
export alias la = ls -a
export alias pydoc = python -m pydoc
export alias poe = poetry

def inv [
  fname: string
] {
  
}

# query cht.sh
export def chtsh [
  q: string # string to query
] {
  curl -sS $"https://cht.sh/($q)"
}