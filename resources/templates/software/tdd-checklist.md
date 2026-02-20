# TDD Checklist

**Project**: {Project Name}
**Story/Feature**: {Story ID or Feature Name}
**Date**: {Date}
**Owner**: Implementer

---

## TDD Cycles

| # | Behavior | RED: Test Written | RED: Fails? | GREEN: Code Written | GREEN: Passes? | REFACTOR: Changes | Notes |
|---|----------|-------------------|-------------|---------------------|----------------|-------------------|-------|
| 1 | {What behavior is being tested} | {Test file:function} | Yes/No | {Implementation summary} | Yes/No | {Refactor summary or "None"} | |
| 2 | | | | | | | |
| 3 | | | | | | | |

---

## Coverage Summary

- Tests written: {count}
- Tests passing: {count}
- Requirements covered: {list FR-x.x IDs}
- Requirements NOT covered: {list or "None"}

---

## Compliance Verdict

- [ ] Every behavior was tested BEFORE implementation (red-green-refactor)
- [ ] All acceptance criteria from PRD have corresponding test(s)
- [ ] No implementation code exists without a preceding test
- [ ] Refactoring preserved all green tests

**TDD Compliant**: Yes / No
