# CLAUDE.md

## Project Overview
Claude Code plugin: BMAD-METHOD framework — holacracy-inspired AI circle for structured project workflows.
No build step, no npm, no traditional tests. All content is Markdown.

## Structure
- `skills/bmad-<name>/SKILL.md` — auto-discovered skills (YAML frontmatter required)
- `commands/<name>.md` — simple slash commands (no frontmatter)
- `resources/soul.md` — shared circle principles (loaded by every role)
- `resources/governance-protocol.md` — dynamic governance protocol (tension detection, role proposals, promotion)
- `resources/skill-security-criteria.md` — security criteria for reviewing external skills from skills.sh
- `resources/templates/<domain>/<name>.md` — output scaffolds (software/business/personal)
- `resources/templates/software/role-template.md` — template for generating new SKILL.md via promotion
- `resources/templates/config-example.yaml` — per-project config template
- `.claude-plugin/plugin.json` — plugin manifest
- `docs/CUSTOMIZATION.md` — contributor guide with templates
- `.github/workflows/upstream-sync.yml` — weekly upstream BMAD-METHOD sync monitor
- `.github/upstream-mapping.json` — upstream agent → local skill mapping (agents in TWO upstream dirs: `src/bmm/agents/` + `src/core/agents/`)
- `.github/upstream-snapshot.json` — SHA snapshot of upstream files (auto-updated by Action)
- `.github/upstream-version.txt` — last synced upstream version (auto-updated by Action)

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
Utilities: `/bmad-init`, `/bmad-shard`, `/bmad-skills`

## Key Conventions
- All skill template paths use `${CLAUDE_PLUGIN_ROOT}/` — never hardcode absolute paths
- Every SKILL.md must start with `---` YAML frontmatter (name, description, context, agent)
- Every role skill opens with: "You energize the **X** role in the BMAD circle."
- Every role skill loads `${CLAUDE_PLUGIN_ROOT}/resources/soul.md` for shared principles
- Domain detection block is copy-pasted identically across all skills — update ALL when adding domains
- Orchestrators use `context: same`, agent skills use `context: fork`
- Output artifacts go to `.claude/bmad-output/` in the target project (not this repo)
- Quality gates: P0=REJECT, P1=CONDITIONAL PASS, P2=PASS with notes, P3=PASS
- After `git mv` of skill directories, Read each file at its new path before editing — tool tracks read state by path
- **TDD mandatory** (software domain): `bmad-impl` enforces red-green-refactor; `bmad-qa` issues P0 REJECT if `tdd-checklist.md` missing. Configurable via `roles.qa.tdd_enforcement` in bmad-config.yaml (`strict`/`relaxed`/`off`)
- **Protect Main**: never work directly on `main`/`master` — soul.md principle + Git Branch Guard in `bmad-impl` and `bmad-greenfield`
- GitHub Actions: always pass `${{ steps.* }}` via `env:` blocks, never inline in `run:` scripts (injection prevention)
- Zsh shell: quote `gh api` URLs containing `?` (e.g., `gh api 'repos/.../contents/dir?ref=tag'`)
- Git rebase continue: use `GIT_EDITOR=true git rebase --continue` (no `--no-edit` flag exists for rebase)
- **Dynamic Governance**: all 8 agent roles have a `## Tension Sensing` block that references `governance-protocol.md`. Orchestrators have a `## Temporary Roles` section. New roles can be proposed, approved, used temporarily, and promoted to permanent SKILL.md files.
- **Skills.sh Integration**: `/bmad-skills` discovers and installs external skills from skills.sh with a mandatory security gate. Security criteria in `resources/skill-security-criteria.md`. Verdicts: PASS (low risk), WARN (medium), BLOCK (high — hard stop). `/bmad-init` suggests external skills after domain detection.

## Testing / Validation
- `claude --plugin-dir ./claude-plugin-bmad` — local dev testing
- Verify all skills have SKILL.md: `for d in skills/bmad-*/; do [ -f "$d/SKILL.md" ] && echo "OK: $d" || echo "MISSING: $d"; done`
- Check no hardcoded paths: `grep -r '/Users/' skills/ commands/ resources/` (should return nothing)
- Check frontmatter: all `skills/*/SKILL.md` must start with `---`
- Check all skills reference soul.md: `grep -l "soul.md" skills/*/SKILL.md | wc -l`
- Check no old role names: `grep -r "bmad-analyst\|bmad-pm\|/bmad-architect\|/bmad-dev\|/bmad-sm" skills/ commands/`
- After renaming skills, check no stale references: `grep -r "old-name" skills/ commands/ resources/ README.md docs/`
- Cross-reference scan should cover ALL text files including templates and documentation, not just skills/
- Check TDD in impl: `grep -r "red-green-refactor" skills/bmad-impl/` (should match)
- Check TDD enforcement in QA: `grep -r "TDD compliance" skills/bmad-qa/` (should match)
- Check Branch Guard: `grep -r "Branch Guard" skills/bmad-impl/ skills/bmad-greenfield/` (should match both)
- Check tdd-checklist template exists: `[ -f resources/templates/software/tdd-checklist.md ] && echo OK`
- Check governance protocol exists: `[ -f resources/governance-protocol.md ] && echo OK`
- Check role template exists: `[ -f resources/templates/software/role-template.md ] && echo OK`
- Check Tension Sensing in agent roles: `grep -l "Tension Sensing" skills/bmad-{scope,prioritize,arch,impl,qa,ux,security,facilitate}/SKILL.md | wc -l` (should be 8)
- Check Temporary Roles in orchestrators: `grep -l "Temporary Roles" skills/bmad-{greenfield,sprint}/SKILL.md | wc -l` (should be 2)
- Check governance-protocol.md sections: `grep -c "Tension Format\|Proposal Flow\|Temporary Role Format\|Promotion Rules" resources/governance-protocol.md` (should be 4)
- Check bmad-skills skill exists: `[ -f skills/bmad-skills/SKILL.md ] && echo OK`
- Check skill-security-criteria exists: `[ -f resources/skill-security-criteria.md ] && echo OK`
- Check bmad-skills uses context same: `grep -q "context: same" skills/bmad-skills/SKILL.md && echo OK`
- Check security criteria has required sections: `grep -c "PASS\|WARN\|BLOCK\|Patterns to Flag\|Report Format" resources/skill-security-criteria.md` (should be 5+)
- Check bmad-init references bmad-skills: `grep -q "bmad-skills" skills/bmad-init/SKILL.md && echo OK`

## Related Repositories
- Company version (holacracy, quality gates): github.com/alessioroberto82/claude-plugin-bmad
- PR #1 (`feat/holacracy-evolution`): holacracy migration with soul.md, P0-P3 gates, role renames (merged)
- PR #2 (`feat/mandatory-tdd-and-branch-protection`): mandatory TDD for software, Protect Main rule, tdd-checklist template
- PR #3 (`feat/upstream-sync-action`): GitHub Action for upstream BMAD-METHOD release monitoring
- PR #5 (`docs/update-documentation`): documentation alignment with PR #3 and PR #4, holacracy references

## Installation (for users)
- Local: `claude plugin install ./claude-plugin-bmad`
- GitHub: `/plugin marketplace add darthpelo/claude-plugin-bmad` then `/plugin install bmad-method@darthpelo-claude-plugin-bmad`
