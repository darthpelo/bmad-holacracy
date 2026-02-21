# Skill Security Criteria

This document defines the security criteria for reviewing external skills from skills.sh before installation. Read this during the security review phase of `/bmad-skills`.

## Risk Classification

### PASS (Low Risk)
The skill is safe to install. It only reads information and does not modify files or execute commands.

**Allowed tools**:
- `Read`, `Grep`, `Glob` — read-only file access
- `WebSearch` — search queries (no data sent)

**Characteristics**:
- No shell commands
- No file modifications
- No external network calls beyond documented APIs
- No access to sensitive files

### WARN (Medium Risk)
The skill modifies files or communicates externally. Review carefully before approving.

**Flagged tools**:
- `Write`, `Edit` — modifies files in the project
- `WebFetch` — external HTTP communication
- `Bash` with non-destructive commands (`ls`, `git status`, `npm test`, `npx`, `cat`)
- `NotebookEdit` — modifies Jupyter notebooks

**Characteristics**:
- File modifications are scoped to project directory
- Network calls are to documented, well-known APIs
- Shell commands are read-only or standard dev tools

### BLOCK (High Risk)
The skill poses a security threat. Do NOT install.

**Blocked patterns**:
- `Bash` with destructive commands: `rm -rf`, `rm -f` on paths outside project
- `Bash` with code execution from network: `curl | sh`, `curl | bash`, `wget | sh`
- `Bash` with dynamic evaluation: `eval`, `exec`, `source` with untrusted input
- Access to sensitive files: `.env`, `credentials`, `secrets`, `tokens`, API keys, SSH keys
- Access to system paths: `~/.ssh/`, `~/.aws/`, `~/.config/`, `/etc/`, `/usr/`
- Environment variable reading for secrets: `$API_KEY`, `$SECRET`, `$TOKEN`, `$PASSWORD`
- `dangerouslyDisableSandbox: true` or equivalent bypass flags
- Obfuscated code: base64-encoded commands, encoded URLs, hex-encoded strings
- Data exfiltration: `curl -X POST`, `wget --post-data`, outbound `nc`/`netcat`

## Detailed Patterns to Flag

### Shell Command Analysis
When a skill uses `Bash`, inspect each command for:

| Pattern | Risk | Verdict |
|---------|------|---------|
| `rm -rf /` or `rm -rf ~` | Destructive | BLOCK |
| `rm -rf` on project-scoped paths | Caution | WARN |
| `curl \| sh` or `curl \| bash` | Remote code execution | BLOCK |
| `eval "$variable"` | Code injection | BLOCK |
| `git push --force` | Destructive | WARN |
| `npm install`, `npx` | Dependency install | WARN |
| `git status`, `git diff` | Read-only | PASS |
| `ls`, `cat`, `head` | Read-only | PASS |

### File Access Analysis
When a skill reads or writes files, check paths for:

| Path Pattern | Risk | Verdict |
|--------------|------|---------|
| `.env`, `.env.*` | Secrets exposure | BLOCK |
| `*credentials*`, `*secret*` | Secrets exposure | BLOCK |
| `~/.ssh/*`, `~/.aws/*` | System credentials | BLOCK |
| `~/.config/*` | System config | WARN |
| Project-scoped paths | Normal | PASS |

### Network Analysis
When a skill uses `WebFetch` or `Bash` with network commands:

| Pattern | Risk | Verdict |
|---------|------|---------|
| `WebFetch` to documented API | External comm | WARN |
| `curl` GET to known API | External comm | WARN |
| `curl -X POST` with project data | Data exfiltration | BLOCK |
| `nc`/`netcat` outbound | Data exfiltration | BLOCK |

## Security Report Format

After analysis, generate a report in this format:

```
SKILL SECURITY REPORT
=====================
Skill: <owner/repo>
Verdict: PASS | WARN | BLOCK

Risk Level: Low | Medium | High
Tools Used: [list of tools declared or detected]
Shell Commands: [list of Bash commands found]
Files Accessed: [list of file paths referenced]
Network Calls: [list of URLs or endpoints]

Findings:
- [Finding 1 with severity]
- [Finding 2 with severity]

Recommendation: [Install / Review carefully / Do NOT install]
```

## Verdict Rules

1. If ANY BLOCK pattern is found → verdict is **BLOCK**
2. If WARN patterns found but no BLOCK → verdict is **WARN**
3. If only PASS patterns found → verdict is **PASS**
4. If unable to analyze (repo not accessible) → verdict is **WARN** (caution)
