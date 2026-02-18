# Personal Digital Privacy Audit

**Date**: [Date]
**Period Covered**: Current state as of [Date]

---

## Executive Summary

**Overall Privacy Score**: X/10 ([High/Moderate/Low] risk)

**Key Findings**:
- X accounts with weak or reused passwords
- Y accounts exposed in data breaches
- Digital footprint: [High/Medium/Low]
- Z apps with excessive permissions
- [Password manager status]

**Recommendation**: Implement privacy roadmap within 30 days

---

## Password Hygiene Review

### Password Strength Analysis

**Total accounts analyzed**: X

| Category | Count | Action Required |
|----------|-------|-----------------|
| Weak passwords (<8 chars) | X | 🔴 Change immediately |
| Reused passwords | X | 🟡 Change to unique |
| Medium strength | X | 🟢 OK for now |
| Strong + unique | X | ✅ Good |

### Accounts with Weak Passwords

1. **Email ([Provider])**: "[password]" 🔴 CRITICAL
2. **Bank**: "[password]" 🔴 CRITICAL
3. **[Account]**: "[password]" 🟡 High priority
4. [...]

**Immediate Action Required**:
- [ ] Change all weak passwords TODAY (especially email, bank)
- [ ] Use strong passwords: 16+ characters, random mix
- [ ] Use password manager (1Password, Bitwarden)

### Reused Passwords

**Password "[X]" reused across**:
- [Account 1]
- [Account 2]
- [Account 3]
- [...]

**Risk**: If one site is breached, all accounts compromised

**Action**:
- [ ] Change to unique passwords for each account
- [ ] Priority: Start with financial and email accounts

---

## Account Security Check

### Two-Factor Authentication (2FA) Status

| Account | 2FA Enabled | Method | Recommendation |
|---------|-------------|--------|----------------|
| Gmail | ❌ No | - | 🔴 Enable TOTP |
| Bank | ✅ Yes | SMS | 🟡 Upgrade to TOTP |
| Apple ID | ✅ Yes | Device | ✅ Good |
| [...]  | [...] | [...] | [...] |

**Statistics**:
- 2FA enabled: X/Y accounts (Z%)
- Target: 100% for critical accounts, 80% for all accounts

**Action Plan**:
- [ ] Enable 2FA on email (CRITICAL)
- [ ] Enable 2FA on financial accounts
- [ ] Enable 2FA on social media
- [ ] Enable 2FA on work/developer accounts

### Breach Exposure Check

**Checked via**: haveibeenpwned.com

**Email [address]**:
- ✅ Breached in X data breaches:
  1. **[Site] ([Year])**: [Data exposed]
  2. **[Site] ([Year])**: [Data exposed]
  3. [...]

**Passwords exposed**: X (now cracked and in public databases)

**Action**:
- [ ] Change passwords for breached sites
- [ ] Change passwords for ANY accounts reusing those passwords
- [ ] Monitor email for suspicious activity

---

## Digital Footprint Analysis

### What's Publicly Available

#### Google Search Results for "[Your Name]"

- [Result 1]
- [Result 2]
- [Result 3]
- [...]

**Assessment**: 🔴 High visibility / 🟡 Moderate / 🟢 Low

#### Social Media Public Posts

- **Facebook**: X posts visible to "Public"
- **Instagram**: X photos visible, Y with location tags
- **Twitter**: All tweets public (X tweets total)

**Risks**:
- Location data reveals home address
- Posts reveal daily routine
- Personal details (family names, pet names - security question answers!)

**Action**:
- [ ] Review Facebook privacy settings (change posts to "Friends")
- [ ] Remove location tags from Instagram photos
- [ ] Delete oversharing tweets or make account private
- [ ] Google yourself monthly, monitor what's public

---

## Data Protection

### Backups

**Current backup strategy**:
- **Photos**: [Platform] (automatic) ✅ / ❌
- **Documents**: [Platform] (automatic) ✅ / ❌
- **Code/projects**: [Platform] (manual) ⚠️ / ❌
- **Contacts**: [Platform] (automatic) ✅ / ❌
- **Important files**: No backup ❌

**Gaps**:
- [ ] Set up local backup (external drive, Time Machine)
- [ ] Set up cloud backup (Backblaze, Arq)
- [ ] Test restore (ensure backups work)

**Recommendation**: 3-2-1 rule (3 copies, 2 media types, 1 offsite)

### Encryption

**Device encryption**:
- **Laptop**: FileVault/BitLocker ✅ / ❌
- **Phone**: Encrypted by default ✅ / ❌
- **External drives**: Encrypted ✅ / ❌

**Cloud storage**:
- **[Provider]**: [Encryption status]
- **[Provider]**: [Encryption status]

**Sensitive files**:
- [Location]: [Encryption status]

**Action**:
- [ ] Encrypt external drives (VeraCrypt, BitLocker)
- [ ] Move sensitive files to end-to-end encrypted storage
- [ ] OR: Encrypt sensitive files locally before uploading

---

## Privacy Settings Review

### Browser

**Current browser**: [Name]
**Privacy issues**:
- Third-party cookies enabled (tracking)
- No ad blocker (malvertising risk)
- DNS not encrypted (ISP sees browsing)

