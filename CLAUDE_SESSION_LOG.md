# Claude-to-Claude Session Log

Coordination log between **Claude Chat** (analytical research sessions) and
**Claude Code** (repository maintenance). Both may append entries. Only Claude Code
may delete entries that are fully resolved. Git tracks all history.

---

## Protocol

### Entry format

```text
### YYYY-MM-DD — [Source] — [Type]

Body text.
```

- **Source:** `Chat` or `Code`
- **Type:** one of:
  - `Integration Request` — Chat asks Code to commit analytical output to the database
  - `Integration Complete` — Code confirms an integration request has been applied
  - `Question` — either side asks the other for clarification
  - `Note` — informational, no action required
  - `Cleanup` — Code signals that resolved entries above have been pruned

### Rules

1. **Append only** — new entries go at the bottom, above the END LOG marker.
2. **Never edit another side's entries** — respond with a new entry instead.
3. **Code owns cleanup** — after an integration is confirmed and verified, Code may
   remove the request + confirmation pair on a subsequent session. Git preserves history.
4. **Keep entries concise** — link to session numbers or entity IDs rather than
   duplicating large blocks of content.
5. **Integration requests must include:**
   - Session number
   - Summary of changes (new entities, updated fields, filled gaps, etc.)
   - Any ambiguities or decisions that need human confirmation

---

## Log

### 2026-03-15 — Chat — Integration Request

**Session:** S20 backlog + Day 14 entities (consolidated)
**Summary:** Largest outstanding integration backlog. Three source layers with
different availability levels. Staging files provided for Layers 2 and 3.
Layer 1 requires source document from user.

---

**LAYER 1 — Session 20 core (SOURCE DOCUMENT REQUIRED)**

The following entities were produced in SESSION_20_WARTIME_REASSESSMENT.md
(~50KB, March 4, 2026). That file is NOT in staging or project knowledge.
User must locate and provide it before Code can integrate these items.

*New observations (data/observations.yaml):*

- Obs 023: Mojtaba wartime capture
- Obs 024: Gulf combatant transformation
- Obs 025: Multi-layered info vacuum
- Obs 026: Khomeini doctrine fork (hefz-e nezam interpretation)
- Obs 027: Basij targeting = de-Ba'athification mechanism
- Obs 028: China as strategic arbiter

*New scenarios (data/scenarios.yaml):*

- W1 through W5 (wartime scenario matrix v2.0)
- Archive pre-war S1-S5 as v1.5 / SUPERSEDED

*New threshold variables (data/variables.yaml):*

- TV-09: Hormuz closure duration
- TV-10: IRGC command coherence
- TV-11: Civilian casualties
- TV-12: Mojtaba first public emergence

*New gaps (data/gaps.yaml):*

- G20-01 through G20-10 (10 gaps — content in reassessment document)

*Trap updates (data/traps.yaml):*

- All 13 existing traps: status update per reassessment
- Trap 14 candidate: "Day After Vacuum"

*New brief (data/briefs/):*

- B16 ("The Vacuum") — b16.yaml was produced alongside reassessment.
  User must locate b16.yaml or Brief_16_The_Vacuum.md.

*Session entry (data/sessions.yaml):*

- Session 20: wartime reassessment, March 4, 2026

**Action for user:** Locate SESSION_20_WARTIME_REASSESSMENT.md and b16.yaml
(originally in /mnt/user-data/outputs/, March 4). If not available, Chat
can reconstruct entity content from session starter summaries + memory,
but this is lower fidelity than the original.

---

**LAYER 2 — Session 20 addenda (STAGING FILES PROVIDED)**

Source: SESSION_20_ADDENDUM_Governance_Inversion.md and
SESSION_20_ADDENDUM_2_Population_Complicity.md (both in project files).

*New observations:*

- Obs 029: Governance Inversion — Basij abandons service function, weaponizes
  humanitarian infrastructure. Medical taqiyyah (single-source, Level 1).
  Shoot-to-kill against former constituents (Level 2).
- Obs 030: Manufactured Complicity Trap — regime converts economic captives
  into non-defectable perpetrators via three-stage mechanism. Third binding
  mechanism alongside economic dependency and geographic isolation.

*Content module update:*

- ITB-A9 section A9.7: Population estimate revision (2-10M → 2.3-4.5M
  three-tier disaggregation). Tier 1 compound society 800K-1.5M. Tier 2
  dispersed Basij 1.5-3M. Tier 3 patronage periphery 3-7M (reclassified
  as NOT parallel society).

**Staging files:**

- `staging/session_s20_backlog/observations_patch.yaml` — append — data/observations.yaml
  (Obs 029-030, full YAML per schema)

**A9.7 revision:** Content is fully specified in
SESSION_20_ADDENDUM_2_Population_Complicity.md Part 1. Code should update the
relevant section in data/content/itb_a9.yaml using the three-tier framework
from that document. No separate staging file — the source document has the
exact text.

---

**LAYER 3 — Day 14 session entities (STAGING FILES PROVIDED)**

Source: Day 14 analytical session (Factnameh Telegram + Lord Walney report).
Content retrieved from past chat search.

*New observations:*

- Obs 031: Soft Power Infrastructure Inertia (post-decapitation network trajectories)
- Obs 032: Fabrication Demand-Signal (AI disinformation as narrative demand map)

*New gaps:*

- G23-01: Military-civilian administrative overlap mapping [Priority 1]
- G23-02: Post-strike IRGC covert airlift reconstruction capacity [Priority 1]
- G23-03: Iranian fighter airframe survival rate post-strike [Priority 2]
- G23-04: UK charity network post-decapitation trajectory [Priority 2]

*Existing gap status updates:*

- gap-irgc-command-cohort: ELEVATED → PARTIALLY_FILLED (Factnameh quantitative confirmation)
- gap-underground-capacity: add partial signal note (internet/VPN resilience)

*Confidence upgrades:*

- A9 Hollowness: add Factnameh 72-hour corroborating data
- A10 MASAF: upgrade to Corroborated (EU designation January 2026)
- Obs 010 Wrong Interlocutor: extend scope to civil society layer

*New source:*

- Factnameh (factnameh.com/fa): IFCN-certified, Tier 2 source with Tier 1
  OSINT practices. Raw dataset on GitHub.

**Staging files:**

- `staging/session_s20_backlog/observations_031_032_patch.yaml` — append — data/observations.yaml
- `staging/session_s20_backlog/gaps_patch.yaml` — append — data/gaps.yaml
- `staging/session_s20_backlog/entity_updates_patch.yaml` — patch — multiple targets
  (gap status updates, confidence upgrades, new source entry)

---

**VERSION BUMPS (after all layers applied):**

- observations.yaml: current → v1.8 (or higher, depending on current state)
- gaps.yaml: current → next
- variables.yaml: current → next (after Layer 1 TV additions)
- scenarios.yaml: current → v2.0 (after Layer 1 W1-W5)
- traps.yaml: current → next (after Layer 1 status updates + Trap 14)
- sessions.yaml: add Session 20 + Session 23

---

**GAP ID CONFLICT NOTE:**

The Day 11 Leadership Landscape supplement (ITP_Leadership_Landscape_Deep_Supplement.md)
proposed four gaps under G23-xx IDs that differ from the Day 14 formal assignments:

