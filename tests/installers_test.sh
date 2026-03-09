#!/bin/bash

set -euo pipefail

TESTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$TESTS_DIR/helpers.sh"

test_root_installer_delegates_to_check() {
  run_cmd "$REPO_ROOT/install.sh"
  assert_eq "$CMD_STATUS" "0" "install.sh should succeed by delegating to setup-codex.sh --check"
  assert_contains "$CMD_OUTPUT" "This installer is deprecated." "install.sh should print the deprecation notice"
  assert_contains "$CMD_OUTPUT" "Codex workflow check passed." "install.sh should delegate to the bootstrap check"
}

test_nested_installer_forwards_arguments() {
  run_cmd "$REPO_ROOT/build-workflow/install.sh" --help
  assert_eq "$CMD_STATUS" "0" "build-workflow/install.sh should forward arguments to setup-codex.sh"
  assert_contains "$CMD_OUTPUT" "Usage: ./setup-codex.sh [--check] [--scaffold <target-dir>]" "Nested installer should forward --help"
}

test_root_installer_does_not_touch_global_dirs() {
  local temp_home
  temp_home="$(make_temp_dir)"

  run_cmd env HOME="$temp_home" "$REPO_ROOT/install.sh"
  assert_eq "$CMD_STATUS" "0" "install.sh should still succeed with an isolated HOME"
  assert_path_not_exists "$temp_home/.claude" "install.sh should not create ~/.claude"
  assert_path_not_exists "$temp_home/.cursor" "install.sh should not create ~/.cursor"

  rm -rf "$temp_home"
}

test_root_installer_delegates_to_check
test_nested_installer_forwards_arguments
test_root_installer_does_not_touch_global_dirs
