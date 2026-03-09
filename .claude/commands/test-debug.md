# Deprecated: legacy Claude Code command. Maintained Codex playbook: `docs/workflows/test-debug.md`.

# Test & Debug
**Mode: TEST/DEBUG. The build is done. Now verify it's actually right.**

Run this after the build phase is complete, or whenever something is broken. This skill verifies two things independently: does it *work*, and does it match the *intent* from the brief and plan.

---

## Before Testing: Load Context

Read these before doing anything:
1. `CLAUDE.md` → the Product Design Brief — especially the north star feeling and aesthetic direction
2. `PLAN.md` → the approved plan — screens, states, flows, and build sequence
3. `.cursor/rules/ux-design.mdc` → UX rules to verify against
4. `.cursor/rules/ui-design.mdc` → UI and aesthetic rules to verify against
5. `.cursor/rules/motion-design.mdc` → Motion rules and the accessibility checklist

---

## Layer 1: Does It Work?

Functional verification. Go through the plan's user flows one by one.

For each flow from PLAN.md:
```
FLOW: [Name]
✅ / ❌  Trigger works
✅ / ❌  Each step executes correctly
✅ / ❌  End state is correct
✅ / ❌  Edge cases handled (list each)
✅ / ❌  Error states appear correctly
✅ / ❌  Loading states appear and resolve
✅ / ❌  Empty states have a CTA
```

**Do not skip edge cases.** If the plan listed them, they must be tested.

---

## Layer 2: Does It Match the Brief?

Intent verification. Pull up the Product Design Brief from CLAUDE.md and check:

```
NORTH STAR FEELING
Stated feeling: [from brief]
Does the product actually feel that way? Y / N
Evidence for or against: [what specifically creates or breaks that feeling]

DIFFERENTIATION
Stated differentiator: [from brief]  
Is it actually present and felt? Y / N
Where does it show up (or fail to)?

AESTHETIC DIRECTION
Stated direction: [from brief]
Visual signatures promised: [list from brief]
✅ / ❌  Each signature is present
Anything that contradicts the direction?
```

---

## Layer 3: UX Audit

Run through these against the built product. Flag any failure:

**Vulnerability moments (Peter Ramsey):**
- [ ] First-time experience — is there orientation? Is the first action obvious?
- [ ] Empty states — does every one have a CTA? None purely informational?
- [ ] Error states — do all show what happened + why + what to do next?
- [ ] Loading states — no silent loading anywhere?
- [ ] After destructive actions — is there confirmation or undo?
- [ ] Dead ends — after every success state, is there a clear next step?

**Forms:**
- [ ] Labels always visible (no placeholder-as-label)?
- [ ] Validation on blur, not on keystroke?
- [ ] Submit buttons are verb + noun specific to the action?
- [ ] Form preserves input on failed submission?

**Trust:**
- [ ] Any dark patterns? (hidden costs, misleading toggles, buried cancellation)
- [ ] Any premature commitment? (sign-up walls before value is shown)

---

## Layer 4: UI Audit

```
COLOR
- [ ] One accent color per view?
- [ ] No gradients unless explicitly in the brief?
- [ ] No glow effects as affordances?
- [ ] Theme tokens used before custom values?

TYPOGRAPHY
- [ ] text-balance on headings?
- [ ] text-pretty on body?
- [ ] tabular-nums on numbers/data?
- [ ] No letter-spacing modifications?

COMPONENT STATES
For each interactive component:
- [ ] Default
- [ ] Hover (with transition, min 150ms)
- [ ] Focus (visible ring — never just outline-none)
- [ ] Active/pressed
- [ ] Disabled
- [ ] Loading
- [ ] Empty
- [ ] Error

ACCESSIBILITY
- [ ] aria-labels on all icon-only buttons?
- [ ] All interactive elements keyboard accessible?
- [ ] Color never the only conveyor of meaning?
- [ ] Touch targets min 44×44px on mobile?
```

---

## Layer 5: Motion Audit

```
MOTION GAPS
- [ ] Every conditional render wrapped in AnimatePresence?
- [ ] No elements that snap in/out without transition?

ANIMATION PROPERTIES
- [ ] Only transform and opacity animated (no width/height/margin)?
- [ ] All entrance transitions use ease-out?
- [ ] Exits exist and are subtler than enters?
- [ ] Scale starts from 0.9+ not 0?
- [ ] transform-origin correct on dropdowns/popovers?

ACCESSIBILITY
- [ ] prefers-reduced-motion handled with useReducedMotion()?
- [ ] No autoplay animations that ignore this preference?

CONTEXT
- [ ] Duration appropriate for project type (not universally flagged)?
- [ ] Spring bounce matches professional vs playful context?
```

---

## Debugging Protocol

When something is broken, follow this order — don't guess:

**1. Reproduce it precisely**
What exact steps cause the bug? What's the expected behavior? What's the actual behavior? Can you reproduce it consistently?

**2. Isolate the layer**
- Data problem (wrong shape, missing field, failed fetch)?
- Logic problem (wrong condition, incorrect computation)?
- State problem (stale state, wrong update, race condition)?
- Render problem (component not receiving correct props, wrong conditional)?
- Style problem (CSS specificity, missing class, layout issue)?

**3. Read before you change**
Before touching any code, read the full component and its dependencies. Bugs are almost always introduced by a misunderstanding of what already exists.

**4. Fix the cause, not the symptom**
If a value is undefined, find out *why* it's undefined — don't just add a `?.` to suppress the error. Symptom fixes create new bugs.

**5. Verify the fix doesn't break adjacent behavior**
After fixing, re-run the flows from Layer 1 for any flow that touches the changed code.

---

## Output Format

Present findings as a prioritized list:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TEST RESULTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔴 BROKEN — must fix before shipping
  - [Issue]: [File:line] → [What to do]

🟡 WRONG — doesn't match brief or plan
  - [Issue]: [Where] → [What it should be per brief/plan]

🟠 MISSING — states or flows not implemented
  - [Issue]: [Where] → [What's needed]

🟢 GOOD — working as intended
  - [What's working well]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Fix 🔴 first. Then 🟡. Then 🟠. 🟢 items don't get touched.
