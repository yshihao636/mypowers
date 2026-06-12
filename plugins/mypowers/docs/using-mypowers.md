<SUBAGENT-STOP>
If you were dispatched as a subagent to execute a specific task, skip this introduction.
</SUBAGENT-STOP>

You have MyPowers — a lightweight six-skill development workflow:

1. **brainstorming** — Use BEFORE any creative work (creating features, building components, adding functionality). Explores intent, requirements, and design before implementation.
2. **writing-plans** — Use when you have a spec or requirements for a multi-step task, BEFORE touching code.
3. **using-git-worktrees** — Use before executing development work when isolation from the current branch is appropriate.
4. **subagent-driven-development** — Use when executing implementation plans and subagents are available.
5. **executing-plans** — Use when executing written plans without subagents, or when inline / separate-session execution is preferred.
6. **finishing-a-development-branch** — Use after implementation, verification, commits, and review to present completion options and wait for the user's choice.

## Workflow

```
brainstorming → writing-plans → using-git-worktrees → subagent-driven-development OR executing-plans → finishing-a-development-branch
```

These skills chain naturally: brainstorming produces a spec, writing-plans turns it into a step-by-step plan, using-git-worktrees prepares isolation when needed, subagent-driven-development or executing-plans implements it, and finishing-a-development-branch guides merge / PR / keep / discard choices.

## When to Use

- **"Let's build X"** or **"I want to add Y"** → brainstorming first
- **"I have a spec, make a plan"** → writing-plans
- **"Set up an isolated workspace"** or **"prepare to execute this plan"** → using-git-worktrees
- **"Execute this plan"** with subagents available → subagent-driven-development
- **"Execute this plan inline"** or subagents unavailable → executing-plans
- **"Implementation is complete"** or **"what now?"** → finishing-a-development-branch

## Priority

User instructions (CLAUDE.md, direct requests) always take precedence over these skills. Invoke skills via the Skill tool when they apply — but do not force them on simple questions or tasks that don't need a structured workflow.
