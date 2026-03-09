# How to use this workflow

The README explains the repository. This guide explains the working rhythm inside Codex.

## The sequence

The workflow has four stages:

```text
Discovery  -> design-thinking
Plan       -> plan mode
Build      -> implementation
Verify     -> test-debug
```

This is not ceremony. Each stage exists to prevent a different class of mistake.

## Discovery

Start by reading `AGENTS.md`.

Then use `docs/workflows/design-thinking.md` to lock:
- the problem in the user's words
- the person and context
- the emotional core
- the aesthetic direction
- the stack

At the end of discovery, those decisions should be written into `AGENTS.md`.

If discovery is weak, everything downstream drifts.

## Plan mode

Once the brief is stable, use `docs/workflows/plan.md`.

The plan should define:
- scope boundaries
- user flows
- screens and states
- architecture
- API and data shape where needed
- risks and unknowns
- build order

Save the result as `PLAN.md`.

Do not ask the agent to build the whole product from a vague paragraph. The point of plan mode is to remove mid-build guesswork.

## Build

Implementation starts only after `AGENTS.md` and `PLAN.md` are both solid.

Build in dependency order. Finish the happy path first, then required states, then polish. Do not animate or optimize code that does not work yet.

When working inside an existing codebase:
- inspect the current stack and conventions first
- plan changes against what already exists
- avoid importing patterns that do not fit the codebase

## Verify

Use `docs/workflows/test-debug.md` when a part is done or when something is broken.

Verification is not only "does it run." It is also:
- does it match the brief
- does it cover the planned states
- does it behave accessibly
- does it hold up on edge cases

## What done looks like

Discovery is done when `AGENTS.md` can guide product and design decisions without guessing.

Plan mode is done when `PLAN.md` is decision complete and implementation can proceed without open design questions.

Build is done when the implemented part behaves as planned and has been checked against its required states.

Verify is done when functional issues, intent drift, and missing states have been either fixed or explicitly tracked.

## Working from this repository

This repository is a starter workflow, not a global tool install.

Recommended path:

```bash
./setup-codex.sh --check
./setup-codex.sh --scaffold /path/to/new/project
```

Then open the scaffolded project in Codex and continue from `AGENTS.md`.

## Legacy note

If you see references to `.claude`, `.cursor`, or `CLAUDE.md`, treat them as deprecated historical material unless a compatibility migration explicitly requires them.
