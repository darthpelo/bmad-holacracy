# Customizing the BMAD Plugin

This guide explains how to extend the BMAD plugin with new skills, workflows, commands, templates, and domain support.

## Table of Contents

- [Plugin Architecture](#plugin-architecture)
- [Adding a New Skill](#adding-a-new-skill)
- [Adding a New Orchestrator](#adding-a-new-orchestrator)
- [Adding a New Command](#adding-a-new-command)
- [Adding Templates](#adding-templates)
- [Adding a New Domain](#adding-a-new-domain)
- [Skill Frontmatter Reference](#skill-frontmatter-reference)
- [Patterns and Conventions](#patterns-and-conventions)
- [Testing Your Changes](#testing-your-changes)

---

## Plugin Architecture

```
claude-plugin-bmad/
├── .claude-plugin/
│   └── plugin.json              # Plugin manifest (name, description, author)
├── skills/                      # Auto-discovered: each subdirectory with SKILL.md becomes a /command
│   └── bmad-<name>/SKILL.md
├── commands/                    # Slash commands (simpler than skills, no frontmatter)
│   └── bmad.md
├── resources/                   # Shared assets referenced by skills
│   ├── soul.md                  # Shared circle principles
│   ├── governance-protocol.md   # Dynamic governance protocol (tension sensing, role proposals)
│   ├── templates/<domain>/      # Output templates per domain
│   │   └── software/role-template.md  # Template for promoting temporary roles to SKILL.md
│   └── scripts/                 # Helper scripts
├── README.md
└── LICENSE
```

**Key concepts:**

- **Skills** (`skills/*/SKILL.md`) are the primary extension point. Each skill directory is auto-discovered and becomes a `/skill-name` slash command.
- **Commands** (`commands/*.md`) are simpler slash commands without frontmatter or agent configuration.
- **Resources** (`resources/`) hold shared assets — `soul.md` (circle principles), `governance-protocol.md` (dynamic governance), templates, scripts — referenced via `${CLAUDE_PLUGIN_ROOT}/resources/...`.
- **soul.md** (`resources/soul.md`) defines shared principles loaded by every role in the circle.
- **Config** (`resources/templates/config-example.yaml`) is a per-project config template users copy to `.claude/bmad-output/bmad-config.yaml`.
- **Domain detection** is a shared pattern: every skill detects `software`, `business`, `personal`, or `general` from files in the working directory.

---

## Adding a New Skill

### Step 1: Create the skill directory

```bash
mkdir skills/bmad-<name>
```

### Step 2: Choose the skill type

There are three types of skills in BMAD, each with different frontmatter:

| Type | `context` | `agent` | When to use |
|------|-----------|---------|-------------|
| **Role** | `fork` | `Explore`, `Plan`, `qa`, `general-purpose` | Independent workflow phase (scope, prioritize, impl...) |
| **Orchestrator** | `same` | `general-purpose` | Multi-step workflow that guides the user through multiple roles |
| **Utility** | `same` or `fork` | `general-purpose` | Tool or helper (init, shard...) |

### Step 3: Write SKILL.md

#### Role Skill Template

Use this for a new workflow phase (e.g., a "Data Steward" or "Documentation Owner" role):

```yaml
---
name: bmad-<name>
description: <Role purpose>. For <domains> (<specifics>). Use after <prerequisite>.
context: fork
agent: Plan
---

# BMAD <Role Title>

You energize the **<Role Title>** role in the BMAD circle. <Your purpose in one sentence.>

## Shared Principles

Read the BMAD circle principles from `${CLAUDE_PLUGIN_ROOT}/resources/soul.md`. Key principle for this role:
- **<Most relevant principle>**: <why it matters for this role>

## Project Config

Check for per-project config at `.claude/bmad-output/bmad-config.yaml`. If found, apply overrides for this role. If not found, use defaults.

## Domain Detection

Detect the project domain by analyzing files in the current directory:
- **software**: if `package.json`, `pom.xml`, `requirements.txt`, `go.mod`, `Cargo.toml` exists
- **business**: if `business-plan.md`, `market-analysis.md`, `strategy.md` exists
- **personal**: if `goals.md`, `journal.md`, or `habits/` folder exists
- **general**: default if no indicator found

## Input

- Read <prerequisite> in `.claude/bmad-output/` (one of: `<file1>`, `<file2>`). If not found: "<Error message>. Run /bmad-<prerequisite-skill>"

## Domain-Specific Behavior

### Software Development
**Focus**: <what this role does for software>
**Output**: `<filename>.md` with:
- <Section 1>
- <Section 2>

**Template**: `${CLAUDE_PLUGIN_ROOT}/resources/templates/software/<filename>.md`

### Business Strategy
**Focus**: <what this role does for business>
**Output**: `<filename>.md` with:
- <Section 1>
- <Section 2>

**Template**: `${CLAUDE_PLUGIN_ROOT}/resources/templates/business/<filename>.md`

### Personal Goals
**Focus**: <what this role does for personal>
**Output**: `<filename>.md` with:
- <Section 1>
- <Section 2>

**Template**: `${CLAUDE_PLUGIN_ROOT}/resources/templates/personal/<filename>.md`

## Tension Sensing

During your work, if you encounter a task that falls outside your defined scope and no existing BMAD role covers it, this is a **tension** — a gap in the circle.

When you detect a tension:
1. Read `${CLAUDE_PLUGIN_ROOT}/resources/governance-protocol.md`
2. Formulate the tension using the standard format
3. Present the proposal to the user for approval
4. If approved, create the temporary role and continue

Do NOT generate tensions for tasks covered by existing roles.
Do NOT interrupt flow for minor gaps — only for recurring or significant ones.

## Process

1. **Validate input**: Check prerequisite artifacts exist
2. **<Phase-specific step>**: <Description>
3. **Generate document**: Write to `.claude/bmad-output/<filename>.md`
4. **Handoff**: "<Output> completed. Next: /bmad-<next-role> for <next phase>."
```

#### Utility Skill Template

Use this for tools and helpers:

```yaml
---
name: bmad-<name>
description: <What it does>. <When to use>.
context: same
---

# BMAD <Tool Name>

<What this tool does in one sentence.>

## Process

1. <Step 1>
2. <Step 2>
3. <Step 3>

## Output

<Confirmation message>
```

### Step 4: Add templates (if needed)

If your skill generates domain-specific output, create templates:

```bash
# Create templates for each domain your skill supports
echo "# <Template Title>" > resources/templates/software/<output-name>.md
echo "# <Template Title>" > resources/templates/business/<output-name>.md
echo "# <Template Title>" > resources/templates/personal/<output-name>.md
```

Reference them in your SKILL.md with:
```
**Template**: `${CLAUDE_PLUGIN_ROOT}/resources/templates/<domain>/<filename>.md`
```

### Example: Adding a "Documentation Owner" Role

```bash
mkdir skills/bmad-docs
```

`skills/bmad-docs/SKILL.md`:
```yaml
---
name: bmad-docs
description: Documentation generation from implementation artifacts. For software (API reference), business (SOPs), personal (knowledge base). Use after impl.
context: fork
agent: general-purpose
---

# BMAD Documentation Owner

You energize the **Documentation Owner** role in the BMAD circle. You create clear, structured documentation from implementation artifacts.

## Shared Principles

Read the BMAD circle principles from `${CLAUDE_PLUGIN_ROOT}/resources/soul.md`. Key principle for this role:
- **Impact Over Activity**: document what matters, skip what doesn't

## Project Config

Check for per-project config at `.claude/bmad-output/bmad-config.yaml`. If found, apply overrides. If not found, use defaults.

## Domain Detection

Detect the project domain by analyzing files in the current directory:
- **software**: if `package.json`, `pom.xml`, `requirements.txt`, `go.mod`, `Cargo.toml` exists
- **business**: if `business-plan.md`, `market-analysis.md`, `strategy.md` exists
- **personal**: if `goals.md`, `journal.md`, or `habits/` folder exists
- **general**: default if no indicator found

## Input

- Read implementation artifacts in `.claude/bmad-output/` and source code. If no artifacts found: "No implementation found. Run /bmad-impl first."

## Domain-Specific Behavior

### Software Development
**Focus**: API docs, README, setup guides, architecture docs
**Output**: `documentation.md`

### Business Strategy
**Focus**: Standard operating procedures, process documentation
**Output**: `operations-guide.md`

### Personal Goals
**Focus**: Knowledge base, reference guides, checklists
**Output**: `reference-guide.md`

## Process

1. **Scan artifacts**: Read all files in `.claude/bmad-output/` and relevant source code
2. **Identify audience**: Ask who will read this documentation
3. **Generate docs**: Write structured documentation appropriate to the domain
4. **Handoff**: "Documentation completed. Review in `.claude/bmad-output/`."
```

---

## Adding a New Orchestrator

Orchestrators guide users through multi-step workflows. They run in the main conversation (`context: same`) and prompt the user to invoke individual roles at each step.

### Orchestrator Template

```yaml
---
name: bmad-<workflow>
description: Orchestrates <workflow name> (<step → step → step>). Interactive with human checkpoints. Resumable.
context: same
agent: general-purpose
---

# BMAD <Workflow> Orchestrator

You are the **<Workflow> Orchestrator** of the BMAD-METHOD framework. You guide the user through <purpose>.

## Workflow Structure

**Steps** (<N> steps):
```
step1 → step2 → step3 → step4
```

## Commands

- `/bmad-<workflow>` - Start new workflow
- `/bmad-<workflow> resume` - Resume from checkpoint
- `/bmad-<workflow> status` - Show progress

## Domain Detection

Detect the project domain by analyzing files in the current directory:
- **software**: if `package.json`, `pom.xml`, `requirements.txt`, `go.mod`, `Cargo.toml` exists
- **business**: if `business-plan.md`, `market-analysis.md`, `strategy.md` exists
- **personal**: if `goals.md`, `journal.md`, or `habits/` folder exists
- **general**: default if no indicator found

## Initialization

1. Check for existing workflow in `.claude/bmad-output/session-state.json`
2. Initialize session state with workflow type and step sequence
3. Display workflow plan and ask for confirmation

## Execution

For each step:

1. Display step description and expected output
2. Ask user to proceed: `[y] Yes  [n] Skip  [p] Pause  [x] Exit`
3. Prompt: "Please invoke: /bmad-<agent>"
4. Wait for completion, verify artifact exists
5. Update session-state.json with checkpoint
6. Advance to next step

## State Management

File: `.claude/bmad-output/session-state.json`

```json
{
  "domain": "<detected>",
  "phase": "<current>",
  "workflow": {
    "type": "<workflow-name>",
    "current_step": "<step>",
    "completed_steps": [],
    "step_sequence": ["step1", "step2", "step3"],
    "checkpoints": []
  }
}
```

## Resume Logic

1. Read session-state.json
2. Display completed and remaining steps
3. Continue from current_step

## Error Handling

- Missing artifact: offer Retry / Skip / Exit
- Session conflict: offer Complete existing / Abort / Cancel

## BMAD Principles
- Human-in-the-loop: checkpoint at every phase
- Progressive disclosure: one step at a time
- Resumable: save state after every checkpoint
```

### Key Design Rules for Orchestrators

1. **Use `context: same`** — orchestrators must run in the main conversation to guide the user through multiple agent invocations.
2. **Cannot invoke skills directly** — orchestrators prompt the user: "Please invoke: `/bmad-scope`". The user runs each role manually.
3. **Persist state** — write to `session-state.json` after every checkpoint so workflows can be paused and resumed.
4. **Verify artifacts** — after each agent completes, check that the expected output file exists in `.claude/bmad-output/`.

---

## Adding a New Command

Commands are simpler than skills. They don't have frontmatter, don't spawn agents, and run in the main conversation.

### Create a command file

```bash
# Creates /bmad-<name> command
touch commands/bmad-<name>.md
```

### Command Template

`commands/bmad-status.md`:
```markdown
# BMAD Status Check

Display a summary of the current BMAD project state.

## Process

1. Read `.claude/bmad-output/session-state.json`
2. List all artifacts in `.claude/bmad-output/`
3. Show current workflow phase and progress
4. Display formatted summary
```

### When to use Commands vs Skills

| Use Case | Commands | Skills |
|----------|----------|--------|
| Simple information display | Yes | Overkill |
| Needs agent isolation (`fork`) | No | Yes |
| Needs specific agent persona | No | Yes |
| Entry point / status dashboard | Yes | Overkill |
| Complex multi-step agent work | No | Yes |

---

## Adding Templates

Templates are output scaffolds that skills use to generate structured documents.

### Template location

```
resources/templates/
├── software/<template-name>.md
├── business/<template-name>.md
└── personal/<template-name>.md
```

### Template structure

Templates use placeholder sections that skills fill in:

```markdown
# <Document Title>

**Project**: [Project Name]
**Version**: 1.0
**Date**: [Date]
**Author**: [Role Name]

---

## Section 1

[Content description]

## Section 2

### Subsection 2.1
- [ ] Checklist item 1
- [ ] Checklist item 2

## Section 3

[Content description]
```

### Referencing templates from skills

In your SKILL.md:
```markdown
**Template**: `${CLAUDE_PLUGIN_ROOT}/resources/templates/software/my-template.md`
```

The `${CLAUDE_PLUGIN_ROOT}` variable resolves to the plugin's installation directory at runtime.

---

## Adding a New Domain

BMAD ships with three domains: `software`, `business`, `personal`. You can add more.

### Step 1: Define domain indicators

Choose which files signal your new domain. For example, a **research** domain:

```markdown
- **research**: if `paper.tex`, `bibliography.bib`, `data/` folder, or `experiments/` folder exists
```

### Step 2: Update domain detection in all skills

Every SKILL.md has a Domain Detection section. Add your domain **before** the `general` default:

```markdown
## Domain Detection

Detect the project domain by analyzing files in the current directory:
- **software**: if `package.json`, `pom.xml`, `requirements.txt`, `go.mod`, `Cargo.toml` exists
- **business**: if `business-plan.md`, `market-analysis.md`, `strategy.md` exists
- **personal**: if `goals.md`, `journal.md`, or `habits/` folder exists
- **research**: if `paper.tex`, `bibliography.bib`, `data/` folder, or `experiments/` folder exists
- **general**: default if no indicator found
```

### Step 3: Add domain-specific behavior to skills

In each relevant SKILL.md, add a new subsection:

```markdown
### Research
**Focus**: <what this agent does for research projects>
**Output**: `<filename>.md` with:
- <Section 1>
- <Section 2>

**Template**: `${CLAUDE_PLUGIN_ROOT}/resources/templates/research/<filename>.md`
```

### Step 4: Create templates

```bash
mkdir resources/templates/research
```

Add template files for each skill that supports the domain.

### Step 5: Update detect_domain.sh

```bash
# Research indicators
if [ -f "paper.tex" ] || [ -f "bibliography.bib" ] || [ -d "data" ] || [ -d "experiments" ]; then
    echo "research"
    exit 0
fi
```

### Step 6: Update the /bmad command

Edit `commands/bmad.md` to list the new domain in detection rules.

---

## Skill Frontmatter Reference

```yaml
---
name: skill-name              # Identifier (kebab-case). Defaults to directory name.
description: What it does      # REQUIRED. Claude uses this to decide when to suggest the skill.
context: fork                  # "fork" = isolated subagent. "same" = main conversation.
agent: Plan                    # Subagent type: Explore, Plan, qa, general-purpose.
argument-hint: "[args]"        # Autocomplete hint shown in UI.
disable-model-invocation: false # true = only the user can invoke, Claude cannot.
user-invocable: true           # false = only Claude can invoke, hidden from user.
allowed-tools: Read, Grep      # Restrict which tools the skill can use.
model: default                 # Override model for this skill.
---
```

### Variable substitutions available in skill content

| Variable | Description |
|----------|-------------|
| `$ARGUMENTS` | All arguments passed after the command name |
| `$ARGUMENTS[0]` | First argument |
| `$0`, `$1`, `$2` | Positional shorthand |
| `${CLAUDE_SESSION_ID}` | Current session ID |
| `${CLAUDE_PLUGIN_ROOT}` | Plugin installation directory |

### Agent types

| Agent | Best for |
|-------|----------|
| `Explore` | Research, analysis, codebase exploration (read-heavy) |
| `Plan` | Planning, design, requirements (structured thinking) |
| `qa` | Testing, validation, auditing (verification-focused) |
| `general-purpose` | Implementation, mixed tasks (default) |

### Context modes

| Mode | Behavior | Use when |
|------|----------|----------|
| `fork` | Spawns isolated subagent. Cannot see or modify main conversation state. | Individual workflow phases that should be self-contained. |
| `same` | Runs in main conversation. Has full context. | Orchestrators, utilities, status commands. |

---

## Patterns and Conventions

### Naming

- Skill directories: `bmad-<role>` (lowercase, hyphenated)
- Output files: `<descriptive-name>.md` (e.g., `test-report.md`, `sprint-plan.md`)
- Templates: match the output filename

### Holacracy pattern

Every role skill must:
1. Open with: `You energize the **<Role Title>** role in the BMAD circle.`
2. Load shared principles: `Read the BMAD circle principles from ${CLAUDE_PLUGIN_ROOT}/resources/soul.md`
3. Check per-project config: `Check for per-project config at .claude/bmad-output/bmad-config.yaml`
4. Include a `## Tension Sensing` block referencing `governance-protocol.md` (see Role Skill Template above)

### Workflow sequence

Skills signal the next step via handoff messages:

```markdown
"<Phase> completed. Next: /bmad-<next> for <description>."
```

This is a convention, not enforced. Users can invoke skills in any order.

### Session state

All skills write artifacts to `.claude/bmad-output/`. Orchestrators manage `session-state.json` with:

```json
{
  "domain": "software",
  "phase": "current-phase",
  "workflow": {
    "type": "greenfield|sprint|none",
    "current_step": "step-name",
    "completed_steps": ["step1", "step2"],
    "checkpoints": [
      {"step": "scope", "timestamp": "...", "status": "completed", "artifact": "project-brief.md"}
    ]
  }
}
```

### Prerequisites pattern

Skills check for prerequisite artifacts:

```markdown
## Input

- Read requirements in `.claude/bmad-output/` (one of: `PRD.md`, `business-requirements.md`, `action-plan.md`). If not found: "Requirements missing. Run /bmad-prioritize"
```

### Domain detection (copy-paste block)

Every skill includes this identical block:

```markdown
## Domain Detection

Detect the project domain by analyzing files in the current directory:
- **software**: if `package.json`, `pom.xml`, `requirements.txt`, `go.mod`, `Cargo.toml` exists
- **business**: if `business-plan.md`, `market-analysis.md`, `strategy.md` exists
- **personal**: if `goals.md`, `journal.md`, or `habits/` folder exists
- **general**: default if no indicator found
```

---

## Testing Your Changes

### 1. Verify structure

```bash
# All skills must have SKILL.md
for d in skills/bmad-*/; do
  if [ -f "$d/SKILL.md" ]; then
    echo "OK: $d"
  else
    echo "MISSING: $d/SKILL.md"
  fi
done
```

### 2. Verify frontmatter

```bash
# All SKILL.md files must start with ---
for f in skills/*/SKILL.md; do
  first=$(head -1 "$f")
  skill=$(basename $(dirname "$f"))
  if [ "$first" = "---" ]; then
    echo "OK: $skill"
  else
    echo "FAIL: $skill (no frontmatter)"
  fi
done
```

### 3. Check for hardcoded paths

```bash
# Should return zero matches
grep -r '~/\.' skills/ commands/ resources/
grep -r '/Users/' skills/ commands/ resources/
```

All paths should use `${CLAUDE_PLUGIN_ROOT}/` instead.

### 4. Test locally

```bash
# Load the plugin in development mode
claude --plugin-dir ./claude-plugin-bmad
```

Then test:
- `/bmad` — should show status overview
- `/bmad-<your-new-skill>` — should activate your skill
- Check that templates are readable via `${CLAUDE_PLUGIN_ROOT}/resources/templates/...`

### 5. Verify templates exist

```bash
# List all template references in skills
grep -rh 'CLAUDE_PLUGIN_ROOT.*templates' skills/ | sort -u

# List all actual template files
find resources/templates -name '*.md' | sort

# Cross-check: every referenced template should exist as a file
```
