# AI Prompts Execution Order & Dependencies

## Overview
This document defines the correct execution order for the 11 investor collateral AI prompts based on their interdependencies.

## Execution Order

### Tier 1: Foundation (Execute First)
**1. Vision Brief** - Must execute first
- No dependencies
- Provides foundation for all other documents
- Establishes: company info, value proposition, business model, market overview, team overview, funding requirements

### Tier 2: Research & Analysis (Execute Second - Parallel Execution Possible)
These documents build on Vision Brief and can run simultaneously:

**2. Market Analysis**
- Dependencies: Vision Brief (target market, initial TAM/SAM/SOM)
- Validates market opportunity with research
- Provides detailed customer analysis

**3. Team Credentials**
- Dependencies: Vision Brief (team overview, roles)
- Expands team details with full backgrounds
- Identifies team gaps and hiring needs

**4. Competitive Analysis**
- Dependencies: Vision Brief (competitive landscape, value proposition)
- Deep competitive intelligence
- Moat assessment and positioning

**5. Risk Analysis**
- Dependencies: Vision Brief (initial risks, business model)
- Can also reference Market, Team, Competitive Analysis if available
- Comprehensive risk assessment across all categories

### Tier 3: Go-to-Market Strategy (Execute Third)
This requires Tier 1 & 2 completion:

**6. Go-to-Market Strategy**
- Dependencies:
  - Vision Brief (value proposition, target customers, business model)
  - Market Analysis (customer segments, market size, buying behavior)
  - Competitive Analysis (competitive positioning, differentiation, pricing context)
  - Team Credentials (optional: sales/marketing capabilities)
  - Risk Analysis (optional: market entry risks)
- Defines customer acquisition channels and CAC
- Establishes sales strategy and process
- Creates pricing strategy aligned with market
- Plans launch approach and timeline
- Critical for financial modeling (informs CAC, sales costs)

### Tier 4: Financial & Planning (Execute Fourth)
These require Tiers 1-3 completion:

**7. Financial Model**
- Dependencies:
  - Vision Brief (revenue model, business model)
  - Market Analysis (TAM/SAM/SOM, customer segments, pricing validation)
  - Team Credentials (salary costs, hiring timeline)
  - Competitive Analysis (pricing strategy, competitive positioning)
  - Risk Analysis (financial risks to model)
  - Go-to-Market Strategy (CAC by channel, sales costs, acquisition strategy)
- Critical for investment decisions
- Provides unit economics and projections
- Uses CAC from go-to-market strategy

**8. Use of Funds**
- Dependencies:
  - Financial Model (burn rate, spending categories, runway)
  - Team Credentials (hiring plans with costs)
  - Vision Brief (total funding amount)
  - Risk Analysis (contingency planning)
  - Go-to-Market Strategy (marketing/sales budget allocation)
- Shows how capital will be deployed
- Milestone-based spending plan
- Allocates budget to go-to-market activities

### Tier 5: Implementation Planning (Execute Fifth - Parallel Execution Possible)
These require Tiers 1-4:

**9. Customer Journey Mapping**
- Dependencies:
  - Vision Brief (value proposition, target customers)
  - Market Analysis (customer personas, segments, pain points)
  - Competitive Analysis (competitive touchpoints, differentiation)
  - Financial Model (conversion metrics, retention targets)
  - Go-to-Market Strategy (acquisition channels, customer touchpoints)
- Maps end-to-end customer experience
- Identifies optimization opportunities
- Aligns with go-to-market acquisition strategy

**10. Technical Requirements**
- Dependencies:
  - Vision Brief (product features, core functionality)
  - Financial Model (technology budget)
  - Use of Funds (development budget allocation)
  - Market Analysis (scale requirements, user volume)
  - Risk Analysis (technical risks)
- Defines architecture and tech stack
- Implementation approach

### Tier 6: Strategic Roadmap (Execute Last)
**11. Development Roadmap**
- Dependencies: ALL PREVIOUS DOCUMENTS
  - Vision Brief (product vision, MVP scope)
  - Market Analysis (launch timing, market readiness)
  - Team Credentials (team capacity, hiring plan)
  - Competitive Analysis (competitive pressures)
  - Risk Analysis (execution risks, mitigation)
  - Go-to-Market Strategy (launch plan, acquisition timeline)
  - Financial Model (budget by phase, runway)
  - Use of Funds (quarterly spending plan, milestones)
  - Customer Journey (features by journey stage)
  - Technical Requirements (development phases, technical milestones)
- Integrates all previous information
- Creates phased execution plan with milestones
- Incorporates go-to-market launch timeline

## Execution Strategy

### Sequential Execution (Recommended for Thoroughness)
Execute in order 1→11, waiting for each document to be complete before starting the next. This ensures maximum information flow and consistency.

**Timeline: ~12-18 days**
- Day 1-2: Vision Brief
- Day 3-6: Market Analysis, Team Credentials, Competitive Analysis, Risk Analysis (parallel)
- Day 7-8: Go-to-Market Strategy
- Day 9-11: Financial Model, Use of Funds (sequential)
- Day 12-14: Customer Journey, Technical Requirements (parallel)
- Day 15-18: Development Roadmap

### Parallel Execution (Faster but Requires Coordination)
Execute tiers in parallel where possible:

