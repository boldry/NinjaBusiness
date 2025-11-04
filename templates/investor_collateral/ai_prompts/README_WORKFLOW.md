# Sequential Workflow for Investor Collateral Generation

## Overview

This directory contains 10 AI prompts that generate comprehensive investor collateral documents in a sequential, dependency-aware workflow. Each prompt builds on previous outputs to create a complete investment package.

## ⚡ Quick Start - Two Ways to Execute

### 🤖 Option 1: AUTOMATED with Orchestrator (Recommended)

**Easiest way!** Claude guides you through everything automatically.

1. **Load the Orchestrator:**
   - Open [00_ORCHESTRATOR_PROMPT.md](00_ORCHESTRATOR_PROMPT.md)
   - Copy entire contents
   - Paste into Claude

2. **Start the workflow:**
   - Type: `start`
   - Answer Claude's questions
   - Review outputs at checkpoints
   - Claude handles all dependencies, file tracking, and validation

3. **Get complete package:**
   - ~25-35 hours over 10-15 days
   - Built-in review points
   - Pause/resume anytime
   - Quality validation included

📖 **Full Guide:** [ORCHESTRATOR_QUICK_START.md](ORCHESTRATOR_QUICK_START.md)

**Benefits:**
- ✅ No manual tracking needed
- ✅ Automatic dependency management
- ✅ Built-in quality checks
- ✅ Save and resume capability
- ✅ Error prevention
- ✅ Progress tracking

---

### 📝 Option 2: MANUAL Execution

**More control, more work.** You manage everything yourself.

#### Prerequisites
1. Create project directory structure
2. Gather source documents
3. Have AI chat interface ready (Claude, ChatGPT, etc.)

#### Execution Steps

1. **Start with 01_Vision_Brief_Prompt.md** - Foundation document
2. **Execute 02-05 (Research)** - Can run in parallel after #1
3. **Execute 06-07 (Financial)** - Must run sequentially after #1-5
4. **Execute 08-09 (Implementation)** - Can run in parallel after #1-7
5. **Execute 10_Roadmap** - Must run last, requires ALL previous outputs

#### Expected Timeline
- **Sequential:** 10-15 days (~25-35 hours)
- **Parallel (within tiers):** 7-10 days (~25-35 hours)

📖 **Full Guide:** [WORKFLOW_EXECUTION_GUIDE.md](WORKFLOW_EXECUTION_GUIDE.md)

## Workflow Documents

This directory contains:

### Orchestrator (Automated Execution)
- **00_ORCHESTRATOR_PROMPT.md** - Master prompt for automated workflow
- **ORCHESTRATOR_QUICK_START.md** - Quick start guide for orchestrator

### Core Documentation
- **EXECUTION_ORDER.md** - Dependency analysis and execution order
- **WORKFLOW_ORCHESTRATION.md** - Technical file inputs/outputs, data flow
- **WORKFLOW_EXECUTION_GUIDE.md** - Step-by-step manual instructions
- **WORKFLOW_COMPLETE.md** - Completion summary and status
- **PROMPT_HEADER_TEMPLATE.md** - Workflow headers reference

