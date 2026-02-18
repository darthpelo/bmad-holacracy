# Greenfield Workflow Summary

**Project**: [Project Name]
**Domain**: [software|business|personal]
**Started**: [YYYY-MM-DD HH:MM:SS]
**Completed**: [YYYY-MM-DD HH:MM:SS]
**Total Duration**: [Duration]

---

## Executive Summary

[2-3 sentence summary of what was accomplished in this workflow]

---

## Workflow Execution

### Completed Phases

1. ✅ **Init** ([time])
   - Project structure initialized
   - Session state created

2. ✅ **Analyst** ([start time] - [end time])
   - **Artifact**: [artifact-name].md
   - **Duration**: [duration]
   - **Notes**: [Any notes from this phase]

3. ✅ **PM** ([start time] - [end time])
   - **Artifact**: [artifact-name].md
   - **Duration**: [duration]
   - **Notes**: [Key requirements defined, acceptance criteria established]

4. ✅ **UX** ([start time] - [end time]) [OPTIONAL]
   - **Artifact**: [artifact-name].md
   - **Duration**: [duration]
   - **Notes**: [Personas created, wireframes designed]

5. ✅ **Architect** ([start time] - [end time])
   - **Artifact**: [artifact-name].md
   - **Duration**: [duration]
   - **Notes**: [Key ADRs: list important architectural decisions]

6. ✅ **Security** ([start time] - [end time]) [OPTIONAL]
   - **Artifact**: [artifact-name].md
   - **Duration**: [duration]
   - **Notes**: [Critical issues: X, High: Y, Medium: Z, Low: W]

7. ✅ **SM** ([start time] - [end time]) [OPTIONAL]
   - **Artifact**: [artifact-name].md
   - **Duration**: [duration]
   - **Notes**: [Sprint capacity: X points, Stories selected: Y]

8. ✅ **Dev** ([start time] - [end time])
   - **Implementation**: [Brief description of what was implemented]
   - **Duration**: [duration]
   - **Notes**: [Technologies used, key components built]

9. ✅ **QA** ([start time] - [end time])
   - **Artifact**: [artifact-name].md
   - **Duration**: [duration]
   - **Status**: [APPROVED | APPROVED WITH CONDITIONS | REJECTED]
   - **Notes**: [Test results summary, issues found]

### Skipped Phases

[List any phases that were skipped, with reasons]

---

## Artifacts Generated

### Requirements & Planning
- `.claude/bmad-output/[brief-file].md` - Initial project brief and vision
- `.claude/bmad-output/[requirements-file].md` - Detailed requirements document
- `.claude/bmad-output/[plan-file].md` - Sprint/quarterly/weekly plan (if SM phase included)

### Design
- `.claude/bmad-output/[ux-file].md` - User experience design (if UX phase included)
- `.claude/bmad-output/[architecture-file].md` - System architecture and ADRs

### Security & Quality
- `.claude/bmad-output/[security-file].md` - Security audit report (if Security phase included)
- `.claude/bmad-output/[test-file].md` - Quality assurance test report

### State & Tracking
- `.claude/bmad-output/session-state.json` - Workflow state and checkpoints
- `.claude/bmad-output/workflow-summary.md` - This document

### Implementation
[List key implementation artifacts: source files, documentation, tools created]

---

## Workflow Statistics

| Metric | Value |
|--------|-------|
| **Total Steps** | [number] |
| **Optional Steps Included** | [UX, Security, SM] or [None] |
| **Skipped Steps** | [number] or [None] |
| **Paused/Resumed** | [number] times |
| **Total Artifacts** | [number] documents |
| **Total Duration** | [hours:minutes] |
| **Average Step Duration** | [minutes] |

### Issues Found

| Severity | Count | Status |
|----------|-------|--------|
| Critical (P0) | [number] | [Resolved | Pending | Accepted] |
| High (P1) | [number] | [Resolved | Pending | Accepted] |
| Medium (P2) | [number] | [Resolved | Pending | Accepted] |
| Low (P3) | [number] | [Resolved | Pending | Accepted] |

---

## Next Steps

### Immediate Actions (Next 24 Hours)

- [ ] **Review all artifacts for completeness**
  - Verify all requirements documented
  - Check all ADRs have clear justifications
  - Ensure test coverage is adequate

- [ ] **Address critical and high-priority issues**
  - Security vulnerabilities (if any)
  - QA blockers (if any)
  - Architecture gaps (if any)

- [ ] **Set up version control**
  - Initialize git repository (if not already done)
  - Commit all artifacts: `git add .claude/bmad-output && git commit -m "Complete BMAD greenfield workflow"`
  - Create repository on GitHub/GitLab/Bitbucket
  - Push initial commit

### Short-term Actions (Next Week)

**For Software Projects**:
- [ ] Set up development environment
  - Install dependencies
  - Configure local development
  - Set up database/services
- [ ] Set up CI/CD pipeline
  - GitHub Actions / GitLab CI / Jenkins
  - Automated testing
  - Code quality checks
- [ ] Configure production environment
  - Cloud infrastructure (AWS/GCP/Azure)
  - Environment variables
  - Secrets management
- [ ] Set up monitoring and logging
  - Application monitoring (Datadog/New Relic)
  - Error tracking (Sentry)
  - Log aggregation (ELK stack)
- [ ] Deploy to staging environment
  - Smoke tests
  - User Acceptance Testing (UAT)
- [ ] Schedule production deployment
  - Rollout plan
  - Rollback procedure
  - On-call schedule

**For Business Initiatives**:
- [ ] Present artifacts to stakeholders
  - Executive summary presentation
  - Q&A session
  - Feedback incorporation
