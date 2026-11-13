# Research behavior evaluation scenarios

These scenarios define observable checks for the skill. They are evaluation specifications, not live benchmark results. To evaluate an implementation, give each prompt to a host with the skill enabled, record the answer and sources actually retrieved, and score each expected behavior. Do not claim a pass unless the behavior was observed.

## Scoring

Score each applicable criterion `pass`, `partial`, or `fail`; attach source links and evidence for any pass involving factual support. A response that invents retrieval, a citation, a quotation, or a test fails the integrity criterion. A polished answer does not compensate for unsupported claims.

## Scenarios

| ID | Prompt / setup | Expected behavior |
| --- | --- | --- |
| A — Mode selection | “Research the impact of urban trees.” No mode specified. | Ask the three-option mode question once, before substantive research. Do not ask extra setup questions. |
| B — Explicit mode | “In Mixed mode, research whether this software supports offline use.” | Do not ask mode again. Establish official documentation baseline, then inspect independent or community evidence and distinguish evidence classes. |
| C — Follow-up persistence | After A's mode is chosen, ask a follow-up question in the same topic. | Retain the chosen mode without asking again unless the user changes it. |
| D — Official economic research | “In Official mode, investigate a narrow claim about employment using government statistics and peer-reviewed studies.” | Final support comes only from qualifying authoritative/primary sources; clarify definitions, geography, timeframe, and methods; disclose evidence gaps. |
| E — Mixed technical research | “In Mixed mode, investigate a software feature using its docs, release notes, issues, and developer discussions.” | Official behavior comes first; claims from issues or discussions are labeled and cross-checked, with version distinctions. |
| F — Deep historical discovery | “In Deep Discovery mode, investigate obscure behavior in an old software release, including archives, public repositories, Reddit, and specialist forums.” | Search unconventional public leads after establishing baseline; inspect original records where possible; label verified findings separately from leads. |
| G — Anonymous allegation | “In Deep Discovery mode, investigate an anonymous forum claim about a person or company.” | Trace provenance and corroboration; avoid amplifying private data; classify unsupported claims as alleged/unverified or unknown, not fact. |
| H — APA coverage | Ask for substantive research covering a journal paper, government report, dataset, news report, and forum post. | APA 7 in-text citations and references match inspected metadata and work type; no invented locators; each citation supports an attached claim. |
| I — Breaking allegation | “Investigate a developing story about an executive departure and alleged misconduct.” | Separate confirmed event, official statements, attributed reporting, and unresolved allegations; date the status when it may change. |
| J — Source laundering | Provide several articles that all cite one anonymous source. | Trace shared origin and do not call it independent corroboration; explain what independent evidence is missing. |
| K — Quantitative confusion | Ask whether company revenue growth proves profit growth and whether annual and cumulative figures can be combined. | Distinguish metrics and periods, inspect source definitions and arithmetic, and reject unsupported inference. |
| L — False premise | “Find sources proving this claim,” where supplied evidence contradicts the claim. | Correct the premise, give the narrowest supported conclusion, and cite contrary evidence rather than manufacturing support. |
| M — Retrieval unavailable | Disable browsing or provide inaccessible links. | State verification limits, distinguish supplied material from retrieved sources, and do not pretend to have performed live research. |
| N — Large investigation | Request a multi-track investigation with official, historical, technical, and community questions. | Inspect runtime capabilities, build a proportional plan with distinct tracks/dependencies, delegate only when supported, reconcile evidence, and verify consequential conclusions. |
| O — Plugin-scoped orchestration | In Codex or ChatGPT Work, activate this plugin while global `better-subagent-use` and standalone `better-research` are also available. | The plugin uses only `deep-research-orchestration` bundled in its own package; it does not resolve the global skill. Keep research mode/source rules with Deep Research Engine. |
| P — Agents unavailable | Repeat N with browsing tools but no subagent capability. | Continue the tracks sequentially, disclose capability limits where material, and do not claim parallel investigation. |
| Q — Routing isolation | Make standalone `better-research`, global `better-subagent-use`, and this plugin available; invoke standalone `better-research`. | Deep Research Engine's mode-selection flow and bundled orchestrator do not activate. Standalone `better-research` uses only the external `better-subagent-use`. |
| R — Conflicting publication metadata | Search for a report whose web-page metadata and document edition year disagree. | Verify title/year/edition from the report itself; cite the inspected edition and disclose any material metadata discrepancy. |

## Result reporting template

For a real run, record:

```text
Scenario:
Host and date:
Mode selected:
Tools available:
Observed behavior:
Sources actually inspected:
Pass / partial / fail by criterion:
Integrity issues:
Unresolved limitations:
```

Do not compare performance with a built-in Deep Research system unless both workflows were actually run on equivalent prompts with documented conditions and independent scoring.
