# Compliance & Data Governance Report

**Organization**: [Name]
**Report Date**: [Date]
**Scope**: [Department / Company-wide / Specific Initiative]
**Auditor**: Compliance Auditor

---

## Executive Summary

**Compliance Status**:
- GDPR: ⚠️ Partially Compliant / ✅ Compliant / ❌ Non-Compliant
- CCPA: ⚠️ Partially Compliant / ✅ Compliant / ❌ Non-Compliant
- [Industry-specific]: [Status]

**Risk Level**: 🔴 High / 🟡 Medium / 🟢 Low

**Key Findings**:
- [Finding 1]
- [Finding 2]
- [Finding 3]

**Recommendation**: [Action needed]

---

## GDPR (General Data Protection Regulation)

### Art. 5: Principles

**Status**: ✅ / ⚠️ / ❌

- **Lawfulness**: [Status] - [Gap if any]
- **Purpose limitation**: [Status] - [Gap]
- **Data minimization**: [Status] - [Gap]
- **Accuracy**: [Status] - [Gap]
- **Storage limitation**: [Status] - [Gap]
- **Integrity & confidentiality**: [Status] - [Gap]

**Gaps**:
- [ ] [Action item 1]
- [ ] [Action item 2]

### Art. 6: Lawful Basis

**Status**: ✅ / ⚠️ / ❌
**Current Basis**: Consent / Contract / Legitimate Interest / [Other]
**Gaps**: [If any]

### Art. 7: Consent

**Status**: ✅ / ⚠️ / ❌
**Issues**:
- [List any consent issues]

**Gaps**:
- [ ] [Fix pre-ticked boxes]
- [ ] [Implement granular consent]
- [ ] [Add easy consent withdrawal]

### Art. 13-14: Information to Data Subjects

**Status**: ✅ / ⚠️ / ❌
**Gaps**: [If any]

### Art. 15-20: Data Subject Rights

| Right | Status | Gap |
|-------|--------|-----|
| Access (Art. 15) | ⚠️ | Manual process, slow (30+ days) |
| Rectification (Art. 16) | ✅ | - |
| Erasure (Art. 17) | ❌ | No self-service deletion |
| Restriction (Art. 18) | ❌ | No ability to restrict processing |
| Portability (Art. 20) | ❌ | No data export feature |
| Object (Art. 21) | ⚠️ | Can opt-out marketing only |

**Gaps**:
- [ ] Implement self-service data export
- [ ] Implement self-service account deletion
- [ ] Build data subject request (DSR) portal

### Art. 30: Records of Processing Activities (ROPA)

**Status**: ✅ / ⚠️ / ❌
**Gap**: [If not compliant]

**Required**:
- [ ] Create ROPA documenting all processing activities
- [ ] Update ROPA quarterly

### Art. 32: Security of Processing

**Status**: ⚠️ (See security audit for details)
**Gaps**: Reference security-audit.md

### Art. 33-34: Data Breach Notification

**Status**: ✅ / ⚠️ / ❌
**Gaps**:
- [ ] Establish breach response plan
- [ ] Define 72-hour notification timeline
- [ ] Create breach notification templates

### Art. 35: Data Protection Impact Assessment (DPIA)

**Status**: ✅ / ⚠️ / ❌
**Required for**: High-risk processing (profiling, sensitive data, large-scale)
**Gaps**: [If not conducted]

### Art. 37: Data Protection Officer (DPO)

**Status**: ✅ / ⚠️ / ❌
**Gap**: [If not appointed]

---

## CCPA (California Consumer Privacy Act)

### Data Inventory

**Status**: ✅ / ⚠️ / ❌
**Gap**: [If incomplete]

### Consumer Rights

| Right | Status | Gap |
|-------|--------|-----|
| Know | ⚠️ | No clear disclosure of categories collected |
| Delete | ❌ | No deletion request process |
| Opt-out of sale | N/A | Not selling data |
| Non-discrimination | ✅ | - |

**Gaps**:
- [ ] Add "Do Not Sell My Personal Information" link
- [ ] Implement deletion request process
- [ ] Update privacy policy with data categories

### Privacy Policy

**Status**: ✅ / ⚠️ / ❌
**Gaps**:
- [ ] Add required CCPA disclosures
- [ ] Add contact method for CCPA requests

---

## Data Governance Assessment

### Data Inventory

| Data Type | Location | Owner | Retention | Status |
|-----------|----------|-------|-----------|--------|
| Customer PII | Production DB | Engineering | Unknown | ❌ No policy |
| Marketing emails | [Platform] | Marketing | Forever | ❌ No deletion |
| Analytics | [Platform] | Product | [Period] | ✅ Auto-delete |
| [...]  | [...] | [...] | [...] | [...] |

