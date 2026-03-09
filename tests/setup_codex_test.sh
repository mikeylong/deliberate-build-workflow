#!/bin/bash

set -euo pipefail

TESTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$TESTS_DIR/helpers.sh"

test_help_output() {
  run_cmd "$REPO_ROOT/setup-codex.sh" --help
  assert_eq "$CMD_STATUS" "0" "setup-codex.sh --help should succeed"
  assert_contains "$CMD_OUTPUT" "Usage: ./setup-codex.sh [--check] [--scaffold <target-dir>]" "Help output should include usage"
  assert_contains "$CMD_OUTPUT" "This script does not install anything globally." "Help output should explain local-only behavior"
}

test_check_output() {
  run_cmd "$REPO_ROOT/setup-codex.sh" --check
  assert_eq "$CMD_STATUS" "0" "setup-codex.sh --check should succeed in the repo root"
  assert_contains "$CMD_OUTPUT" "Checking Codex workflow files" "Check output should start verification"
  assert_contains "$CMD_OUTPUT" "Codex workflow check passed." "Check output should report success"
}

test_scaffold_success() {
  local target_dir
  target_dir="$(make_temp_dir)"
  rmdir "$target_dir"

  run_cmd "$REPO_ROOT/setup-codex.sh" --scaffold "$target_dir"
  assert_eq "$CMD_STATUS" "0" "setup-codex.sh --scaffold should succeed for an empty target"
  assert_contains "$CMD_OUTPUT" "Scaffolding Codex workflow into $target_dir" "Scaffold output should name the target"
  assert_contains "$CMD_OUTPUT" "Scaffold complete." "Scaffold output should report completion"

  assert_path_exists "$target_dir/AGENTS.md" "Scaffold should copy AGENTS.md"
  assert_path_exists "$target_dir/README.md" "Scaffold should copy README.md"
  assert_path_exists "$target_dir/docs" "Scaffold should copy docs"
  assert_path_exists "$target_dir/setup-codex.sh" "Scaffold should copy setup-codex.sh"
  assert_path_exists "$target_dir/.claude" "Scaffold should copy legacy .claude reference"
  assert_path_exists "$target_dir/.cursor" "Scaffold should copy legacy .cursor reference"
  assert_path_exists "$target_dir/build-workflow" "Scaffold should copy build-workflow"

  rm -rf "$target_dir"
}

test_scaffold_rejects_non_empty_dir() {
  local target_dir
  target_dir="$(make_temp_dir)"
  echo "occupied" >"$target_dir/existing.txt"

  run_cmd "$REPO_ROOT/setup-codex.sh" --scaffold "$target_dir"
  assert_eq "$CMD_STATUS" "1" "setup-codex.sh --scaffold should fail for a non-empty target"
  assert_contains "$CMD_OUTPUT" "Target directory must be empty: $target_dir" "Scaffold failure should explain why it refused the directory"

  rm -rf "$target_dir"
}

test_unknown_option_fails() {
  run_cmd "$REPO_ROOT/setup-codex.sh" --nope
  assert_eq "$CMD_STATUS" "1" "Unknown options should fail"
  assert_contains "$CMD_OUTPUT" "Unknown option: --nope" "Unknown-option output should name the bad flag"
  assert_contains "$CMD_OUTPUT" "Usage: ./setup-codex.sh [--check] [--scaffold <target-dir>]" "Unknown-option output should show help"
}

test_help_output
test_check_output
test_scaffold_success
test_scaffold_rejects_non_empty_dir
test_unknown_option_fails
