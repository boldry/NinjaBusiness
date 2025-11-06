# Instructions for Updating All Prompts with Workflow Headers

## Status
- ✅ 01_Vision_Brief_Prompt.md - UPDATED (example)
- ⏳ 02_Market_Analysis_Prompt.md - PENDING
- ⏳ 03_Team_Credentials_Prompt.md - PENDING
- ⏳ 04_Competitive_Analysis_Prompt.md - PENDING
- ⏳ 05_Risk_Analysis_Prompt.md - PENDING
- ⏳ 06_Financial_Model_Prompt.md - PENDING
- ⏳ 07_Use_of_Funds_Prompt.md - PENDING
- ⏳ 08_Customer_Journey_Mapping_Prompt.md - PENDING
- ⏳ 09_Technical_Requirements_Prompt.md - PENDING
- ⏳ 10_Roadmap_Prompt.md - PENDING

## How to Update Each Prompt

### Step 1: Open the prompt file

### Step 2: Add workflow header after the title line

Insert the appropriate header from `PROMPT_HEADER_TEMPLATE.md` immediately after the `# AI Prompt: [Name]` line and before `## Your Role`.

### Step 3: Format

Ensure there's a blank line after the header section (marked by `---`) and before `## Your Role`.

### Example Structure

```markdown
# AI Prompt: [Document Name] Generator

---
## 🔄 WORKFLOW CONTEXT
[Workflow context from template]
---

## Your Role
[Existing content continues...]
```

## Headers to Use

### For 02_Market_Analysis_Prompt.md

```markdown
---
## 🔄 WORKFLOW CONTEXT
**Position:** Stage 2 - Research & Analysis (Execute after Stage 1)
**Dependencies:** Vision Brief (01)

**Input Files Required:**
- `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`

**Input Files Optional:**
- User market research documents
- Industry reports

**What to Extract from Vision Brief:**
- Target market definition
- Initial TAM/SAM/SOM estimates
- Customer segments mentioned
- Market trends mentioned
- Problem statement for market demand research

**Output File:** `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
**Used By:** Financial Model (06), Customer Journey (08), Technical Requirements (09), Roadmap (10)
**Execution Time:** 3-4 hours

**Critical:** TAM must be ≥$100M (Ninja Concepts requirement)
---
```

### For 03_Team_Credentials_Prompt.md

```markdown
---
## 🔄 WORKFLOW CONTEXT
**Position:** Stage 2 - Research & Analysis (Execute after Stage 1)
**Dependencies:** Vision Brief (01)

**Input Files Required:**
- `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`

**Input Files Optional:**
- Team resumes
- LinkedIn profiles
- Advisor information

**What to Extract from Vision Brief:**
- Team overview and roles
- Founder names and backgrounds (high-level)
- Team gaps mentioned
- Hiring plans mentioned

**Output File:** `03_outputs/[CompanyName]_Team_Credentials_v1.0_[Date].md`
**Used By:** Financial Model (06), Use of Funds (07), Roadmap (10)
**Execution Time:** 2-3 hours

**Critical:** Technical co-founder or strong advisor required (deal-breaker if missing)
---
```

### For 04_Competitive_Analysis_Prompt.md

```markdown
---
## 🔄 WORKFLOW CONTEXT
**Position:** Stage 2 - Research & Analysis (Execute after Stage 1)
**Dependencies:** Vision Brief (01)

**Input Files Required:**
- `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`

**Input Files Optional:**
- Competitive research documents
- Patent information

**What to Extract from Vision Brief:**
- Competitive landscape overview
- Key competitors mentioned
- Competitive advantages claimed
- Value proposition to defend
- Differentiation points mentioned

**Output File:** `04_outputs/[CompanyName]_Competitive_Analysis_v1.0_[Date].md`
**Used By:** Financial Model (06), Customer Journey (08), Roadmap (10)
**Execution Time:** 3-4 hours

**Critical:** Competitive moat must be defensible (scores up to 15 points in investment rubric)
---
```

### For 05_Risk_Analysis_Prompt.md

```markdown
---
## 🔄 WORKFLOW CONTEXT
**Position:** Stage 2 - Research & Analysis (Execute after Stage 1)
**Dependencies:** Vision Brief (01), optionally Market/Team/Competitive (02-04)

**Input Files Required:**
- `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`

