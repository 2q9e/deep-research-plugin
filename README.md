# Deep Research Engine

An evidence-first research plugin for Codex, ChatGPT, Claude Code, Cursor, and compatible skill hosts. It packages a repeatable research workflow; it does not bundle a search engine, MCP server, browser, or other retrieval service. It uses the capabilities available in the host and is explicit when those capabilities are missing.

## What it does

Deep Research Engine turns a research request into a sourced investigation. Before substantive research on a new investigation, it asks the user to choose a mode unless one was already specified:

| Mode | What it does | Use it for |
| --- | --- | --- |
| **Official** | Builds the answer from authoritative and primary evidence. Non-authoritative sources may help locate leads but do not support final claims. | Academic work, statistics, policy, law, technical specifications |
| **Mixed** | Establishes the official baseline first, then checks independent reporting, expert work, and relevant community evidence against it. | Products, software, real-world behavior, contested claims |
| **Deep Discovery** | Starts with the same baseline, then searches widely across public archives, forums, repositories, and other obscure sources. It labels leads and allegations separately from verified findings. | Obscure histories, undocumented behavior, public rumors, overlooked records |

The selected mode persists for the investigation and its follow-ups. Users can switch modes at any time. Research depth is chosen separately from mode, so a narrow Deep Discovery task need not become a large report.

## Evidence and citations

- APA 7 citations and a matching References list are the default for substantive research, unless the user requests another style. Legal authorities use APA legal-material conventions and jurisdiction-specific citation forms; non-retrievable personal communications are cited in text only.
- Citations are checked against retrieved source passages or data. References, quotations, URLs, dates, page numbers, and native citation IDs are never invented.
- Important claims are mapped to direct, partial, indirect, contradictory, or unverified evidence. Source quality and relevance are assessed separately.
- The report distinguishes confirmed facts, official statements, credible reporting, allegations, disputed claims, and unknowns. An official statement verifies that it was made; it does not automatically prove its contents.
- Research uses adversarial checks for alternative explanations, common-source repetition, stale data, corrections, and contrary evidence.

## Discovery and safety

The workflow supports exact-phrase and domain searches, alternate terminology, date and file filters where available, citation tracing, public records, original datasets, source repositories, historical archives, specialist forums, and community discussions. Search operators are used only when supported by the active retrieval tool.

Deep Discovery investigates publicly accessible material. It does not bypass access controls or acquire or expose stolen credentials, private personal data, or confidential records. Retrieved pages and files are treated as untrusted content, not instructions.

## Supported clients

The research skills are shared across hosts. Each client has its own install route:

| Client | Package route | Notes |
| --- | --- | --- |
| **Codex CLI and desktop** | Portable Agent Plugin from the repo marketplace | The plugin is namespaced as `deep-research-plugin:deep-research-engine`. |
| **Codex IDE extension** | Project skills in `.agents/skills/` | Run the included installer in the target workspace. |
| **Claude Code CLI and VS Code IDE** | Claude Code plugin manifest and marketplace | Load through the CLI or the IDE's plugin browser. |
| **Cursor CLI and IDE** | Portable Agent Plugin or project skills | Cursor supports Agent Plugins; the installer adds project skills for CLI use. |
| **Freebuff CLI and IDE terminal** | Project skills in `.agents/skills/` | Run the installer in the project where you use its CLI. |
| **ChatGPT.com** | OpenAI's shared ChatGPT/Codex plugin directory | A skills-only public listing may have additional eligibility requirements and needs review and publication. Local repo marketplaces are for supported desktop clients, not direct ChatGPT.com installation. |

Choose one route per workspace: install the plugin through its native catalog or copy the skills into the workspace. Installing both can expose duplicate skill names.

### Codex CLI

Add the GitHub repository as a marketplace and install the plugin:

```sh
codex plugin marketplace add 2q9e/deep-research-plugin
codex plugin add deep-research-plugin@deep-research-marketplace
```

### Codex IDE extension

To expose the project-skill version in an IDE workspace, run the installer against that workspace:

```sh
bash "/path/to/deep-research-plugin/scripts/install-agent-skills.sh" "/path/to/your-project"
```

### Claude Code CLI and IDE

From the Claude Code CLI, add the repository marketplace and install the plugin:

```sh
claude plugin marketplace add 2q9e/deep-research-plugin
claude plugin install deep-research-plugin@deep-research-marketplace
```

The same plugin can be managed from the Claude Code panel in VS Code. Its skill command is `/deep-research-plugin:deep-research-engine`. To load a local checkout for one session, use `claude --plugin-dir /path/to/deep-research-plugin`.

### Cursor CLI and IDE

In Cursor, use **Customize → From GitHub Repository** and install the listed plugin. For project-skill installation, run the helper above in the workspace and type `/` in Agent chat to invoke the skill.

### Freebuff CLI and IDE terminal

Freebuff discovers skills from the standard `.agents/skills/<name>/SKILL.md` layout. Install the project-skill version by running:

```sh
bash "/path/to/deep-research-plugin/scripts/install-agent-skills.sh" "/path/to/your-project"
```

