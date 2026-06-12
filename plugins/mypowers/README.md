# MyPowers

A streamlined Claude Code plugin with three core development workflow skills: **brainstorming → writing-plans → subagent-driven-development**.

Extracted and refined from [superpowers](https://github.com/obra/superpowers) — keeping only the three essential skills for the design→plan→implement workflow, without the heavy auto-injection overhead.

## Skills

| Skill | When to Use |
|-------|-------------|
| **brainstorming** | Before any creative work — creating features, building components, adding functionality. Explores intent, requirements, and design before implementation. |
| **writing-plans** | When you have a spec or requirements for a multi-step task, before touching code. Produces bite-sized, TDD-oriented implementation plans. |
| **subagent-driven-development** | When executing implementation plans with independent tasks. Dispatches a fresh subagent per task with two-stage review (spec compliance + code quality). |

## Workflow

```
User request → brainstorming (design) → writing-plans (plan) → subagent-driven-development (execute)
```

These skills chain naturally:
1. **brainstorming** produces a validated spec
2. **writing-plans** turns it into a step-by-step plan
3. **subagent-driven-development** executes it with fresh subagents per task

## Installation

### Claude Code

```bash
/plugin install https://github.com/yshihao636/mypowers.git
```

Or via the plugin marketplace:

```bash
/plugin install mypowers
```

### Manual

1. Clone this repo to `~/.claude/plugins/marketplaces/mypowers/`
2. Add `"mypowers@mypowers": true` to `enabledPlugins` in `~/.claude/settings.json`
3. Run `/reload-plugins`

## What's Different from Superpowers

| | Superpowers | MyPowers |
|---|-------------|----------|
| Skills | 13 (full suite) | 4 (3 core + using-mypowers) |
| Auto-injection | Heavy (`using-superpowers` with EXTREMELY_IMPORTANT block) | Light (`using-mypowers` brief intro) |
| SessionStart hook | Forces skill check on every message | Gentle introduction, no forced checks |
| Spec path | `docs/superpowers/specs/` | `docs/specs/` |
| Plan path | `docs/superpowers/plans/` | `docs/plans/` |
| Dependencies | using-git-worktrees, executing-plans, finishing-a-development-branch, test-driven-development, etc. | Self-contained |

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
- TDD-oriented: write failing test → implement → verify → commit
- No placeholders — every step contains actual code and commands
- Self-review checklist for completeness and type consistency
- Auto-transitions to **subagent-driven-development** when done

### Subagent-Driven Development

Executes plans with fresh subagents per task:
- **Implementer** subagent writes code, tests, and commits
- **Spec reviewer** verifies code matches the spec
- **Code quality reviewer** checks for clean, maintainable code
- Continuous execution — no pauses between tasks
- Model selection based on task complexity

## License

MIT