**Input Files Optional (Recommended):**
- `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `03_outputs/[CompanyName]_Team_Credentials_v1.0_[Date].md`
- `04_outputs/[CompanyName]_Competitive_Analysis_v1.0_[Date].md`

**What to Extract from Vision Brief:**
- Risk assessment section (initial risks)
- Business model risks
- Market risks mentioned

**What to Extract from Other Documents (if available):**
- Market Analysis: Market demand risks, timing risks
- Team Credentials: Team gaps, key person risks
- Competitive Analysis: Competitive threats, moat weaknesses

**Output File:** `05_outputs/[CompanyName]_Risk_Analysis_v1.0_[Date].md`
**Used By:** Financial Model (06), Use of Funds (07), Technical Requirements (09), Roadmap (10)
**Execution Time:** 2-3 hours

**Critical:** Honest risk assessment builds investor trust
---
```

### For 06_Financial_Model_Prompt.md

```markdown
---
## 🔄 WORKFLOW CONTEXT
**Position:** Stage 3 - Financial & Planning (Execute after Stage 2 complete)
**Dependencies:** ALL Stage 2 outputs (01-05)

**Input Files Required (ALL):**
- `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `03_outputs/[CompanyName]_Team_Credentials_v1.0_[Date].md`
- `04_outputs/[CompanyName]_Competitive_Analysis_v1.0_[Date].md`
- `05_outputs/[CompanyName]_Risk_Analysis_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Business model, revenue streams, pricing strategy, funding amount
- Market Analysis: TAM/SAM/SOM, customer segments, market growth rates
- Team Credentials: Team size, salaries, hiring plan with costs and timing
- Competitive Analysis: Competitive pricing data, market positioning
- Risk Analysis: Financial risks, revenue risks, cost risks

**Output File:** `06_outputs/[CompanyName]_Financial_Model_v1.0_[Date].md`
**Used By:** Use of Funds (07), Customer Journey (08), Technical Requirements (09), Roadmap (10)
**Execution Time:** 3-5 hours

**Critical:** LTV/CAC must be ≥3:1 (minimum requirement), clear path to profitability required
---
```

### For 07_Use_of_Funds_Prompt.md

```markdown
---
## 🔄 WORKFLOW CONTEXT
**Position:** Stage 3 - Financial & Planning (Execute after Financial Model)
**Dependencies:** Vision Brief (01), Team Credentials (03), Financial Model (06)

**Input Files Required:**
- `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `03_outputs/[CompanyName]_Team_Credentials_v1.0_[Date].md`
- `06_outputs/[CompanyName]_Financial_Model_v1.0_[Date].md`

**Input Files Optional:**
- `05_outputs/[CompanyName]_Risk_Analysis_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Funding amount, next steps and milestones
- Team Credentials: Hiring plan (roles, timing, costs), team gaps
- Financial Model: Monthly burn rate, cost breakdown by category, quarterly spending, hiring costs, runway targets
- Risk Analysis: Contingency planning needs, financial risks

**Output File:** `07_outputs/[CompanyName]_Use_of_Funds_v1.0_[Date].md`
**Used By:** Technical Requirements (09), Roadmap (10)
**Execution Time:** 2-3 hours

**Critical:** Every dollar must tie to specific outcomes, include 15-20% contingency reserve
---
```

### For 08_Customer_Journey_Mapping_Prompt.md

```markdown
---
## 🔄 WORKFLOW CONTEXT
**Position:** Stage 4 - Implementation Planning (Execute after Stage 3)
**Dependencies:** Vision Brief (01), Market Analysis (02), Competitive Analysis (04)

**Input Files Required:**
- `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `04_outputs/[CompanyName]_Competitive_Analysis_v1.0_[Date].md`

**Input Files Optional:**
- `06_outputs/[CompanyName]_Financial_Model_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Core concept, value proposition, target customers, solution description
- Market Analysis: Customer personas (detailed), pain points, segments, buying behavior
- Competitive Analysis: Competitive touchpoints, customer experience gaps
- Financial Model (optional): Conversion targets, CAC, retention targets

**Output File:** `08_outputs/[CompanyName]_Customer_Journey_v1.0_[Date].md`
**Used By:** Roadmap (10)
**Execution Time:** 2-3 hours
---
```

### For 09_Technical_Requirements_Prompt.md

