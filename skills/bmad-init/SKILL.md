---
name: bmad-init
description: Initialize BMAD framework in the current project. Creates bmad-output directory and configures for domain. Run once per project.
context: same
---

# BMAD Init

Initialize the BMAD circle in the current project.

## Process

1. **Detect domain** by analyzing files in the current directory:
   - **software**: if `package.json`, `pom.xml`, `requirements.txt`, `go.mod`, `Cargo.toml` exists
   - **business**: if `business-plan.md`, `market-analysis.md`, `strategy.md` exists
   - **personal**: if `goals.md`, `journal.md`, or `habits/` folder exists
   - **general**: default if no indicator found

2. **Create structure**:
   ```bash
   mkdir -p .claude/bmad-output
   mkdir -p .claude/bmad-output/shards/{requirements,architecture,stories}
   ```

3. **Create session state**:
   ```json
   {
     "domain": "<detected-domain>",
     "phase": "analysis",
     "created": "<timestamp>",
     "updated": "<timestamp>",
     "artifacts": []
   }
   ```
   Write to: `.claude/bmad-output/session-state.json`

4. **Add to CLAUDE.md**:
   ```markdown
   ## BMAD Context

   Domain: <detected-domain>
   Phase: analysis

   Circle roles:
   - /bmad-scope - Scope clarification and discovery
   - /bmad-prioritize - Requirements and prioritization
   - /bmad-arch - Solution architecture
   - /bmad-impl - Implementation
   - /bmad-qa - Quality validation

   Workflow:
   1. /bmad-scope -> clarify scope
   2. /bmad-prioritize -> define requirements
   3. /bmad-arch -> design architecture
   4. /bmad-impl -> implement
   5. /bmad-qa -> validate
   ```

5. **Confirm**:
   "BMAD circle initialized for domain: <domain>. Start with: /bmad-scope"