- [ ] Secure budget approval
  - Financial forecast
  - ROI justification
  - Resource allocation
- [ ] Assign roles and responsibilities
  - RACI matrix
  - Team structure
  - Communication plan
- [ ] Schedule kick-off meeting
  - Agenda preparation
  - All stakeholder invites
  - Goals and expectations alignment
- [ ] Begin quarterly execution
  - Week 1 deliverables
  - Progress tracking setup
  - Regular status meetings

**For Personal Goals**:
- [ ] Set up tracking tools
  - Habit tracker app (Habitica, Streaks, etc.)
  - Progress dashboard (Notion, Airtable, etc.)
  - Calendar integration
- [ ] Configure reminders and triggers
  - Morning routine alarm
  - Workout reminders
  - Review prompts
- [ ] Schedule weekly reviews
  - Sunday evening reflection
  - Progress check
  - Next week planning
- [ ] Find accountability partner
  - Weekly check-in schedule
  - Shared goals tracking
  - Mutual support system
- [ ] Start Week 1 implementation
  - Begin habit tracking
  - Execute action items
  - Document early learnings

### Medium-term Actions (Next Month)

- [ ] **Track success metrics** (defined in requirements)
  - Set up dashboards
  - Regular metric reviews
  - Adjust strategy based on data

- [ ] **Schedule retrospective** (1 week after completion)
  - What went well?
  - What could be improved?
  - Action items for next iteration

- [ ] **Iterate based on feedback**
  - User feedback collection
  - Bug reports and feature requests
  - Continuous improvement

- [ ] **Update documentation**
  - Onboarding guides
  - API documentation
  - User manuals

### Long-term Actions (Next Quarter)

- [ ] **Evaluate success against original goals**
  - Compare metrics to targets
  - ROI analysis
  - Lessons learned

- [ ] **Plan next phase or iteration**
  - Feature roadmap
  - Technical debt paydown
  - Scalability improvements

- [ ] **Team growth and development**
  - Skill gap analysis
  - Training programs
  - Hiring needs

---

## Key Decisions Made

### Architecture Decision Records (ADRs)

[List key ADRs from architecture phase]

**ADR-001**: [Decision Title]
- **Context**: [Why this decision was needed]
- **Decision**: [What was decided]
- **Consequences**: [Trade-offs and implications]

**ADR-002**: [Decision Title]
- **Context**: [Why this decision was needed]
- **Decision**: [What was decided]
- **Consequences**: [Trade-offs and implications]

[Continue for all major ADRs]

### Security Decisions

[List key security decisions and mitigations]

**SEC-001**: [Security Decision]
- **Threat**: [What threat this addresses]
- **Mitigation**: [How it's mitigated]
- **Status**: [Implemented | Planned | Accepted Risk]

### Process Decisions

[List key process or workflow decisions]

**PROC-001**: [Process Decision]
- **Rationale**: [Why this process was chosen]
- **Impact**: [How it affects the team/project]

---

## Lessons Learned

### What Went Well ✅

[List positive aspects of the workflow]

- [Lesson 1: e.g., "UX phase helped identify usability issues early"]
- [Lesson 2: e.g., "Security audit revealed issues before implementation"]
- [Lesson 3: e.g., "Sprint planning kept scope realistic"]

### What Could Be Improved 🔧

[List areas for improvement]

- [Improvement 1: e.g., "More time needed for architecture phase"]
- [Improvement 2: e.g., "Requirements should include more edge cases"]
- [Improvement 3: e.g., "Better integration between UX and Dev phases"]

### Surprises or Unexpected Findings 💡

[List anything unexpected discovered during workflow]

- [Finding 1: e.g., "Performance bottleneck in database design"]
- [Finding 2: e.g., "GDPR compliance more complex than expected"]
- [Finding 3: e.g., "User persona assumptions were incorrect"]

### Recommendations for Next Time 📋

[Specific recommendations for future workflows]

- [Recommendation 1: e.g., "Start security phase earlier"]
- [Recommendation 2: e.g., "Include performance testing in QA"]
- [Recommendation 3: e.g., "Allocate more time for sprint planning"]

---

## Risk Assessment

### Current Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| [Risk 1] | High/Med/Low | High/Med/Low | [Mitigation strategy] |
| [Risk 2] | High/Med/Low | High/Med/Low | [Mitigation strategy] |
| [Risk 3] | High/Med/Low | High/Med/Low | [Mitigation strategy] |

### Resolved Risks

| Risk | How Resolved |
|------|-------------|
| [Risk 1] | [Resolution] |
| [Risk 2] | [Resolution] |

---

## Team Recognition

**Workflow Completed By**: [Team members or individual]
**Framework**: BMAD-METHOD (Breakthrough Method for Agile AI-Driven Development)
**Orchestrator**: bmad-greenfield
**Completion Date**: [YYYY-MM-DD]

**Special Thanks**: [Any acknowledgments]

---

## Appendix

### Session State Details

**Domain**: [software|business|personal]
**Workflow Type**: greenfield
**Phase**: completed

**Checkpoints**:
```json
[Include relevant checkpoints from session-state.json]
```

### Environment Details

**Development Environment**: [Details if software]
**Tools Used**: [List of tools and technologies]
**Dependencies**: [Major dependencies]

### References

- [Link to project repository]
- [Link to documentation]
- [Link to issue tracker]
- [Link to deployment]

---

**Document Version**: 1.0
**Last Updated**: [Date]
**Generated By**: BMAD-METHOD bmad-greenfield orchestrator

---

*This workflow summary is a living document. Update it as the project evolves.*