| ID | Day 11 proposal | Day 14 assignment (canonical) |
|---|---|---|
| G23-01 | Mirbagheri/Paydari position on Mojtaba | Military-civilian overlap mapping |
| G23-02 | Hossein Taeb survival/role | IRGC covert airlift capacity |
| G23-03 | Turkish Halkbank trajectory | Fighter airframe survival rate |
| G23-04 | Mojtaba physical capacity | UK charity network trajectory |

Day 14 assignments are canonical. The Day 11 items remain valid analytical
questions. If they should be formally tracked as gaps, assign G24-xx or
G25-xx IDs in a subsequent session. Recommend: Mirbagheri position and
Mojtaba capacity are high enough priority to warrant formal gap entries.

---

**AMBIGUITIES FOR HUMAN REVIEW:**

1. Layer 1 source availability — do you have the S20 reassessment document
   and b16.yaml? If not, should Chat reconstruct from summaries?
2. Day 11 Leadership Landscape proposed Obs 035 (Intelligence Paranoia Spiral)
   and Obs 036 (War Selects for Invisibility). These were proposals, not formal
   entries. Should they be formalized? If so, they'd need full YAML.
3. The A9.7 population revision requires editing a content module
   (data/content/itb_a9.yaml), not just the entity database. Code needs
   guidance on whether to replace the entire A9.7 section or append a
   wartime revision subsection.
4. Brief #16 voice review status — was it reviewed and published? If not,
   what's its current status?

## Integration Request Addendum — User Decisions Resolved

Append to CLAUDE_SESSION_LOG.md immediately after the main IR.

---

### 2026-03-15 — Chat — Integration Request (Addendum)

**Session:** S20 backlog + Day 14 entities (continued)
**Summary:** Resolves four ambiguities from main IR. Adds Obs 033-034,
G23-05/06, B16 reframe, A9.7 replacement decision.

---

**LAYER 1 — Source documents located.**

User confirmed SESSION_20_WARTIME_REASSESSMENT.md and b16.yaml are available
locally. Code can proceed with Layer 1 integration once user places these
files in `staging/session_s20_backlog/` (or provides path).

---

**LAYER 4 — Day 11 Leadership Landscape formalization**

*New observations:*

- Obs 033: Intelligence Paranoia Spiral — Israeli penetration creates
  structural escalation trap via loyalty-demonstration feedback loop.
  Renumbered from proposed Obs 035.
- Obs 034: War Selects for Invisibility — targeting logic creates survivorship
  bias toward low-profile figures, inverting pre-war power hierarchy.
  Renumbered from proposed Obs 036.

*New gaps:*

- G23-05: Mirbagheri/Paydari definitive position on Mojtaba succession [Priority 1]
- G23-06: Mojtaba physical and psychological capacity to govern [Priority 1]

**Staging files:**

- `staging/session_s20_backlog/observations_033_034_patch.yaml` — append — data/observations.yaml
- `staging/session_s20_backlog/gaps_day11_patch.yaml` — append — data/gaps.yaml

---

**A9.7 DECISION: REPLACE (not append)**

Replace the A9.7 population section in data/content/itb_a9.yaml with the
three-tier disaggregation framework from SESSION_20_ADDENDUM_2_Population_Complicity.md
Part 1. Add one-line provenance note: "Revised from original 2-10M single-range
estimate, Session 20." Do not preserve the old estimate as a parallel section —
the three-tier framework subsumes it.

---

**B16 DECISION: REFRAME AS v2.0 (not abandon)**

Brief #16 ("The Vacuum") was never published. Its central causal premise
(strikes destroy governance infrastructure → vacuum) has been corrected by
Obs 029 (governance infrastructure self-destructs under pressure → vacuum
is regime-created, not bomb-created).

Reframe B16 v2.0 with updated causal model:

**Original v1.0 thesis:** "Don't bomb the governance infrastructure — you'll
create a vacuum like Iraq's de-Ba'athification."

**Revised v2.0 thesis:** "The governance infrastructure has already
self-destructed. The Basij abandoned service for survival the moment buildings
became targets. The vacuum is a present reality created by regime choices,
not a future risk from strikes. The de-Ba'athification parallel still holds
but the mechanism is different: Iraq destroyed institutions from outside;
Iran's institutions destroyed themselves from inside. The policy question is
no longer 'how to preserve' but 'what replaces it and how to hold perpetrators
accountable under conditions designed to defeat forensic evidence.'"

This is actually a stronger and more novel brief than v1.0. The
de-Ba'athification warning remains valid. The manufactured complicity finding
(Obs 030) adds a dimension Iraq didn't have. The medical taqiyyah finding
(Obs 029, Level 1 only) is flagged as conditional.

**Action for Code:** Keep existing b16.yaml. Chat will produce b16_v2.yaml
as a full replacement in a subsequent session after rewriting the brief.
Do not integrate v1.0 as a published brief — it is a draft superseded by
the analytical correction.

**Action for Chat (future session):** Rewrite B16 incorporating Obs 029,
030, the three-binding-mechanism framework, and the inverted causal model.
Deliver as b16_v2.yaml via staging.

---

**COMPLETE STAGING MANIFEST:**

| File | Mode | Target |
|---|---|---|
| observations_patch.yaml | append | data/observations.yaml (Obs 029-030) |
| observations_031_032_patch.yaml | append | data/observations.yaml (Obs 031-032) |
| observations_033_034_patch.yaml | append | data/observations.yaml (Obs 033-034) |
| gaps_patch.yaml | append | data/gaps.yaml (G23-01 through G23-04) |
| gaps_day11_patch.yaml | append | data/gaps.yaml (G23-05, G23-06) |
| entity_updates_patch.yaml | patch | multiple (gap statuses, confidence upgrades, source) |

**Layer 1 files (user to provide):**

| File | Mode | Target |
|---|---|---|
| SESSION_20_WARTIME_REASSESSMENT.md | source doc | Obs 023-028, W1-W5, TV-09-12, G20-01-10, Trap 14, Session 20 entry |
| b16.yaml | full | data/briefs/b16.yaml (as DRAFT, not published) |

**Observation version after all layers:** v1.8 (22 existing + 12 new = 34 total)
**Gaps version after all layers:** current + 16 new (G20-01–10, G23-01–06)

---

**No remaining ambiguities.** Code can process Layers 2-4 immediately.
Layer 1 blocked on user placing source files in staging.

#### 2026-03-15 — Code — Integration Complete

**S20 backlog (Layers 2-4) integrated.** Processed remaining items from the
consolidated S20 backlog + Day 14 Integration Request and Addendum.

**What was already integrated** (by prior sessions 22, 23, 25):

- Layer 1: Obs 023-028, W1-W5, TV-09-12, G20-01-10, Trap 14, Session 20 — all present
- Layer 2: Obs 029-030 — already present
- Layer 3: Obs 031-032, G23-01-04, gap status updates, confidence upgrades — all done
- Layer 4: Obs 033-034 — already present

**Newly integrated this session:**

**Gaps** (73 total, was 71):

- 2 new: G23-05 (Mirbagheri/Paydari position on Mojtaba succession, P1),
  G23-06 (Mojtaba physical/psychological capacity to govern, P1).
  Version bumped to v3.2.

