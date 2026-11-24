#!/bin/bash
source "$(dirname "$0")/config.sh"
need_dir "$PROJECT_DIR"
cd "$PROJECT_DIR" && git status --short --branch && git push
read -r -p "Press Return to close."
