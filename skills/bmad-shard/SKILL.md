---
name: bmad-shard
description: Splits large documents into atomic shards for context management. Reduces token usage by 90%. Use for large PRD/architecture (>3000 tokens).
context: fork
agent: general-purpose
---

# BMAD Document Sharding

Implements BMAD context sharding: splits large documents into atomic "story files".

## Input

Documents to shard (automatically detected):
- `.claude/bmad-output/PRD.md`
- `.claude/bmad-output/architecture.md`
- `.claude/bmad-output/business-requirements.md`

## Process

1. **Analyze document**:
   - Identify independent sections (e.g., FR-1.1, FR-1.2, ADR-001, etc.)

2. **Create a shard for each section**:
   - Format: `<type>-<id>-<name>.md`
   - Example: `FR-1.1-user-authentication.md`

3. **Each shard contains**:
   ```markdown
   # <ID>: <Title>

   **Type**: Requirement/Architecture/Story
   **Priority**: High/Medium/Low
   **Dependencies**: [ID-other-shard]

   ## Description
   [Original content of the section]

   ## Acceptance Criteria
   - [ ] Criterion 1
   - [ ] Criterion 2

   ## References
   - [ADR-001] for architecture decision
   ```

4. **Save to**:
   - Requirements → `.claude/bmad-output/shards/requirements/`
   - Architecture → `.claude/bmad-output/shards/architecture/`
   - Stories → `.claude/bmad-output/shards/stories/`

5. **Update session-state.json**:
   ```json
   {
     "sharding": {
       "enabled": true,
       "shards_count": 15,
       "last_shard_date": "<timestamp>"
     }
   }
   ```

## Benefits

- **Token Reduction**: 90% (Dev loads only the needed shard, not the full PRD)
- **Focus**: One task at a time, no distractions
- **Progressive Disclosure**: Future tasks not visible

## Post-Sharding Usage

```bash
# Developer implements only STORY-001
/bmad-dev STORY-001

# Developer will read ONLY:
# - .claude/bmad-output/shards/stories/STORY-001.md
# - Any dependencies referenced in the shard
```
