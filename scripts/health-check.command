#!/bin/bash
source "$(dirname "$0")/config.sh"
echo "== Java ==";   java -version 2>&1 || echo "not found"
echo "== Maven ==";  (command -v mvn >/dev/null && mvn -v 2>/dev/null | head -1) || echo "not found"
echo "== Node ==";   node -v 2>&1 || echo "not found"
echo "== Angular =="; (ng version 2>/dev/null | grep -i "angular cli") || echo "not found"
echo "== Docker =="; (docker info >/dev/null 2>&1 && echo "running") || echo "not running"
read -r -p "Press Return to close."