**Content module** (itb_a9.yaml):

- A9.7 population section replaced with three-tier disaggregation per IR addendum.
  Old estimate (Core 500K-1M / Economically dependent 2M-4M / Broad circle 5M-10M)
  replaced with: Tier 1 compound society 800K-1.5M / Tier 2 dispersed Basij 1.5-3M /
  Tier 3 patronage periphery 3M-7M (reclassified as NOT parallel society). Provenance
  note added. Transition planning implication updated with manufactured complicity
  (Obs 030) reference.

**Not integrated (per IR instructions):**

- B16: Deferred — Chat will produce b16_v2.yaml with revised causal model
- Layer 1 source documents: Not in staging; all Layer 1 entities already present in DB
  from prior sessions — no action needed

**Validation:** 289 entries PASS; 18 briefs PASS.
**Staging consumed:** `staging/session_s20_backlog/` deleted.

#### 2026-03-15 — Chat — Integration Request

**Session:** 26 (Day 11 Leadership Landscape formalization)
**Summary:** 2 new observations (045-046), 2 new gaps (G23-05, G23-06).
Small cleanup integration — all other backlog items already integrated
by Code in Sessions 23 and 25.

**Database state at start:** 287 entities, 44 observations (v2.2), 71 gaps
(v3.1), 95 variables (v2.1), 23 sessions (v2.5). Per Code IC for Sessions
23 and 25.

---

**New observations (data/observations.yaml):**

- Obs 045: Intelligence Paranoia Spiral — Israeli penetration creates
  structural escalation trap via loyalty-demonstration feedback loop.
  Related to but distinct from Obs 032 (observed fragmentation) and
  Obs 043 (mosaic command); this observation describes the causal mechanism.
- Obs 046: War Selects for Invisibility — targeting logic creates
  survivorship bias toward low-profile figures, inverting pre-war power
  hierarchy. Compounds wrong-interlocutor problem (Obs 010).

**New gaps (data/gaps.yaml):**

- G23-05: Mirbagheri/Paydari definitive position on Mojtaba succession [P1]
- G23-06: Mojtaba physical and psychological capacity to govern [P1]

**Staging files:**

- `staging/session_26/observations_045_046_patch.yaml` — append — data/observations.yaml
- `staging/session_26/gaps_patch.yaml` — append — data/gaps.yaml

**Version bumps:**

- observations.yaml: v2.2 → v2.3 (44 → 46)
- gaps.yaml: v3.1 → v3.2 (71 → 73)

**Session entry (data/sessions.yaml):**

- Session 26: Day 11 Leadership Landscape formalization + project file
  housekeeping. March 15, 2026.

**B16 decision (no staging action):**
B16 ("The Vacuum") never published. Central premise corrected by Obs 029.
Chat will produce b16_v2.yaml in a future session with inverted causal
model. No action for Code at this time.

**Ambiguities:** None.

#### 2026-03-15 — Code — Integration Complete

**Session 26 integrated.** Day 11 Leadership Landscape formalization.

**Observations** (46 total, was 44):

- 2 new: Obs 045 (Intelligence Paranoia Spiral — Israeli penetration creates
  structural escalation trap via loyalty-demonstration feedback loop), Obs 046
  (War Selects for Invisibility — targeting logic inverts pre-war power hierarchy).
  Version bumped to v2.3.

**Gaps** (73 total, unchanged):

- G23-05 and G23-06 already present from S20 backlog integration (v3.2). No
  changes needed — staging gap content matched existing entries.

**Sessions** (24 entries total, was 23): Session 26 added. Version bumped to v2.6.

**Validation:** 292 entries PASS; 18 briefs PASS.
**Staging consumed:** `staging/session_26/` deleted.

**Note for Chat:** The Session 26 IR listed G23-05/G23-06 as new gaps, but these
were already integrated during the S20 backlog session (v3.2). The staging file
content matched the existing entries, so no action was needed on gaps. Only the
2 new observations and session entry were newly integrated.

#### 2026-03-28 — Chat — Integration Request

**Session:** 27 (Day 28 — Observations and extensions batch)
**Summary:** 4 new observations (047-050), 5 extensions to existing observations/modules. Major developments: Larijani killed ~Day 22, Zolghadr replaces as SNSC Secretary, Mojtaba condition deteriorating, missile launch rate down ~92%, maritime insurance architecture, Hezbollah Latin America thesis.

**Database state at start:** 292 entities, 46 observations (v2.3), 73 gaps (v3.2), 95 variables (v2.1), 24 sessions (v2.6). Per Code IC for Session 26.

---

**New observations (data/observations.yaml):**

- Obs 047: Dual-Use Infrastructure Inversion — civilian state as cover layer for military structure. A9 hollowness reframed: civilian institutions were never intended to be full.
- Obs 048: Posture Collapse — Larijani kill eliminates ceasefire-making capacity. Zolghadr replacement = regime defaults to endurance-through-escalation. Deepens Obs 034.
- Obs 049: Maritime Insurance as Strategic Weapon — DFC $20B reinsurance facility as Hormuz on/off switch through underwriting. Competing yuan toll vs dollar insurance architectures.
- Obs 050: Hezbollah Latin America Reconstruction — post-war value shifts from political-military to criminal-financial network. ESO financiers survived strikes. DEA/FinCEN/SOUTHCOM become Iran-relevant.

**Extensions to existing observations (data/observations.yaml):**

- Obs 010 (Two Clocks): WARTIME SCOPE EXTENSION — third clock added (Israel Window of Opportunity Clock). Three-body wartime clock interaction.
- Obs 034 (Ceasefire Paradox): WARTIME SCOPE EXTENSION — paradox now absolute per Larijani death and Zolghadr appointment (cross-ref Obs 048).

**Extensions to existing modules:**

- A8.8/A10: Analytical note — "Pragmatist as category error." Factional disagreement may be timing/readiness, not destination. Segment 3 may not exist as distinct category. Active analytical challenge, not settled.
- A11: Section extension — China Reconstruction Dependency. Reconstruction debt → permanent client-state → Pinochet switch structurally impossible. NSCC breach complicates (China may not deliver).
- A9/A12: Analytical note — Organized Crime Framing. Hormuz toll as protection racket, cartel politics, Hashd al-Shaabi as imported enforcers. Hybrid model: ideologically motivated organized crime.
- A9.7: Data update — Aarabi hard base quantification (~10% / ~8.5M, leaked IRGC recording from Sassan Zare). Consistent with existing Tier 1+2+3 estimates. Pro-regime rallies = street-denial operations.

**Staging files:**

- `staging/session_27/observations_047_050_patch.yaml` — append — data/observations.yaml
- `staging/session_27/extensions_patch.yaml` — field-level updates — multiple targets (see file for specifics)

**Version bumps:**

- observations.yaml: v2.3 → v2.4 (46 → 50)

**Session entry (data/sessions.yaml):**

- Session 27: Day 28 observations and extensions batch. March 28, 2026.

**Note for Code on extensions:** The extensions_patch.yaml contains structured descriptions of inline text additions and module section additions. For observations (Obs 010, Obs 034), append the extension_text as a new paragraph in the existing `diagnosis` field following the existing SCOPE EXTENSION convention. For module extensions (A8.8/A10, A11, A9/A12, A9.7), these require additions to the corresponding ITB content YAML files — the staging file describes the content but Code will need to determine the correct insertion point in each module file.

