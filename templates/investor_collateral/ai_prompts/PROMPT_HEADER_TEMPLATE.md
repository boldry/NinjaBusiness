# Workflow Context Header Template

This template should be added to the beginning of each prompt to make it workflow-aware.

---

## For Prompt 01 - Vision Brief

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 1 - Foundation (Execute First)
**Dependencies:** None - This is the starting point
**Input Files:** User-provided source documents (optional)
**Output File:** `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`
**Used By:** All subsequent prompts (02-10)
**Execution Time:** 2-3 hours
---
```

## For Prompt 02 - Market Analysis

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 2 - Research & Analysis (Execute after Stage 1)
**Dependencies:** Vision Brief (01)
**Input Files Required:**
- `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`

**Input Files Optional:**
- User market research documents
- Industry reports

**What to Extract from Vision Brief:**
- Target market definition
- Initial TAM/SAM/SOM estimates
- Customer segments mentioned
- Market trends mentioned
- Problem statement for market demand research

**Output File:** `[ProjectName]/02_[CompanyName]_Market_Analysis_v1.0_[Date].md`
**Used By:** Financial Model (06), Customer Journey (08), Technical Requirements (09), Roadmap (10)
**Execution Time:** 3-4 hours
**Critical:** TAM must be ≥$100M (Ninja Concepts requirement)
---
```

## For Prompt 03 - Team Credentials

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 2 - Research & Analysis (Execute after Stage 1)
**Dependencies:** Vision Brief (01)
**Input Files Required:**
- `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`

**Input Files Optional:**
- Team resumes
- LinkedIn profiles
- Advisor information

**What to Extract from Vision Brief:**
- Team overview and roles
- Founder names and backgrounds (high-level)
- Team gaps mentioned
- Hiring plans mentioned

**Output File:** `[ProjectName]/03_[CompanyName]_Team_Credentials_v1.0_[Date].md`
**Used By:** Financial Model (06), Use of Funds (07), Roadmap (10)
**Execution Time:** 2-3 hours
**Critical:** Technical co-founder or strong advisor required (deal-breaker if missing)
---
```

## For Prompt 04 - Competitive Analysis

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 2 - Research & Analysis (Execute after Stage 1)
**Dependencies:** Vision Brief (01)
**Input Files Required:**
- `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`

**Input Files Optional:**
- Competitive research documents
- Patent information

**What to Extract from Vision Brief:**
- Competitive landscape overview
- Key competitors mentioned
- Competitive advantages claimed
- Value proposition to defend
- Differentiation points mentioned

**Output File:** `[ProjectName]/04_[CompanyName]_Competitive_Analysis_v1.0_[Date].md`
**Used By:** Financial Model (06), Customer Journey (08), Roadmap (10)
**Execution Time:** 3-4 hours
**Critical:** Competitive moat must be defensible (scores up to 15 points in investment rubric)
---
```

## For Prompt 05 - Risk Analysis

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 2 - Research & Analysis (Execute after Stage 1)
**Dependencies:** Vision Brief (01), optionally Market/Team/Competitive (02-04)
**Input Files Required:**
- `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`

**Input Files Optional (Recommended):**
- `[ProjectName]/02_[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `[ProjectName]/03_[CompanyName]_Team_Credentials_v1.0_[Date].md`
- `[ProjectName]/04_[CompanyName]_Competitive_Analysis_v1.0_[Date].md`

**What to Extract from Vision Brief:**
- Risk assessment section (initial risks)
- Business model risks
- Market risks mentioned
- Team risks implied

**What to Extract from Other Documents (if available):**
- Market Analysis: Market demand risks, timing risks
- Team Credentials: Team gaps, key person risks
- Competitive Analysis: Competitive threats, moat weaknesses

**Output File:** `[ProjectName]/05_[CompanyName]_Risk_Analysis_v1.0_[Date].md`
**Used By:** Financial Model (06), Use of Funds (07), Technical Requirements (09), Roadmap (10)
**Execution Time:** 2-3 hours
**Critical:** Honest risk assessment builds investor trust
---
```

## For Prompt 06 - Go-to-Market Strategy

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 3 - Go-to-Market Strategy (Execute after Stage 2 complete, before Financial Planning)
**Dependencies:** Vision Brief (01), Market Analysis (02), Competitive Analysis (04)

