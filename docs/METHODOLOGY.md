# Analytical Methodology

**Iran Transition Project**
**Status:** Continuously developed and refined — critique welcome

---

## Overview

This document describes the analytical methodology used by the Iran Transition
Project. It is written for readers familiar with traditional analytical methods
(intelligence community structured analysis, academic political science, think
tank policy analysis) who want to understand what this project does differently
and why.

**This methodology is not finished.** It is being developed and refined through
application to a live, high-stakes analytical problem. Feedback and critique
are actively sought — see [How to Critique This Methodology](#how-to-critique-this-methodology)
at the end of this document.

---

## What Problem This Methodology Addresses

Traditional analytical frameworks for Iran exhibit recurring failure modes:

1. **Wrong interlocutor.** Negotiations focus on pragmatist factions while
   actors with veto power (eschatological hardliners, IRGC economic networks)
   are neither at the table nor analytically modeled as decision-relevant.

2. **Surface legibility bias.** The regime's constitutional architecture is
   treated as decorative, its ideological claims dismissed as rhetoric, and
   its institutional depth underestimated. This produces analysis that
   consistently overestimates regime flexibility and underestimates
   institutional inertia.

3. **English-language source monoculture.** The vast majority of Western
   analysis relies on English-language sources, missing the regime's own
   signaling (KHAMENEI.IR, seminary networks, IRGC-affiliated media) and
   the analytical signal embedded in Farsi-language institutional discourse.

4. **Snapshot analysis.** Think tank products and intelligence assessments
   tend to capture point-in-time snapshots rather than tracking structural
   dynamics across time. Variables change; the analysis does not update.

This methodology is designed to address these specific failure modes through
structured frameworks, explicit epistemic discipline, continuous variable
tracking, and multilingual source integration.

---

## Core Frameworks

### Iran Transition Baseline (ITB)

The ITB maps the regime's institutional architecture across eight pillars:

| Pillar | Coverage |
|--------|----------|
| A | Constitutional architecture, IRGC, ideology, parallel society, eschatological faction, coercive doctrine |
| B | Security and military architecture |
| C | Economic structures and sanctions |
| D | International relations and alignment |
| E | Domestic society and demographics |
| F | Transition dynamics and historical cases |
| G | Nuclear program and proliferation |
| H | Information environment and media |

Each pillar contains one or more analytical modules — structured documents
with explicit section numbering, cross-references, and epistemic tags on
every claim. The ITB is not a static reference; it is updated as new
information changes the analytical picture.

### Iran Stress Architecture (ISA)

The ISA identifies structural vulnerabilities and analytical hazards:

- **Traps:** Circular logic structures that catch policymakers. Example:
  a nuclear deal requires trust → trust requires verification → verification
  requires access → access requires a deal. Each trap documents its mechanism,
  circular structure, resolution path, and historical parallels.

- **Observations:** "So-what" findings that emerge from cross-referencing ITB
  modules. Each observation states what is true (diagnosis) and what it means
  for planning (strategic implication).

- **Scenarios:** Modeled transition and conflict pathways with probability
  ranges, leading indicators, and cross-referenced variables.

### Analytical Variables

The project tracks 86 variables across five tables: stock (slow-moving
structural conditions), flow (dynamic indicators), threshold (trigger
points), positive optionality (opportunities), and normalization quality
(governance readiness). Variables are updated with explicit trend indicators
and confidence bands.

### Research Gaps

Open questions are registered, prioritized (1-4), and tracked. When a gap
is filled, the session and method of resolution are recorded. This creates
an auditable trail of what the project knows, what it does not know, and
what it is actively trying to learn.

---

## Epistemic Framework

### Claim Tagging

Every analytical claim carries an epistemic tag:

| Tag | Meaning |
|-----|---------|
| `[Fact]` | Directly verifiable, multiple independent sources |
| `[Inference]` | Reasoned from established facts, reasoning chain stated |
| `[Uncertain]` | Single source, contested, or extrapolated |
| `[Speculation]` | Acknowledged hypothesis, forward projection |

Tags are paired with confidence bands (High, Medium, Low) that indicate
the overall strength of evidence supporting a conclusion.

**Why this matters:** In traditional analysis, a reader cannot distinguish
between a conclusion the analyst is confident about and one that rests on
thin evidence without reading the full sourcing appendix. Inline tagging
makes evidence quality visible at the point of consumption.

### Source Hierarchy

The project uses a five-tier source taxonomy:

1. **Regime primary sources** (KHAMENEI.IR, official institutional output)
2. **Human rights monitoring organizations** (HRANA, Amnesty, CHRI)
3. **Academic Iran studies** (peer-reviewed research)
4. **Diaspora investigative outlets** (with transparent sourcing methodology)
5. **Unverified / single-source**

Sources at tiers 1-3 receive priority weighting. Wikipedia is excluded as a
primary or corroborating source for Iran content due to documented
state-affiliated manipulation.

### Regime Source Filtering

Regime-controlled media is not treated as factual reporting. It is treated
as a signaling channel — what the regime chooses to say, to whom, and when,
is itself analytical data. The content is claims-only; the decision to publish
is the signal.

### Taqiyyah as Analytical Variable

The project explicitly models taqiyyah (religiously sanctioned dissimulation)
as an institutional capability, not a cultural stereotype. Four specific
failure modes are documented where Western analysts misread regime behavior
because they do not account for this institutionalized deception doctrine.
This is framed with strict anti-Islamophobic discipline — the analytical
point is institutional, not civilizational.

---

## AI-Assisted Research

This project uses Claude (Anthropic) as a research assistant. The AI's role
is documented publicly through two instruction files:

- **CLAUDE_CHAT_INSTRUCTIONS.md** governs analytical sessions: epistemic
  discipline, source standards, module activation, stakeholder analysis
- **CLAUDE_CODE_INSTRUCTIONS.md** governs repository maintenance: YAML
  operations, schema validation, build pipeline

### What AI Does

- Accelerates multilingual source research (Farsi, Arabic, English)
- Maintains structured data consistency across 86 variables, 57 gaps,
  and 22 content modules
- Drafts analytical content under explicit epistemic constraints
- Validates cross-references and schema compliance
- Builds publication-ready output from structured data

### What AI Does Not Do

- AI output is not treated as a source. All claims require independent
  sourcing per the epistemic framework above.
- AI does not make analytical judgments autonomously. The human analyst
  sets the analytical direction, evaluates findings, and decides what
  conclusions the evidence supports.
- AI-generated summaries of other AI systems (e.g., Gemini) are treated
  as potentially contaminated and require independent verification.

### Why This Is Public

Analytical transparency requires disclosing methods. The instruction files
document exactly what constraints the AI operates under, what it is told to
prioritize, and how its output is validated. If the AI introduces bias or
methodological weakness, the instructions that produced that bias are
available for anyone to examine.

---

## Comparison with Traditional Methods

| Dimension | Traditional IC / Think Tank | This Project |
|-----------|---------------------------|--------------|
| **Update cycle** | Point-in-time assessments | Continuous variable tracking with session-based updates |
| **Evidence transparency** | Sourcing appendix or footnotes | Inline epistemic tags on every claim |
| **Source language** | Predominantly English | Multilingual mandate (Farsi, Arabic, English) |
| **Structural modeling** | Narrative-driven | Structured data (YAML) with schema validation |
| **Cross-reference integrity** | Manual, error-prone | Automated build pipeline with validation |
| **Accessibility** | Classified or paywalled | Open source (CC BY-SA 4.0) |
| **Methodology disclosure** | Rarely published | Fully public, open to critique |
| **Factional position** | Often aligned with policy preference | Explicitly neutral — the test is structural, not preferential |

**What traditional methods do better:** Classified intelligence access,
human source networks, satellite imagery analysis, signals intelligence.
This project cannot replace those capabilities. It can structure and
validate the analytical framework that interprets their output.

---

## Known Limitations

- **No classified sources.** The project relies entirely on open sources.
  This creates blind spots on operational military details, internal regime
  communications, and real-time intelligence.

- **Single analyst.** The current framework reflects one analyst's judgment.
  Peer review and methodological critique are essential correctives — this
  is an active invitation, not a disclaimer.

- **AI contamination risk.** Despite safeguards, AI assistance introduces
  the risk of plausible-sounding but unsourced claims. The epistemic
  tagging system is designed to catch this, but no system is foolproof.

- **Regime deception.** The project explicitly models taqiyyah, but
  modeling deception does not guarantee detecting it in every case.
  The framework can identify structural conditions where deception is
  likely; it cannot always identify the specific deception.

- **English-language output.** Despite multilingual source integration,
  all output is in English. This limits accessibility to Farsi-speaking
  audiences who might provide the most valuable feedback.

---

## How to Critique This Methodology

This methodology is being developed in the open specifically to invite
critique. The most valuable feedback addresses:

1. **Structural blind spots.** Where does the framework systematically
   miss something? Not individual factual errors, but categories of
   information or analysis that the structure itself excludes.

2. **Epistemic overconfidence.** Where do confidence bands seem too
   high for the evidence available? Where does an `[Inference]` tag
   mask what should be `[Uncertain]`?

3. **Source hierarchy problems.** Is the five-tier taxonomy appropriate?
   Are there source categories that deserve higher or lower weighting?

4. **Framework transferability.** Could this methodology be applied to
   other opaque regimes (North Korea, Myanmar, Eritrea)? What would
   need to change?

5. **AI methodology risks.** Does the AI-assisted workflow introduce
   biases that the current safeguards do not catch?

**How to submit critique:**
- Public: [GitHub Discussions](../../discussions) (Feedback & Critique category)
- Private: [irantransitionproject.org/submit](https://irantransitionproject.org/submit)
- Email: [admin@irantransitionproject.org](mailto:admin@irantransitionproject.org)

All methodological critiques that identify genuine weaknesses will be
acknowledged and addressed in the framework, with attribution if the
submitter requests it.
