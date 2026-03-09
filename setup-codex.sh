#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

show_help() {
  cat <<EOF
Usage: ./setup-codex.sh [--check] [--scaffold <target-dir>]

Options:
  --check                Validate the local repository layout for Codex usage.
  --scaffold <dir>       Copy the workflow into a target directory as a starter kit.
  -h, --help             Show this help text.

This script does not install anything globally.
It keeps the workflow local to the repository or the scaffold target.
EOF
}

run_check() {
  local required=(
    "AGENTS.md"
    "README.md"
    "docs/workflows/design-thinking.md"
    "docs/workflows/plan.md"
    "docs/workflows/new-project.md"
    "docs/workflows/test-debug.md"
  )

  echo ""
  echo "Checking Codex workflow files"
  echo ""

  local missing=0
  for path in "${required[@]}"; do
    if [ -e "$SCRIPT_DIR/$path" ]; then
      echo "  OK  $path"
    else
      echo "  MISSING  $path"
      missing=1
    fi
  done

  echo ""
  if [ "$missing" -ne 0 ]; then
    echo "Codex workflow check failed."
    return 1
  fi

  echo "Codex workflow check passed."
  echo "Next steps:"
  echo "  1. Read AGENTS.md"
  echo "  2. Start with docs/workflows/design-thinking.md"
  echo "  3. Move to docs/workflows/plan.md before implementation"
}

scaffold_repo() {
  local target_dir="$1"

  if [ -z "$target_dir" ]; then
    echo "Missing target directory for --scaffold"
    return 1
  fi

  if [ -e "$target_dir" ] && [ -n "$(ls -A "$target_dir" 2>/dev/null)" ]; then
    echo "Target directory must be empty: $target_dir"
    return 1
  fi

  mkdir -p "$target_dir"

  local items=(
    "AGENTS.md"
    "README.md"
    "docs"
    ".claude"
    ".cursor"
    "install.sh"
    "setup-codex.sh"
    "build-workflow"
  )

  echo ""
  echo "Scaffolding Codex workflow into $target_dir"
  echo ""

  for item in "${items[@]}"; do
    cp -R "$SCRIPT_DIR/$item" "$target_dir/"
    echo "  copied $item"
  done

  echo ""
  echo "Scaffold complete."
  echo "Open the new directory in Codex and read AGENTS.md first."
}

main() {
  if [ $# -eq 0 ]; then
    show_help
    exit 0
  fi

  case "${1:-}" in
    --check)
      run_check
      ;;
    --scaffold)
      scaffold_repo "${2:-}"
      ;;
    -h|--help)
      show_help
      ;;
    *)
      echo "Unknown option: $1"
      echo ""
      show_help
      return 1
      ;;
  esac
}

main "$@"
