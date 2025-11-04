# Sequential Workflow Orchestration for Investor Collateral Generation

## Overview
This document defines the sequential workflow for generating all 10 investor collateral documents, including file inputs, outputs, and handoffs between prompts.

## File Naming Convention

All output files follow this pattern:
```
[CompanyName]_[DocumentType]_[Version]_[Date].md
```

Example: `Acme_Vision_Brief_v1.0_2025-01-04.md`

### Standard Output Directory Structure
```
project/
├── 01_outputs/
│   └── [CompanyName]_Vision_Brief_v1.0_[Date].md
├── 02_outputs/
│   └── [CompanyName]_Market_Analysis_v1.0_[Date].md
├── 03_outputs/
│   └── [CompanyName]_Team_Credentials_v1.0_[Date].md
├── 04_outputs/
│   └── [CompanyName]_Competitive_Analysis_v1.0_[Date].md
├── 05_outputs/
│   └── [CompanyName]_Risk_Analysis_v1.0_[Date].md
├── 06_outputs/
│   └── [CompanyName]_Financial_Model_v1.0_[Date].md
├── 07_outputs/
│   └── [CompanyName]_Use_of_Funds_v1.0_[Date].md
├── 08_outputs/
│   └── [CompanyName]_Customer_Journey_v1.0_[Date].md
├── 09_outputs/
│   └── [CompanyName]_Technical_Requirements_v1.0_[Date].md
└── 10_outputs/
    └── [CompanyName]_Roadmap_v1.0_[Date].md
```

## Sequential Workflow

### Stage 1: Foundation (Prompt 01)

**Prompt:** `01_Vision_Brief_Prompt.md`

**Input Files:**
- User-provided documents (optional):
  - Business plans
  - Pitch decks
  - Notes
  - Financial models
  - Any existing documentation

**Required Information from User:**
- Company name
- Problem being solved
- Solution description
- Target market
- Business model
- Team information
- Financial projections (if available)
- Funding requirements

**Output File:**
```
01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md
```

**Output Contains:**
- Company Information
- Executive Summary
- Core Concept & Value Proposition
- Business Model
- Market Opportunity (initial estimates)
- Competitive Landscape (overview)
- Team Overview
- Financial Highlights
- Funding Requirements
- Risk Assessment (high-level)
- Next Steps

**Handoff to Next Stage:**
This file becomes the PRIMARY INPUT for all Stage 2 prompts (02-05).

---

### Stage 2: Research & Analysis (Prompts 02-05) - Can Run in Parallel

#### Stage 2A: Market Analysis (Prompt 02)

**Prompt:** `02_Market_Analysis_Prompt.md`

**Input Files:**
- **REQUIRED:** `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
- User-provided market research (optional)
- Industry reports (optional)

**What to Extract from Vision Brief:**
- Target market definition
- Initial TAM/SAM/SOM estimates (to validate)
- Customer segments mentioned
- Market trends mentioned
- Problem statement (to research market demand)

**Additional Information Needed:**
- Industry specifics
- Geographic markets
- Customer interview data (if available)
- Market validation evidence

**Output File:**
```
02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md
```

**Output Contains:**
- Market Definition
- TAM/SAM/SOM Analysis (validated with sources)
- Market Growth Analysis
- Customer Analysis (detailed personas)
- Market Trends
- Market Validation
- Competitive Landscape (market view)
- Market Risks
- Market Opportunity Summary
- Data Sources

---

#### Stage 2B: Team Credentials (Prompt 03)

**Prompt:** `03_Team_Credentials_Prompt.md`

**Input Files:**
- **REQUIRED:** `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
- User-provided documents (optional):
  - Resumes
  - LinkedIn profiles
  - Team bios
  - Advisor information

**What to Extract from Vision Brief:**
- Team overview and roles
- Founder names and backgrounds (high-level)
- Team gaps mentioned
- Hiring plans mentioned

**Additional Information Needed:**
- Detailed founder backgrounds
- Educational credentials
- Work experience details
- Previous startup experience
- Advisory board details
- Equity structure (if comfortable sharing)

