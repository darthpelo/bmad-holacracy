# BMAD-METHOD Overview

Show the status of the BMAD framework in the current project.

## Process

1. **Detect domain** by analyzing files in the current directory:
   - **software**: if `package.json`, `pom.xml`, `requirements.txt`, `go.mod`, `Cargo.toml` exists
   - **business**: if `business-plan.md`, `market-analysis.md`, `strategy.md` exists
   - **personal**: if `goals.md`, `journal.md`, or `habits/` folder exists
   - **general**: default if no indicator found

2. **Check workflow status**: Read `.claude/bmad-output/session-state.json` if it exists.
   - If it exists: show current phase, active workflow, completed steps
   - If it doesn't exist: indicate that BMAD is not yet initialized

3. **Check existing artifacts**: List files in `.claude/bmad-output/` if the directory exists.

4. **Show formatted output**:

```
BMAD-METHOD
===========
Domain: <detected>
Status: <initialized/not initialized>
Phase:  <current phase from session-state or N/A>

Active workflow: <greenfield/sprint/none>
Completed steps: <list or N/A>

Generated artifacts:
- <list of files in bmad-output/ or "None">

Available roles:
  Core Workflow:
    /bmad-scope      - Scope clarification and discovery
    /bmad-prioritize - Requirements and prioritization (PRD, business req, action plan)
    /bmad-ux         - Experience design (wireframes, journey, life design)
    /bmad-arch       - Solution architecture (ADRs, system design)
    /bmad-security   - Security audit (STRIDE, OWASP, compliance, privacy)
    /bmad-facilitate - Sprint/quarter/week planning facilitation
    /bmad-impl       - Implementation
    /bmad-qa         - Quality validation (plan or verify mode)

  Orchestrators:
    /bmad-greenfield - Full workflow (init -> qa, 6-9 steps)
    /bmad-sprint     - Sprint planning ceremony (6 steps)

  Utilities:
    /bmad-init       - Initialize BMAD in the project
    /bmad-shard      - Context sharding for large documents

Quick start: /bmad-init to initialize, then /bmad-scope to begin.
```
