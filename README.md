# BMAD-METHOD — Claude Plugin

**BMAD** (Breakthrough Method for Agile AI-Driven Development) is a framework of 12 specialized AI agents that guide you through structured workflows for software, business, and personal projects.

## Installation

```bash
claude plugin install ./claude-plugin-bmad
```

Or install directly from GitHub:

```bash
claude plugin install github:alessioroberto/claude-plugin-bmad
```

After installation, all 12 skills become available as slash commands in any project.

## Quick Start

1. **Open any project directory**

2. **Initialize BMAD**:
   ```
   /bmad-init
   ```

3. **Follow the base workflow**:
   ```
   /bmad-analyst    # Analysis & vision
   /bmad-pm         # Detailed requirements
   /bmad-architect  # Solution design
   /bmad-dev        # Implementation
   /bmad-qa         # Validation
   ```

4. **Extended workflow** (with optional agents):
   ```
   /bmad-analyst    # Analysis & vision
   /bmad-pm         # Detailed requirements
   /bmad-ux         # [OPTIONAL] User experience design
   /bmad-architect  # Solution design
   /bmad-security   # [OPTIONAL] Security audit
   /bmad-sm         # [OPTIONAL] Sprint planning
   /bmad-dev        # Implementation
   /bmad-qa         # Validation
   ```

5. **Check status anytime**:
   ```
   /bmad
   ```

## Agents Reference

### Core Workflow Agents

| Agent | Command | Description |
|-------|---------|-------------|
| Analyst | `/bmad-analyst` | Initial analysis, discovery, brainstorming. Creates project/business/personal brief. |
| Product Manager | `/bmad-pm` | Detailed requirements: PRD (software), business requirements, action plan (personal). |
| UX Designer | `/bmad-ux` | User research, wireframes, customer journey, life design. |
| Architect | `/bmad-architect` | Solution design, ADRs, technology stack, system architecture. |
| Security Auditor | `/bmad-security` | STRIDE threat modeling, OWASP Top 10, GDPR compliance, digital privacy. |
| Scrum Master | `/bmad-sm` | Sprint planning, quarterly OKRs, weekly planning. |
| Developer | `/bmad-dev` | Implementation following architecture and design. Supports context sharding. |
| QA | `/bmad-qa` | Testing, validation, edge case identification. |

### Workflow Orchestrators

| Orchestrator | Command | Description |
|--------------|---------|-------------|
| Greenfield | `/bmad-greenfield` | Full workflow (6-9 steps: init to qa). Interactive checkpoints, pause/resume, optional phases. |
| Sprint | `/bmad-sprint` | Sprint planning ceremony (6 steps: backlog review to commitment). Domain-aware, resumable. |

### Utilities

| Utility | Command | Description |
|---------|---------|-------------|
| Init | `/bmad-init` | Initialize BMAD in the current project. Run once per project. |
| Shard | `/bmad-shard` | Context sharding for large documents. Reduces token usage by 90%. |

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
/bmad-analyst       # Output: .claude/bmad-output/project-brief.md
/bmad-pm            # Output: .claude/bmad-output/PRD.md
/bmad-ux wireframe  # Output: .claude/bmad-output/ux-design.md
/bmad-architect     # Output: .claude/bmad-output/architecture.md
/bmad-security audit # Output: .claude/bmad-output/security-audit.md
/bmad-sm plan       # Output: .claude/bmad-output/sprint-plan.md
/bmad-dev           # Implements features
/bmad-qa            # Output: .claude/bmad-output/test-report.md
```

### Business Strategy

```bash
cd business-strategy/
echo "# Business Plan" > business-plan.md
/bmad-init
/bmad-analyst       # Output: .claude/bmad-output/business-brief.md
/bmad-pm            # Output: .claude/bmad-output/business-requirements.md
/bmad-ux journey    # Output: .claude/bmad-output/customer-experience.md
/bmad-architect     # Output: .claude/bmad-output/operational-architecture.md
/bmad-security gdpr # Output: .claude/bmad-output/compliance-report.md
/bmad-sm quarter    # Output: .claude/bmad-output/quarterly-plan.md
```

### Personal Goals

```bash
cd my-goals-2026/
echo "# My Goals" > goals.md
/bmad-init
/bmad-analyst          # Output: .claude/bmad-output/personal-brief.md
/bmad-pm               # Output: .claude/bmad-output/action-plan.md
/bmad-ux ideal-day     # Output: .claude/bmad-output/life-design.md
/bmad-architect        # Output: .claude/bmad-output/systems-design.md
/bmad-security privacy # Output: .claude/bmad-output/privacy-audit.md
/bmad-sm week          # Output: .claude/bmad-output/weekly-plan.md
```

## Workflow Orchestrators

### bmad-greenfield

Orchestrates the complete project workflow with interactive checkpoints:

```bash
/bmad-greenfield          # Start new workflow
/bmad-greenfield resume   # Resume from checkpoint
/bmad-greenfield status   # Show current progress
```

Features: human checkpoints at each phase, optional phases (UX, Security, SM), pause/resume, artifact verification, state management via `session-state.json`.

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
/bmad-dev STORY-001   # Developer loads only the relevant shard
```

## Output Structure

Each project generates artifacts in `.claude/bmad-output/`:

```
<project>/.claude/bmad-output/
├── *-brief.md               # Analyst output
├── PRD.md                   # PM output (software)
├── business-requirements.md # PM output (business)
├── action-plan.md           # PM output (personal)
├── ux-design.md             # UX output (software)
├── architecture.md          # Architect output (software)
├── security-audit.md        # Security output (software)
├── sprint-plan.md           # SM output (software)
├── test-report.md           # QA output
├── session-state.json       # Workflow state
└── shards/                  # Context shards (optional)
```

## Plugin Structure

```
claude-plugin-bmad/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   ├── bmad-analyst/SKILL.md
│   ├── bmad-pm/SKILL.md
│   ├── bmad-ux/SKILL.md
│   ├── bmad-architect/SKILL.md
│   ├── bmad-security/SKILL.md
│   ├── bmad-sm/SKILL.md
│   ├── bmad-dev/SKILL.md
│   ├── bmad-qa/SKILL.md
│   ├── bmad-greenfield/SKILL.md
│   ├── bmad-sprint/SKILL.md
│   ├── bmad-init/SKILL.md
│   └── bmad-shard/SKILL.md
├── commands/
│   └── bmad.md
├── resources/
│   ├── templates/
│   │   ├── software/
│   │   ├── business/
│   │   └── personal/
│   └── scripts/
│       └── detect_domain.sh
├── README.md
└── LICENSE
```

## Customization

Want to add new skills, workflows, commands, templates, or domains? See the **[Customization Guide](docs/CUSTOMIZATION.md)** for step-by-step instructions with copy-paste templates.

## BMAD Principles

- **Progressive Disclosure**: Each agent sees only the current step
- **Context Sharding**: Large documents fragmented for token efficiency
- **Human-in-the-Loop**: Agents ask questions, never assume
- **Domain Agnostic**: Works for software, business, and personal projects
- **Version Controlled**: All artifacts are git-trackable

## References

- BMAD-METHOD: https://github.com/bmad-code-org/BMAD-METHOD
- Documentation: https://bmadcodes.com/

## License

MIT
