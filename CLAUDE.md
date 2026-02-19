# CLAUDE.md

## Project Overview
Claude Code plugin: BMAD-METHOD framework — holacracy-inspired AI circle for structured project workflows.
No build step, no npm, no traditional tests. All content is Markdown.

## Structure
- `skills/bmad-<name>/SKILL.md` — auto-discovered skills (YAML frontmatter required)
- `commands/<name>.md` — simple slash commands (no frontmatter)
- `resources/soul.md` — shared circle principles (loaded by every role)
- `resources/templates/<domain>/<name>.md` — output scaffolds (software/business/personal)
- `resources/templates/config-example.yaml` — per-project config template
- `.claude-plugin/plugin.json` — plugin manifest
- `docs/CUSTOMIZATION.md` — contributor guide with templates

## Holacracy Model
Every role "energizes" a purpose in the BMAD circle. Roles load shared principles from `soul.md` and respect per-project config from `.claude/bmad-output/bmad-config.yaml`.

Circle roles:
- `/bmad-scope` — Scope Clarifier (discovery, briefs)
- `/bmad-prioritize` — Prioritizer (requirements, PRDs)
- `/bmad-ux` — Experience Designer (wireframes, journeys)
- `/bmad-arch` — Architecture Owner (ADRs, system design)
- `/bmad-security` — Security Guardian (threat modeling, compliance)
- `/bmad-facilitate` — Facilitator (sprint/quarter/week planning)
- `/bmad-impl` — Implementer (code, content, actions)
- `/bmad-qa` — Quality Guardian (plan mode + verify mode, P0-P3 gates)

Orchestrators: `/bmad-greenfield`, `/bmad-sprint`
Utilities: `/bmad-init`, `/bmad-shard`

## Key Conventions
- All skill template paths use `${CLAUDE_PLUGIN_ROOT}/` — never hardcode absolute paths
- Every SKILL.md must start with `---` YAML frontmatter (name, description, context, agent)
- Every role skill opens with: "You energize the **X** role in the BMAD circle."
- Every role skill loads `${CLAUDE_PLUGIN_ROOT}/resources/soul.md` for shared principles
- Domain detection block is copy-pasted identically across all skills — update ALL when adding domains
- Orchestrators use `context: same`, agent skills use `context: fork`
- Output artifacts go to `.claude/bmad-output/` in the target project (not this repo)
- Quality gates: P0=REJECT, P1=CONDITIONAL PASS, P2=PASS with notes, P3=PASS

## Testing / Validation
- `claude --plugin-dir ./claude-plugin-bmad` — local dev testing
- Verify all skills have SKILL.md: `for d in skills/bmad-*/; do [ -f "$d/SKILL.md" ] && echo "OK: $d" || echo "MISSING: $d"; done`
- Check no hardcoded paths: `grep -r '/Users/' skills/ commands/ resources/` (should return nothing)
- Check frontmatter: all `skills/*/SKILL.md` must start with `---`
- Check all skills reference soul.md: `grep -l "soul.md" skills/*/SKILL.md | wc -l`
- Check no old role names: `grep -r "bmad-analyst\|bmad-pm\|/bmad-architect\|/bmad-dev\|/bmad-sm" skills/ commands/`

## Installation (for users)
- Local: `claude plugin install ./claude-plugin-bmad`
- GitHub: `/plugin marketplace add darthpelo/claude-plugin-bmad` then `/plugin install bmad-method@darthpelo-claude-plugin-bmad`