```markdown
---
## 🔄 WORKFLOW CONTEXT
**Position:** Stage 4 - Implementation Planning (Execute after Stage 3)
**Dependencies:** Vision Brief (01), Market Analysis (02), Financial Model (06), Use of Funds (07)

**Input Files Required:**
- `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `06_outputs/[CompanyName]_Financial_Model_v1.0_[Date].md`
- `07_outputs/[CompanyName]_Use_of_Funds_v1.0_[Date].md`

**Input Files Optional:**
- `05_outputs/[CompanyName]_Risk_Analysis_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Core concept, product features, solution description, target users
- Market Analysis: User scale requirements, geographic requirements, performance expectations
- Financial Model: Technology budget, infrastructure costs, development team costs
- Use of Funds: Product development budget, infrastructure budget, timeline
- Risk Analysis (optional): Technical risks, technology feasibility, scalability risks

**Output File:** `09_outputs/[CompanyName]_Technical_Requirements_v1.0_[Date].md`
**Used By:** Roadmap (10)
**Execution Time:** 3-4 hours
---
```

### For 10_Roadmap_Prompt.md

```markdown
---
## 🔄 WORKFLOW CONTEXT
**Position:** Stage 5 - Strategic Roadmap (Execute Last - Requires ALL Previous)
**Dependencies:** ALL previous outputs (01-09)

**Input Files Required (ALL 9 DOCUMENTS):**
- `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `03_outputs/[CompanyName]_Team_Credentials_v1.0_[Date].md`
- `04_outputs/[CompanyName]_Competitive_Analysis_v1.0_[Date].md`
- `05_outputs/[CompanyName]_Risk_Analysis_v1.0_[Date].md`
- `06_outputs/[CompanyName]_Financial_Model_v1.0_[Date].md`
- `07_outputs/[CompanyName]_Use_of_Funds_v1.0_[Date].md`
- `08_outputs/[CompanyName]_Customer_Journey_v1.0_[Date].md`
- `09_outputs/[CompanyName]_Technical_Requirements_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Product vision, MVP scope, long-term vision
- Market Analysis: Market readiness, launch timing, competitive pressures
- Team Credentials: Team capacity, hiring plan, development capabilities
- Competitive Analysis: Competitive pressures, feature priorities
- Risk Analysis: Execution risks, technical risks, mitigation strategies
- Financial Model: Budget by phase, spending timeline, runway
- Use of Funds: Quarterly spending plan, major milestones, success criteria
- Customer Journey: Features by journey stage, time-to-value targets
- Technical Requirements: Development phases, technical milestones, dependencies

**Output File:** `10_outputs/[CompanyName]_Roadmap_v1.0_[Date].md`
**Used By:** Final investor package (no further documents)
**Execution Time:** 3-4 hours

**Critical:** Integrates all previous work into cohesive execution plan
---
```

## Verification

After updating each prompt, verify:

1. ✅ Header is placed after title, before "## Your Role"
2. ✅ Header is enclosed in `---` markers
3. ✅ Blank line after closing `---`
4. ✅ All required fields present (Position, Dependencies, Input Files, Output File, etc.)
5. ✅ File paths use correct format: `XX_outputs/[CompanyName]_[Type]_v1.0_[Date].md`
6. ✅ Critical requirements are noted where applicable

## Testing

To test after updates:

1. Load a prompt in AI chat
2. Verify AI acknowledges workflow context
3. Check that AI asks for input files correctly
4. Verify AI understands what to extract from inputs
5. Confirm AI saves output with correct filename

## Completion Checklist

- [ ] 01_Vision_Brief_Prompt.md ✅ (Already done)
- [ ] 02_Market_Analysis_Prompt.md
- [ ] 03_Team_Credentials_Prompt.md
- [ ] 04_Competitive_Analysis_Prompt.md
- [ ] 05_Risk_Analysis_Prompt.md
- [ ] 06_Financial_Model_Prompt.md
- [ ] 07_Use_of_Funds_Prompt.md
- [ ] 08_Customer_Journey_Mapping_Prompt.md
- [ ] 09_Technical_Requirements_Prompt.md
- [ ] 10_Roadmap_Prompt.md

## Notes

- Maintain consistency in formatting across all prompts
- Keep critical requirements visible in workflow headers
- Ensure file naming convention is consistent
- Preserve all existing prompt content - only ADD the header, don't remove anything