**Output File:**
```
03_outputs/[CompanyName]_Team_Credentials_v1.0_[Date].md
```

**Output Contains:**
- Founding Team (detailed profiles)
- Advisory Board
- Team Strengths
- Network and Relationships
- Team Gaps and Hiring Plan
- Previous Experience
- Team Commitment
- Team Risk Assessment
- Team Validation

---

#### Stage 2C: Competitive Analysis (Prompt 04)

**Prompt:** `04_Competitive_Analysis_Prompt.md`

**Input Files:**
- **REQUIRED:** `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
- User-provided competitive research (optional)

**What to Extract from Vision Brief:**
- Competitive landscape overview
- Key competitors mentioned
- Competitive advantages claimed
- Value proposition (to defend)
- Differentiation points mentioned

**Additional Information Needed:**
- Detailed competitor list
- Competitive research conducted
- Pricing information
- Feature comparisons
- Patents or IP

**Output File:**
```
04_outputs/[CompanyName]_Competitive_Analysis_v1.0_[Date].md
```

**Output Contains:**
- Competitive Landscape Overview
- Direct Competitors (3+ detailed profiles)
- Indirect Competitors
- Competitive Positioning
- Competitive Analysis Matrix
- Competitive Threats
- Market Opportunities
- Competitive Strategy
- Competitive Intelligence
- Competitive Risks
- Competitive Outlook

---

#### Stage 2D: Risk Analysis (Prompt 05)

**Prompt:** `05_Risk_Analysis_Prompt.md`

**Input Files:**
- **REQUIRED:** `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
- **RECOMMENDED (if available):**
  - `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
  - `03_outputs/[CompanyName]_Team_Credentials_v1.0_[Date].md`
  - `04_outputs/[CompanyName]_Competitive_Analysis_v1.0_[Date].md`

**What to Extract from Vision Brief:**
- Risk assessment section (initial risks)
- Business model risks
- Market risks mentioned
- Team risks implied

**What to Extract from Other Documents (if available):**
- Market Analysis: Market demand risks, timing risks
- Team Credentials: Team gaps, key person risks
- Competitive Analysis: Competitive threats, moat weaknesses

**Additional Information Needed:**
- Known risks and concerns
- Past challenges or failures
- Biggest uncertainties
- Contingency plans considered

**Output File:**
```
05_outputs/[CompanyName]_Risk_Analysis_v1.0_[Date].md
```

**Output Contains:**
- Risk Assessment Framework
- Market Risks
- Technology Risks
- Financial Risks
- Operational Risks
- Regulatory Risks
- Competitive Risks
- Risk Matrix
- Risk Mitigation Strategies
- Risk Monitoring
- Risk Response Plans
- Risk Communication
- Risk Assessment Summary

---

### Stage 3: Financial & Planning (Prompts 06-07) - Must Run Sequentially

#### Stage 3A: Financial Model (Prompt 06)

**Prompt:** `06_Financial_Model_Prompt.md`

**Input Files:**
- **REQUIRED:**
  - `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
  - `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
  - `03_outputs/[CompanyName]_Team_Credentials_v1.0_[Date].md`
  - `04_outputs/[CompanyName]_Competitive_Analysis_v1.0_[Date].md`
  - `05_outputs/[CompanyName]_Risk_Analysis_v1.0_[Date].md`

**What to Extract from Input Files:**

From **Vision Brief:**
- Business model and revenue streams
- Pricing strategy
- Current revenue (if any)
- Financial highlights
- Funding amount

From **Market Analysis:**
- TAM/SAM/SOM (for market share assumptions)
- Customer segments and pricing sensitivity
- Market growth rates
- Target customer count estimates

From **Team Credentials:**
- Team size and roles
- Salary estimates for current team
- Hiring plan with roles and timing
- Team costs

From **Competitive Analysis:**
- Competitive pricing data
- Market positioning (premium/mid/low)
- Pricing strategy validation

From **Risk Analysis:**
- Financial risks identified
- Revenue risks
- Cost risks
- Contingency needs

**Additional Information Needed:**
- Detailed revenue model
- Current financial metrics (if any)
- Cost structure details
- Growth assumptions
- Unit economics data

**Output File:**
```
06_outputs/[CompanyName]_Financial_Model_v1.0_[Date].md
```

**Output Contains:**
- Financial Model Overview
- Revenue Model
- Cost Structure
- Financial Projections (3-year)
- Key Financial Metrics (CAC, LTV, etc.)
- Cash Flow Analysis
- Funding Requirements
- Sensitivity Analysis
- Financial Assumptions
- Financial Risks
- Financial Model Validation

**Critical for Next Stage:**
- Monthly burn rate
- Spending by category (Product Dev, S&M, Ops)
- Quarterly spending breakdown
- Runway calculations
- Hiring costs by role and timing

---

#### Stage 3B: Use of Funds (Prompt 07)

**Prompt:** `07_Use_of_Funds_Prompt.md`

**Input Files:**
- **REQUIRED:**
  - `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
  - `03_outputs/[CompanyName]_Team_Credentials_v1.0_[Date].md`
  - `06_outputs/[CompanyName]_Financial_Model_v1.0_[Date].md`
