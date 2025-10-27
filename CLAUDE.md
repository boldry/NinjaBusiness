# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the NinjaBusiness (Ninja Concepts AI Venture Studio) repository containing frameworks, templates, and tools for evaluating and developing product ideas through a structured, phased approach. The repository focuses on venture evaluation, business planning, investor collateral generation, and sales discovery processes.

## Directory Structure

```
NinjaBusiness/
├── frameworks/                    # Core methodologies and evaluation frameworks
│   └── Investment_Framework.md   # Comprehensive investment evaluation (consolidated)
│
├── templates/                     # All reusable templates organized by phase
│   ├── phase_1/
│   │   └── Vision_Brief_Template.md
│   ├── phase_2/
│   │   ├── BRD_Template.md
│   │   └── Financial_Model_Template.md
│   └── investor_collateral/       # 10 investor presentation templates
│       ├── 01_Vision_Brief_Summary_Template.md
│       ├── 02_Market_Analysis_Template.md
│       ├── ... (03-10)
│       └── examples/              # Real-world examples (e.g., Momeaze)
│           └── Momeaze_Vision_Brief_Summary.md
│
├── tools/                         # Scripts and automation
│   ├── generate_asana_import.py   # Generates Asana project import JSON
│   └── Project_Evaluation_Checklist.txt  # Source checklist data
│
├── venture_fund/                  # Internal venture fund materials
│   ├── pitch.md                   # Fund pitch deck
│   └── plan.md                    # Business plan
│
└── CLAUDE.md                      # This file
```

## Core Framework: 5-Phase Product Development

The repository implements a comprehensive **5-Phase Product Evaluation & Development Framework**:

1. **Phase 1: Idea Evaluation** (1-2 weeks) - Initial assessment, Vision Brief, TAM/SAM/SOM analysis, go/no-go decision
2. **Phase 2: Scope & Design** (4-6 weeks) - BRD/PRD, technical architecture, financial modeling, GTM strategy
3. **Phase 3: Development** (8-16 weeks) - MVP development, testing, QA
4. **Phase 4: Deployment** (2-4 weeks) - Launch strategy, marketing, sales enablement
5. **Phase 5: Continuous Service** (Ongoing) - Customer support, optimization, market expansion

## Key Files and Their Purpose

### Frameworks Directory (`frameworks/`)

**`Investment_Framework.md`** - Comprehensive investment evaluation framework (consolidated from 3 previous documents)
- Part 1: Core Investment Analysis Collateral (10 categories)
- Part 2: Investor-Specific Requirements (High & Medium Priority)
- Part 3: Implementation Framework (5 phases with timelines)
- Includes Quality Assurance Checklist and Key Investment Criteria
- Covers: Strategic Foundation, Business Planning, GTM, Product Development, Operations, Risk Management, KPIs, Data Strategy, IP Strategy, Exit Strategy

### Templates Directory (`templates/`)

#### Phase 1 Templates (`templates/phase_1/`)
**`Vision_Brief_Template.md`** - 1-page vision brief for initial evaluation
- Problem statement, solution, market opportunity
- Competitive landscape, business model
- Team requirements, financial projections
- Risks and success criteria

#### Phase 2 Templates (`templates/phase_2/`)
**`BRD_Template.md`** - Business Requirements Document with 16-section framework:
- **Executive Perspective**: Vision, Problem Statement, Objectives, Business Model
- **Project Management**: Scope, Stakeholders, Requirements, Dependencies, Implementation
- **Operational Perspective**: User Personas, Journey Mapping, Operational Requirements
- **Multi-Perspective**: Risks, Open Questions, Appendices

**`Financial_Model_Template.md`** - Financial projections and analysis
- Revenue projections, cost structure, cash flow
- Unit economics, break-even analysis

