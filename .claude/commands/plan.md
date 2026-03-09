# Deprecated: legacy Claude Code command. Maintained Codex playbook: `docs/workflows/plan.md`.

# Plan
**Mode: PLAN only. No code. No implementation. No files created.**

Run this after `/design-thinking` is confirmed. The brief must exist in CLAUDE.md before starting. If it doesn't, run `/design-thinking` first.

Your job in this skill is to think through the full build *before* any code is written. Every decision made here is a decision that doesn't get made mid-build — which is where mistakes and drift happen.

---

## Before Planning: Load Context

Read these before doing anything else:
1. `CLAUDE.md` → the Product Design Brief — especially the **stack**, problem, user, north star, and aesthetic
2. `.cursor/rules/stack.mdc` → patterns and rules for the confirmed stack
3. `.cursor/rules/ui-design.mdc` → the Project Aesthetic section

If CLAUDE.md has no Product Design Brief, stop and say: *"I need the design brief before planning. Run `/design-thinking` first."*

If no stack is defined in CLAUDE.md, stop and ask: *"What stack are we building with?"* — add it to CLAUDE.md before continuing.

**State the stack explicitly at the top of your plan.** Every architectural decision that follows — Server vs Client Components, data fetching approach, routing structure, which primitives to reach for — must be made through the lens of that specific stack. Never suggest a pattern that doesn't match it.

---

## Step 1: Scope Boundary

Before planning what to build, define what is **not** in scope for this build.

State explicitly:
- What this build covers (features, screens, flows)
- What is explicitly out of scope and why
- What is a future consideration but not now

This prevents scope creep during the build phase. If something is out of scope, it doesn't get planned, and it doesn't get built.

---

## Step 2: User Flows First

Before any component or architecture decisions, map the key user flows as plain text sequences. Not wireframes, not components — just the steps a user takes.

For each flow:
```
FLOW: [Name]
Trigger: [What starts this flow]
Steps:
  1. User does X
  2. System responds with Y
  3. User sees Z and can do A or B
  ...
End state: [What has changed when the flow is complete]
Edge cases: [What can go wrong and what happens]
```

Map every flow in scope before moving on. Edge cases are required — they often reveal the hardest parts of the build.

---

## Step 3: Screen & State Inventory

From the flows, list every screen and every meaningful state that needs to exist:

```
SCREENS
- [Screen name]: [What the user does here]
- ...

STATES TO DESIGN
- [Component/screen]: [loading / empty / error / partial / success / disabled]
- ...
```

Every state listed here needs to be built. This is the list that prevents the "I forgot the empty state" moment at the end.

---

## Step 4: Component Architecture

Now — only now — think about components. Work top-down:

```
PAGES / ROUTES
  └── [Layout component]
       └── [Section components]
            └── [UI components]
                 └── [Primitives from shadcn/ui]
```

For each significant component, note:
- What data it needs (props or fetched)
- What state it manages locally (if any)
- Whether it's a Server Component or Client Component and why
- Which shadcn/ui primitives it's built from (check before inventing)

---

## Step 5: Data & API Shape

For each data entity in the product:

```
ENTITY: [Name]
Fields: [list with types]
Source: [where it comes from — local state / API / database]
Mutations: [what operations change it — create / update / delete]
```

If there are API routes needed, list them:
```
API ROUTES
POST /api/[route] → [what it does, what it returns]
GET  /api/[route] → [what it does, what it returns]
```

---

## Step 6: Build Sequence

Order the work from most foundational to most dependent. This is the sequence the build follows — not alphabetical, not by feature, but by dependency.

```
BUILD SEQUENCE
1. [Foundation: layout, routing, auth if needed]
2. [Data layer: types, API routes, data fetching]
3. [Core screens: the happy path first]
4. [States: loading, empty, error for each screen]
5. [Secondary flows]
6. [Polish: animation, micro-interactions, transitions]
7. [Edge cases and error handling]
```

Rule: **build the happy path first, states second, polish last.** Never animate something that doesn't work yet.

---

## Step 7: Risk & Unknowns

List anything that is uncertain, technically risky, or likely to take longer than expected:

```
RISKS & UNKNOWNS
- [Thing]: [Why it might be hard / what we don't know yet]
- ...
```

These get resolved in the build phase before the features that depend on them.

---

## Step 8: Plan Output

Present the complete plan in one readable document, starting with the stack so it's impossible to miss:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

STACK
[Framework + language + key libraries. Every decision below is made for this stack.]

IN SCOPE
[What this build covers]

OUT OF SCOPE
[What is explicitly not being built now, and why]

USER FLOWS
[All flows with steps and edge cases]

SCREENS & STATES
[Every screen and every state that must be designed and built]

COMPONENT ARCHITECTURE
[Top-down component tree with data sources and Server/Client designation]

DATA & API SHAPE
[Entities, fields, mutations, API routes]

BUILD SEQUENCE
[Ordered list from foundation to polish]

RISKS & UNKNOWNS
[What might be hard, what we don't know yet]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**"Does this plan cover everything? Anything missing, out of order, or that should be descoped before we build?"**

Wait for confirmation. Do not start building until the plan is explicitly approved.

---

## After Plan Is Confirmed

1. **Save the plan to `PLAN.md`** in the project root — the build phase references it
2. **Switch to Build mode** — agents execute the plan in order, referencing PLAN.md for sequence and CLAUDE.md for brief/aesthetic
3. One agent per branch if running parallel sessions — each takes a section of the build sequence

---

## Principles for Planning

- A plan that takes 20 minutes to write saves 2 hours of confused building
- If a component's data source is unclear during planning, it will be unclear during building — resolve it now
- Every "we'll figure it out later" in the plan becomes a decision made under pressure during the build
- The build sequence is a contract — agents follow it in order, they don't jump ahead
- If the plan reveals the scope is too large for one session, split it now, not mid-build
