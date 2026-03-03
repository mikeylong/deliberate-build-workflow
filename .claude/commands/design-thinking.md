# Design Thinking + Brand Foundation
**Mode: ASK only. Do not plan. Do not build. Do not propose solutions.**

Run this before any new product, feature, or screen. This skill has three phases with hard gates between them. Do not cross into the next phase until the current one is confirmed.

---

## What "Ask Mode" Means

Your job is to understand, not solve. The moment you propose a feature, UI pattern, tech approach, or aesthetic direction, you have left the problem space prematurely.

The difference:
- Problem space: what is happening for the user, why it matters, what they're trying to accomplish, what's in their way
- Solution space: features, flows, interfaces, components, aesthetic directions, tech choices

Hold that line until Phase 1 is confirmed.

---

## Phase 1: Problem Space
### Do not move to Phase 2 until these are answered and confirmed.

Ask all questions at once. If answers drift toward solutions, redirect: *"That's a solution — what's the underlying need?"*

---

**1. What is the problem?**

Describe the situation from the user's perspective — not what the product does, but what *goes wrong* without it. What breaks down? What takes too long? What causes frustration, confusion, or risk?

One sentence. User's words, not product words.

> ❌ "There's no tool for managing design tokens across platforms"
> ✅ "Designers update a color in Figma and then spend an hour manually updating the same color in 6 different files, and they still miss some"

---

**2. Who experiences this problem?**

Name a real, specific person — not a persona archetype. What's their role, context, skill level? What tools do they live in every day? Are they working alone or in a team? Under pressure or in focused flow?

---

**3. When and where does this problem occur?**

What triggers it? Is it daily friction or a rare painful event? What are they doing right before it appears? What does their environment look like — physical space, tools open, mental state?

---

**4. What's the stack?**

What framework, language, and tools are we building with? If new, what's preferred? If existing, what's already in place?

If the answer is "whatever you recommend", state the default stack (Next.js + TypeScript + Tailwind + shadcn/ui + Bun) and confirm before moving on.

---

**5. What do they do today instead?**

How are they solving this right now? Workarounds, manual steps, spreadsheets, asking someone, ignoring it? What does the workaround cost them — time, accuracy, stress, money?

---

**6. What does success look like for them — not the product?**

If this problem were fully solved, what would be different in their day? What would they stop doing? What would they be able to do that they can't now? How would they feel?

---

### Phase 1 Gate

Synthesize into a **Problem Space Summary:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PROBLEM SPACE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

THE PROBLEM
[One sentence. Specific friction, not abstract need.]

THE PERSON
[Specific individual — role, context, skill level, tools, mental state.]

THE TRIGGER CONTEXT
[When/where the problem occurs. What precedes it. Environment and pressure level.]

THE CURRENT WORKAROUND
[What they do today and what it costs them.]

THE SUCCESS OUTCOME
[What their day looks like when solved — outcome terms, not feature terms.]

STACK
[Confirmed. Locked before planning begins.]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Ask: **"Does this accurately capture the problem? Anything missing or wrong?"**

**Wait for explicit confirmation. Do not continue until received.**

---

## Phase 2: Emotional Core
### Only enter here after Phase 1 is confirmed.

This phase bridges the problem space and the brand. Brand is not a visual style you choose — it's an emotional promise that emerges from deeply understanding who has the problem and how it makes them feel.

Ask all questions at once.

---

**7. How does the user feel BEFORE they use the product?**

What is the emotional state of the person when the problem is active? What specific feelings does the current situation cause — not just inconvenience, but the emotional texture of it?

> Examples: anxious, frustrated, overwhelmed, embarrassed, exposed, uncertain, stuck, resentful

This is the emotional state the product must *resolve*.

---

**8. How should they feel WHILE using it?**

Not the outcome — the *experience of using the product itself*. What should it feel like to interact with it? What emotional tone should every screen, every interaction, every piece of copy carry?

> Examples: in control, calm, capable, focused, trusted, surprised by simplicity, professionally equipped

This defines the *character* of the product. It's the emotion the design must sustain throughout.

---

**9. How should they feel AFTER — once the task is done?**

What is the emotional payoff? The feeling at the end of the job, the closing state. This is the brand promise in emotional terms.

> Examples: certain, relieved, confident, unblocked, protected, like they didn't miss anything

This is what users will remember and tell others about (Peak-end rule).

---

**10. How should they feel about the *company* — not just the product?**

What does this brand stand for in the user's mind? What quality, value, or position should they associate with the company itself?

> Examples: rigorous, on our side, the expert in the room, refreshingly honest, quietly powerful

This is the brand's trust position — the relationship it has with the user beyond any single task.

---

**11. What should it NEVER feel like?**

Name 2–3 emotional states or associations the brand must explicitly avoid. These are the anti-values — the things that, if a user felt them, would mean the brand has failed.

> Examples: intimidating, opaque, like a toy, bureaucratic, like it's hiding something, like it's for someone else