#### Investor Collateral Templates (`templates/investor_collateral/`)
10 comprehensive templates for complete investment packages:
1. **Vision Brief Summary** - Executive overview for investors
2. **Market Analysis** - TAM/SAM/SOM, trends, segmentation
3. **Team Credentials** - Bios, experience, advisory board, network
4. **Competitive Analysis** - Landscape, positioning, differentiation
5. **Risk Analysis** - Market, technology, financial, operational risks
6. **Financial Model** - Detailed projections, unit economics, ROI
7. **Use of Funds** - Investment allocation, spending plan
8. **Customer Journey Mapping** - End-to-end experience, touchpoints
9. **Technical Requirements** - Architecture, tech stack, scalability
10. **Roadmap** - Development timeline, milestones, releases

#### Examples Subdirectory (`templates/investor_collateral/examples/`)
Real-world examples of completed templates (e.g., Momeaze Vision Brief)

### Tools Directory (`tools/`)

**`generate_asana_import.py`** - Python script to generate Asana project management imports
- Creates hierarchical task structure (Project → Phase → Section → Task)
- Includes custom fields for Priority and Phase tracking
- Generates `Project_Evaluation_Checklist_Complete_Asana_Import.json`
- Pre-built Phase 1 checklist with 86 detailed items
- Framework structure for Phases 2-5

**`Project_Evaluation_Checklist.txt`** - Source checklist data covering all 5 phases

### Venture Fund Directory (`venture_fund/`)

Internal materials for the Ninja Concepts venture fund:
- **`pitch.md`** - Investor pitch deck for the venture fund
- **`plan.md`** - Detailed business plan

## Commands

### Generate Asana Import Files
```bash
cd tools
python generate_asana_import.py
```

This generates a comprehensive Asana import JSON with:
- Pre-Evaluation Setup tasks
- Phase 1 detailed checklist (86 items: market research, business case, strategic alignment, risk assessment)
- Phases 2-5 framework structure
- Custom fields for Priority (High/Medium/Low) and Phase (1-5)

## Key Concepts and Architecture

### Investment Evaluation Stages
The framework recognizes three business maturity levels:
- **Stage 1: Early-Stage Ideas** (Pre-Seed/Seed) - Focus on templates 01-05 (Vision, Market, Team, Competition, Risk)
- **Stage 2: Growth-Stage Companies** (Series A/B) - Add templates 06-08 (Financial Model, Use of Funds, Customer Journey)
- **Stage 3: Mature Companies** (Series C+) - Complete all 10 templates including Technical Requirements and Roadmap

### BRD Framework (16 Sections)
The Business Requirements Document follows a three-perspective approach:

**Executive Perspective** (Sections 1-6):
1. Document Control & Project Basics
2. Customer Documentation
3. Business Vision & Mission
4. Business Problem Statement
5. Business Objectives & Success Criteria
6. Business Model & ROI

**Project Management Perspective** (Sections 7-11):
7. Project Scope & Objectives
8. Stakeholder Analysis & Management
9. Requirements & Features
10. Project Dependencies & Constraints
11. Implementation Plan & MVP

**Operational Perspective** (Sections 12-13):
12. User Personas & Journey Mapping
13. Operational Requirements

**Multi-Perspective** (Sections 14-16):
14. Risks & Mitigations
15. Open Questions & Decisions
16. Appendices & Supporting Materials

### Success Criteria by Phase
Each phase has specific success gates:
- **Phase 1**: Vision brief approved, market validated ($100M+ TAM), budget approved, team assigned
- **Phase 2**: BRD/PRD approved, technical feasibility confirmed, financial model approved
- **Phase 3**: MVP completed, quality standards met, UAT achieved
- **Phase 4**: Successful launch, initial customers acquired, support operational
- **Phase 5**: Customer satisfaction targets met, revenue growth achieved, ROI targets met

## Workflow Patterns

### Typical Product Evaluation Flow
1. Receive new product idea
2. Create Phase 1 Vision Brief using `templates/phase_1/Vision_Brief_Template.md`
3. Conduct market research (TAM/SAM/SOM) - must meet $100M minimum TAM
4. Complete competitive analysis using `templates/investor_collateral/04_Competitive_Analysis_Template.md`
5. Generate initial financial model using `templates/phase_2/Financial_Model_Template.md`
6. Hold Phase Gate Review for go/no-go decision
7. If approved, create Phase 2 BRD using `templates/phase_2/BRD_Template.md`
8. Progress through remaining phases

