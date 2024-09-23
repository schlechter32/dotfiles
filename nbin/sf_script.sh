#!/bin/bash
rg --color=always --line-number --no-heading --smart-case --glob "!04archive" --glob "!06referencenotes" --glob "!extrepos" "" ~/secondBrain | fzf --ansi --delimiter : --preview "bat --style=numbers --color=always --highlight-line {2} {1}" --preview-window +{2}-/2 --bind "enter:execute(nvim {1} +{2})"

