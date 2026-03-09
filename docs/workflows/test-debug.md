# Test and Debug

Use this after a build or when a feature is misbehaving.

Goal: verify correctness against both the implementation plan and the product brief, then isolate and fix root causes.

## How To Run It In Codex

Prompt shape:

```text
Use /Users/mike/Design Workflow/docs/workflows/test-debug.md.
Read AGENTS.md and PLAN.md first.
Review behavior against the approved brief and plan before proposing fixes.
```

## Verification Layers

### 1. Functional Verification

For each planned flow, check:
- trigger works
- each step completes correctly
- end state is correct
- loading, empty, and error states appear when they should
- edge cases behave as planned

### 2. Brief Alignment

Check:
- the product still expresses the intended emotional tone
- the differentiator is visible in the experience
- the visual system matches the brief and does not drift into generic UI

### 3. UX and Accessibility

Check:
- first-run clarity
- empty states with action
- useful errors
- keyboard access
- visible focus
- sufficient contrast
- clear next steps after success states

### 4. Root-Cause Debugging

Debug in this order:
- reproduce precisely
- isolate the layer
- read the relevant code before changing it
- fix the cause, not the symptom
- re-test adjacent flows after the fix

## Deliverable

Report findings in priority order:
- broken
- wrong versus brief or plan
- missing
- good

Include the affected file paths and the next action for each issue.
