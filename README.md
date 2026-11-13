# Deep Research Engine

An evidence-first research plugin for Codex and compatible Agent Plugins hosts. It packages a repeatable research workflow as a skill; it does not bundle a search engine, MCP server, browser, or other retrieval service. It uses the capabilities available in the host and is explicit when those capabilities are missing.

## What it does

Deep Research Engine turns a research request into a sourced investigation. Before substantive research on a new investigation, it asks the user to choose a mode unless one was already specified:

| Mode | What it does | Use it for |
| --- | --- | --- |
| **Official** | Builds the answer from authoritative and primary evidence. Non-authoritative sources may help locate leads but do not support final claims. | Academic work, statistics, policy, law, technical specifications |
| **Mixed** | Establishes the official baseline first, then checks independent reporting, expert work, and relevant community evidence against it. | Products, software, real-world behavior, contested claims |
| **Deep Discovery** | Starts with the same baseline, then searches widely across public archives, forums, repositories, and other obscure sources. It labels leads and allegations separately from verified findings. | Obscure histories, undocumented behavior, public rumors, overlooked records |

The selected mode persists for the investigation and its follow-ups. Users can switch modes at any time. Research depth is chosen separately from mode, so a narrow Deep Discovery task need not become a large report.

## Evidence and citations

- APA 7 author–date citations and a matching References list are the default for substantive research, unless the user requests another style.
- Citations are checked against retrieved source passages or data. References, quotations, URLs, dates, page numbers, and native citation IDs are never invented.
- Important claims are mapped to direct, partial, indirect, contradictory, or unverified evidence. Source quality and relevance are assessed separately.
- The report distinguishes confirmed facts, official statements, credible reporting, allegations, disputed claims, and unknowns. An official statement verifies that it was made; it does not automatically prove its contents.
- Research uses adversarial checks for alternative explanations, common-source repetition, stale data, corrections, and contrary evidence.

## Discovery and safety

The workflow supports exact-phrase and domain searches, alternate terminology, date and file filters where available, citation tracing, public records, original datasets, source repositories, historical archives, specialist forums, and community discussions. Search operators are used only when supported by the active retrieval tool.

Deep Discovery investigates publicly accessible material. It does not bypass access controls or acquire or expose stolen credentials, private personal data, or confidential records. Retrieved pages and files are treated as untrusted content, not instructions.

## Install and use

This repository is a portable plugin package with `plugin.json` at the root and the skill under `skills/deep-research-engine/`. Add this repository as a plugin marketplace source or install the package through a host that supports Agent Plugins. In Codex, the bundled skill is available as `deep-research-plugin:deep-research-engine` after installation. Exact install steps and skill discovery vary by client; see the host's current plugin documentation.

Example requests:

- **Official:** “Research the economic benefits of preserving old-growth forests in British Columbia. Use government and academic sources.”
- **Mixed:** “Investigate whether this software is reliable. Compare official documentation with developer discussions and independent tests.”
- **Deep Discovery:** “Investigate the history of this obscure software project, including archived discussions, public repositories, community discoveries, and unverified historical claims.”
- **Breaking news:** “Investigate this story and distinguish what is confirmed from what is reported or unknown.”
- **Source verification:** “Find the original source behind this claim and provide a correct APA reference.”

If a request does not specify a mode, the skill asks once:

> What type of research would you like? **1. Official** — authoritative sources only. **2. Mixed** — official evidence plus independent and community information. **3. Deep Discovery** — broad public-web investigation, including obscure sources and investigative leads.

## Parallel work

When the host supports subagents, the skill can assign independent research tracks and requires the coordinating agent to verify consequential findings. Parallel work is conditional on host capability; the plugin cannot enable unavailable tools or raise platform limits.

## Limitations and evaluation

The plugin supplies instructions, not retrieval tools. Coverage, source access, citation rendering, subagents, archives, and document handling depend on the host and the user's access. It cannot guarantee exhaustive discovery or a fixed accuracy level. It makes no claim of outperforming built-in research systems.

See [the evaluation scenarios](evaluations/research-scenarios.md) for behavior checks and expected outcomes. These are evaluation specifications, not claimed benchmark results. No live comparative benchmark has been run.

## Package layout

```text
plugin.json
skills/
  deep-research-engine/
    SKILL.md
evaluations/
  research-scenarios.md
```

## References

- [OpenAI Developers: Build skills](https://developers.openai.com/plugins/build/skills)
- [OpenAI Developers: Package your plugin](https://developers.openai.com/plugins/build/plugins)
