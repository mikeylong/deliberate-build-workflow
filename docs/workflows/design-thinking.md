# Design Thinking

Use this before planning a new product, major feature, or new screen family.

Goal: understand the problem, person, and emotional contract before proposing features or visual direction.

## When To Use It

Use this playbook when:
- the project is new
- the problem is still fuzzy
- the brief does not exist yet
- the team is jumping to screens before agreeing on what matters

## How To Run It In Codex

Start a Codex session in discovery mode and provide:
- the product idea or feature request
- any known user or business context
- the current stack if it already exists
- the current `AGENTS.md` if this is an existing project

Prompt shape:

```text
Use /Users/mike/Design Workflow/docs/workflows/design-thinking.md.
Stay in discovery. Do not plan or implement yet.
Read AGENTS.md first and produce the phase outputs in order.
```

## Phase 1: Problem Space

Ask for:
- the specific problem in the user's words
- who has the problem
- when and where it appears
- the current workaround
- what success looks like for the person
- the confirmed stack or preferred default

Gate:
- produce a concise problem-space summary
- wait for confirmation before moving on

## Phase 2: Emotional Core

Ask for:
- how the person feels before using the product
- how they should feel while using it
- how they should feel after finishing
- what trust position the company should hold
- what the product must never feel like

Gate:
- synthesize an emotional core and brand essence
- wait for confirmation before moving on

## Phase 3: Solution Direction and Brand Identity

Ask for:
- the boundaries of v1
- the memorable impression
- the meaningful differentiator
- the product personality, voice, and visual signatures
- what should be explicitly avoided

Required output:
- a project brief ready to live inside `AGENTS.md`

## Required Deliverable

Write or update these sections in `AGENTS.md`:
- Problem Space
- Emotional Core
- Brand Identity
- Stack
- V1 Scope

## Guardrails

- Do not propose implementation details during Phase 1.
- Do not choose an aesthetic before the emotional core is agreed.
- Push back on vague statements like "clean" or "modern" until they are explained in product terms.
- Keep the language concrete enough that a later planner can make decisions without guessing.