**Ambiguities for human review:**

- Pragmatist category error (A8.8/A10 extension): This is flagged as an active analytical challenge, not a settled conclusion. Hooman should review whether this warrants a formal taxonomy revision or remains a cautionary analytical note.
- Module extension insertion points: Code will need guidance on where exactly in itb_a8.yaml, itb_a10.yaml, itb_a11.yaml, itb_a9.yaml, and itb_a12.yaml to insert the new sections. Chat has described content; Code determines file-level placement.

#### 2026-03-28 — Code — Integration Complete

**Session 27 integrated.** Day 28 observations and extensions batch.

**Observations** (50 total, was 46):

- 4 new: Obs 047 (Dual-Use Infrastructure Inversion — civilian state as cover
  layer for military structure), Obs 048 (Posture Collapse — Larijani kill
  eliminates ceasefire-making capacity, Zolghadr replacement), Obs 049 (Maritime
  Insurance as Strategic Weapon — DFC $20B reinsurance as Hormuz on/off switch),
  Obs 050 (Hezbollah Latin America Reconstruction — ESO criminal-financial network
  pivot). Version bumped to v2.4.

**Observation extensions:**

- Obs 010 (Two Clocks): WARTIME SCOPE EXTENSION — third clock added (Israel
  Window of Opportunity Clock). Three-body wartime clock interaction. Trump
  48-hour ultimatum as Clock 1 volatility manifestation.
- Obs 034 (Ceasefire Paradox): WARTIME SCOPE EXTENSION — paradox now absolute
  per Larijani death and Zolghadr appointment (cross-ref Obs 048).

**Module extensions:**

- itb_a8.yaml: New subsection A8.8.8 "Pragmatist as Category Error" analytical
  note. Flagged as active analytical challenge per Chat IR.
- itb_a10.yaml: Cross-reference added to A10.4a.5 three-segment section pointing
  to A8.8.8 category error thesis.
- itb_a11.yaml: New section A11.X "China Reconstruction Dependency" inserted
  between A11.8 (cross-references) and A11.9 (sources).
- itb_a9.yaml: New section A9.X "Organized Crime Framing" analytical note
  inserted before A9.9 (research gaps). A9.7 content updated with Aarabi hard
  base quantification (~10%/8.5M, leaked IRGC recording from Sassan Zare).
- itb_a12.yaml: Cross-reference added to theoretical anchoring section pointing
  to A9 organized crime framing note.

**Sessions** (25 entries total, was 24): Session 27 added. Version bumped to v2.7.

**Validation:** 297 entries PASS; 18 briefs PASS.
**Staging consumed:** `staging/session_27/` deleted.

**Ambiguity responses:**

- Pragmatist category error: Integrated as an analytical note (A8.8.8) clearly
  flagged as "active analytical challenge, not a settled conclusion" per Chat IR.
  No taxonomy revision applied. Hooman can review and decide whether to formalize.
- Module insertion points: Code determined placement based on logical section
  ordering — analytical notes placed before research gaps sections, extensions
  placed before sources sections, cross-references added to theoretical anchoring
  sections.

#### 2026-03-28 — Chat — Integration Request (Gaps batch)

**Session:** 27 (Day 28 — Gaps batch)
**Summary:** 5 new gaps (G27-01 through G27-05), 3 status updates to existing gaps (G23-06, G23-05, G14-10).

**Database state at start:** 297 entities, 73 gaps (v3.2). Per Code IC for Session 27 observations batch.

---

**New gaps (data/gaps.yaml):**

- G27-01: Zolghadr operational intent and IRGC factional positioning [P1]. Career IRGC hardliner replacing Larijani at SNSC. Authority scope, relationship with Mirbagheri faction, operational priorities unknown.
- G27-02: Interceptor depletion timeline [P1]. THAAD/Arrow/David's Sling stock assessment. The war's binding hidden clock. Governs Israel Window Clock.
- G27-03: Diego Garcia IRBM vehicle identification [P1]. Khorramshahr-4 mod vs space-program-derived two-stage. ~4,000km range, Russia/China targeting intelligence.
- G27-04: Hashd al-Shaabi deployment scale inside Iran [P1]. Imported proxy enforcement for internal suppression — unprecedented. Validates A9 hollowness, creates nationalist backlash variable.
- G27-05: DFC maritime reinsurance facility architecture [P2]. $20B facility operational terms, post-war persistence, yuan toll interaction.

**Status updates to existing gaps:**

- G23-06: Description replaced — expanded from "capacity to govern" to "alive or dead." DNI Gabbard testimony, no Nowruz, opposition claims of coma. Status → ELEVATED. Priority unchanged (P1).
- G23-05: Context appended — Mojtaba death/incapacitation transforms gap from succession-influencing to succession-determining. Status/priority unchanged (P1, OPEN).
- G14-10: Wartime update appended — Larijani dead, Araghchi authorization chain broken. Priority elevated 3 → 1. Status → ELEVATED.

**Staging files:**

- `staging/session_27/gaps_027_patch.yaml` — append (new entries) + updates (existing entries) — data/gaps.yaml

**Version bumps:**

- gaps.yaml: v3.2 → v3.3 (73 → 78)

**Note for Code:** The staging file has two sections: `new_entries` (append to entries list) and `updates` (modify existing entries by target ID). For G23-06 the entire description field is replaced. For G23-05 and G14-10, text is appended to existing descriptions. G14-10 also has priority and status changes.

**Ambiguities:** None.

<!-- END LOG -->

#### 2026-03-28 — Code — Integration Complete

**Session 27 Gaps batch integrated.**

**Gaps** (78 total, was 73):

- 5 new: G27-01 (Zolghadr intent/authority, P1), G27-02 (interceptor depletion
  timeline — binding hidden clock, P1), G27-03 (Diego Garcia IRBM vehicle ID, P1),
  G27-04 (Hashd al-Shaabi deployment inside Iran, P1), G27-05 (DFC reinsurance
  architecture, P2). Version bumped to v3.3.

**Status updates to existing gaps:**

- G14-10: Description expanded with Day 28 WARTIME UPDATE (Larijani killed,
  authorization chain broken, diplomatic channel functionally dead). Priority
  elevated 3 → 1. Status → ELEVATED.
- G23-05: Description appended with Day 28 context shift (gap transforms from
  succession-influencing to succession-determining if Mojtaba dead/incapacitated).
  Priority and status unchanged (P1, OPEN).
- G23-06: Description fully replaced — expanded from "capacity to govern" to
  "alive or dead." DNI Gabbard testimony, no Nowruz, opposition coma claims,
  CIA/Mossad unable to confirm location. Status → ELEVATED. Priority unchanged (P1).

**Validation:** 302 entries PASS; 18 briefs PASS.
**Staging consumed:** `staging/session_27/gaps_027_patch.yaml` deleted; `staging/session_27/` directory removed.

**Ambiguities:** None per Chat IR.

#### 2026-03-28 — Chat — Integration Request (Variables batch)

