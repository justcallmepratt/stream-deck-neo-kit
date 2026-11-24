#!/bin/bash
source "$(dirname "$0")/config.sh"
need_dir "$PROJECT_DIR"
cd "$PROJECT_DIR" || exit 1
# Opens the pull request for this branch, or the page to create one. Needs the GitHub CLI.
gh pr view --web 2>/dev/null || gh pr create --web