Anti-values are as important as values. They create the boundaries that protect the brand from drift.

---

### Phase 2 Gate

Synthesize into an **Emotional Core:**

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EMOTIONAL CORE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

BEFORE (the pain state the product resolves)
[Emotional state when the problem is active]

DURING (the character of the experience)
[Emotional tone the product sustains throughout]

AFTER (the brand promise — what they remember)
[Emotional payoff at task completion]

TRUST POSITION (how they feel about the company)
[The relationship and association beyond the task]

ANTI-VALUES (what it must never feel like)
[2–3 explicit emotional states to avoid]

BRAND ESSENCE (synthesized)
[One sentence that captures the emotional contract:
"[Product] makes [person] feel [after state] by [how]
— never [anti-value]."]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Ask: **"Does this emotional core feel true to the product and the person? Anything off?"**

**Wait for explicit confirmation. Do not continue until received.**

---

## Phase 3: Solution Space + Brand Identity
### Only enter here after Phase 2 is confirmed.

Now with the problem locked and the emotional core confirmed, translate both into a brand identity and product direction. The aesthetic direction is no longer chosen — it is *derived* from what came before.

---

**12. What are the boundaries of the first version?**

What is the smallest version that still genuinely solves the problem? What's in, what's explicitly out? Push back on "everything" — the best v1 is ruthlessly focused. What's the core loop?

---

**13. What is the one thing someone will remember?**

If someone uses this for 60 seconds and closes it, what's the single impression that sticks? Ground this in the emotional core — it should be consistent with the AFTER state.

---

**14. What makes this genuinely different?**

Not just better execution of the same idea — what does this do *differently*? The answer should connect to why existing solutions fail the user emotionally, not just functionally.

---

### Brand Identity Derivation

Using the problem space AND emotional core, derive the brand identity. Do not pick a visual style arbitrarily — argue why it's the only logical conclusion given what you know.

Present this as:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BRAND IDENTITY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

BRAND PERSONALITY
[3–5 adjectives that describe the brand as if it were a person.
Not aspirational — these should describe how it actually
behaves in every interaction.]

BRAND VOICE
[How the product speaks. Sentence rhythm, vocabulary level,
tone in errors vs. success vs. onboarding. One short example
sentence that sounds exactly right for this brand.]

VISUAL PERSONALITY
[What the aesthetic must *communicate*, not what it must
*look like*. e.g. "Institutional precision without coldness"
or "Calm authority that never shouts"]

AESTHETIC DIRECTION (derived)
[Now name the direction — and explain why it's the only
logical conclusion given this person, this emotional core,
and this brand personality. Not chosen — argued.

Options to draw from but not limited to:
brutally minimal · editorial/magazine · retro-futuristic ·
soft/pastel utility · luxury/refined · industrial/raw ·
maximalist · toy-like/playful · organic/natural ·
art deco/geometric · dark utility · corporate-subversive]

VISUAL SIGNATURES
[3–4 specific, concrete design decisions this direction implies:
typography choice, color palette range, motion style,
component density, shadow/border treatment, iconography style]

WHAT WE WON'T DO
[2–3 things explicitly ruled out — connected directly to
the anti-values from the emotional core]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Full Brief Output

Once Phase 3 is confirmed, assemble the complete brief:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PRODUCT DESIGN BRIEF — [PRODUCT NAME]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROBLEM SPACE (locked)
[Paste confirmed Problem Space summary]

EMOTIONAL CORE (locked)
[Paste confirmed Emotional Core]

STACK
[Confirmed stack]

V1 SCOPE
[Core loop only — in and out of scope]

NORTH STAR
[The one thing someone will remember]

DIFFERENTIATION
[What this does differently, not just better]

BRAND IDENTITY
[Paste Brand Identity]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
READY FOR PLAN MODE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## Locking In: After the Full Brief Is Confirmed

1. **Write `CLAUDE.md`** with the complete brief — every section — so every future session loads with the full context including brand identity
2. **Append `## Project Aesthetic + Brand`** to `.cursor/rules/ui-design.mdc` — translate visual signatures and anti-values into concrete tokens: color range, type choice, density, motion personality, shadow/border decisions
3. **Switch to Plan mode** — run `/plan`

---

## Principles for Running This Session

- Phase 1 stays in the problem space — redirect any drift
- Phase 2 is not a creative exercise — the emotional core must be *felt* as true, not invented. Push back on answers that feel like marketing copy rather than honest description.
- The aesthetic direction in Phase 3 must be *argued*, not named. "Clean and modern" is not an argument. "Given that our user feels exposed and uncertain, and our brand must feel like a trusted expert in the room, the direction must be X because..." is an argument.
- Anti-values are as important as values — they prevent drift. If someone suggests a visual idea that triggers an anti-value, name it.
- Bold and committed always beats safe and hedged. A clear wrong direction is more useful than a vague right one.