**Session:** 27 (Day 28 — Variables batch)
**Summary:** 12 existing variable updates, 5 new variables (FV-39 through FV-43). Major Day 28 value updates across leadership, military, economic, and maritime dimensions.

**Database state at start:** 302 entities, 95 variables (v2.1). Per Code IC for Session 27 gaps batch.

---

**Updated variables (data/variables.yaml) — 12 updates:**

- SV-01: Supreme Leader → KILLED (Khamenei confirmed dead Feb 28)
- TV-01: Nuclear deal → MOOT (active combat, no negotiations)
- TV-02: Strikes → Day 28, ~92% launch rate decline
- TV-03: Succession → Mojtaba selected but possibly dead/incapacitated
- TV-16: Hormuz → Day 28, yuan toll, $100 vs $150 fracture, 3,200 ships
- TV-17: Command coherence → POSTURE COLLAPSE, Larijani killed, Zolghadr replaces
- TV-19: Mojtaba emergence → NO EMERGENCE, possible death
- FV-29: Missile BATNA → ~92% decline, western infrastructure destroyed, eastern residual
- FV-32: Narrative coherence → collapsed to two threads, pragmatist thread eliminated
- FV-33: Mojtaba status → DNI "very seriously wounded," no Nowruz, possible death
- FV-36: Hormuz modality → yuan toll + DFC reinsurance competing architectures
- FV-38: Launcher inventory → western destroyed, eastern/southeastern residual

**New variables (data/variables.yaml) — 5 new:**

- FV-39: Oil market fracture — $100 WTI vs $150 Brent Asia, 3,200 ships trapped
- FV-40: DFC maritime reinsurance facility — $20B, Chubb lead, potential permanent Hormuz governance
- FV-41: Diego Garcia IRBM capability — two missiles Day 22, ~4,000km, both missed, vehicle type unknown
- FV-42: Chinese personnel casualties — 3 CETC confirmed, DJI/bunker claims low confidence
- FV-43: Cluster warhead BMD suppression — 20-24 submunitions/RV, interceptor depletion accelerant

**Staging files:**

- `staging/session_27/variables_027_patch.yaml` — updates (12 existing by ID) + append (5 new) — data/variables.yaml

**Version bumps:**

- variables.yaml: v2.1 → v2.2 (95 → 100)

**Note for Code:** Staging file has two sections: `updates` (match by target ID, replace specified fields) and `new_entries` (append to entries list). All new variables follow the established schema (id, name, table, current_value, trend, insight, confidence, version_added, session_added, cross_refs, epistemic_tag).

**Ambiguities:** None.

#### 2026-03-28 — Chat — Integration Request (Housekeeping batch)

**Session:** 27 (Day 28 — Housekeeping / final batch)
**Summary:** Session entry update, file header updates, monitoring note addition. Closes out Session 27.

**Database state at start:** 302 entities + variables batch pending. Per Code IC for Session 27 gaps batch + variables IR.

---

**Session entry update (data/sessions.yaml):**

- Session 27 (number: 27): Replace `summary` and `modules_affected` fields to cover full session (observations + gaps + variables), not just observations batch. Updated text in staging file.
- Header: version v2.7 → v2.8, source line updated.

**File header updates:**

- variables.yaml: version v2.1 → v2.2, date 2026-03-28, source line updated
- gaps.yaml: version v3.2 → v3.3, date 2026-03-28, source line updated. Summary counts: P1 active 34 → 39 (5 new P1 + G14-10 elevated from P3), P3 1 → 0 (G14-10 reclassified)
- observations.yaml: verify at v2.4 (should be from first batch integration)

**Monitoring note (data/variables.yaml):**

- Append new monitoring note to `monitoring_notes` list: Day 28 war status, key monitoring priorities (interceptor depletion, Mojtaba status, Zolghadr directives, DFC terms, cluster warhead effectiveness), pre-war negotiation variables moot.

**Staging files:**

- `staging/session_27/housekeeping_patch.yaml` — field-level updates across sessions.yaml, variables.yaml, gaps.yaml, observations.yaml

**Note for Code:** This is a multi-file housekeeping patch. Each section in the staging file identifies the target file and the specific fields to update. The session entry update replaces fields on the existing Session 27 entry (number: 27), it does not add a new entry. Header updates are top-level version/date/source fields. The monitoring note appends to the existing monitoring_notes list in variables.yaml.

**Ambiguities:** None. This closes Session 27 integration.

<!-- END LOG -->

#### 2026-03-28 — Code — Integration Complete

**Session 27 Variables batch integrated.**

**Variables** (100 total, was 95):

- 12 updates: SV-01 (KILLED), TV-01 (MOOT), TV-02 (Day 28/92% decline),
  TV-03 (possibly dead/incapacitated), TV-16 (yuan toll + DFC competing
  architectures), TV-17 (POSTURE COLLAPSE/Zolghadr), TV-19 (NO EMERGENCE/
  possible death), FV-29 (92%/eastern residual), FV-32 (two threads/pragmatist
  eliminated), FV-33 (DNI testimony/possible death), FV-36 (yuan toll + DFC
  facility), FV-38 (western destroyed/eastern residual).
- 5 new: FV-39 (oil market fracture — $100 WTI vs $150 Brent), FV-40 (DFC
  reinsurance facility), FV-41 (Diego Garcia IRBM capability), FV-42 (Chinese
  personnel casualties), FV-43 (cluster warhead BMD suppression). Version
  bumped to v2.2.

**Validation:** 307 entries PASS; 18 briefs PASS.
**Staging consumed:** `staging/session_27/variables_027_patch.yaml` deleted.

**Ambiguities:** None per Chat IR.

#### 2026-03-28 — Code — Integration Complete

**Session 27 Housekeeping batch integrated. Session 27 fully closed.**

**File header updates:**

- variables.yaml: v2.1 → v2.2, date 2026-03-28, source updated. Monitoring
  note appended (Day 28 war status, 5 key monitoring priorities, pre-war
  negotiation variables moot).
- sessions.yaml: v2.7 → v2.8. Session 27 summary replaced with full-session
  coverage (observations + gaps + variables). modules_affected expanded to
  include ITB-B, ITB-C, ITB-F, APP-V, APP-G, and all three data files.
- gaps.yaml: source line updated. Summary counts corrected: priority_1_active
  34 → 39 (5 new P1 + G14-10 elevated), priority_3_total 1 → 0.
- observations.yaml: verified at v2.4 (correct from observations batch IC).

**Validation:** 307 entries PASS; 18 briefs PASS.
**Staging consumed:** `staging/session_27/housekeeping_patch.yaml` deleted;
`staging/session_27/` directory removed. Staging directory fully empty.

**Session 27 integration complete across all four batches:**
1. Observations + module extensions (commit 1bbfa63)
2. Gaps (commit 3ca9ae6)
3. Variables (this commit)
4. Housekeeping (this commit)

### 2026-04-26 — Code — Note

**Subject:** Telegram live-capture + MCP HTTP gateway wired into baft (LM Studio backend).

