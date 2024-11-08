#!/bin/bash

# Get the current session
current_session=$(tmux display-message -p '#S')

# List all windows in the current session and let the user pick one or more
windows=$(tmux list-windows -F "#{window_index}: #{window_name}" | fzf --multi --prompt="Select windows to move: ")

# If no windows were selected, exit
if [ -z "$windows" ]; then
  echo "No windows selected."
  exit 1
fi

# Get the list of all sessions and let the user pick a target session
target_session=$(tmux list-sessions -F "#{session_name}" | fzf --prompt="Select target session: ")

# If no target session was selected, exit
if [ -z "$target_session" ]; then
  echo "No target session selected."
  exit 1
fi

# Move the selected windows to the target session
while read -r window; do
  window_index=$(echo "$window" | cut -d':' -f1)
  tmux move-window -s "$current_session:$window_index" -t "$target_session"
done <<< "$windows"

echo "Selected windows moved to session: $target_session"
