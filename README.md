# MyPowers Marketplace

A Claude Code plugin marketplace that ships the **mypowers** plugin — a streamlined set of core development workflow skills (brainstorming → writing-plans → subagent-driven-development), distilled from the [superpowers](https://github.com/obra/superpowers) project to focus on the design→plan→implement loop without the heavy auto-injection overhead.

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

| Skill | Slash command | When to use |
|-------|---------------|-------------|
| `brainstorming` | `/mypowers:brainstorming` | Before any creative work — explores intent, requirements, and design before implementation. |
| `writing-plans` | `/mypowers:writing-plans` | When you have a spec or requirements for a multi-step task, before touching code. |
| `subagent-driven-development` | `/mypowers:subagent-driven-development` | When executing implementation plans with independent tasks in the current session. |
| `using-mypowers` *(intro)* | `/mypowers:using-mypowers` | Auto-injected on session start. Briefly introduces the three core skills. Can be invoked manually if you want a refresher. |

The skills chain naturally: **brainstorming** → **writing-plans** → **subagent-driven-development**.

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

```
.
├── .claude-plugin/
│   └── marketplace.json          # Marketplace manifest
├── plugins/
│   └── mypowers/                 # The mypowers plugin
│       ├── .claude-plugin/
│       │   └── plugin.json       # Plugin manifest
│       ├── README.md
│       ├── LICENSE
│       ├── hooks/                # SessionStart hook
│       └── skills/               # Auto-discovered skills/
│           ├── brainstorming/
│           ├── writing-plans/
│           ├── subagent-driven-development/
│           └── using-mypowers/
└── README.md                     # This file
```

Skills are auto-discovered from `plugins/mypowers/skills/` — no `skills` field is required in `plugin.json`.

## License & Attribution

- **License:** [MIT](./plugins/mypowers/LICENSE)
- **Original project:** [superpowers](https://github.com/obra/superpowers) by obra — the design of these skills (brainstorming, writing-plans, subagent-driven-development) is adapted from superpowers and re-released under MIT. See `plugins/mypowers/LICENSE` for the full text.
- **Maintainer:** [@yshihao636](https://github.com/yshihao636)