**Timeline: ~8-12 days**
- Day 1-2: Vision Brief (Tier 1)
- Day 3-5: All Tier 2 documents in parallel (Market, Team, Competitive, Risk)
- Day 6-7: Go-to-Market Strategy (Tier 3)
- Day 8-9: Financial Model first, then Use of Funds (Tier 4)
- Day 10-11: Customer Journey and Technical Requirements in parallel (Tier 5)
- Day 12: Development Roadmap (Tier 6)

### Agile/Iterative Execution (For Early-Stage Ideas)
Start with minimum viable documents and iterate:

**Phase 1 (Week 1):**
- Vision Brief (complete)
- Market Analysis (basic validation)
- Team Credentials (founder bios only)
- Risk Analysis (high-level)

**Phase 2 (Week 2):**
- Refine Market Analysis with research
- Complete Team Credentials
- Add Competitive Analysis
- Create Go-to-Market Strategy
- Create Financial Model (basic)

**Phase 3 (Week 3):**
- Refine Financial Model
- Add Use of Funds
- Add Customer Journey
- Add Technical Requirements
- Create Roadmap

## Critical Dependencies Summary

| Document | Depends On | Blocks |
|----------|-----------|--------|
| 01_Vision_Brief | None | Everything |
| 02_Market_Analysis | Vision Brief | Go-to-Market, Financial Model, Roadmap |
| 03_Team_Credentials | Vision Brief | Go-to-Market (optional), Financial Model, Use of Funds, Roadmap |
| 04_Competitive_Analysis | Vision Brief | Go-to-Market, Financial Model, Customer Journey |
| 05_Risk_Analysis | Vision Brief | Go-to-Market (optional), Financial Model, Use of Funds, Roadmap |
| 06_Go_to_Market_Strategy | Vision, Market, Competitive | Financial Model, Use of Funds, Customer Journey, Roadmap |
| 07_Financial_Model | Vision, Market, Team, Competitive, Risk, Go-to-Market | Use of Funds, Roadmap |
| 08_Use_of_Funds | Financial Model, Team, Vision, Go-to-Market | Roadmap |
| 09_Customer_Journey | Vision, Market, Competitive, Financial, Go-to-Market | Roadmap |
| 10_Technical_Requirements | Vision, Financial, Use of Funds, Market | Roadmap |
| 11_Roadmap | ALL PREVIOUS | None |

## Data Flow Diagram (Text)

```
┌─────────────────┐
│  Vision Brief   │ (Start Here)
└────────┬────────┘
         │
    ┌────┴─────┬──────────┬──────────┐
    ▼          ▼          ▼          ▼
┌────────┐ ┌────────┐ ┌──────────┐ ┌──────┐
│ Market │ │  Team  │ │Competitive│ │ Risk │
│Analysis│ │ Creds  │ │ Analysis │ │Analysis│
└───┬────┘ └───┬────┘ └─────┬─────┘ └───┬──┘
    │          │            │            │
    └──────┬───┴────────┬───┴────────────┘
           │            │
       ┌───▼──────────────┐
       │ Go-to-Market     │
       │    Strategy      │
       └──────┬───────────┘
              │
       ┌──────▼──────┐
       │  Financial  │
       │    Model    │
       └──────┬──────┘
              │
         ┌────▼────────┐
         │ Use of Funds│
         └────┬────────┘
              │
    ┌─────────┴─────────┬────────────┐
    ▼                   ▼            │
┌─────────┐      ┌──────────────┐   │
│Customer │      │  Technical   │   │
│ Journey │      │Requirements  │   │
└────┬────┘      └──────┬───────┘   │
     │                  │            │
     └──────────┬───────┴────────────┘
                ▼
         ┌──────────────┐
         │  Development │
         │   Roadmap    │
         └──────────────┘
```

## Numbering Summary

The current numbering (01-11) reflects the correct execution order based on dependencies:

| Number | Document | Tier | Rationale |
|--------|----------|------|-----------|
| 01 | Vision Brief | 1 | Foundation - must run first |
| 02 | Market Analysis | 2 | Research - can run in parallel with 03-05 |
| 03 | Team Credentials | 2 | Research - can run in parallel with 02, 04-05 |
| 04 | Competitive Analysis | 2 | Research - can run in parallel with 02-03, 05 |
| 05 | Risk Analysis | 2 | Research - can run in parallel with 02-04 |
| 06 | Go-to-Market Strategy | 3 | Strategy - requires 01, 02, 04 |
| 07 | Financial Model | 4 | Financial - requires 01-06 |
| 08 | Use of Funds | 4 | Financial - requires 01, 03, 07 |
| 09 | Customer Journey | 5 | Implementation - can run in parallel with 10 |
| 10 | Technical Requirements | 5 | Implementation - can run in parallel with 09 |
| 11 | Roadmap | 6 | Strategy - requires ALL 01-10 |

## Conclusion

The numbering (01-11) correctly reflects the execution order based on dependencies. The prompts can be executed sequentially in their current order, or in parallel within tiers as outlined above.

The key insight is:
- **01 must run first**
- **02-05 can run in parallel** (but after 01)
- **06 must complete before 07** (go-to-market informs financial model)
- **07 must complete before 08** (financial model informs use of funds)
- **09-10 can run in parallel** (but after 01-08)
- **11 must run last** (requires all others)
