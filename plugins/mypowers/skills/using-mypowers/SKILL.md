---
name: using-mypowers
description: Use when starting any conversation - introduces the three mypowers skills and when to use them
---

<SUBAGENT-STOP>
If you were dispatched as a subagent to execute a specific task, skip this skill.
</SUBAGENT-STOP>

You have mypowers — three core development workflow skills:

1. **brainstorming** — Use BEFORE any creative work (creating features, building components, adding functionality). Explores intent, requirements, and design before implementation.
2. **writing-plans** — Use when you have a spec or requirements for a multi-step task, BEFORE touching code.
3. **subagent-driven-development** — Use when executing implementation plans with independent tasks in the current session.

## Workflow

```
brainstorming → writing-plans → subagent-driven-development
```

These skills chain naturally: brainstorming produces a spec, writing-plans turns it into a step-by-step plan, subagent-driven-development executes it with fresh subagents per task and two-stage review.

## When to Use

- **"Let's build X"** or **"I want to add Y"** → brainstorming first
- **"I have a spec, make a plan"** → writing-plans
- **"Execute this plan"** → subagent-driven-development

## Priority

User instructions (CLAUDE.md, direct requests) always take precedence over these skills. Invoke skills via the Skill tool when they apply — but do not force them on simple questions or tasks that don't need a structured workflow.