- **RECOMMENDED:**
  - `05_outputs/[CompanyName]_Risk_Analysis_v1.0_[Date].md`

**What to Extract from Input Files:**

From **Vision Brief:**
- Funding amount being raised
- Next steps and milestones

From **Team Credentials:**
- Hiring plan (roles, timing, costs)
- Team gaps that need to be filled
- Current team costs

From **Financial Model:**
- Monthly burn rate
- Cost breakdown by category:
  - Product Development costs
  - Sales & Marketing costs
  - Operations costs
  - Working Capital needs
- Quarterly spending plan
- Hiring costs and timing
- Infrastructure costs
- Runway targets

From **Risk Analysis:**
- Contingency planning needs
- Financial risks to mitigate

**Additional Information Needed:**
- Specific allocation priorities
- Milestone definitions
- Success criteria for each phase

**Output File:**
```
07_outputs/[CompanyName]_Use_of_Funds_v1.0_[Date].md
```

**Output Contains:**
- Funding Overview
- Use of Funds Breakdown (by category)
- Quarterly Spending Plan
- Funding Milestones
- ROI Analysis
- Risk Management
- Performance Tracking
- Contingency Planning
- Funding Sources

---

### Stage 4: Implementation Planning (Prompts 08-09) - Can Run in Parallel

#### Stage 4A: Customer Journey Mapping (Prompt 08)

**Prompt:** `08_Customer_Journey_Mapping_Prompt.md`

**Input Files:**
- **REQUIRED:**
  - `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
  - `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
  - `04_outputs/[CompanyName]_Competitive_Analysis_v1.0_[Date].md`
- **RECOMMENDED:**
  - `06_outputs/[CompanyName]_Financial_Model_v1.0_[Date].md`

**What to Extract from Input Files:**

From **Vision Brief:**
- Core concept and value proposition
- Target customers
- Solution description
- Business model (how customers buy)

From **Market Analysis:**
- Customer personas (detailed demographics, psychographics)
- Customer pain points
- Customer segments
- Buying behavior
- Decision-making process

From **Competitive Analysis:**
- Competitive touchpoints
- Customer experience gaps in market
- Differentiation opportunities
- Competitive customer journeys

From **Financial Model (if available):**
- Conversion rate targets
- Customer acquisition metrics (CAC)
- Retention targets
- Time-to-value targets
- Sales cycle length

**Additional Information Needed:**
- Current customer experience (if any)
- Known pain points or friction
- Conversion/retention metrics
- Customer feedback

**Output File:**
```
08_outputs/[CompanyName]_Customer_Journey_v1.0_[Date].md
```

**Output Contains:**
- Customer Journey Overview
- Customer Personas (detailed)
- Journey Stages (7 stages mapped)
- Touchpoint Analysis
- Pain Point Analysis
- Optimization Opportunities
- Journey Analytics

---

