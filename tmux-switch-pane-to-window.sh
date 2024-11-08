#!/bin/bash

# Get the current session and window
current_session=$(tmux display-message -p '#S')
current_window=$(tmux display-message -p '#I')

# List all panes in the current window and let the user pick one or more
panes=$(tmux list-panes -F "#{pane_id}: #{pane_title} (#{pane_current_command})" | fzf --multi --prompt="Select panes to move: ")

# If no panes were selected, exit
if [ -z "$panes" ]; then
  echo "No panes selected."
  exit 1
fi

# Get the list of all windows and let the user pick a target window
target_window=$(tmux list-windows -F "#{window_id}: #{window_name}" | fzf --prompt="Select target window: ")

# If no target window was selected, exit
if [ -z "$target_window" ]; then
  echo "No target window selected."
  exit 1
fi

# Extract the target window index
target_window_index=$(echo "$target_window" | cut -d':' -f1)

# Move the selected panes to the target window
while read -r pane; do
  pane_id=$(echo "$pane" | cut -d':' -f1)
  tmux join-pane -s "$pane_id" -t "$current_session:$target_window_index"
done <<< "$panes"

echo "Selected panes moved to window: $target_window"
