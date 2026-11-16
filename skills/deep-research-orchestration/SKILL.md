---
name: deep-research-orchestration
description: Coordinate agent work only for investigations initiated with the Deep Research Engine plugin. Plan multi-track research, independent source checks, and counterevidence work when delegation is useful; do not activate for standalone better-research requests.
---
<!-- Copyright (c) 2026 2q9e. See ../../LICENSE for terms. -->

# Deep research orchestration

This skill is scoped to research investigations initiated through the Deep Research Engine plugin. Do not activate it for standalone `better-research`; that workflow uses its own external orchestration instructions. Use available agents to finish more validated research work in less time. Delegation is a means, not a goal. This skill does not create agent tools, raise platform limits, grant permissions, or guarantee parallel execution. Use only capabilities exposed by the current runtime; adapt or work directly when a needed capability is absent, and never claim unsupported capabilities or results.

## 1. Discover the runtime and project

Before delegating:

1. Read the user request and derive concrete acceptance criteria. Preserve user constraints and requested validation.
2. Inspect relevant research scope, source constraints, and host instructions. Distinguish project guidance from worker definitions. Inspect native worker definitions only for a host and named worker you may use; verify the runtime reads them and inspect executable definitions or MCP configuration before using them. Follow trust prompts and never bypass a trust gate.
3. If delegation is useful, discover the runtime controls relevant to this task: worker availability, source retrieval access, permission scope, concurrency, and any isolation or coordination features you plan to use. Narrow permissions where supported. If they cannot be narrowed, delegate only work safe with inherited tools and credentials; do not provide secrets or unrelated private data. Do not infer capabilities from the installed skill or agent name.
4. Reuse a suitable existing worker when available. Create a native worker definition only when supported, authorized, and useful beyond one assignment. Otherwise put role guidance in the brief. Report definitions created or changed.
5. Estimate the parallel benefit against startup and context-gathering time, shared-state and write-conflict risk, and integration/verification overhead. A small, serial, single-area task normally stays with the coordinator.

## 2. Decompose research work

Map the investigation into bounded tracks by question, evidence class, or source community:

1. Identify shared questions, dependencies between claims, source constraints, and verification needs. Broad or extensive investigations usually benefit from roughly four to six distinct evidence tracks when the question supports them. For current news, these can cover official records, chronology and prior statements, financial/technical context, policy consequences, and independent reporting or counterevidence. Use separate tracks and multiple search waves when the runtime supports them; do not split artificial tracks or treat searches, candidate records, inspected sources, and citations as interchangeable counts.
2. Map track dependencies and readiness in a small graph or checklist.
3. Define what evidence each track needs to find and report. Resolve scope and constraints from the user's request; keep unresolved interpretations with the coordinator and clarify only when needed.
4. Put dependent tracks later in the queue.
5. Prefer assignments that produce inspected primary evidence, independent corroboration, quantitative checks, or counterevidence. Avoid parallel source summaries that repeat the same material.
6. Delegate only when a track benefits from separate expertise or source access; do not fragment work to increase worker count.

Keep the coordinator productive on independent research while workers run. Avoid assigning overlapping claims or source sets without a clear reason. Integrate a completed track while other independent tracks continue; wait only for evidence or findings that are actual dependencies.

## 3. Schedule adaptively

Treat concurrency as a live capacity limit, not a target. Discover the host's available slots and documented caps. Maintain a ready queue and fill free slots with independent, useful work. When a worker completes, record its result and free its slot; immediately launch other ready work while integration proceeds. Unlock dependent packages only after their required inputs or shared interfaces are validated. Reduce concurrency when conflicts, failures, resource pressure, or integration cost rise; increase it when more independent work is ready and the system is healthy. Stop when remaining work is dependent, unsafe to split, or cheaper to finish directly.

Judge throughput by completed, validated work and integration effort against the direct-work estimate, not by worker count. Use observed delays, rework, failures, and cost to adjust later waves. Keep tracking lightweight; do not add instrumentation unless it helps make a real scheduling decision.

If capacity is unknown, start with a modest wave using host defaults and adjust from observed reliability and resource pressure. Never treat host limits as targets or change global settings to force more slots. Prevent recursive spawning unless the host supports it and the task tree and budget are explicit.

## 4. Match model and reasoning to work