**Input Files Required:**
- `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `[ProjectName]/02_[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `[ProjectName]/04_[CompanyName]_Competitive_Analysis_v1.0_[Date].md`

**Input Files Optional (Recommended):**
- `[ProjectName]/03_[CompanyName]_Team_Credentials_v1.0_[Date].md`
- `[ProjectName]/05_[CompanyName]_Risk_Analysis_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Value proposition, target customers, business model, product positioning, funding stage
- Market Analysis: Customer segments, market size, customer personas, buying behavior, market trends, market readiness
- Competitive Analysis: Competitive positioning, differentiation, market gaps, competitive advantages, pricing context
- Team Credentials (optional): Sales/marketing team capabilities, hiring needs, execution capacity
- Risk Analysis (optional): Market entry risks, competitive risks, execution risks

**Output File:** `[ProjectName]/06_[CompanyName]_Go_to_Market_Strategy_v1.0_[Date].md`
**Used By:** Financial Model (07), Use of Funds (08), Customer Journey (09), Roadmap (11)
**Execution Time:** 3-4 hours
**Critical:** Must define clear customer acquisition channels with realistic CAC estimates, sales strategy must be executable with available resources
---
```

## For Prompt 07 - Financial Model

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 4 - Financial & Planning (Execute after Stage 3 complete)
**Dependencies:** ALL Stage 2 & 3 outputs (01-06)
**Input Files Required (ALL):**
- `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `[ProjectName]/02_[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `[ProjectName]/03_[CompanyName]_Team_Credentials_v1.0_[Date].md`
- `[ProjectName]/04_[CompanyName]_Competitive_Analysis_v1.0_[Date].md`
- `[ProjectName]/05_[CompanyName]_Risk_Analysis_v1.0_[Date].md`
- `[ProjectName]/06_[CompanyName]_Go_to_Market_Strategy_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Business model, revenue streams, pricing strategy, funding amount
- Market Analysis: TAM/SAM/SOM, customer segments, market growth rates
- Team Credentials: Team size, salaries, hiring plan with costs and timing
- Competitive Analysis: Competitive pricing data, market positioning
- Risk Analysis: Financial risks, revenue risks, cost risks
- Go-to-Market Strategy: CAC by channel, sales costs, acquisition strategy

**Output File:** `[ProjectName]/07_[CompanyName]_Financial_Model_v1.0_[Date].md`
**Used By:** Use of Funds (08), Customer Journey (09), Technical Requirements (10), Roadmap (11)
**Execution Time:** 3-5 hours
**Critical:** LTV/CAC must be ≥3:1 (minimum requirement), clear path to profitability required
---
```

## For Prompt 08 - Use of Funds

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 4 - Financial & Planning (Execute after Financial Model)
**Dependencies:** Vision Brief (01), Team Credentials (03), Financial Model (07)
**Input Files Required:**
- `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `[ProjectName]/03_[CompanyName]_Team_Credentials_v1.0_[Date].md`
- `[ProjectName]/07_[CompanyName]_Financial_Model_v1.0_[Date].md`

**Input Files Optional:**
- `[ProjectName]/05_[CompanyName]_Risk_Analysis_v1.0_[Date].md`
- `[ProjectName]/06_[CompanyName]_Go_to_Market_Strategy_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Funding amount, next steps and milestones
- Team Credentials: Hiring plan (roles, timing, costs), team gaps
- Financial Model: Monthly burn rate, cost breakdown by category, quarterly spending, hiring costs, infrastructure costs, runway targets
- Risk Analysis: Contingency planning needs, financial risks
- Go-to-Market Strategy: Marketing/sales budget allocation, acquisition channel costs

**Output File:** `[ProjectName]/08_[CompanyName]_Use_of_Funds_v1.0_[Date].md`
**Used By:** Technical Requirements (10), Roadmap (11)
**Execution Time:** 2-3 hours
**Critical:** Every dollar must tie to specific outcomes, include 15-20% contingency reserve
---
```

## For Prompt 09 - Customer Journey Mapping

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 5 - Implementation Planning (Execute after Stage 4)
**Dependencies:** Vision Brief (01), Market Analysis (02), Competitive Analysis (04), Go-to-Market Strategy (06), Financial Model (07)
**Input Files Required:**
- `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `[ProjectName]/02_[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `[ProjectName]/04_[CompanyName]_Competitive_Analysis_v1.0_[Date].md`
- `[ProjectName]/06_[CompanyName]_Go_to_Market_Strategy_v1.0_[Date].md`
- `[ProjectName]/07_[CompanyName]_Financial_Model_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Core concept, value proposition, target customers, solution description, business model
- Market Analysis: Customer personas (detailed), pain points, segments, buying behavior
- Competitive Analysis: Competitive touchpoints, customer experience gaps, differentiation
- Go-to-Market Strategy: Acquisition channels, customer touchpoints, sales process
- Financial Model: Conversion targets, CAC, retention targets, sales cycle length

**Output File:** `[ProjectName]/09_[CompanyName]_Customer_Journey_v1.0_[Date].md`
**Used By:** Roadmap (11)
**Execution Time:** 2-3 hours
---
```

## For Prompt 10 - Technical Requirements

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 5 - Implementation Planning (Execute after Stage 4)
**Dependencies:** Vision Brief (01), Market Analysis (02), Financial Model (07), Use of Funds (08)
**Input Files Required:**
- `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `[ProjectName]/02_[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `[ProjectName]/07_[CompanyName]_Financial_Model_v1.0_[Date].md`
- `[ProjectName]/08_[CompanyName]_Use_of_Funds_v1.0_[Date].md`

**Input Files Optional:**
- `[ProjectName]/05_[CompanyName]_Risk_Analysis_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Core concept, product features, solution description, target users
- Market Analysis: User scale requirements, geographic requirements, performance expectations
- Financial Model: Technology budget, infrastructure costs, development team costs
- Use of Funds: Product development budget, infrastructure budget, timeline and milestones
- Risk Analysis (optional): Technical risks, technology feasibility, scalability risks

**Output File:** `[ProjectName]/10_[CompanyName]_Technical_Requirements_v1.0_[Date].md`
**Used By:** Roadmap (11)
**Execution Time:** 3-4 hours
---
```

## For Prompt 11 - Development Roadmap

```markdown
---
# 🔄 WORKFLOW CONTEXT
**Position:** Stage 6 - Strategic Roadmap (Execute Last - Requires ALL Previous)
**Dependencies:** ALL previous outputs (01-10)
**Input Files Required (ALL 10 DOCUMENTS):**
- `[ProjectName]/01_[CompanyName]_Vision_Brief_v1.0_[Date].md`
- `[ProjectName]/02_[CompanyName]_Market_Analysis_v1.0_[Date].md`
- `[ProjectName]/03_[CompanyName]_Team_Credentials_v1.0_[Date].md`
- `[ProjectName]/04_[CompanyName]_Competitive_Analysis_v1.0_[Date].md`
- `[ProjectName]/05_[CompanyName]_Risk_Analysis_v1.0_[Date].md`
- `[ProjectName]/06_[CompanyName]_Go_to_Market_Strategy_v1.0_[Date].md`
- `[ProjectName]/07_[CompanyName]_Financial_Model_v1.0_[Date].md`
- `[ProjectName]/08_[CompanyName]_Use_of_Funds_v1.0_[Date].md`
- `[ProjectName]/09_[CompanyName]_Customer_Journey_v1.0_[Date].md`
- `[ProjectName]/10_[CompanyName]_Technical_Requirements_v1.0_[Date].md`

**What to Extract from Each Document:**
- Vision Brief: Product vision, MVP scope, long-term vision, current stage
- Market Analysis: Market readiness, launch timing, market windows, competition timeline
- Team Credentials: Team capacity, hiring plan, team experience, development capabilities
- Competitive Analysis: Competitive pressures, market entry timing, feature priorities
- Risk Analysis: Execution risks, technical risks, timeline risks, mitigation strategies
- Go-to-Market Strategy: Launch plan, acquisition timeline, sales milestones
- Financial Model: Budget by phase, spending timeline, runway, financial constraints
- Use of Funds: Quarterly spending plan, major milestones, resource allocation, success criteria
- Customer Journey: Features by journey stage, onboarding requirements, time-to-value targets
- Technical Requirements: Development phases, technical milestones, implementation timeline, dependencies

**Output File:** `[ProjectName]/11_[CompanyName]_Roadmap_v1.0_[Date].md`
**Used By:** Final investor package (no further documents)
**Execution Time:** 3-4 hours
**Critical:** Integrates all previous work into cohesive execution plan
---
```

## Usage Instructions

1. Copy the appropriate workflow context header
2. Paste it at the very beginning of each prompt file (after the title line)
3. This makes each prompt workflow-aware and helps AI understand the context
4. The header provides:
   - Position in workflow
   - Required input files
   - What to extract from each input
   - Output file naming
   - Dependencies
   - Critical success criteria
   - Time estimates
