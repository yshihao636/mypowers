# MyPowers

A lightweight Claude Code plugin with six development workflow skills: **brainstorming → writing-plans → using-git-worktrees → subagent-driven-development / executing-plans → finishing-a-development-branch**.

Extracted and refined from [superpowers](https://github.com/obra/superpowers) — keeping the minimum complete development loop while avoiding heavy auto-injection overhead.

## Skills

| Slash command | When to Use |
|---------------|-------------|
| `/mypowers:brainstorming` | Before creative work — explores intent, requirements, and design before implementation. |
| `/mypowers:writing-plans` | When you have a spec or requirements for a multi-step task, before touching code. Produces bite-sized implementation plans with verification at each step. |
| `/mypowers:using-git-worktrees` | Before implementation work when changes should be isolated from the current checkout. |
| `/mypowers:subagent-driven-development` | When executing an implementation plan and subagents are available. Dispatches a fresh subagent per task with two-stage review. |
| `/mypowers:executing-plans` | When executing a written plan without subagents, or when inline execution is preferred. |
| `/mypowers:finishing-a-development-branch` | After implementation is complete and verified. Presents safe options to merge, create a PR, keep, or discard the branch/worktree. |

`using-mypowers` is not a user-callable skill. It is stored in `docs/using-mypowers.md` and injected by the SessionStart hook as a lightweight introduction.

## Workflow

```text
User request
  → brainstorming (design)
  → writing-plans (plan)
  → using-git-worktrees (isolate when appropriate)
  → subagent-driven-development OR executing-plans (execute)
  → finishing-a-development-branch (choose merge / PR / keep / discard)
```

These skills chain naturally:

1. **brainstorming** produces a validated spec.
2. **writing-plans** turns it into a step-by-step implementation plan.
3. **using-git-worktrees** prepares an isolated workspace when appropriate.
4. **subagent-driven-development** executes with subagents when available, or **executing-plans** executes inline / in a separate session when subagents are unavailable or not preferred.
5. **finishing-a-development-branch** verifies completion and presents structured options without automatically merging, creating PRs, discarding work, or deleting worktrees.

## Installation

### Claude Code (via marketplace)

Add this repository as a marketplace, then install the plugin:

```powershell
claude plugin marketplace add yshihao636/mypowers
claude plugin install mypowers@mypowers
```

Or in an interactive session:

```
/plugin marketplace add yshihao636/mypowers
/plugin install mypowers@mypowers
/reload-plugins
```

### Manual

1. Clone this repo to `~/.claude/plugins/marketplaces/mypowers/`
2. Add `"mypowers@mypowers": true` to `enabledPlugins` in `~/.claude/settings.json`
3. Run `/reload-plugins`

## Design Notes

| Area | MyPowers behavior |
|------|-------------------|
| Skills | 6 development workflow skills |
| Auto-injection | Light docs-based introduction (`docs/using-mypowers.md`) |
| SessionStart hook | PowerShell-based, gentle introduction |
| Spec path | `docs/specs/` |
| Plan path | `docs/plans/` |
| Worktree path | `~/.config/mypowers/worktrees/` with legacy fallback |

## Skill Details

### Brainstorming

Turns ideas into fully formed designs through collaborative dialogue:
- Explores project context and asks clarifying questions one at a time
- Proposes 2-3 approaches with trade-offs
- Presents design in sections with incremental approval
- Writes spec to `docs/specs/YYYY-MM-DD-<topic>-design.md`
- Includes visual companion for mockups and diagrams (optional)
- Auto-transitions to **writing-plans** when done

### Writing Plans

Creates comprehensive implementation plans for agentic workers:
- Bite-sized tasks (2-5 minutes per step)
- Verification-first: write tests for behavior changes, lint/typecheck for config/docs
- No placeholders — every step contains actual code and commands
- Recommends **using-git-worktrees** before execution when isolation is appropriate
- Offers **subagent-driven-development** when subagents are available, or **executing-plans** when subagents are unavailable / inline execution is preferred

### Using Git Worktrees

Sets up or verifies an isolated workspace:
- Detects existing isolation first
- Prefers native harness worktree tools when available
- Falls back to git worktrees only when needed
- Defaults to project-local `.worktrees/` or `~/.config/mypowers/worktrees/` where appropriate

### Subagent-Driven Development

Executes plans with fresh subagents per task:
- **Implementer** subagent writes code, tests, and commits
- **Spec reviewer** verifies code matches the spec
- **Code quality reviewer** checks for clean, maintainable code
- Continuous execution — no pauses between tasks
- After all tasks are implemented, verified, committed, and reviewed, transitions to **finishing-a-development-branch**

### Executing Plans

Executes written plans without subagents or when inline execution is preferred:
- Loads and reviews the plan critically before starting
- Executes tasks sequentially with verification
- Stops when blocked instead of guessing
- Never starts implementation on main/master without explicit user consent
- Transitions to **finishing-a-development-branch** after completion

### Finishing a Development Branch

Guides completion of implementation work:
- Verifies tests pass before presenting options
- Detects normal repo vs worktree vs detached HEAD
- Presents structured options: merge locally, push/create PR, keep as-is, or discard
- Waits for user choice before taking any outward-facing or destructive action
- Does not automatically merge, create PRs, discard work, or delete worktrees

## License

MIT. Adapted from [superpowers](https://github.com/obra/superpowers); attribution to the original project is preserved.