**Gaps**:
- [ ] Complete data inventory
- [ ] Define data owners
- [ ] Document data flows

### Data Classification

**Current State**: ✅ Implemented / ⚠️ Partial / ❌ Not implemented

**Recommended Classification**:
- **Public**: Marketing content
- **Internal**: Internal docs
- **Confidential**: Customer PII, financial data
- **Restricted**: Auth credentials, payment info

**Gaps**:
- [ ] Define data classification policy
- [ ] Tag all data with classification

### Data Retention

**Current State**: ✅ Policy exists / ⚠️ Partial / ❌ No policy

**Recommended Policy**:
| Data Type | Retention Period | Legal Basis |
|-----------|------------------|-------------|
| Customer PII | Account lifetime + 30 days | Contract |
| Financial records | 7 years | Legal requirement |
| [...]  | [...] | [...] |

**Gaps**:
- [ ] Formalize retention policy
- [ ] Implement automated deletion

### Data Access Controls

**Current State**: ✅ Adequate / ⚠️ Needs improvement / ❌ Insufficient

**Issues**:
- [List access control issues]

**Gaps**:
- [ ] Implement principle of least privilege
- [ ] Define roles and access levels
- [ ] Regular access reviews

---

## Vendor Risk Analysis

### Critical Vendors

#### Vendor 1: [Name]

**Service**: [Description]
**Data Shared**: [Types of data]
**Risk Level**: 🔴 High / 🟡 Medium / 🟢 Low
**Assessment Status**: ✅ / ❌

**Required**:
- [ ] Request vendor's SOC 2 report
- [ ] Review DPA (Data Processing Agreement)
- [ ] Verify GDPR-compliant processing

#### Vendor 2: [Name]

[Repeat structure]

### Vendor Assessment Process

**Gaps**:
- [ ] Create vendor risk assessment questionnaire
- [ ] Assess all vendors handling personal data
- [ ] Annual vendor re-assessment

---

## Security Policies Review

### Information Security Policy

**Status**: ✅ Current / ⚠️ Outdated / ❌ Does not exist
**Last Updated**: [Date]
**Gaps**: [If any]

### Acceptable Use Policy

**Status**: [Status]
**Gaps**: [If any]

### Incident Response Plan

**Status**: [Status]
**Gaps**: [If any]

### Data Breach Response Plan

**Status**: [Status]
**Required for GDPR Art. 33**
**Gaps**:
- [ ] Create breach response plan
- [ ] Define 72-hour timeline
- [ ] Train response team

---

## Compliance Gaps Summary

| Area | Gap | Severity | Remediation Effort |
|------|-----|----------|-------------------|
| GDPR ROPA | Not documented | 🟡 High | 2 weeks |
| GDPR DPO | Not appointed | 🟡 High | 1 week |
| GDPR DSR | No self-service portal | 🟡 High | 4 weeks |
| Data retention | No policy/enforcement | 🔴 Critical | 4 weeks |
| [...] | [...] | [...] | [...] |

---

## Remediation Roadmap

### Phase 1: Foundation (Weeks 1-4)

**Critical gaps**:
- [ ] Complete data inventory
- [ ] Create data retention policy
- [ ] Create data breach response plan
- [ ] Appoint DPO

**Effort**: 3-4 weeks
**Cost**: $[estimate]

### Phase 2: GDPR Compliance (Weeks 5-8)

- [ ] Create ROPA
- [ ] Fix consent forms
- [ ] Implement DSR portal
- [ ] Implement automated data retention

**Effort**: 4 weeks
**Cost**: $[estimate]

### Phase 3: Operational Security (Weeks 9-12)

- [ ] Conduct vendor risk assessments
- [ ] Create incident response plan
- [ ] Implement RBAC
- [ ] Train team on compliance

**Effort**: 4 weeks
**Cost**: $[estimate]

### Ongoing

- [ ] Quarterly data governance reviews
- [ ] Annual vendor re-assessments
- [ ] Annual incident response drill
- [ ] Continuous monitoring for new regulations

---

## Recommendations

### Immediate Actions (Next 7 days)

1. [Action 1]
2. [Action 2]
3. [Action 3]

### Priority 1 (Next 30 days)

1. [Action 1]
2. [Action 2]

### Priority 2 (Next 90 days)

1. [Action 1]
2. [Action 2]

### Success Metrics

- **Compliance score**: Track % of requirements met (target: 95%)
- **DSR response time**: Track time to fulfill requests (target: <15 days)
- **Vendor assessment coverage**: Track % assessed (target: 100%)

---

## Sign-off

**Compliance Status**: ✅ Compliant / ⚠️ Partially Compliant / ❌ Non-Compliant

**Regulatory Risk**: 🔴 High / 🟡 Medium / 🟢 Low

**Recommendation**: [Action needed]

**Next Review**: [90 days from now]
