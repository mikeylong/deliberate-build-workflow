# Plan

Use this after discovery is confirmed and the project brief exists in `AGENTS.md`.

Goal: produce a decision-complete implementation plan before code changes begin.

## How To Run It In Codex

Prompt shape:

```text
Use /Users/mike/Design Workflow/docs/workflows/plan.md.
Read AGENTS.md first.
Stay in plan mode until the plan is complete.
Produce a plan that is ready for implementation without further decisions.
```

## Inputs

Load:
- `AGENTS.md`
- any existing codebase context
- any current constraints, deadlines, or platform requirements

If the brief is missing critical information, pause and resolve that gap before planning.

## Planning Checklist

Include:
- confirmed stack
- in-scope and out-of-scope boundaries
- user flows with triggers, steps, end states, and edge cases
- screen and state inventory
- component or subsystem architecture
- data entities and API shape where applicable
- build sequence ordered by dependency
- risks, unknowns, and assumptions

## Deliverable

Output a single plan document with:
- Summary
- Key implementation changes
- Public interfaces or user-facing changes
- Test plan
- Assumptions and defaults

Then save it as `PLAN.md` in the project root.

## Guardrails

- Plan the happy path first, then required states, then polish.
- Do not leave high-impact decisions for implementation.
- If scope is too large, split it in the plan instead of carrying ambiguity forward.
- Treat the plan as a contract for implementation order.
