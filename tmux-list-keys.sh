#!/bin/bash

# Append custom keybindings from ~/.tmux.conf (filter only bind lines)
grep -E '^(bind|unbind-key)' ~/.tmux.conf | fzf --no-preview
