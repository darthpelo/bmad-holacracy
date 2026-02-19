# CLAUDE.md

## Project Overview
Claude Code plugin: BMAD-METHOD framework (12 AI agents for structured project workflows).
No build step, no npm, no traditional tests. All content is Markdown.

## Structure
- `skills/bmad-<name>/SKILL.md` — auto-discovered skills (YAML frontmatter required)
- `commands/<name>.md` — simple slash commands (no frontmatter)
- `resources/templates/<domain>/<name>.md` — output scaffolds (software/business/personal)
- `.claude-plugin/plugin.json` — plugin manifest
- `docs/CUSTOMIZATION.md` — contributor guide with templates

## Key Conventions
- All skill template paths use `${CLAUDE_PLUGIN_ROOT}/` — never hardcode absolute paths
- Every SKILL.md must start with `---` YAML frontmatter (name, description, context, agent)
- Domain detection block is copy-pasted identically across all skills — update ALL when adding domains
- Orchestrators use `context: same`, agent skills use `context: fork`
- Output artifacts go to `.claude/bmad-output/` in the target project (not this repo)

## Testing / Validation
- `claude --plugin-dir ./claude-plugin-bmad` — local dev testing
- Verify all skills have SKILL.md: `for d in skills/bmad-*/; do [ -f "$d/SKILL.md" ] && echo "OK: $d" || echo "MISSING: $d"; done`
- Check no hardcoded paths: `grep -r '/Users/' skills/ commands/ resources/` (should return nothing)
- Check frontmatter: all `skills/*/SKILL.md` must start with `---`

## Installation (for users)
- Local: `claude plugin install ./claude-plugin-bmad`
- GitHub: `/plugin marketplace add darthpelo/claude-plugin-bmad` then `/plugin install bmad-method@darthpelo-claude-plugin-bmad`