### Investor Collateral Generation
Follow the sequence in `frameworks/Investment_Framework.md`:

**Early-Stage (Pre-Seed/Seed):**
- Use templates 01-05: Vision Brief, Market Analysis, Team Credentials, Competitive Analysis, Risk Analysis
- Focus on market validation and team capability

**Growth-Stage (Series A/B):**
- Add templates 06-08: Financial Model, Use of Funds, Customer Journey Mapping
- Emphasize traction, unit economics, and GTM validation

**Mature (Series C+):**
- Complete all 10 templates including Technical Requirements (09) and Roadmap (10)
- Comprehensive due diligence with scalability proof and exit strategy

### Asana Project Management Integration
1. Run `python tools/generate_asana_import.py`
2. Import generated JSON via Asana: Project Settings → Import/Export → Import JSON
3. Track progress through hierarchical task structure:
   - Custom fields for Priority (High/Medium/Low) and Phase (1-5)
   - 4-level hierarchy: Project → Phase → Section → Task
   - Phase 1 includes 86 pre-built detailed checklist items

## File Naming Conventions

- **Phase templates**: `[Name]_Template.md` in `templates/phase_N/`
- **Investor collateral**: `[NN]_[Name]_Template.md` (numbered 01-10) in `templates/investor_collateral/`
- **Frameworks**: `[Name]_Framework.md` in `frameworks/`
- **Examples**: Stored in `templates/investor_collateral/examples/`
- **Generated files**: Include version/date information in content

## Key Decision Criteria

### Investment Criteria (Must-Have)
1. **Market Opportunity**: Minimum $100M TAM
2. **Competitive Advantage**: Unique technology or sustainable moat
3. **Team Capability**: Right expertise, experience, and network
4. **Financial Viability**: Clear path to profitability with positive unit economics
5. **Strategic Fit**: Aligns with company/investor vision

### Valuation Methodology
- **Market Approach**: Comparable company analysis
- **Income Approach**: DCF based on projected cash flows
- **Asset Approach**: Technology and IP valuation
- **Risk Adjustment**: Market, technology, execution risks

### Return Expectations
- **Early Stage**: 10-20x return potential, 25-40% IRR target
- **Growth Stage**: 5-10x return potential
- **Late Stage**: 2-5x return potential

## Tools and Data Sources

### Market Research
- Gartner, IDC, industry reports for TAM/SAM/SOM validation
- Gap Intelligence for competitive analysis
- Customer interviews and surveys for validation
- Market validation evidence required (testimonials, LOIs, pilot results)

### Financial Modeling
- Excel-based templates in `templates/phase_2/Financial_Model_Template.md`
- Unit economics: CAC, LTV, LTV/CAC ratio (target 3:1), gross margin
- 3-year projections standard
- Quarterly spending plans with 15-20% contingency reserves

### Project Management
- Asana for task tracking via generated JSON imports
- Jira or similar for development phases
- Hierarchical structure with custom priority and phase fields

## Special Focus Areas

### AI-Specific Considerations
- **Technology Differentiation**: Agentic vs. Generative AI positioning
- **AI Ethics & Compliance**: Bias mitigation, algorithmic accountability
- **Performance Benchmarks**: Quantified AI performance metrics

### Data Monetization
- "Hundreds of millions" opportunity analysis
- Data licensing, Analytics-as-a-Service
- Privacy-compliant monetization strategies
- Competitive advantage from proprietary data assets

### Administrative Burden Reduction Theme
- Time savings and cost reduction metrics
- Process standardization and repeatability
- SDLC process validation
- Customer satisfaction improvements

## Python Scripts

### generate_asana_import.py
**Functions:**
- `generate_task_id(prefix, number)` - Creates unique task IDs
- `create_task(name, notes, parent_id, phase, priority)` - Task object builder
- `count_tasks(task)` - Recursive task counter
- `count_phase_1_items(phase_1)` - Phase 1 item counter

**Output:** `Project_Evaluation_Checklist_Complete_Asana_Import.json`

**Usage:** Run from tools directory with `python generate_asana_import.py`
