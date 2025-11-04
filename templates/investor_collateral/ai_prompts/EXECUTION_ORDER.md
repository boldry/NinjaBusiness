# AI Prompts Execution Order & Dependencies

## Overview
This document defines the correct execution order for the 10 investor collateral AI prompts based on their interdependencies.

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

### Tier 3: Financial & Planning (Execute Third)
These require Tier 1 & 2 completion:

**6. Financial Model**
- Dependencies:
  - Vision Brief (revenue model, business model)
  - Market Analysis (TAM/SAM/SOM, customer segments, pricing validation)
  - Team Credentials (salary costs, hiring timeline)
  - Competitive Analysis (pricing strategy, competitive positioning)
  - Risk Analysis (financial risks to model)
- Critical for investment decisions
- Provides unit economics and projections

**7. Use of Funds**
- Dependencies:
  - Financial Model (burn rate, spending categories, runway)
  - Team Credentials (hiring plans with costs)
  - Vision Brief (total funding amount)
  - Risk Analysis (contingency planning)
- Shows how capital will be deployed
- Milestone-based spending plan

### Tier 4: Implementation Planning (Execute Fourth - Parallel Execution Possible)
These require Tiers 1-3:

**8. Customer Journey Mapping**
- Dependencies:
  - Vision Brief (value proposition, target customers)
  - Market Analysis (customer personas, segments, pain points)
  - Competitive Analysis (competitive touchpoints, differentiation)
  - Financial Model (conversion metrics, retention targets)
- Maps end-to-end customer experience
- Identifies optimization opportunities

**9. Technical Requirements**
- Dependencies:
  - Vision Brief (product features, core functionality)
  - Financial Model (technology budget)
  - Use of Funds (development budget allocation)
  - Market Analysis (scale requirements, user volume)
  - Risk Analysis (technical risks)
- Defines architecture and tech stack
- Implementation approach

### Tier 5: Strategic Roadmap (Execute Last)
**10. Development Roadmap**
- Dependencies: ALL PREVIOUS DOCUMENTS
  - Vision Brief (product vision, MVP scope)
  - Market Analysis (launch timing, market readiness)
  - Team Credentials (team capacity, hiring plan)
  - Competitive Analysis (competitive pressures)
  - Risk Analysis (execution risks, mitigation)
  - Financial Model (budget by phase, runway)
  - Use of Funds (quarterly spending plan, milestones)
  - Customer Journey (features by journey stage)
  - Technical Requirements (development phases, technical milestones)
- Integrates all previous information
- Creates phased execution plan with milestones

## Execution Strategy

### Sequential Execution (Recommended for Thoroughness)
Execute in order 1→10, waiting for each document to be complete before starting the next. This ensures maximum information flow and consistency.

**Timeline: ~10-15 days**
- Day 1-2: Vision Brief
- Day 3-6: Market Analysis, Team Credentials, Competitive Analysis, Risk Analysis (parallel)
- Day 7-9: Financial Model, Use of Funds (sequential)
- Day 10-12: Customer Journey, Technical Requirements (parallel)
- Day 13-15: Development Roadmap

### Parallel Execution (Faster but Requires Coordination)
Execute tiers in parallel where possible:

**Timeline: ~7-10 days**
- Day 1-2: Vision Brief (Tier 1)
- Day 3-5: All Tier 2 documents in parallel (Market, Team, Competitive, Risk)
- Day 6-7: Financial Model first, then Use of Funds (Tier 3)
- Day 8-9: Customer Journey and Technical Requirements in parallel (Tier 4)
- Day 10: Development Roadmap (Tier 5)

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
| 02_Market_Analysis | Vision Brief | Financial Model, Roadmap |
| 03_Team_Credentials | Vision Brief | Financial Model, Use of Funds, Roadmap |
| 04_Competitive_Analysis | Vision Brief | Financial Model, Customer Journey |
| 05_Risk_Analysis | Vision Brief | Financial Model, Use of Funds, Roadmap |
| 06_Financial_Model | Vision, Market, Team, Competitive, Risk | Use of Funds, Roadmap |
| 07_Use_of_Funds | Financial Model, Team, Vision | Roadmap |
| 08_Customer_Journey | Vision, Market, Competitive, Financial | Roadmap |
| 09_Technical_Requirements | Vision, Financial, Use of Funds, Market | Roadmap |
| 10_Roadmap | ALL PREVIOUS | None |

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
       ┌───▼─────────┐  │
       │  Financial  │◄─┘
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

## Renumbering Recommendation

Based on execution order, the current numbering is **already correct** for the most part, but here's the optimal sequence:

### Current → Recommended Renumbering

| Current | Document | New Number | Rationale |
|---------|----------|------------|-----------|
| 01 | Vision Brief | **01** | ✓ Correct - Foundation |
| 02 | Market Analysis | **02** | ✓ Correct - Tier 2 |
| 03 | Team Credentials | **03** | ✓ Correct - Tier 2 |
| 04 | Competitive Analysis | **04** | ✓ Correct - Tier 2 |
| 05 | Risk Analysis | **05** | ✓ Correct - Tier 2 |
| 06 | Financial Model | **06** | ✓ Correct - Tier 3 |
| 07 | Use of Funds | **07** | ✓ Correct - Tier 3 |
| 08 | Customer Journey | **08** | ✓ Correct - Tier 4 |
| 09 | Technical Requirements | **09** | ✓ Correct - Tier 4 |
| 10 | Roadmap | **10** | ✓ Correct - Tier 5 |

## Conclusion

**No renumbering needed!** The current numbering (01-10) already reflects the correct execution order based on dependencies. The prompts can be executed sequentially in their current order, or in parallel within tiers as outlined above.

The key insight is:
- **01 must run first**
- **02-05 can run in parallel** (but after 01)
- **06 must complete before 07**
- **08-09 can run in parallel** (but after 01-07)
- **10 must run last** (requires all others)
