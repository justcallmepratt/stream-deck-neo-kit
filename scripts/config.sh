# Edit these five lines, then every key uses them.
PROJECT_DIR="$HOME/code/my-project"      # the folder IntelliJ opens
BACKEND_DIR="$PROJECT_DIR/backend"       # Spring Boot (Maven)
FRONTEND_DIR="$PROJECT_DIR/frontend"     # Angular, React, Next.js...
FRONTEND_SCRIPT="start"                  # npm script to run: "start" (Angular) or "dev" (Next.js, Vite)
IDE_APP="IntelliJ IDEA"

# Stops with a readable message if a folder is missing, and keeps the
# Terminal window open so the message can be read.
need_dir() {
  if [ ! -d "$1" ]; then
    echo "Folder not found: $1"
    echo "Edit scripts/config.sh."
    read -r -p "Press Return to close."
    exit 1
  fi
}

# Runs Maven through the project's wrapper when there is one.
mvn_cmd() {
  if [ -x ./mvnw ]; then ./mvnw "$@"; else mvn "$@"; fi
}