**Action**:
- [ ] Switch to privacy-focused browser (Firefox, Brave)
- [ ] Install uBlock Origin (ad/tracker blocker)
- [ ] Enable HTTPS-only mode
- [ ] Use DNS over HTTPS (Cloudflare, Quad9)

### Social Media

#### Facebook

**Current privacy settings**: 🔴 Poor / 🟡 Moderate / 🟢 Good

**Issues**:
- Profile visible to: [Setting]
- Posts default: [Setting]
- Friend list visible: [Yes/No]

**Recommended settings**:
- [ ] Profile visible to: Friends
- [ ] Posts default: Friends (or Custom)
- [ ] Hide friend list
- [ ] Disable email/phone search
- [ ] Review past posts (bulk change to "Friends")
- [ ] Remove third-party app connections

#### Instagram

**Current privacy settings**: [Status]

**Issues**:
- Account: Public / Private
- Location tagging: Enabled / Disabled

**Recommended settings**:
- [ ] Switch account to Private
- [ ] Disable location tagging
- [ ] Story sharing: Friends only
- [ ] Remove location data from past posts

#### [Other Social Media]

[Repeat structure]

### Mobile Apps

**Apps with concerning permissions**:

| App | Permission | Why Concerning | Action |
|-----|-----------|----------------|--------|
| [App name] | Location, Contacts | No reason needed | 🔴 Delete app |
| [App name] | Microphone (background) | Potential eavesdropping | 🟡 Revoke |
| [...] | [...] | [...] | [...] |

**Action**:
- [ ] Review all app permissions (Settings → Privacy)
- [ ] Revoke unnecessary permissions
- [ ] Delete apps with excessive data collection

---

## Email Privacy

### Current Issues

- **Email provider**: [Provider] ([Privacy assessment])
- **Spam**: X+ marketing emails/day

**Action**:
- [ ] Consider switching to privacy-focused email (ProtonMail, Tutanota)
- [ ] Unsubscribe from marketing lists
- [ ] Use email aliases for signups (hide real email)

### Email Aliases

- Use `name+service@provider.com` for signups
- Or use alias service (SimpleLogin, AnonAddy)

---

## Personal Security Roadmap

### Sprint 1: Critical (This Week)

**Time**: 2-3 hours

**Priority 1: Secure accounts**
- [ ] Change weak passwords (especially email, bank) - 30 min
- [ ] Enable 2FA on email, bank, social media - 30 min
- [ ] Install password manager - 15 min
- [ ] Generate strong unique passwords for top 10 accounts - 45 min

**Priority 2: Reduce exposure**
- [ ] Check haveibeenpwned.com, change breached passwords - 15 min
- [ ] Remove public posts with oversharing - 30 min

### Sprint 2: Important (This Month)

**Time**: 4-6 hours

- [ ] Enable 2FA on all important accounts - 2h
- [ ] Review and tighten social media privacy settings - 1h
- [ ] Review and revoke excessive app permissions - 1h
- [ ] Set up encrypted backup strategy - 1h
- [ ] Install privacy browser extensions - 15 min
- [ ] Review and remove old third-party app connections - 30 min

### Sprint 3: Long-term (This Quarter)

**Time**: Ongoing

- [ ] Switch to privacy-focused browser
- [ ] Consider privacy-focused email
- [ ] Set up VPN for public WiFi use
- [ ] Monthly: Google yourself, review what's public
- [ ] Quarterly: Review privacy settings (social media, apps)
- [ ] Annual: Full privacy audit (like this one)

---

## Privacy Tools Recommended

### Essential (Free or Low Cost)

1. **Password Manager**: Bitwarden ($10/year) or 1Password ($36/year)
2. **2FA Authenticator**: Authy (free) or Google Authenticator (free)
3. **Ad/Tracker Blocker**: uBlock Origin (free)
4. **HTTPS Everywhere**: Browser extension (free)
5. **haveibeenpwned**: Check breach exposure (free)

### Optional (Enhanced Privacy)

1. **VPN**: Mullvad ($5/mo) or IVPN ($6/mo)
2. **Private Email**: ProtonMail ($5/mo) or Tutanota ($3/mo)
3. **Private Browser**: Brave (free) or Firefox (free)
4. **Encrypted Cloud**: Tresorit ($10/mo) or SpiderOak ($6/mo)
5. **Email Alias Service**: SimpleLogin ($30/year)

**Total Essential Cost**: ~$50/year
**Total with Optional**: ~$150/year

---

## Success Metrics

**Track monthly**:
- [ ] % of accounts with strong, unique passwords (target: 100%)
- [ ] % of accounts with 2FA enabled (target: 80%+)
- [ ] # of public posts/photos (target: reduce by 50%)
- [ ] # of apps with excessive permissions (target: 0)

**Quarterly review**:
- Google search: What's still publicly available?
- Breach check: Any new breaches?
- Privacy settings: Any apps/services changed defaults?

---

## Sign-off

**Current Privacy Score**: X/10 ([Risk level])

**Target Privacy Score**: 8/10 (within 30 days)

**Next Audit**: [90 days from now]

**Priority**: 🔴 Critical actions in Sprint 1 should be completed this week
