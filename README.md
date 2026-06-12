# MyPowers

一个轻量级 Claude Code 开发工作流插件，从 [Superpowers](https://github.com/obra/superpowers) 精简而来，只保留最小可用闭环：设计 → 计划 → 隔离 → 实现 → 完成。

---

## 1. 项目简介

MyPowers 从 Superpowers 中提取了开发工作流的核心环节，去掉完整方法论中的重注入、TDD-first 和额外脚手架，适合只需要轻量工作流助手的 Claude Code 用户。

**与 Superpowers 的关系：**

| | MyPowers | Superpowers |
|---|---|---|
| 定位 | 轻量工作流插件 | 完整开发方法论 |
| Skill 数量 | 6 个 | 14 个 |
| 自动注入 | 轻量文档引入 | 强制技能检查 |
| 测试策略 | 验证优先 | TDD-first |
| 适用场景 | 想要简洁工作流 | 想要完整方法论 |

如果你想要完整的 Superpowers 方法论，请直接使用 [superpowers](https://github.com/obra/superpowers)。

---

## 2. 功能特性

- **brainstorming** — 在动手写代码前，通过对话厘清意图、需求和设计
- **writing-plans** — 将设计拆分为可执行的、带验证步骤的实现计划
- **using-git-worktrees** — 在隔离的工作空间中开发，保护当前分支
- **subagent-driven-development** — 用子代理逐任务执行计划，带两阶段审查
- **executing-plans** — 无子代理时顺序执行计划
- **finishing-a-development-branch** — 完成后安全地合并、创建 PR、保留或丢弃

完整工作流：

```text
brainstorming → writing-plans → using-git-worktrees → subagent-driven-development / executing-plans → finishing-a-development-branch
```

---

## 3. 目录结构

```text
mypowers/
├── .claude-plugin/
│   └── marketplace.json          # 市场清单
├── plugins/
│   └── mypowers/                 # mypowers 插件
│       ├── .claude-plugin/
│       │   └── plugin.json       # 插件清单
│       ├── README.md
│       ├── LICENSE
│       ├── docs/
│       │   └── using-mypowers.md # SessionStart 引入文档（非可调用技能）
│       ├── hooks/                # SessionStart 钩子
│       │   ├── hooks.json
│       │   ├── run-hook.cmd      # Windows cmd 入口
│       │   └── session-start.ps1 # PowerShell 钩子脚本
│       └── skills/               # 自动发现的可调用技能
│           ├── brainstorming/
│           ├── writing-plans/
│           ├── using-git-worktrees/
│           ├── subagent-driven-development/
│           ├── executing-plans/
│           └── finishing-a-development-branch/
└── README.md                     # 本文件
```

技能从 `plugins/mypowers/skills/` 自动发现，`plugin.json` 中无需 `skills` 字段。

---

## 4. 快速开始

### 4.1 安装

在 Claude Code 会话中运行：

```
/plugin marketplace add yshihao636/mypowers
/plugin install mypowers@mypowers
/reload-plugins
```

### 4.2 使用

安装后，通过斜杠命令调用对应技能：

| 斜杠命令 | 使用场景 |
|---|---|
| `/mypowers:brainstorming` | 写代码前，探索意图、需求和设计 |
| `/mypowers:writing-plans` | 有了设计或需求后，拆分实现计划 |
| `/mypowers:using-git-worktrees` | 需要隔离工作空间时 |
| `/mypowers:subagent-driven-development` | 有子代理时执行实现计划 |
| `/mypowers:executing-plans` | 无子代理时顺序执行计划 |
| `/mypowers:finishing-a-development-branch` | 实现完成后，选择合并 / PR / 保留 / 丢弃 |

`using-mypowers` 不是可调用的技能，它由 SessionStart 钩子自动注入，提供轻量的工作流介绍。

---

## 5. 本地开发

```powershell
# 1. 克隆仓库
git clone https://github.com/yshihao636/mypowers.git
cd mypowers

# 2. 添加本地市场
claude plugin marketplace add .

# 3. 安装插件
claude plugin install mypowers@mypowers

# 4. 推送前验证
claude plugin validate .
claude plugin validate .\plugins\mypowers
```

---

## 6. 版本发布

版本格式：

```text
v主版本.次版本.修订版本
```

打标签并推送：

```text
git tag v1.1.0
git push origin v1.1.0
```

---

## 7. 许可证

- **许可证：** [MIT](./plugins/mypowers/LICENSE)
- **上游项目：** [superpowers](https://github.com/obra/superpowers) by obra — 本项目的工作流技能从 superpowers 适配而来，以 MIT 协议重新发布。详见 `plugins/mypowers/LICENSE`。
- **维护者：** [@yshihao636](https://github.com/yshihao636)
