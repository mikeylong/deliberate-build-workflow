# New Project

Use this playbook when you want Codex to scaffold a new project from scratch using this workflow.

Goal: create a project with a working stack, a project-local `AGENTS.md`, and a clear next step into discovery.

## Default Stack

Unless the user specifies otherwise:
- Next.js App Router
- TypeScript
- Tailwind CSS
- shadcn/ui
- Bun
- Biome

## How To Run It In Codex

Prompt shape:

```text
Use /Users/mike/Design Workflow/docs/workflows/new-project.md.
Scaffold the project with the default stack unless I specify something else.
Create AGENTS.md in the new project and leave placeholders for the brief sections.
Do not start feature implementation after scaffolding.
```

## Required Steps

1. Confirm the project name, type, and any required integrations.
2. Scaffold the project with the confirmed stack.
3. Install only the dependencies required for the baseline stack.
4. Initialize git if needed.
5. Create a project-local `AGENTS.md` with placeholders for:
   - Problem Space
   - Emotional Core
   - Brand Identity
   - Stack
   - V1 Scope
6. Add `PLAN.md` only after planning is complete.
7. End by directing the next session into the design-thinking playbook.

## Guardrails

- Do not add optional dependencies without a reason.
- Do not invent product requirements during scaffolding.
- Do not skip the brief; the project should not move straight from scaffold to build.
