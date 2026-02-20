# Governance Protocol

This protocol defines how the BMAD circle evolves dynamically. When an agent detects a gap in the circle, it follows this protocol to propose new roles — always with human approval.

## Tension Format

When you detect a task outside your scope that no existing BMAD role covers, formulate a tension:

```
TENSION DETECTED
================
Gap: [What task or responsibility is missing from the circle]
Suggested Role: bmad-<name>
Purpose: [What this role would do in the circle]
Accountabilities:
  - [Responsibility 1]
  - [Responsibility 2]
  - [Responsibility 3]
Domain: software | business | personal | general
```

## Existing Roles Reference

Before proposing a new role, verify the gap is real. These roles already exist:
- **bmad-scope**: Vision, scope, briefs
- **bmad-prioritize**: Requirements, PRDs, priorities
- **bmad-ux**: User research, wireframes, journeys
- **bmad-arch**: Architecture, ADRs, system design
- **bmad-security**: Threat modeling, compliance, audits
- **bmad-facilitate**: Sprint/quarter/week planning
- **bmad-impl**: Code, content, action implementation
- **bmad-qa**: Testing strategy, quality validation
- **bmad-greenfield**: Full workflow orchestration
- **bmad-sprint**: Sprint ceremony orchestration

If an existing role covers the task, suggest invoking that role instead of creating a new one.

## Proposal Flow

1. **Present the tension** to the user using the format above
2. **Offer options**: Approve / Reject / Modify
   - **Approve**: Create the temporary role immediately
   - **Reject**: Continue your current work, no role created
   - **Modify**: User adjusts name, purpose, or accountabilities before creation
3. **If approved**: Create the temporary role in the current session context

## Temporary Role Format

When creating a temporary role after approval, establish it in the conversation with:

```
TEMPORARY ROLE CREATED
======================
Name: bmad-<name>
Purpose: [Purpose as approved by user]
Accountabilities:
  - [As approved]
Principles: Follow soul.md (Growth Over Ego, Iteration Over Perfection, Impact Over Activity, Distributed Authority)

This role is active for the current session only.
```

The temporary role:
- Can be invoked by orchestrators as if it were a permanent role
- Follows the same BMAD principles from soul.md
- Has no SKILL.md on filesystem (exists only in conversation context)
- Ceases to exist when the session ends

## Promotion Rules

Track how many times a temporary role is used in the session. When the count reaches **2 or more uses**:

1. **Suggest promotion**: "The temporary role bmad-<name> has been used N times this session. Would you like to make it permanent?"
2. **If confirmed**: Generate a SKILL.md using the role template at `${CLAUDE_PLUGIN_ROOT}/resources/templates/software/role-template.md`
   - Create directory: `skills/bmad-<name>/`
   - Write `skills/bmad-<name>/SKILL.md` with all standard blocks (frontmatter, soul.md, domain detection, config, process, tension sensing)
   - Use `${CLAUDE_PLUGIN_ROOT}/` for all paths (never hardcode absolute paths)
3. **If rejected**: Do not suggest again in this session

## Governance Principles

- **Human-in-the-loop**: Never create a role without explicit user approval
- **Minimal disruption**: Tension sensing should not interrupt normal work flow for minor gaps
- **Single responsibility**: Each proposed role should have a clear, distinct purpose
- **Circle coherence**: New roles should complement, not overlap with, existing roles
