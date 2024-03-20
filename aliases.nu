#!/usr/bin/env nu
# nutshell aliases

export alias dr = deno run

# Look up something on cht.sh
export def chtsh [
  q: string # query to search cht.sh
] {
  curl -sS $"https://cht.sh/($q)"
}