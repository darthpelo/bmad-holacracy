# BMAD-METHOD — Claude Plugin

**BMAD** (Breakthrough Method for Agile AI-Driven Development) is a holacracy-inspired AI circle of specialized roles that guide you through structured workflows for software, business, and personal projects.

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Holacracy Model](#holacracy-model)
- [Roles Reference](#roles-reference)
- [Quality Gates](#quality-gates)
- [Dynamic Governance](#dynamic-governance)
- [Supported Domains](#supported-domains)
- [Domain Examples](#domain-examples)
- [Workflow Orchestrators](#workflow-orchestrators)
- [Context Sharding](#context-sharding)
- [Output Structure](#output-structure)
- [Plugin Structure](#plugin-structure)
- [Customization](#customization)
- [BMAD Principles](#bmad-principles)
- [References](#references)
- [License](#license)

## Installation

```bash
claude plugin install ./claude-plugin-bmad
```

Or install from GitHub:

```bash
# 1. Add the repository as a marketplace
/plugin marketplace add darthpelo/claude-plugin-bmad

# 2. Install the plugin from the marketplace
/plugin install bmad-method@darthpelo-claude-plugin-bmad
```

After installation, all skills become available as slash commands in any project.

## Quick Start

1. **Open any project directory**

2. **Initialize BMAD**:
   ```
   /bmad-init
   ```

3. **Follow the base workflow**:
   ```
   /bmad-scope      # Scope clarification & discovery
   /bmad-prioritize # Requirements & prioritization
   /bmad-arch       # Solution architecture
   /bmad-impl       # Implementation
   /bmad-qa         # Quality validation
   ```

4. **Extended workflow** (with optional roles):
   ```
   /bmad-scope      # Scope clarification & discovery
   /bmad-prioritize # Requirements & prioritization
   /bmad-ux         # [OPTIONAL] Experience design
   /bmad-arch       # Solution architecture
   /bmad-security   # [OPTIONAL] Security audit
   /bmad-facilitate # [OPTIONAL] Sprint planning
   /bmad-impl       # Implementation
   /bmad-qa         # Quality validation
   ```

5. **Or let the orchestrator guide you**:
   ```
   /bmad-greenfield  # Interactive full workflow with checkpoints
   ```

6. **Check status anytime**:
   ```
   /bmad
   ```

## Holacracy Model

BMAD uses a holacracy-inspired model where each AI role "energizes" a specific purpose in the circle. All roles share core principles defined in `soul.md`:

- **Growth Over Ego** — Every role serves the project, not itself
- **Iteration Over Perfection** — Ship, learn, improve
- **Impact Over Activity** — Load only what's needed, eliminate token waste
- **Distributed Authority** — Each role owns its domain, no bottlenecks

Per-project behavior can be customized via `bmad-config.yaml` (see `resources/templates/config-example.yaml`).

Additional safeguards enforced by the circle:
- **Protect Main**: `bmad-impl` and `bmad-greenfield` block work on `main`/`master` — a dedicated feature branch is always required.
- **TDD Mandatory** (software domain): `bmad-impl` enforces red-green-refactor; `bmad-qa` issues P0 REJECT if `tdd-checklist.md` is missing.

## Roles Reference

### Core Workflow Roles

| Role | Command | Description |
|------|---------|-------------|
| Scope Clarifier | `/bmad-scope` | Discovery and scope definition. Creates project/business/personal brief. |
| Prioritizer | `/bmad-prioritize` | Requirements and prioritization: PRD (software), business requirements, action plan (personal). |
| Experience Designer | `/bmad-ux` | User research, wireframes, customer journey, life design. |
| Architecture Owner | `/bmad-arch` | Solution design, ADRs, technology stack, system architecture. |
| Security Guardian | `/bmad-security` | STRIDE threat modeling, OWASP Top 10, GDPR compliance, digital privacy. |
| Facilitator | `/bmad-facilitate` | Sprint planning, quarterly OKRs, weekly planning. |
| Implementer | `/bmad-impl` | Implementation following architecture and design. Supports context sharding. |
| Quality Guardian | `/bmad-qa` | Two modes: test planning (before impl) and verification (after impl). P0-P3 quality gates. |

### Workflow Orchestrators

| Orchestrator | Command | Description |
|--------------|---------|-------------|
| Greenfield | `/bmad-greenfield` | Full workflow (6-9 steps: init to qa). Interactive checkpoints, pause/resume, quality gates. |
| Sprint | `/bmad-sprint` | Sprint planning ceremony (6 steps: backlog review to commitment). Domain-aware, resumable. |

### Utilities

| Utility | Command | Description |
|---------|---------|-------------|
| Init | `/bmad-init` | Initialize BMAD in the current project. Run once per project. |
| Shard | `/bmad-shard` | Context sharding for large documents. Reduces token usage by 90%. |

## Quality Gates

BMAD enforces quality through a P0-P3 severity system:

| Level | Verdict | Meaning |
|-------|---------|---------|
| P0 | REJECT | Hard block. Must be fixed before proceeding. |
| P1 | CONDITIONAL PASS | Proceed with documented risks. Fix before release. |
| P2 | PASS with notes | Minor issues, track in backlog. |
| P3 | PASS | Optional improvements. |

The **Quality Guardian** (`/bmad-qa`) operates in two modes:
- **Plan mode** (`/bmad-qa plan`): Before implementation — defines test strategy, acceptance criteria, test cases
- **Verify mode** (`/bmad-qa verify`): After implementation — executes tests, validates, reports with P0-P3 verdicts

The **Security Guardian** (`/bmad-security`) can issue a **SECURITY BLOCK** (P0) that prevents the greenfield workflow from advancing to implementation.

## Dynamic Governance

BMAD implements dynamic governance inspired by holacracy's integrative decision-making. Any agent role can detect **tensions** — gaps where no existing role covers a needed capability — and propose new roles on the fly.

**How it works:**

1. **Tension Sensing**: All 8 agent roles monitor for tasks outside their scope. When a recurring or significant gap is detected, the role formulates a tension.
2. **Role Proposal**: The agent presents a structured proposal to the user (human-in-the-loop). The user can approve, reject, or modify.
3. **Temporary Roles**: Approved roles exist in the current session context. Orchestrators (`bmad-greenfield`, `bmad-sprint`) can include them in workflow planning.
4. **Promotion**: After 2+ uses, a temporary role can be promoted to a permanent SKILL.md using the role template (`resources/templates/software/role-template.md`).

The governance protocol is defined in `resources/governance-protocol.md` and loaded on-demand to minimize token usage.

## Supported Domains

BMAD automatically detects the project type and adapts terminology, templates, and outputs:

- **Software Development**: PRD, architecture, test design, sprint planning
- **Business Strategy**: Business requirements, market analysis, quarterly OKRs
- **Personal Goals**: SMART goals, habit tracking, weekly planning, life design

Detection is based on files in the working directory (e.g., `package.json` = software, `business-plan.md` = business, `goals.md` = personal).

## Domain Examples

### Software Development

```bash
cd my-software-project/
/bmad-init
/bmad-scope          # Output: .claude/bmad-output/project-brief.md
/bmad-prioritize     # Output: .claude/bmad-output/PRD.md
/bmad-ux wireframe   # Output: .claude/bmad-output/ux-design.md
/bmad-arch           # Output: .claude/bmad-output/architecture.md
/bmad-security audit # Output: .claude/bmad-output/security-audit.md
/bmad-facilitate     # Output: .claude/bmad-output/sprint-plan.md
/bmad-impl           # Implements features
/bmad-qa             # Output: .claude/bmad-output/test-report.md
```

### Business Strategy

```bash
cd business-strategy/
echo "# Business Plan" > business-plan.md
/bmad-init
/bmad-scope          # Output: .claude/bmad-output/business-brief.md
/bmad-prioritize     # Output: .claude/bmad-output/business-requirements.md
/bmad-ux journey     # Output: .claude/bmad-output/customer-experience.md
/bmad-arch           # Output: .claude/bmad-output/operational-architecture.md
/bmad-security gdpr  # Output: .claude/bmad-output/compliance-report.md
/bmad-facilitate     # Output: .claude/bmad-output/quarterly-plan.md
```

### Personal Goals

```bash
cd my-goals-2026/
echo "# My Goals" > goals.md
/bmad-init
/bmad-scope            # Output: .claude/bmad-output/personal-brief.md
/bmad-prioritize       # Output: .claude/bmad-output/action-plan.md
/bmad-ux ideal-day     # Output: .claude/bmad-output/life-design.md
/bmad-arch             # Output: .claude/bmad-output/systems-design.md
/bmad-security privacy # Output: .claude/bmad-output/privacy-audit.md
/bmad-facilitate week  # Output: .claude/bmad-output/weekly-plan.md
```

## Workflow Orchestrators

### bmad-greenfield

Orchestrates the complete project workflow with interactive checkpoints:

```bash
/bmad-greenfield          # Start new workflow
/bmad-greenfield resume   # Resume from checkpoint
/bmad-greenfield status   # Show current progress
```

Features: human checkpoints at each phase, optional phases (UX, Security, Facilitate), pause/resume, artifact verification, quality gate enforcement, state management via `session-state.json`.

### bmad-sprint

Interactive sprint planning ceremony:

```bash
/bmad-sprint          # Start new ceremony
/bmad-sprint resume   # Resume interrupted ceremony
/bmad-sprint replan   # Re-plan sprint (scope change)
```

6-step process: Backlog Review, Capacity Planning, Story Selection, Task Breakdown, Sprint Goal, Sprint Commitment.

## Context Sharding

For large documents (>3000 tokens), use sharding to reduce token usage by 90%:

```bash
/bmad-shard           # Fragments PRD/architecture into atomic shards
/bmad-impl STORY-001  # Implementer loads only the relevant shard
```

## Output Structure

Each project generates artifacts in `.claude/bmad-output/`:

```
<project>/.claude/bmad-output/
├── *-brief.md               # Scope Clarifier output
├── PRD.md                   # Prioritizer output (software)
├── business-requirements.md # Prioritizer output (business)
├── action-plan.md           # Prioritizer output (personal)
├── ux-design.md             # Experience Designer output (software)
├── architecture.md          # Architecture Owner output (software)
├── security-audit.md        # Security Guardian output (software)
├── sprint-plan.md           # Facilitator output (software)
├── test-plan.md             # Quality Guardian plan mode output
├── test-report.md           # Quality Guardian verify mode output
├── bmad-config.yaml         # Per-project config (optional)
├── session-state.json       # Workflow state
└── shards/                  # Context shards (optional)
```

## Plugin Structure

```
claude-plugin-bmad/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   ├── bmad-scope/SKILL.md        # Scope Clarifier
│   ├── bmad-prioritize/SKILL.md   # Prioritizer
│   ├── bmad-ux/SKILL.md           # Experience Designer
│   ├── bmad-arch/SKILL.md         # Architecture Owner
│   ├── bmad-security/SKILL.md     # Security Guardian
│   ├── bmad-facilitate/SKILL.md   # Facilitator
│   ├── bmad-impl/SKILL.md         # Implementer
│   ├── bmad-qa/SKILL.md           # Quality Guardian
│   ├── bmad-greenfield/SKILL.md   # Greenfield Orchestrator
│   ├── bmad-sprint/SKILL.md       # Sprint Orchestrator
│   ├── bmad-init/SKILL.md         # Init Utility
│   └── bmad-shard/SKILL.md        # Shard Utility
├── commands/
│   └── bmad.md
├── resources/
│   ├── soul.md                    # Shared circle principles
│   ├── governance-protocol.md     # Dynamic governance protocol
│   ├── templates/
│   │   ├── config-example.yaml    # Per-project config template
│   │   ├── software/
│   │   │   ├── role-template.md   # Template for promoting temporary roles
│   │   │   └── tdd-checklist.md   # TDD cycle tracking template
│   │   ├── business/
│   │   └── personal/
│   └── scripts/
│       └── detect_domain.sh
├── .github/
│   ├── workflows/
│   │   └── upstream-sync.yml      # Weekly upstream BMAD-METHOD sync monitor
│   ├── upstream-mapping.json      # Upstream agent → local skill mapping
│   ├── upstream-snapshot.json     # SHA snapshot of upstream files
│   └── upstream-version.txt       # Last synced upstream version
├── README.md
└── LICENSE
```

## Customization

Want to add new skills, workflows, commands, templates, or domains? See the **[Customization Guide](docs/CUSTOMIZATION.md)** for step-by-step instructions with copy-paste templates.

## BMAD Principles

- **Growth Over Ego** — Every role serves the project, not itself
- **Iteration Over Perfection** — Ship, learn, improve
- **Impact Over Activity** — Load only what's needed, eliminate token waste
- **Distributed Authority** — Each role owns its domain, no bottlenecks
- **Progressive Disclosure** — Each role sees only the current step
- **Human-in-the-Loop** — Roles ask questions, never assume
- **Domain Agnostic** — Works for software, business, and personal projects

## References

- BMAD-METHOD: https://github.com/bmad-code-org/BMAD-METHOD
- Documentation: https://bmadcodes.com/
- Holacracy: https://www.holacracy.org/
- Holacracy Constitution: https://github.com/holacracyone/Holacracy-Constitution

## License

MIT
