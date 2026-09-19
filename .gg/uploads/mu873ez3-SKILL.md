---
name: workflow-audit
description: Use when auditing a workflow to determine whether it should be automated, hybrid, or manual. Triggers on Impact/Risk scoring, 4-question risk check, verdict matrix, and mapping to ICM stage structures. Use when building ICM workspaces and deciding on review gates.
---

# SKILL.md — Workflow Audit & Verdict Mapping for ICM

## Purpose

This skill file enables an ICM agent to audit a workflow using the Impact/Risk scoring methodology and translate the verdict into an appropriate ICM folder structure. It is designed to be read as Layer 3 reference material within an ICM workspace.

## The Core Problem

Most AI automation failures follow the same pattern: practitioners select the workflow they hate most, attempt full end-to-end automation, and when it fails at an expensive point, they blame the model. The fix is to audit before building.

## The Audit Methodology

### Scoring Dimensions

Score each workflow on two dimensions, 1 to 5:

**Impact** — How much does this workflow move the business if it works?
- 1 = Minimal business effect
- 2 = Small operational improvement
- 3 = Moderate time savings or quality lift
- 4 = Significant revenue or margin improvement
- 5 = Transformational business outcome

**Risk** — How much does it cost you or your client if the AI gets it wrong?
- 1 = Trivial to fix, no downstream effects
- 2 = Requires minor cleanup, no external impact
- 3 = Real cost or time to fix, internal only
- 4 = Significant cost, may affect external parties
- 5 = Catastrophic—legal, financial, or reputational damage

### The 4-Question Risk Check

If ANY of these are true, the workflow gets a risk bump:

1. **Binding outputs** — Does the workflow produce something that commits the business to an action, contract, or obligation?
2. **Customer-facing** — Does the output touch a customer, client, or external stakeholder directly?
3. **Data dependency** — Does other software, reporting, or systems rely on this output being correct?
4. **Trust damage** — If this goes wrong, does it erode trust with customers, partners, or regulators?

If one or more ticks are present, the minimum risk score is **3** regardless of other factors. If multiple ticks are present, the minimum risk score is **4**.

### The Verdict Matrix

|  | Risk 1–2 | Risk 3 | Risk 4–5 |
|---|---|---|---|
| **Impact 1–2** | MANUAL | MANUAL | MANUAL |
| **Impact 3** | HYBRID | HYBRID | MANUAL |
| **Impact 4–5** | AUTOMATE | HYBRID | MANUAL |

### Verdict Definitions

- **AUTOMATE** — End-to-end AI execution with minimal human touch. Appropriate only when impact is high and risk is low.
- **HYBRID** — AI drafts or executes initial stages; human reviews and approves before final execution. This is the highest-value verdict for most workflows.
- **MANUAL** — Leave the workflow human-driven or with AI as a research assistant only. Appropriate when risk exceeds impact or when the 4-question check flags critical concerns.

## Mapping Verdicts to ICM Stage Structures

### AUTOMATE Structure

For high-impact, low-risk workflows:

```
workspace/
├── 01_research/
│   ├── CONTEXT.md
│   └── output.md
├── 02_draft/
│   ├── CONTEXT.md
│   └── output.md
├── 03_execute/
│   ├── CONTEXT.md
│   └── output.md
└── config.md
```

- Minimal human checkpoints (major stages only)
- No mandatory review gates between every stage
- Agent executes full chain with light oversight

### HYBRID Structure

For high-impact, high-risk workflows (the most common verdict):

```
workspace/
├── 01_research/
│   ├── CONTEXT.md
│   └── output.md
├── 02_draft/
│   ├── CONTEXT.md
│   └── draft.md
├── 03_review_gate/
│   ├── CONTEXT.md
│   ├── gate.md
│   └── approved.md
└── 04_execute/
    ├── CONTEXT.md
    └── output.md
```

