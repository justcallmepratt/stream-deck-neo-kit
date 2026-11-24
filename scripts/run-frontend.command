#!/bin/bash
source "$(dirname "$0")/config.sh"
need_dir "$FRONTEND_DIR"
cd "$FRONTEND_DIR" && npm start
