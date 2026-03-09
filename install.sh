#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "This installer is deprecated."
echo "The maintained workflow is now Codex-first and local to the repository."
echo ""
echo "Use one of these instead:"
echo "  ./setup-codex.sh --check"
echo "  ./setup-codex.sh --scaffold /path/to/new/project"
echo ""

"$SCRIPT_DIR/setup-codex.sh" --check