- **Mandatory review gate** between AI-generated stages and execution stages
- The `gate.md` file tracks status: `pending_review`, `approved`, `rejected_with_changes`
- The `approved.md` file contains the human-approved version
- The agent in `04_execute/` reads ONLY from `03_review_gate/approved.md`, never from `02_draft/draft.md`
- If `approved.md` is missing or empty, the agent halts and reports: "Review gate incomplete. Human approval required before execution."

### When to Add Multiple Gates

For workflows with multiple risk ticks or cascading dependencies:

- Add a review gate after EVERY stage that produces binding, customer-facing, or system-dependent output
- Each gate gets its own numbered folder: `03_review_gate/`, `05_review_gate/`, etc.
- The rule: if the output of a stage would be expensive to undo, it gets a gate

### MANUAL Structure

For workflows that should remain human-driven:

```
workspace/
├── 01_research/
│   ├── CONTEXT.md
│   └── output.md
└── config.md
```

- The AI role is research and preparation only
- Human executes the actual workflow using the research output
- No execution stages in the ICM workspace

## Stage Contract Template for Review Gates

When a stage requires a review gate, its `CONTEXT.md` must include:

```markdown
## Inputs
- Layer 4 (working): ../[previous_stage]/output/  # Or specific file

## Process
1. Read the output from the previous stage
2. Present it for human review in the format specified in the gate template
3. Do NOT proceed to execution until approved.md is populated

## Outputs
- gate.md -> Tracks review status
- approved.md -> Human-edited and approved version

## Gate Rules
- If approved.md is empty: HALT. Status: pending_review
- If approved.md contains "REJECTED": Return to previous stage for revision
- If approved.md contains "APPROVED": Proceed to next stage
```

## Gate Status File Template

```markdown
# REVIEW GATE STATUS

**Stage:** [stage_name]
**Reviewer:** [assigned_human]
**Date:** [timestamp]

## Status
- [ ] Pending review
- [ ] Approved with changes
- [ ] Approved as-is
- [ ] Rejected — return to previous stage

## Notes
[Human reviewer notes here]

## Approved Version
[The final, approved content that the next stage will consume]
```

## Decision Rules for the Agent

When auditing a workflow and mapping it to an ICM structure, follow this priority:

1. **Always run the 4-question check first.** If any tick is present, the verdict is at minimum HYBRID.
2. **Never default to AUTOMATE.** AUTOMATE is a rare verdict requiring both high impact AND low risk with zero risk ticks.
3. **When in doubt, add a gate.** A review gate is cheap to add and expensive to omit.
4. **The folder is the safety mechanism.** If the structure requires a human edit before the next stage can proceed, the workflow is hybrid by design.

## Anti-Patterns to Avoid

- **The "almost automate" trap** — scoring risk at 2 when the 4-question check has a tick. The tick overrides the score.
- **The "gate as an afterthought"** — adding review gates only after a failure. Gates are design features, not patches.
- **The "monolithic context" mistake** — loading all stage instructions, all reference material, and all prior outputs into a single prompt. Use the five-layer context hierarchy (Layer 0–2 structural, Layer 3 reference, Layer 4 working) to scope context per stage.

## Integration with ICM Five-Layer Context

This skill file operates as **Layer 3 (Reference)** material. It should be placed in:

```
workspace/
├── _config/
│   └── skills/
│       └── workflow-audit.md    # This file
├── 01_research/
│   └── CONTEXT.md              # References this skill in its Inputs
└── ...
```

A stage's `CONTEXT.md` references this skill in its Inputs table:

```markdown
## Inputs
- Layer 3 (reference): ../../_config/skills/workflow-audit.md
- Layer 4 (working): [relevant working files]
```

## Source & Attribution

- Audit methodology: Laura (AI Business Transformation Hub) — Workflow Audit Workbook
- ICM architecture: Van Clief & McDermott, "Interpretable Context Methodology: Folder Structure as Agent Architecture" (arXiv:2603.16021v2, 2026)
- License: MIT
