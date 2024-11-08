#!/bin/bash

#find ~/ \( -path ~/.cache -o -path ~/.novaclient -o -path ~/.FBReader -o -path ~/go -o -path ~/.docker -o -path ~/.mozilla -o -path ~/'Telegram Desktop' -o -path ~/.config -o -path ~/backup -o -path ~/restore \) -prune -o -print | fzf --no-preview --height=92% | xargs -I{} tmux new-window -c {}

export _ZO_FZF_OPTS="--height=100% \
    --color=fg:-1,bg:-1,hl:#b6d5f5 \
    --color=fg+:#ffffff,bg+:#0a0909,hl+:#99d94c \
    --color=info:#e3ba62,prompt:#b6d5f5,pointer:#ff0000 \
    --color=marker:#ffffff,spinner:#ffe100,header:#ffe100"

zoxide query -i | xargs -I{} tmux new-window -c {}
