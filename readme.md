# cht.sh Helper Script

This repository contains a shell script that integrates with [cht.sh](https://cht.sh/), a community-driven cheat sheet service. The script allows users to search and view cheat sheets from `cht.sh` directly from the terminal. It uses `fzf` for an interactive selection of available cheat sheets and allows users to query specific commands, programming languages, or tools.

## Features:
- Fetches cheat sheets from `cht.sh` dynamically without needing to download files locally.
- Interactive selection of available commands and programming languages via `fzf`.
- Allows querying cheat sheets by passing user-defined queries.
- Displays results in `less` with raw color support for easier readability.
- Lightweight and does not require permanent storage of files on the local system.

## Requirements:
- `fzf` for interactive selection
- `bash` for script execution
- `curl` for fetching data from `cht.sh`
- `less` for viewing results (optional, can be replaced with other pagers like `bat`)

## How to Use:
1. Clone the repository or download the script.
2. Run the script from the terminal.
3. Select a cheat sheet using `fzf` and provide a query.
4. View the result directly in your terminal.

## Example Usage:

```bash
./tmux-cht.sh