Use the least expensive, lowest reasoning level that is likely to succeed. Respect the user's choices and the model/runtime's documented controls. Model selection and reasoning effort are different settings. A skill cannot set either when the host does not expose the control.

| Research task | Starting effort |
| --- | --- |
| Focused factual question or one-source verification | Low |
| Multi-source synthesis or routine quantitative check | Medium |
| Complex, disputed, or obscure investigation with several evidence tracks | High |
| Exceptionally difficult investigation with material consequences | XHigh/Max only when supported and justified |

Use a faster or less costly model for routine, bounded work when available; reserve stronger models for uncertainty, complexity, or high-impact decisions. Raise effort or change the approach after evidence of a reasoning-related failure. Do not escalate for missing context, unavailable tools, permissions, or environmental faults.

## 5. Prevent overlapping research tracks

For research tracks, prevent duplicate searches and conflicting scope:

- State the claim, source category, geography, timeframe, and exclusions for each worker so tracks remain distinct.
- Let one worker own a shared source or a dependent question when parallel work would create duplicate or conflicting interpretation.
- Do not assume workers share retrieved sources, notes, or persistent state. Ask each worker to return links and evidence locations.
- Reconcile overlapping findings against the original sources; preserve disagreements and do not treat duplicate reports as independent corroboration.

## 6. Assign with a task contract

Give each worker enough context to act without rediscovering the task. Adapt this compact template:

```text
Track and research question:
Context, mode, source policy, and acceptance criteria:
Dependencies / inputs:
Sources or evidence to inspect:
Authorized retrieval actions and prohibited access:
Relevant project instructions / existing agent role:
Available worker tools and permission scope:
Suggested model and reasoning effort (if supported):
Evidence collection and verification requested:
Definition of done:
Report: findings, inspected sources and evidence locations, APA metadata,
confidence/status, limitations, contradictions, open leads, and complete/blocked status.
```

Delegation never expands the user's authorization. Unless the request explicitly authorizes the action, workers must not contact sources, post material, publish findings, bypass access controls, expose private information, or perform other consequential external actions. If an authorized action has an unclear target or environment, do not guess; keep it with the coordinator and ask only for the missing detail.

Ask workers to report concise results, not raw logs or hidden reasoning. Research assignments should name measurable evidence outputs. Most research tracks need retrieval and analysis, not write access; never grant or assume broader permissions than the assignment requires. Confirm tool access and permission scope first. If workers cannot retrieve sources, have them analyze only supplied material and label that limit; do not describe it as independent source research.

## 7. Monitor, integrate, and recover

Maintain a lightweight ledger of track owners, dependencies, status (`ready`, `blocked`, `active`, `retrying`, `complete`, `failed`), active slots versus total assignments, retry cause and changed approach, evidence gathered, and verification state. Use native messaging and wait/resume controls when available. For long efforts, checkpoint at phase boundaries only when a suitable, authorized artifact or tracker exists; do not assume persistence or create a file by default.

On failure, diagnose before retrying and mark the assignment `retrying` with a bounded attempt count. Default to one retry per assignment (two attempts total), and retry only when the cause is plausibly transient or the brief, context, or approach has materially changed. Never repeat an identical failed attempt. Allow another attempt only when there is a specific corrective reason and expected value; record it. Stop on missing authorization or capability, or when the same failure recurs without a new remedy.

- Missing context or unclear acceptance: repair the brief.
- Overlapping track or source scope: clarify ownership, separate the questions, or serialize dependent work.
- Worker crash, timeout, context exhaustion, tool/API error, permission failure, or environment fault: distinguish a transient failure from a missing capability; resume or reassign only when useful, otherwise report the blocker.
- Incomplete track: identify the missing evidence or output and retry only with a revised brief or approach.
- Conflicting evidence: trace source relationships, compare methods and scope, then report unresolved disagreement rather than forcing a false synthesis.
- Reasoning failure: change the approach, scope, or justified effort.

Detect deadlocks, duplicate assignments, uncontrolled nested spawning, and diminishing returns; simplify, reassign, or finish directly.

## 8. Verify completion

Inspect each worker's findings, source links, and evidence locations and validate the combined result against the user's acceptance criteria; do not treat a completion message as proof. Recheck consequential claims in primary sources where accessible. Do not perform actions beyond the permissions and authorization provided. Report source-access limits, unresolved contradictions, remaining unknowns, and material blockers clearly.