#### Stage 4B: Technical Requirements (Prompt 09)

**Prompt:** `09_Technical_Requirements_Prompt.md`

**Input Files:**
- **REQUIRED:**
  - `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
  - `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
  - `06_outputs/[CompanyName]_Financial_Model_v1.0_[Date].md`
  - `07_outputs/[CompanyName]_Use_of_Funds_v1.0_[Date].md`
- **RECOMMENDED:**
  - `05_outputs/[CompanyName]_Risk_Analysis_v1.0_[Date].md`

**What to Extract from Input Files:**

From **Vision Brief:**
- Core concept (product description)
- Solution features
- Target users
- Technical approach mentioned

From **Market Analysis:**
- User scale requirements (# of users)
- Geographic requirements
- Customer technical needs
- Performance expectations

From **Financial Model:**
- Technology budget
- Infrastructure costs
- Development team costs
- Timeline for development

From **Use of Funds:**
- Product development budget allocation
- Infrastructure budget
- Timeline and milestones
- Hiring plan for technical team

From **Risk Analysis (if available):**
- Technical risks identified
- Technology feasibility concerns
- Scalability risks

**Additional Information Needed:**
- Product features (detailed)
- Technical approach preferences
- Technology stack preferences
- Security/compliance requirements
- Integration requirements

**Output File:**
```
09_outputs/[CompanyName]_Technical_Requirements_v1.0_[Date].md
```

**Output Contains:**
- Technical Overview
- Functional Requirements
- Non-Functional Requirements
- Technology Stack
- System Architecture
- Security Requirements
- Performance Requirements
- Integration Requirements
- Development Requirements
- Compliance Requirements
- Technical Risks
- Implementation Timeline
- Resource Requirements

---

### Stage 5: Strategic Roadmap (Prompt 10) - Must Run Last

**Prompt:** `10_Roadmap_Prompt.md`

**Input Files:**
- **REQUIRED: ALL PREVIOUS OUTPUTS**
  - `01_outputs/[CompanyName]_Vision_Brief_v1.0_[Date].md`
  - `02_outputs/[CompanyName]_Market_Analysis_v1.0_[Date].md`
  - `03_outputs/[CompanyName]_Team_Credentials_v1.0_[Date].md`
  - `04_outputs/[CompanyName]_Competitive_Analysis_v1.0_[Date].md`
  - `05_outputs/[CompanyName]_Risk_Analysis_v1.0_[Date].md`
  - `06_outputs/[CompanyName]_Financial_Model_v1.0_[Date].md`
  - `07_outputs/[CompanyName]_Use_of_Funds_v1.0_[Date].md`
  - `08_outputs/[CompanyName]_Customer_Journey_v1.0_[Date].md`
  - `09_outputs/[CompanyName]_Technical_Requirements_v1.0_[Date].md`

**What to Extract from Input Files:**

From **Vision Brief:**
- Product vision
- MVP scope
- Long-term vision
- Current development stage

From **Market Analysis:**
- Market readiness
- Launch timing
- Market windows
- Competition timeline pressures

From **Team Credentials:**
- Team capacity and velocity
- Hiring plan (when new resources arrive)
- Team experience level
- Development capabilities

From **Competitive Analysis:**
- Competitive pressures
- Market entry timing
- Feature priorities based on competition

From **Risk Analysis:**
- Execution risks
- Technical risks
- Timeline risks
- Mitigation strategies

From **Financial Model:**
- Budget by phase
- Spending timeline
- Runway and funding milestones
- Financial constraints

From **Use of Funds:**
- Quarterly spending plan
- Major milestones defined
- Resource allocation by phase
- Success criteria per milestone

From **Customer Journey:**
- Features needed by journey stage
- Customer onboarding requirements
- Feature priorities for customer success
- Time-to-value targets

From **Technical Requirements:**
- Development phases
- Technical milestones
- Implementation timeline
- Technical dependencies
- Infrastructure requirements

**Additional Information Needed:**
- MVP timeline goals
- Feature priorities
- Risk appetite for timeline
- Flexibility on scope

**Output File:**
```
10_outputs/[CompanyName]_Roadmap_v1.0_[Date].md
```

**Output Contains:**
- Roadmap Overview
- Development Phases (4 phases)
- Key Milestones (4-6 major milestones)
- Feature Development Roadmap
- Resource Planning
- Risk Management
- Success Metrics
- Monitoring & Reporting
- Contingency Planning

---

## Workflow Execution Summary

### Sequential Execution Order

```
START
  │
  ├─► [1] Vision Brief (Foundation)
  │     └─► Output: Vision_Brief_v1.0.md
  │
  ├─► [2-5] Research & Analysis (Parallel)
  │     ├─► [2] Market Analysis
  │     │     Input: Vision_Brief_v1.0.md
  │     │     Output: Market_Analysis_v1.0.md
  │     │
  │     ├─► [3] Team Credentials
  │     │     Input: Vision_Brief_v1.0.md
  │     │     Output: Team_Credentials_v1.0.md
  │     │
  │     ├─► [4] Competitive Analysis
  │     │     Input: Vision_Brief_v1.0.md
  │     │     Output: Competitive_Analysis_v1.0.md
  │     │
  │     └─► [5] Risk Analysis
  │           Input: Vision_Brief_v1.0.md + (optionally 2-4)
  │           Output: Risk_Analysis_v1.0.md
  │
  ├─► [6] Financial Model
  │     Input: All outputs from [1-5]
  │     Output: Financial_Model_v1.0.md
  │
  ├─► [7] Use of Funds
  │     Input: Vision_Brief + Team + Financial_Model + Risk
  │     Output: Use_of_Funds_v1.0.md
  │
  ├─► [8-9] Implementation Planning (Parallel)
  │     ├─► [8] Customer Journey
  │     │     Input: Vision + Market + Competitive + Financial
  │     │     Output: Customer_Journey_v1.0.md
  │     │
  │     └─► [9] Technical Requirements
  │           Input: Vision + Market + Financial + Use_of_Funds + Risk
  │           Output: Technical_Requirements_v1.0.md
  │
  └─► [10] Development Roadmap (Final)
        Input: ALL PREVIOUS OUTPUTS [1-9]
        Output: Roadmap_v1.0.md

END - Complete Investor Collateral Package
```

### File Handoff Matrix

| Prompt | Input Files | Output File | Used By |
|--------|-------------|-------------|---------|
| 01 | User docs | Vision_Brief | 02,03,04,05,06,07,08,09,10 |
| 02 | Vision_Brief | Market_Analysis | 06,08,09,10 |
| 03 | Vision_Brief | Team_Credentials | 06,07,10 |
| 04 | Vision_Brief | Competitive_Analysis | 06,08,10 |
| 05 | Vision_Brief (+ opt: 02,03,04) | Risk_Analysis | 06,07,09,10 |
| 06 | 01,02,03,04,05 | Financial_Model | 07,08,09,10 |
| 07 | 01,03,06 (+ opt: 05) | Use_of_Funds | 09,10 |
| 08 | 01,02,04 (+ opt: 06) | Customer_Journey | 10 |
| 09 | 01,02,06,07 (+ opt: 05) | Technical_Requirements | 10 |
| 10 | ALL (01-09) | Roadmap | Final output |

### Execution Timeline (Sequential)

```
Day 1-2:   [1] Vision Brief
Day 3-4:   [2] Market Analysis
Day 3-4:   [3] Team Credentials (parallel)
Day 3-4:   [4] Competitive Analysis (parallel)
Day 4-5:   [5] Risk Analysis
Day 6-7:   [6] Financial Model
Day 8:     [7] Use of Funds
Day 9:     [8] Customer Journey
Day 9:     [9] Technical Requirements (parallel)
Day 10-11: [10] Development Roadmap

Total: 10-11 days
```

## Next Steps

See `WORKFLOW_EXECUTION_GUIDE.md` for:
- Detailed step-by-step instructions
- Quality checkpoints between stages
- Troubleshooting common issues
- Template for tracking progress