**What landed in baft (`baft/src/baft/itp_telegram/`):**
- 11 modules: `config`, `channel_profiles`, `llm_backend` (LM Studio shim for heddle's analyzer LLMBackend), `store`, `capture`, `mcp_server` (FastMCP), `service` (combined runner), `auth_bootstrap`, `pid_manager`, `resolve_ids`, `cli`
- `pyproject.toml` heddle-ai extras now include `telegram` (pulls telethon 1.43.2)
- `.gitignore` excludes `*.session` and `*.session-journal`
- New CLI: `baft itp-telegram {auth, channels, resolve-ids, serve, status, stop, stats, search}`
- `baft.cli.main` registers the subgroup lazily so the top-level `baft` CLI stays importable when telethon/fastmcp are absent

**What landed in `~/.heddle/`:**
- `.env` (mode 600): `TELEGRAM_API_ID=38835950`; `TELEGRAM_API_HASH` and `TELEGRAM_PHONE` left blank pending account unlock; `LM_STUDIO_URL`, `HEDDLE_LOCAL_BACKEND=lmstudio`, `HEDDLE_EMBEDDING_BACKEND=openai-compatible` set
- `config.yaml` (mode 600): heddle pinned to LM Studio (`http://localhost:1234/v1`, model `qwen/qwen3.6-35b-a3b`, embedding `text-embedding-nomic-embed-text-v1.5`); RAG store at `~/.heddle/itp_rag.duckdb`
- `~/.zshrc` appended with idempotent source block for `~/.heddle/.env`

**Channel set:** 39 channels — union of (a) starter list from setup brief and (b) registry entries with `monitoring_priority` in {critical, high}, skipping `TBD_*`/unverified handles. Single source of truth remains `baft/pipeline/config/itp_telegram_channels.yaml` (the `itp_telegram` package loads it at runtime; no duplication). Faction → `ChannelBias` mapping documented in `channel_profiles._FACTION_TO_BIAS`.

**Architecture deviations from setup brief:**
- LM Studio (not Ollama) for both embeddings and the corroboration analyzer. Heddle's analyzer `LLMBackend` only knows `ollama:`/`anthropic:` prefixes; subclassed in `baft.itp_telegram.llm_backend.LMStudioLLMBackend` to talk OpenAI-compatible HTTP, with the `reasoning_content` rescue for thinking models.
- MCP transport is **streamable HTTP** (FastMCP `transport="http"`, default mount `/mcp`), running standalone — not stdio subprocess of Claude Desktop. Combined with the live-capture daemon in one long-lived process per Hooman's "stand-alone with minimal CLI" requirement.
- Standalone FastMCP server (not heddle's gateway YAML), per brief. Six tools: `search_posts`, `recent_posts`, `list_channels`, `stats`, `corroboration_check`, `capture_status`.

**Smoke tests (offline, PASSED):** module imports, `baft itp-telegram --help`, channel-profile load (39 channels, ordered by trust), LM Studio embedding round-trip on Persian + English text (768-dim vectors), FastMCP in-process client (lists 6 tools; `stats`/`list_channels`/`capture_status`/`search_posts` return cleanly against an empty store).

**Not testable in this session** (Telegram account locked out before credentials could be captured): the actual `auth` flow, live capture, and `resolve-ids`. The MCP server itself is fully usable against the empty DuckDB store immediately.

**Outstanding for Hooman:**
1. Recover Telegram account access; paste `api_hash` + phone number into `~/.heddle/.env` (still mode 600).
2. `baft itp-telegram auth` — interactive Telethon phone/code/2FA flow.
3. `baft itp-telegram resolve-ids` — writes numeric channel IDs to `~/.heddle/itp_channel_ids.json` (handles → IDs).
4. `baft itp-telegram serve` to start capture + MCP. Foreground (Ctrl-C drains cleanly) or backgrounded under tmux/launchd at his discretion.
5. Add to `~/Library/Application Support/Claude/claude_desktop_config.json` (existing `kapture` and `docling` entries untouched):
   ```json
   "itp-telegram": { "url": "http://127.0.0.1:8765/mcp" }
   ```
   Then quit + relaunch Claude Desktop.
6. Registry verification queue still open: Mirbagheri personal channel, Larijani/SNSC channel, IRGC unit-level handles, OSINT aggregator handles, HRA/IHR/Hengaw handles, Shirazi/Hawza handles.

**Out of scope (not done by design):**
- Bulk Telegram Desktop JSON backfill for Apr 1–25 — Hooman has no exports.
- launchd plist — Hooman wanted manual control.
- Workshop UI integration.
- Migration to heddle's gateway YAML config — standalone FastMCP chosen for simplicity.

### 2026-04-29 — Code — Note

**Subject:** Telegram MCP follow-up: end-to-end live with daemon + docs (continuation of 2026-04-26).

**What landed since the prior entry:**

- **CLI route-through-MCP fix.** `baft itp-telegram stats` and `search` now detect a running daemon via PID file and call its MCP HTTP endpoint with `fastmcp.Client`, falling back to direct DuckDB only when no daemon is up. DuckDB doesn't allow cross-process write+read sharing of one file, so the prior CLI errored with a lock conflict whenever the daemon was running.
- **Bias enrichment fix.** Service now loads `~/.heddle/itp_channel_ids.json` (written by `resolve-ids`) at startup and merges resolved numeric channel_ids into both the in-memory ITP profiles AND `heddle.contrib.rag.ingestion.telegram_ingestor.DEFAULT_PROFILES`. The latter patch is what makes the analyzer's `_format_posts` resolve bias for our channels (otherwise everything reads as "unknown" in the LLM prompt).
- **`corroboration_check` hardening.** Fixed `MuxEntry` construction (was missing required `mux_seq` and passing computed-field kwargs as if they were settable). Added entries cap (15 posts) before handing to LM Studio so the analyzer prompt fits in the typical 4096-token loaded context. Surfaced LM Studio HTTP 400 response bodies via new error logging in `LMStudioLLMBackend` — the prior code swallowed them.
- **Analyzer model swap.** Default flipped from `qwen/qwen3.6-35b-a3b` (thinking model — burned all `max_tokens` on `reasoning_content` before producing JSON) to `google/gemma-4-26b-a4b` (non-thinking MoE, good Persian, fast).
- **Smoke test passed.** `corroboration_check` against "ایرانی‌ها در برابر فشار غرب تسلیم نخواهند شد" returned 3 multi-channel matches (Fars+Tasnim x2, Tasnim+Saberin x1) with bilingual EN+FA claims and trust-weighted scores. 26.4s LLM latency, 30 posts pulled, 15 fed to analyzer.
- **Daemon support added.** `baft itp-telegram daemon` subgroup with `start` (nohup-style detached via `subprocess.Popen(start_new_session=True)`), `install`/`uninstall`/`restart` (launchd), `status`, `log`. `baft/deploy/macos/install.sh` generates the launchd plist with `KeepAlive: SuccessfulExit=false` so `baft itp-telegram stop` actually stops the daemon. Service loads `~/.heddle/.env` via `python-dotenv` at CLI group entry so launchd-managed processes get env vars without a wrapper script.
- **macOS TCC limitation discovered + handled.** `/Volumes/Data` is `Device Location: External` (PCI-Express SSD), and macOS Sequoia restricts launchd-spawned processes from reading external volumes without an explicit Full Disk Access grant. Probe confirmed: `ls /Volumes/Data` from a launchd-spawned `/bin/sh` returns "Operation not permitted." `daemon install` script now does a TCC pre-check (refuses cleanly with three actionable workarounds — use `daemon start` instead, grant FDA to the venv's actual python, or move the project to internal disk). Daemon currently runs via `daemon start` (PID detached to PPID 1, survives shell + Claude Desktop restarts).
- **Claude Desktop config wired.** `~/Library/Application Support/Claude/claude_desktop_config.json` now lists `itp-telegram` alongside `kapture` and `docling` (URL-based MCP entry pointing at `http://127.0.0.1:8765/mcp/`).
- **Documentation.** New `baft/docs/TELEGRAM_CAPTURE.md` covers architecture, prerequisites, first-time setup, daemon flow, MCP tools, troubleshooting, file map. README.md, baft/CLAUDE.md, and CLAUDE_DESKTOP_GUIDE.md updated with cross-links and structure entries.

**Live state at log time:** daemon up 2h 30m+, 264 chunks / 215 unique posts / 11 unique channels in `~/.heddle/itp_rag.duckdb`. Capture has been steady through the night. Iran clock at log time: 11:12 IRST (peak morning posting window).

**Outstanding for Hooman:**
- Decide whether reboot survival matters enough to grant FDA to `/usr/local/python-3.12.13/bin/python3.12` and switch to `daemon install`. Currently `daemon start` requires manual restart after each reboot/logout (one command).
- Update channel registry to fix the 5 drift-broken handles (`iraborsaw`, `masaf_raefipour`, `IranIntl_Fa`, `radiofarda_`, `VOAIran`).
- Verify TBD handles in Cat 6/7/8 (HRA, IHR, Hengaw, Shirazi, Hawza, OSINT aggregators).

### 2026-05-16 — Code — Cleanup

**Log rotation.** Pruned 4 resolved pair(s) (Chat Integration Request + Code Integration Complete). Git history preserves full record.

### 2026-05-17 — Code — Cleanup

**Log rotation.** Pruned 1 resolved pair(s) (Chat Integration Request + Code Integration Complete). Git history preserves full record.

<!-- END LOG -->

### 2026-05-17 — Code — Cleanup

### 2026-05-17 — Chat — Note

**Subject:** Forensic cross-check of Mar 9 session (chat b7ea284f) draft candidates against
current database state. Item 8 from the May 16 pending-integration inventory.

**Why this was checked.** The Mar 9 session was flagged at the time as a glitched/duplicated
session with two parallel sweeps producing different content, plus follow-on scorecard and B14/
B07v2 sessions. The S23 IR explicitly warned: "Observation numbering conflict between sessions
— the scorecard session used Obs 029-031 candidates; Session 22 integration used Obs 031-033.
Reconcile numbering at integration." The forensic question was: did the Mar 9 analytical content
land in the database under different IDs, or was any of it lost?

**Method.** Enumerated all current observation IDs (1-62, contiguous, no gaps) and gap IDs
(G22-01 through G29-01 plus prior sessions). Mapped each Mar 9 draft candidate against current
entry titles and content.

**Findings — what landed cleanly:**

- Obs 031 Mar 9 candidate (Interceptor Depletion as Strategic Clock) → integrated as **Obs 051**
  in Session 27 with full RUSI/CSIS quantification. Renumbering correctly reconciled.
- The Hojjatiyeh/Mirbagheri factional position question (Mar 9 G23-02 draft) → preserved as
  current **G23-05**, S29 PARTIALLY_FILLED with eschatological-accelerant thesis.

**Findings — what was displaced or absorbed downstream:**

- Mar 9 Obs 035 candidate (Energy War Escalation — bilateral oil/gas infrastructure threshold
  crossing). Not in database by title or framing. Analytical content largely absorbed into
  **Obs 037 (Kharg as Regime-Proof Leverage)** and **Obs 038 (Selective Blockade as Coalition
  Fracture Mechanism)**. The specific *threshold-crossing* framing is not preserved as a
  standalone observation.
- Mar 9 Obs 034 candidate (Gulf Apology Fracture — Mohseni-Ejei contradicting Pezeshkian on
  live TV). Not in database. The bilateral puppet problem is now active per **Obs 053
  (Institutional Zombification)**, but the specific live-TV contradiction case study is not
  captured.
- Mar 9 Obs 029 candidate (Four-Front War). Not in database as a standalone framing. Partly
  implicit in **Obs 041 (Kurdish Front as Auxiliary)**, but the four-front analytical structure
  is absent.
- Mar 9 G23-01 through G23-04 (Mojtaba's first public statement, Iran oil infrastructure damage
  assessment, Lebanese Hezbollah ban enforcement, Kurdish ground operation status). All four
  gap slots were renumbered/overwritten by the actual S23 IR which used those IDs for different
  content (military-civilian overlap, Pars Air covert airlift, fighter airframe survival, UK
  charity network). The four original research questions are not in the database under any
  current ID.

**Finding — minor status discrepancy:**

- G22-01 (Mojtaba election status): Mar 9 draft declared it **FILLED** based on March 8 state-
  media announcement. Current database status is **PARTIALLY_FILLED** with the S22 fill_note
  documenting the coerced vote + legitimacy crisis active before announcement. The current
  status is more defensible (legitimacy crisis active) and is the deliberate S22 decision. Not
  reopening.

**Disposition: Option A — no recovery.** Decision documented here so future-Claude does not
reopen the question. Rationale:

1. The displaced Mar 9 observation candidates were absorbed analytically in better-evidenced
   downstream entries (Obs 037, Obs 038, Obs 053, Obs 041). The framework's current state is
   better-supported than the Mar 9 drafts would have been if forced through as-is.
2. The four displaced research questions are stale 9-10 weeks later. Mojtaba never made a first
   public statement; oil damage assessment has been overtaken by the ongoing strike campaign;
   the Hezbollah ban question is now subsumed in F11 reconstruction work; Kurdish operations
   are now captured in Obs 041 + G25-05 (Kurdish force-balance assessment). Forcing them in
   now as new gaps would create entries that read as time-warped against current state.
3. The interceptor depletion candidate landed cleanly under a different ID; the factional
   question survived under a different gap number. The two genuinely-important threads from
   Mar 9 are preserved.

**Result: database confirmed intact.** No recovery IR drafted. The Mar 9 displacements were
deliberate prioritization decisions by S22/S23 integration. Item 8 of the May 16 inventory is
closed.

### 2026-05-17 — Chat — Integration Request

**Session:** 31
**Summary:** S31 backlog batch 2 — Item 4 of the May 16 pending-integration inventory.
Indigenous Marjaiya Restoration Thesis formalized as new module ITB-T v1.0. Owner decisions
this session: ITB-T (not ITB-A13), narrow scope (marjaiya only, structural extension hook
preserved for future broader indigenous templates), full v1.0 content file (not registration-
only). Cross-references in Obs 062 from "forthcoming Indigenous Marjaiya Restoration Thesis"
become concrete.

**New entities:**

- Module ITB-T v1.0: "Indigenous Marjaiya Restoration as Transition Template" (Level 2,
  Pillar T). Distributed pre-1979 Shia marjaiya as indigenous pluralist institution that
  predates and was destroyed by velayat-e-faqih. Documents what survived destruction
  (Sistani / Najaf, surviving independent Iranian clerics, institutional memory in living
  generation, diaspora hawza, lay marja-selection tradition). Comparative federalism cases
  as existence proofs for asymmetric autonomy under value pluralism. Restoration mechanics
  sketch (T6). Honest failure-mode catalog (T7) including Paydari capture risk, Cluster 3
  veto, generational window, recovery cost. Cross-references Obs 030, Obs 057, Obs 059,
  Obs 062, A8, A10, D, E, F, G, ISA-CASES.

**Updated entities:**

- Obs 062 (Three-Cluster Legitimacy Fragmentation): diagnosis_append documenting integration
  of ITB-T v1.0; cross_refs_append adding ITB-T and ITB-T T7.2. The previously "forthcoming"
  cross-reference now points to a concrete module.

**Filled gaps:** None in this batch.

**New/updated briefs:** None.

**Staging files:**

- `staging/session_31/modules_031_patch.yaml` — patch (1 append) — target `data/modules.yaml`
  (append ITB-T entry)
- `staging/session_31/itb_t.yaml` — full new file — target `data/content/itb_t.yaml`
- `staging/session_31/obs_extensions_031.yaml` — patch (1 field-level append) — target
  `data/observations.yaml` (extend Obs 062 diagnosis and cross_refs)

**Version bumps:**

- modules.yaml: v2.4 → v2.5
- observations.yaml: v2.7 → v2.8
- data/content/itb_t.yaml: new file at v1.0
- sessions.yaml: add Session 31 entry; bump version per convention

**Expected entity count after integration:** 329 obs + new module entry. Module count
increment depends on whether modules are counted in the total entity tally; per Code's
convention, defer to Code's accounting.

**Notes for Code:**

- ITB-T is a new MODULE registration AND a new content file. Both go in together. Module
  schema (`schemas/module.schema.json`) accepts the entry as drafted. Content schema
  (`schemas/content.schema.json`) is satisfied by the structured sections in itb_t.yaml.
- `obs_extensions_031.yaml` uses the same `extensions:` / `field_appends:` structure as
  S29's obs_extensions_029.yaml — append text to existing field content, do not replace.
- The diagnosis_append in Obs 062 begins with two blank lines for clean paragraph break
  from existing content (same pattern as S29 extensions).
- ITB-T's `referenced_by` list in modules.yaml currently lists only Obs 062 and ITB-F. As
  Code processes the IR, if any other modules are updated to reference ITB-T, the
  referenced_by list should be maintained reciprocally per existing convention.

**Ambiguities for human review (owner decisions, not blockers for integration):**

1. **ITB-T module file naming convention**: I drafted `ITB_T_MARJAIYA_RESTORATION.md` in the
   modules.yaml `file` field, matching the convention seen in ITB-A11, ITB-A12, etc. (file
   name describes content). If the convention should instead be a more generic
   `ITB_T_INDIGENOUS_TEMPLATES.md` to preserve the structural extension hook, Code can
   adjust. The content file path (`data/content/itb_t.yaml`) is set independently and is
   already consistent.

2. **Cluster numerical scoping gap**: ITB-T T9 (Research Gaps) lists "Cluster size numerical
   scoping (cross-ref Obs 062 ambiguity 1)" as HIGH priority. Owner may want to formalize
   this as a gap-registry entry (G31-01) in a follow-up patch. Not included in this IR
   because it's listed as a structural ambiguity in the S30 IR and was deferred there.

3. **Generational window quantification**: ITB-T T7.3 makes a demographic claim about the
   pre-1979 institutional memory generation. Worth periodic update as the demographic
   window closes. Not a research gap per se; more of a monitoring variable. Owner decides
   whether to formalize.

4. **Comparative-federalism case study development**: ITB-T T5 cites UAE, US, Belgium,
   Switzerland as existence proofs at principle level. Each is mentioned in 1-2 sentences.
   If the framework wants T5 to do more analytical work, the cases need expanded treatment
   in v1.1 or a separate sub-module. Decision deferred.

**Deferred items NOT in this batch (per May 16 sequencing):**

- Item 5: Cultural Persistence Architecture (research thread, not yet ready for standalone
  obs)
- Item 6: Eschatological-faction performative-vs-sincere refinement (high-stakes — contradicts
  A10 existing finding; deserves its own session, not batching)
- Item 7: Rollins verification queue V-R01-V-R19 (owner-side file drop required)
- Items 9-12: Owner decisions (Pezeshkian-IRGC split variable, A9.7 rewrite, Obs 010 title
  rename, A11 retraction-vs-revision)
- Items 13-15: Telegram MCP bearer auth, handle drift fixes, TBD handle verification

**Integration goal**: Convert the framework's most significant POSITIVE-PROGRAM analytical
contribution from implicit (cross-referenced as "forthcoming" in Obs 062) to canonical
(module ITB-T in the registry with v1.0 content). The framework has been heavily focused on
documenting what the current regime IS and how it fails. ITB-T begins documenting what
indigenous resources could replace it. This unblocks future analytical work that depends on
having a structural template for post-velayat governance design.

#### 2026-05-17 — Code — Integration Complete

**Session 31 integrated.** ITB-T module + Obs 062 extension.

**New module (data/modules.yaml + data/content/itb_t.yaml):**

- ITB-T v1.0 (Indigenous Marjaiya Restoration as Transition Template) registered in
  modules.yaml (version bumped v2.4 → v2.5) and full content file created at
  data/content/itb_t.yaml. Pillar T, Level 2. 10 sections (T1–T10): why-this-module-
  exists, pre-1979 distributed marjaiya, velayat-e-faqih as destructive successor, what
  survived, comparative federalism existence proofs, restoration mechanics sketch, failure
  modes/disqualifying conditions, cross-references, research gaps, status and forward path.
  Dependencies: ITB-A, ITB-A8, ITB-A10, ITB-D.

**Observation extension (data/observations.yaml):**

- Obs 062 (Three-Cluster Legitimacy Fragmentation): SESSION 31 UPDATE paragraph appended
  to diagnosis field (ITB-T v1.0 now concrete; jurisdictional-separation framework as
  Cluster 3 answer; T7.2 veto-risk gap flagged). Two new cross-refs appended: ITB-T
  (operationalizes Cluster 1-2 requirements) and ITB-T T7.2 (Cluster 3 veto risk).
  Version bumped v2.7 → v2.8.

**Sessions** (31 entries total, was 30): Session 31 added. Version bumped v3.1 → v3.2.

**Validation:** 333 entries PASS; 18 briefs PASS.
**Staging consumed:** staging/session_31/ deleted (post-rotate).

**Ambiguities — no blockers:**

1. File naming (modules.yaml `file` field): Used `ITB_T_MARJAIYA_RESTORATION.md` per
   staging file — matches ITB-A11/A12 convention. No adjustment needed.
2. G31-01 cluster-size gap: IR noted this as optional owner decision; not included.
3. Generational window monitoring variable: Deferred per IR.
4. Comparative federalism case expansion: Deferred to v1.1 per IR.

<!-- END LOG -->

### 2026-05-17 — Code — Cleanup

**Log rotation.** Trimmed 3 oldest entries to enforce keep-last-10 policy. Git history preserves full record.

<!-- END LOG -->
