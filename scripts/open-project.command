#!/bin/bash
source "$(dirname "$0")/config.sh"
need_dir "$PROJECT_DIR"
open -a "$IDE_APP" "$PROJECT_DIR"
open -a Docker 2>/dev/null || echo "Docker Desktop not found, skipped."
