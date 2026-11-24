#!/bin/bash
source "$(dirname "$0")/config.sh"
need_dir "$PROJECT_DIR"
cd "$PROJECT_DIR" && git pull --ff-only
read -r -p "Press Return to close."
