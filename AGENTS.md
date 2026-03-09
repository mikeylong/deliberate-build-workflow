# Design Workflow for Codex

This repository is a Codex-first workflow for going from idea to shipped product without skipping discovery, planning, or verification.

`AGENTS.md` is the canonical brief and operating manual for this repository. If you adapt this workflow into another project, keep this file in the project root and update it as the product evolves.

## Operating Sequence

Work in this order unless there is a strong reason not to:

1. Discovery and design thinking
2. Plan mode
3. Implementation
4. Test and debug

Do not skip directly to implementation on a new product or major feature. The workflow assumes the agent is only as good as the context it receives.

## Discovery and Design Thinking

Use the playbook in `docs/workflows/design-thinking.md` before planning a new product, major feature, or new screen family.

Rules:
- Stay in the problem space until it is explicitly confirmed.
- Capture the user's words, not generic product language.
- Define the emotional core before choosing aesthetic direction.
- Write the resulting brief back into this `AGENTS.md` file or into a project-local section that this file references.

Required outputs:
- Problem summary
- Person and trigger context
- Current workaround and cost
- Success outcome
- Emotional core
- Brand identity and visual direction
- Confirmed stack

## Plan Mode

Use the playbook in `docs/workflows/plan.md` once discovery is confirmed.

Rules:
- Plan before editing code.
- State what is in scope and out of scope.
- Map user flows before components.
- Name screens, states, APIs, dependencies, risks, and build order.
- End with an implementation-ready plan, not loose ideas.

Artifacts:
- `PLAN.md` in the target project root
- Updated scope notes in `AGENTS.md` when the plan changes long-lived assumptions

## Implementation Rules

Implementation should follow the approved plan and the established stack. Default conventions from the original workflow are preserved here in Codex-native form.

### Stack Defaults
- Prefer Bun for package management and task execution.
- Prefer Next.js App Router, TypeScript, Tailwind, and shadcn/ui when starting a new web product unless the project has a different confirmed stack.
- Prefer Server Components by default in Next.js; add client components only where interaction requires them.
- Use Biome instead of maintaining separate ESLint and Prettier setups.

### UI and UX Principles
- Every visual decision must be justified by the brief, not by trend-following.
- Use an 8pt spacing system.
- Use a restrained typography scale rather than arbitrary sizes.
- Use one accent color per view unless the brief requires otherwise.
- Design all states: default, hover, focus, active, disabled, loading, empty, and error.
- Empty states need a next step.
- Error states need what happened and what to do next.
- Avoid gradients, glow effects, and decorative noise unless the brief explicitly supports them.
- Accessibility is non-negotiable: keyboard support, visible focus, sufficient contrast, semantic HTML, and 44x44 touch targets on mobile.

### Motion Principles
- Animate transform and opacity, not layout properties.
- Use motion to clarify state change, not to decorate.
- Respect reduced-motion preferences.
- Finish the product before polishing animations.

### Dependency Discipline
- Check what the stack already provides before adding packages.
- Each dependency needs a clear reason.
- Prefer smaller focused tools over broad frameworks.

## Test and Debug

Use `docs/workflows/test-debug.md` after implementation or whenever something is broken.

Rules:
- Verify against both the approved plan and the product brief.
- Test the happy path, edge cases, loading states, empty states, and error states.
- Fix root causes, not symptoms.
- Re-run adjacent flows after each fix.

## Maintaining the Brief

This file replaces `CLAUDE.md` for Codex usage.

When a project using this workflow matures, add or update these sections here:
- Problem Space
- Emotional Core
- Brand Identity
- Stack
- V1 Scope
- Known patterns and decisions

If compatibility with Claude or Cursor matters later, duplicate from this file outward. Do not treat legacy tool-specific files as the source of truth.

## Legacy Compatibility

The `.claude/` and `.cursor/` directories remain in this repository as deprecated reference material from the original workflow.

Rules:
- Do not use them as the primary onboarding path.
- Do not install them globally from this repository.
- If you borrow material from them, port it back into `AGENTS.md` or `docs/workflows/`.
