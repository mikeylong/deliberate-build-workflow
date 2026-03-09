# Design Workflow for Codex

A Codex-first system for going from idea to working product without skipping discovery, planning, or verification.

This repository used to center Claude Code commands and Cursor rules. It now treats Codex as the primary workflow and keeps the older assets only as deprecated reference material.

## Attribution

This repository is a Codex-focused adaptation of the original `Design-workflow` project by Ana State.

Original repository:
- [AI-by-design/Design-workflow](https://github.com/AI-by-design/Design-workflow)

This repo is maintained independently and is not the canonical upstream.

## What's inside

```text
AGENTS.md                     Canonical brief and operating rules
docs/workflows/
  design-thinking.md         Discovery and brief creation
  plan.md                    Decision-complete planning
  new-project.md             New-project scaffolding guidance
  test-debug.md              Verification and debugging workflow
setup-codex.sh               Local bootstrap and scaffold helper
.claude/                     Deprecated legacy reference
.cursor/                     Deprecated legacy reference
```

## Quick Start

```bash
git clone https://github.com/mikeylong/design-workflow.git
cd design-workflow
chmod +x setup-codex.sh
./setup-codex.sh --check
```

Then:

1. Read `AGENTS.md`.
2. Start with `docs/workflows/design-thinking.md`.
3. Move to `docs/workflows/plan.md` before implementation.

This workflow is local to the repository. It does not copy files into `~/.claude`, `~/.cursor`, or `$CODEX_HOME`.

## Core Flow

The sequence is the product:

```text
Discovery  -> docs/workflows/design-thinking.md
Plan       -> docs/workflows/plan.md
Build      -> implement against AGENTS.md and PLAN.md
Verify     -> docs/workflows/test-debug.md
```

Do not start in build mode on a new product or major feature. The workflow assumes the agent is only as good as the context it receives.

## Canonical Brief

In the Codex version, `AGENTS.md` replaces `CLAUDE.md`.

Use it to hold:
- problem space
- emotional core
- brand identity
- stack decisions
- v1 scope
- long-lived conventions and decisions

If you need cross-tool compatibility later, treat `AGENTS.md` as the source of truth and derive other files from it.

## Bootstrap Script

`setup-codex.sh` supports two local workflows:

```bash
./setup-codex.sh --check
./setup-codex.sh --scaffold /path/to/new/project
```

- `--check` verifies the repository has the required Codex workflow files.
- `--scaffold` copies this workflow into an empty target directory as a starter kit.

## Testing

Run the zero-dependency shell test suite with:

```bash
bash tests/run.sh
```

The tests cover `setup-codex.sh`, `install.sh`, and `build-workflow/install.sh` without requiring any external test framework.

GitHub Actions CI runs the same command on pushes and pull requests.

## Legacy Compatibility

The original Claude/Cursor assets remain in:
- `.claude/`
- `.cursor/`
- `install.sh`
- `build-workflow/`

They are deprecated and not the maintained onboarding path. Their purpose is reference and migration only.

## Philosophy

The workflow is built on a simple constraint: agents make better decisions when the brief is explicit, the scope is bounded, and the order of work is deliberate.

That means:
- discovery before design direction
- planning before implementation
- verification against both behavior and intent

The result should feel less like vibe coding and more like disciplined product development.

## Additional Guide

For a longer explanation of how to use the Codex workflow, see [docs/how-to-use.md](docs/how-to-use.md).
