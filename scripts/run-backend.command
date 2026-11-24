#!/bin/bash
source "$(dirname "$0")/config.sh"
need_dir "$BACKEND_DIR"
cd "$BACKEND_DIR" && mvn_cmd spring-boot:run