Then start Freebuff from that project, including from an IDE's integrated terminal, and invoke it with `/skill:deep-research-engine`. This provides CLI-in-IDE skill support without a native Agent Plugin installer.

### ChatGPT.com

The root `plugin.json` packages the skills as a portable OpenAI Agent Plugin. The archive includes the listing icon and privacy policy as well as the canonical skills. From the repository root, create an upload archive:

```sh
zip -r deep-research-plugin-0.3.1.zip plugin.json README.md PRIVACY.md assets/ skills/
```

Upload the archive as a **skills-only plugin** through the [OpenAI plugin submission portal](https://developers.openai.com/plugins/deploy/submission). Complete publisher verification, provide the required support contact, resolve automated checks, and submit it for review. Skills-only plugins may have additional directory eligibility requirements; publication is not guaranteed. Once approved and published, it appears in the shared ChatGPT and Codex directory. Install it from [ChatGPT Plugins](https://chatgpt.com/plugins), then start a ChatGPT Work chat and select the plugin or invoke it with `@Deep Research Engine`. The repo marketplace is for supported local clients and does not install this private checkout directly into ChatGPT.com.

### Use the research skill

If a request does not specify a mode, the skill asks once:

> What type of research would you like? **1. Official** — authoritative sources only. **2. Mixed** — official evidence plus independent and community information. **3. Deep Discovery** — broad public-web investigation, including obscure sources and investigative leads.

Example requests:

- **Official:** “Research the economic benefits of preserving old-growth forests in British Columbia. Use government and academic sources.”
- **Mixed:** “Investigate whether this software is reliable. Compare official documentation with developer discussions and independent tests.”
- **Deep Discovery:** “Investigate the history of this obscure software project, including archived discussions, public repositories, community discoveries, and unverified historical claims.”
- **Breaking news:** “Investigate this story and distinguish what is confirmed from what is reported or unknown.”
- **Source verification:** “Find the original source behind this claim and provide a correct APA reference.”

## Agentic workflow

The skill runs an adaptive investigation loop: frame the question, inspect available retrieval and agent tools, create research tracks for substantial questions, gather and revise evidence, reconcile findings, audit citations, and report unresolved questions. Broad open-ended questions default to a standard evidence pass rather than a one-search headline recap. For current news, the report states its time scope, gives a concise chronology, includes APA author–date citations alongside source links, maps each main source to its contribution and limitations, and separates official statements from unknown causes. Narrow fact checks stay focused; research depth is chosen separately from Official, Mixed, or Deep Discovery source mode.

Users can invoke Deep Research Engine alone; they do not need to manually activate another skill. Plugin-based installs include the `deep-research-orchestration` skill for research initiated through Deep Research Engine. The standalone `better-research` instructions direct that workflow to the external `better-subagent-use` skill and tell it not to load this plugin's orchestrator. These descriptions define the intended routing; each host decides which skills to load, so the package cannot enforce isolation from host-level activation behavior. If the bundled orchestrator is unavailable or the host exposes no agents, use a sequential fallback. A skill does not add tools or permissions. Agent findings should include inspected sources, evidence locations, APA metadata when applicable, evidence status, limitations, contradictions, and next leads; the coordinating agent checks consequential findings before synthesis.

Research state can track the selected mode, objective, completed tracks, evidence links, contradictions, open questions, and next actions. Persistent workspace notes are used only when authorized and useful.

## Limitations and evaluation

The plugin supplies instructions, not retrieval tools. Coverage, source access, citation rendering, subagents, archives, and document handling depend on the host and the user's access. It cannot guarantee exhaustive discovery or a fixed accuracy level. It makes no claim of outperforming built-in research systems.

See [the evaluation scenarios](evaluations/research-scenarios.md) for behavior checks and expected outcomes. These are evaluation specifications, not claimed benchmark results. No live comparative benchmark has been run.

## Package layout

```text
plugin.json
PRIVACY.md
assets/deep-research.svg
.claude-plugin/
  plugin.json
  marketplace.json
.cursor-plugin/
  marketplace.json
.agents/
  plugins/marketplace.json
scripts/
  install-agent-skills.sh
skills/
  deep-research-orchestration/
    SKILL.md
  deep-research-engine/
    SKILL.md
evaluations/
  research-scenarios.md
```

## References

- [OpenAI Developers: Package your plugin](https://developers.openai.com/plugins/build/plugins)
- [OpenAI Developers: Build skills](https://developers.openai.com/plugins/build/skills)
- [OpenAI Developers: Submit and publish a plugin](https://developers.openai.com/plugins/deploy/submission)
- [OpenAI Developers: Plugin guidelines](https://developers.openai.com/plugins/plugin-guidelines)
- [Claude Code: Create a plugin](https://code.claude.com/docs/en/plugins/create)
- [Claude Code: Install and manage plugins](https://code.claude.com/docs/en/plugins/install)
- [Cursor: Agent Skills](https://cursor.com/docs/skills)
- [Freebuff: Skill format and discovery](https://github.com/CodebuffAI/freebuff/blob/main/common/src/templates/initial-agents-dir/skills/README.md)
- [Freebuff: Skills in the CLI](https://github.com/CodebuffAI/freebuff/blob/main/docs/agents-and-tools.md)
