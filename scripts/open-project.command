#!/bin/bash
source "$(dirname "$0")/config.sh"
need_dir "$PROJECT_DIR"
if ! open -a "$IDE_APP" "$PROJECT_DIR" 2>/dev/null; then
  echo "App not found: $IDE_APP"
  echo "Install it, or change IDE_APP in config.sh."
  read -r -p "Press Return to close."
  exit 1
fi
open -a Docker 2>/dev/null || echo "Docker Desktop not found, skipped."
