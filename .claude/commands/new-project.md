# Deprecated: legacy Claude Code command. Maintained Codex playbook: `docs/workflows/new-project.md`.

# New Project Setup

Automates full project scaffolding using Bun. Run this at the start of every new project.

## Steps

### 1. Confirm project details
Ask the user:
- "What's the project name?" (used for folder, GitHub repo, Vercel project)
- "What's the project type?" (landing page / web app / dashboard / other)
- "Does this project need the Vercel AI SDK?" (yes / no)

---

### 2. Create Next.js project with Bun
```bash
bun create next-app@latest $PROJECT_NAME
```

When prompted, choose:
- TypeScript → **Yes**
- Linter → **Biome**
- React Compiler → **No**
- Tailwind CSS → **Yes**
- `src/` directory → **Yes**
- App Router → **Yes**
- Import alias (`@/*`) → **No** (use default)

```bash
cd $PROJECT_NAME
```

---

### 3. Update package.json scripts for Bun
Replace the scripts field in `package.json` with:
```json
{
  "scripts": {
    "dev": "bun --bun next dev",
    "build": "bun --bun next build",
    "start": "bun --bun next start"
  }
}
```

---

### 4. Install shadcn/ui with preset
```bash
bunx --bun shadcn@latest create --preset "https://ui.shadcn.com/init?base=radix&style=vega&baseColor=zinc&theme=indigo&iconLibrary=lucide&font=inter&menu-Accent=subtle&menuColor=default&radius=default&template=next" --template next
```

Then add most-used components:
```bash
bunx --bun shadcn@latest add button input label card dialog sheet tabs
bunx --bun shadcn@latest add dropdown-menu tooltip toast avatar badge
bunx --bun shadcn@latest add form select textarea separator skeleton
```

---

### 5. Install Vercel AI SDK (if confirmed in step 1)
```bash
bun add ai @ai-sdk/anthropic zod
```

Create the env file:
```bash
touch .env.local
```

Add to `.env.local`:
```
ANTHROPIC_API_KEY=your_key_here
```

---

### 6. Install additional utilities
```bash
bun add framer-motion clsx tailwind-merge @tanstack/react-query
```

> Ask before adding anything else. Each dep has a cost.

---

### 7. Set up Git
```bash
git init
git add .
git commit -m "chore: initial project setup"
```

---

### 8. Create GitHub repo
```bash
gh repo create $PROJECT_NAME --private --source=. --remote=origin --push
```

---

### 9. Create dev branch
```bash
git checkout -b dev
git push -u origin dev
```

---

### 10. Link to Vercel
```bash
vercel link
vercel env pull .env.local
```

---

### 11. Scaffold CLAUDE.md
Create `CLAUDE.md` in the project root using the template below.
Note: The Brand Identity and Emotional Core sections will be filled in after running `/design-thinking`.

### 12. Copy Cursor rules
Create `.cursor/rules/` and add: `ui-design.mdc`, `ux-design.mdc`, `motion-design.mdc`, `stack.mdc`, `git.mdc`.

### 13. First run
```bash
bun run dev
```

Tell the user the project is ready at http://localhost:3000 🎉
Then remind them: **Run `/design-thinking` before writing any code.**

---

## CLAUDE.md Template

```markdown
# [PROJECT NAME]

## Problem Space
<!-- Filled in by /design-thinking Phase 1 -->

### The Problem
<!-- One sentence. Specific friction, not abstract need. -->

### The Person
<!-- Specific individual — role, context, skill level, tools, mental state. -->

### Trigger Context
<!-- When/where the problem occurs. Environment and pressure level. -->

### Current Workaround
<!-- What they do today and what it costs them. -->

### Success Outcome
<!-- What their day looks like when solved — outcome terms, not feature terms. -->

---

## Emotional Core
<!-- Filled in by /design-thinking Phase 2 -->

### Before (pain state the product resolves)
<!-- Emotional state when the problem is active -->

### During (character of the experience)
<!-- Emotional tone the product sustains throughout every interaction -->

### After (the brand promise)
<!-- Emotional payoff at task completion — what they remember -->

### Trust Position
<!-- How they feel about the company beyond any single task -->

### Anti-Values
<!-- What it must never feel like — 2–3 explicit emotional states to avoid -->

### Brand Essence
<!-- "[Product] makes [person] feel [after state] by [how] — never [anti-value]." -->

---

## Brand Identity
<!-- Filled in by /design-thinking Phase 3 -->

### Brand Personality
<!-- 3–5 adjectives describing the brand as if it were a person -->

### Brand Voice
<!-- How the product speaks — tone, rhythm, vocabulary. One example sentence. -->

### Visual Personality
<!-- What the aesthetic must *communicate*, not what it must look like -->

### Aesthetic Direction
<!-- Named direction + the argument for why it's right for this person + emotional core -->

### Visual Signatures
<!-- 3–4 specific design decisions: typography, color range, motion style, density -->

### What We Won't Do
<!-- 2–3 explicit rules connected to the anti-values -->

---

## Stack

- **Frontend:** Next.js (App Router) + TypeScript + Tailwind CSS + shadcn/ui + Bun
- **Linter:** Biome
- **Icons:** Lucide React
- **Deployment:** Vercel
- **Package manager:** Bun — always `bun add`, never npm or npx
<!-- Add backend, auth, database below if applicable -->

---

## V1 Scope

<!-- Core loop — what's in and explicitly out of scope -->

---

## Core Rules

- Always read this file at the start of every session
- If I correct you on something, update this file immediately
- Use `bun` for all package operations — never npm or npx
- Check shadcn/ui before building any component from scratch
- Prefer editing existing components over creating new ones
- Ask before adding any new dependency
- Every design decision must be consistent with the Brand Identity above

## Design Rules (project-specific)
<!-- Filled in after /design-thinking — specific tokens, patterns, anti-patterns for this project -->

## What to Ask Before Doing
- Adding a new dependency → ask first
- Changing folder structure → ask first
- Any new UI pattern not covered here → ask first
- Any copy or microcopy decision → check Brand Voice first

## Known Decisions
<!-- Grows over time — add entries when recurring patterns are established -->
```
