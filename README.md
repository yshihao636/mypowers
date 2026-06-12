# MyPowers Marketplace

A Claude Code plugin marketplace that ships the **mypowers** plugin — a six-skill complete development workflow for the design → plan → isolate → implement → finish loop.

MyPowers is distilled from the [superpowers](https://github.com/obra/superpowers) project and focuses on the development workflow skills that form a complete engineering loop.

## Marketplace & Plugin

- **Marketplace name:** `mypowers`
- **Plugin name:** `mypowers`
- **Source repository:** https://github.com/yshihao636/mypowers
- **Plugin entry:** `plugins/mypowers/.claude-plugin/plugin.json`

## Installation

### 1. Add this repository as a marketplace

```bash
claude plugin marketplace add yshihao636/mypowers
```

### 2. Install the plugin

```bash
claude plugin install mypowers@mypowers
```

### Interactive (slash-command) equivalent

```
/plugin marketplace add yshihao636/mypowers
/plugin install mypowers@mypowers
/reload-plugins
```

### Verify

```bash
claude plugin details mypowers@mypowers
```

## Available Skills

Once installed, the following skills are available:

| Slash command | When to use |
|---------------|-------------|
| `/mypowers:brainstorming` | Before creative work — explores intent, requirements, and design before implementation. |
| `/mypowers:writing-plans` | When you have a spec or requirements for a multi-step task, before touching code. |
| `/mypowers:using-git-worktrees` | Before executing development work when isolation from the current branch is appropriate. |
| `/mypowers:subagent-driven-development` | When executing implementation plans and subagents are available. |
| `/mypowers:executing-plans` | When executing written plans without subagents, or when inline / separate-session execution is preferred. |
| `/mypowers:finishing-a-development-branch` | After implementation, verification, commits, and review, to present completion options and wait for user choice. |

The full workflow:

```text
brainstorming → writing-plans → using-git-worktrees → subagent-driven-development OR executing-plans → finishing-a-development-branch
```

`using-mypowers` is not exposed as a callable skill. It lives in `plugins/mypowers/docs/using-mypowers.md` and is injected by the SessionStart hook as a lightweight introduction.

## Local Development

To work on this marketplace / plugin locally:

```bash
# 1. Clone the repository
git clone https://github.com/yshihao636/mypowers.git
cd mypowers

# 2. Add the local checkout as a marketplace
claude plugin marketplace add .

# 3. Install the plugin from the local marketplace
claude plugin install mypowers@mypowers

# 4. Validate before pushing
claude plugin validate .
claude plugin validate ./plugins/mypowers
```

## Repository Layout

```text
.
├── .claude-plugin/
│   └── marketplace.json          # Marketplace manifest
├── plugins/
│   └── mypowers/                 # The mypowers plugin
│       ├── .claude-plugin/
│       │   └── plugin.json       # Plugin manifest
│       ├── README.md
│       ├── LICENSE
│       ├── docs/
│       │   └── using-mypowers.md # SessionStart introduction, not a callable skill
│       ├── hooks/                # SessionStart hook
│       └── skills/               # Auto-discovered callable skills
│           ├── brainstorming/
│           ├── writing-plans/
│           ├── using-git-worktrees/
│           ├── subagent-driven-development/
│           ├── executing-plans/
│           └── finishing-a-development-branch/
└── README.md                     # This file
```

Skills are auto-discovered from `plugins/mypowers/skills/` — no `skills` field is required in `plugin.json`.

## License & Attribution

- **License:** [MIT](./plugins/mypowers/LICENSE)
- **Original project:** [superpowers](https://github.com/obra/superpowers) by obra — these workflow skills are adapted from superpowers and re-released under MIT. See `plugins/mypowers/LICENSE` for the full text.
- **Maintainer:** [@yshihao636](https://github.com/yshihao636)