### 10 AI Prompts (Execute in Order)
1. **01_Vision_Brief_Prompt.md** - Foundation (no dependencies)
2. **02_Market_Analysis_Prompt.md** - Research (requires #1)
3. **03_Team_Credentials_Prompt.md** - Research (requires #1)
4. **04_Competitive_Analysis_Prompt.md** - Research (requires #1)
5. **05_Risk_Analysis_Prompt.md** - Research (requires #1, optionally #2-4)
6. **06_Financial_Model_Prompt.md** - Financial (requires #1-5)
7. **07_Use_of_Funds_Prompt.md** - Financial (requires #1,3,6)
8. **08_Customer_Journey_Mapping_Prompt.md** - Implementation (requires #1,2,4,6)
9. **09_Technical_Requirements_Prompt.md** - Implementation (requires #1,2,6,7)
10. **10_Roadmap_Prompt.md** - Strategy (requires ALL #1-9)

## File Naming Convention

All outputs follow this pattern:
```
[CompanyName]_[DocumentType]_v[Version]_[Date].md
```

Example: `Acme_Vision_Brief_v1.0_2025-01-04.md`

## Directory Structure

Create this structure before starting:

```
YourCompany_Investor_Collateral/
├── source_documents/          # Your input files
├── 01_outputs/               # Vision Brief output
├── 02_outputs/               # Market Analysis output
├── 03_outputs/               # Team Credentials output
├── 04_outputs/               # Competitive Analysis output
├── 05_outputs/               # Risk Analysis output
├── 06_outputs/               # Financial Model output
├── 07_outputs/               # Use of Funds output
├── 08_outputs/               # Customer Journey output
├── 09_outputs/               # Technical Requirements output
└── 10_outputs/               # Roadmap output
```

## Execution Workflow Diagram

```
START
  │
  └─► 01_Vision_Brief (Foundation)
        │
        └─► 02_Market_Analysis    ┐
        └─► 03_Team_Credentials   ├─ Can run in parallel
        └─► 04_Competitive        │
        └─► 05_Risk_Analysis      ┘
              │
              └─► 06_Financial_Model (Sequential)
                    │
                    └─► 07_Use_of_Funds (Sequential)
                          │
                          └─► 08_Customer_Journey  ┐
                          └─► 09_Technical_Req     ┘ Can run in parallel
                                │
                                └─► 10_Roadmap (Final)
                                      │
                                      └─► COMPLETE
```

## File Dependencies Matrix

| Prompt # | Requires Files | Produces | Used By |
|----------|---------------|----------|---------|
| 01 | None | Vision_Brief | 02,03,04,05,06,07,08,09,10 |
| 02 | 01 | Market_Analysis | 06,08,09,10 |
| 03 | 01 | Team_Credentials | 06,07,10 |
| 04 | 01 | Competitive_Analysis | 06,08,10 |
| 05 | 01 (opt: 02,03,04) | Risk_Analysis | 06,07,09,10 |
| 06 | 01,02,03,04,05 | Financial_Model | 07,08,09,10 |
| 07 | 01,03,06 (opt: 05) | Use_of_Funds | 09,10 |
| 08 | 01,02,04 (opt: 06) | Customer_Journey | 10 |
| 09 | 01,02,06,07 (opt: 05) | Technical_Requirements | 10 |
| 10 | ALL (01-09) | Roadmap | Final |

## Key Success Criteria

### Investment Requirements (Must Meet)
- ✅ TAM ≥$100M (Market Analysis)
- ✅ LTV/CAC ≥3:1 (Financial Model)
- ✅ Technical co-founder or strong advisor (Team Credentials)
- ✅ Defensible competitive moat (Competitive Analysis)
- ✅ Clear path to profitability (Financial Model)
- ✅ Realistic timeline and milestones (Roadmap)

### Quality Standards
- ✅ All 10 documents generated
- ✅ Documents are consistent with each other
- ✅ Professional quality suitable for investor review
- ✅ All critical sections completed
- ✅ No unresolved [PLACEHOLDER] tags

## Getting Started

### Step 1: Read the Guides
1. Start with **WORKFLOW_EXECUTION_GUIDE.md** for detailed instructions
2. Reference **WORKFLOW_ORCHESTRATION.md** for technical details
3. Refer to **EXECUTION_ORDER.md** for dependency information

### Step 2: Setup Your Environment
```bash
# Create project directory
mkdir YourCompany_Investor_Collateral
cd YourCompany_Investor_Collateral

# Create output directories
mkdir 01_outputs 02_outputs 03_outputs 04_outputs 05_outputs
mkdir 06_outputs 07_outputs 08_outputs 09_outputs 10_outputs
mkdir source_documents

# Copy your source documents to source_documents/
```

### Step 3: Execute First Prompt
1. Open AI chat session
2. Load `01_Vision_Brief_Prompt.md`
3. Upload source documents
4. Follow AI guidance
5. Save output to `01_outputs/`

### Step 4: Continue Sequential Execution
Follow the workflow, always providing previous outputs as inputs to subsequent prompts.

## Prompt Features

### Each Prompt Includes:

1. **Workflow Context Header**
   - Position in workflow
   - Dependencies clearly stated
   - Required input files
   - What to extract from each input
   - Output file naming
   - Execution time estimate

2. **Role Definition**
   - AI expert role context
   - Task objectives

3. **Information Gathering Process**
   - Document analysis steps
   - Targeted questions by priority
   - Research guidance

4. **Quality Standards**
   - Output requirements
   - Investment criteria
   - Red flags and green flags

5. **Output Format**
   - Structured output sections
   - Professional formatting
   - Validation checklists

## Workflow Benefits

### Sequential Dependencies
- Each document builds on previous work
- Context accumulates through the workflow
- Consistency maintained across all documents

### File Handoffs
- Clear input/output specifications
- Structured data extraction
- No information loss between stages

### Quality Compounding
- Early quality improvements benefit all downstream documents
- Comprehensive validation at each stage
- Professional investor-ready package

## Common Use Cases

### New Venture (Idea Stage)
Execute all 10 prompts sequentially to create complete investor package from scratch.

### Existing Venture (Refining Pitch)
Start with existing documents as inputs to prompt #1, then refine through the workflow.

### Fundraising Preparation
Execute workflow 4-6 weeks before fundraising begins to have complete materials ready.

### Investor Due Diligence
Use completed package to respond to investor questions and due diligence requests.

## Support Resources

### Troubleshooting
See **WORKFLOW_EXECUTION_GUIDE.md** "Troubleshooting" section for common issues.

### Best Practices
- Don't rush - quality over speed
- Review each output carefully before proceeding
- Keep all versions for iteration
- Use AI to fill gaps with industry benchmarks
- Flag assumptions clearly

### Iteration
- You can always go back and regenerate documents
- Updated upstream documents should be re-fed to downstream prompts
- Version numbers track iterations (v1.0, v1.1, v2.0, etc.)

## Time Investment

### By Stage
- Stage 1 (Foundation): 2-3 hours
- Stage 2 (Research): 8-12 hours
- Stage 3 (Financial): 5-8 hours
- Stage 4 (Implementation): 5-7 hours
- Stage 5 (Strategy): 3-4 hours

### Total: 23-34 hours over 10-15 days

This is a significant investment, but produces institutional-quality investor collateral that can be used for:
- Fundraising pitches
- Investor due diligence
- Internal strategic planning
- Team alignment
- Board presentations

## Next Steps After Completion

1. **Internal Review** - Share with co-founders and team
2. **Advisor Review** - Get feedback from mentors and advisors
3. **Investor Preview** - Share with friendly investors for feedback
4. **Iterate** - Refine based on feedback
5. **Go to Market** - Use in active fundraising

## Questions or Issues?

1. Review workflow documentation in this directory
2. Check **WORKFLOW_EXECUTION_GUIDE.md** troubleshooting section
3. Consult with Ninja Concepts team for guidance
4. Iterate and improve - the workflow supports refinement

---

## Document Version History

- **v1.0** (2025-01-04) - Initial workflow creation
  - 10 AI prompts with sequential dependencies
  - File-based handoff system
  - Comprehensive execution guides

---

**Ready to Start?** Open `WORKFLOW_EXECUTION_GUIDE.md` and begin with Stage 1: Foundation (Vision Brief)
