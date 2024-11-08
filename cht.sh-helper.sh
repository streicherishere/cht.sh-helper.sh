#!/usr/bin/env bash

# Get the current directory of the script
current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if cht.sh is already locally available; if not, download it into a variable
chtsh=$(curl -Ss https://cht.sh/:cht.sh)

# Check if the list of available commands is already locally available; if not, fetch it
list=$(curl -Ss https://cht.sh/:list)

# Let the user select an item from the list using fzf with a preview of the selected item
item="$(echo "$list" | fzf --preview="echo '$chtsh' | bash -s {}")"

# If no item was selected, exit the script
if [ -z "$item" ]; then
  exit 0
fi

# Prompt the user for a query related to the selected item
read -e -p "Query for $item: " query

# Replace spaces with "+" for URL encoding
query="$(echo "$query" | sed 's/ /+/g')"

# Send the query to cht.sh and capture the result
result=$(echo "$chtsh" | bash -s "$item" "$query")

# Check if the result is empty or contains an error message
if [[ -z "$result" || "$result" == *"Unknown cheat sheet"* ]]; then
  echo "No results found for $query in $item" | dmenu -p "Error:"
  exit 1
fi

# Display the result using less with raw color support
echo "$result" | less -R
