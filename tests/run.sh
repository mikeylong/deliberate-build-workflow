#!/bin/bash

set -euo pipefail

TESTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

test_files=(
  "$TESTS_DIR/setup_codex_test.sh"
  "$TESTS_DIR/installers_test.sh"
)

pass_count=0

for test_file in "${test_files[@]}"; do
  test_name="$(basename "$test_file")"
  if bash "$test_file"; then
    echo "PASS $test_name"
    pass_count=$((pass_count + 1))
  else
    echo "FAIL $test_name"
    exit 1
  fi
done

echo "PASS $pass_count/${#test_files[@]} test files"
