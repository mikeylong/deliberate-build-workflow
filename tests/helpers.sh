#!/bin/bash

set -euo pipefail

TESTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$TESTS_DIR/.." && pwd)"

fail() {
  echo "FAIL: $*" >&2
  exit 1
}

assert_eq() {
  local actual="$1"
  local expected="$2"
  local message="${3:-Expected values to match}"

  if [ "$actual" != "$expected" ]; then
    fail "$message"$'\n'"expected: $expected"$'\n'"actual:   $actual"
  fi
}

assert_contains() {
  local haystack="$1"
  local needle="$2"
  local message="${3:-Expected output to contain substring}"

  if [[ "$haystack" != *"$needle"* ]]; then
    fail "$message"$'\n'"missing: $needle"$'\n'"output: $haystack"
  fi
}

assert_path_exists() {
  local path="$1"
  local message="${2:-Expected path to exist}"

  if [ ! -e "$path" ]; then
    fail "$message: $path"
  fi
}

assert_path_not_exists() {
  local path="$1"
  local message="${2:-Expected path not to exist}"

  if [ -e "$path" ]; then
    fail "$message: $path"
  fi
}

make_temp_dir() {
  mktemp -d "${TMPDIR:-/tmp}/design-workflow-tests.XXXXXX"
}

run_cmd() {
  local stdout_file stderr_file
  stdout_file="$(mktemp "${TMPDIR:-/tmp}/design-workflow-stdout.XXXXXX")"
  stderr_file="$(mktemp "${TMPDIR:-/tmp}/design-workflow-stderr.XXXXXX")"

  set +e
  "$@" >"$stdout_file" 2>"$stderr_file"
  CMD_STATUS=$?
  set -e

  CMD_STDOUT="$(cat "$stdout_file")"
  CMD_STDERR="$(cat "$stderr_file")"
  if [ -n "$CMD_STDOUT" ] && [ -n "$CMD_STDERR" ]; then
    CMD_OUTPUT="${CMD_STDOUT}"$'\n'"${CMD_STDERR}"
  elif [ -n "$CMD_STDOUT" ]; then
    CMD_OUTPUT="$CMD_STDOUT"
  else
    CMD_OUTPUT="$CMD_STDERR"
  fi

  rm -f "$stdout_file" "$stderr_file"
}
