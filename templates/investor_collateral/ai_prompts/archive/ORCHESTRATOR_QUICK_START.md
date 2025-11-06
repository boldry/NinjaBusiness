# Orchestrator Quick Start Guide

## What is the Orchestrator?

The Orchestrator is a master prompt that enables Claude (or any AI assistant) to **automatically execute** the entire 10-stage investor collateral workflow with built-in:
- ✅ Dependency management
- ✅ State tracking
- ✅ Review checkpoints
- ✅ Quality validation
- ✅ Pause/resume capability

## Quick Start (3 Easy Steps)

### Step 1: Load the Orchestrator

In a new Claude chat session:

1. Open [00_ORCHESTRATOR_PROMPT.md](00_ORCHESTRATOR_PROMPT.md)
2. Copy the **entire file contents**
3. Paste into Claude
4. Claude will respond: "Ready to orchestrate your investor collateral workflow..."

### Step 2: Start the Workflow

Type: `start`

Claude will:
- Ask for your company name
- Ask what source documents you have
- Begin with Stage 1: Vision Brief

### Step 3: Follow the Guided Process

Claude will:
- Execute each stage sequentially
- Ask you targeted questions
- Generate each document
- Present review checkpoints
- Ask for your approval before proceeding

## How It Works

### The Orchestrator Manages Everything

```
You → Start → Orchestrator → Stage 01 (Vision Brief)
                    ↓
              Review Checkpoint
                    ↓
              You Approve?
                    ↓
              Stage 02-05 (Research)
                    ↓
              Review Checkpoints
                    ↓
              Stage 06-07 (Financial)
                    ↓
              Review Checkpoint
                    ↓
              Stage 08-09 (Implementation)
                    ↓
              Review Checkpoint
                    ↓
              Stage 10 (Roadmap)
                    ↓
              Final Quality Check
                    ↓
              Complete Package ✅
```

### What You Do

1. **Provide information** when asked
2. **Review outputs** at checkpoints
3. **Approve or request revisions**
4. **Save generated documents**

### What Claude Does

1. **Loads stage prompts** (01-10)
2. **Extracts data** from previous outputs
3. **Asks targeted questions**
4. **Conducts research**
5. **Generates documents**
6. **Validates quality**
7. **Tracks progress**
8. **Manages dependencies**

## Review Checkpoints

After EVERY stage, Claude will show:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📋 REVIEW CHECKPOINT: Vision Brief
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Stage Completed: 01 - Vision Brief

📄 Output Generated:
   01_outputs/YourCompany_Vision_Brief_v1.0_2025-01-04.md

📊 Summary:
   - Executive summary: [2 sentences]
   - Market: $500M TAM
   - Team: 3 founders (technical co-founder: Yes)
   - Funding: $2M seed round
   - Key risks: [Top 3]

📝 Document Stats:
   - Sections: 11/11 complete
   - Word Count: ~2,500
   - Validation Tags: 3 items flagged

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Options:
1. ✅ APPROVE - Proceed to next stage
2. 🔄 REVISE - Request changes
3. 💾 SAVE & PAUSE - Save progress
4. 📄 VIEW FULL - Show complete document

Your choice (1-4):
```

**You choose** what to do next!

## Commands You Can Use

| Command | What It Does |
|---------|-------------|
| `start` | Begin new workflow |
| `continue` | Proceed to next stage |
| `status` | Show current progress |
| `pause` | Save and exit (resume later) |
| `resume [company]` | Resume saved session |
| `review [stage]` | Review specific stage output |
| `revise [stage]` | Revise specific stage |
| `help` | Show all commands |
| `export` | Export all files |

## Example Session

### Starting

```
You: start

Claude: Welcome to the Investor Collateral Generation Workflow!

         I'll guide you through creating 10 comprehensive documents...

         Setup:
         1. What is your company name?

You: Acme Inc

Claude: Great! Do you have any existing documents to provide?
        (business plans, pitch decks, financial models, etc.)

You: [Upload pitch deck]

Claude: 📎 Documents received: pitch_deck.pdf

        I'll analyze this and begin Stage 1: Vision Brief.

        [Claude executes Vision Brief prompt]
        [Claude asks questions]
        [You answer]
        [Claude generates Vision Brief]

        [Review checkpoint appears]

You: 1 (Approve)

Claude: ✅ Stage 1 complete! Vision Brief saved.

        Progress: ████░░░░░░░░░░░░░░ 10%

        Ready for Stage 2: Market Analysis?
        Type 'continue' to proceed...

You: continue

Claude: [Executes Market Analysis stage]
        [Process repeats...]
```

### Pausing and Resuming

```
You: pause

Claude: 💾 Saving progress...

        Completed: 5/10 stages
        Last: Risk Analysis
        Next: Financial Model

        Outputs saved:
        - 01_Vision_Brief_v1.0.md
        - 02_Market_Analysis_v1.0.md
        - 03_Team_Credentials_v1.0.md
        - 04_Competitive_Analysis_v1.0.md
        - 05_Risk_Analysis_v1.0.md

        To resume: Start new session, type "resume Acme"

[New session, later]

You: [Load orchestrator prompt]
     resume Acme

Claude: 🔄 Resuming workflow for Acme Inc...

        Progress so far:
        ✅ 01 - Vision Brief
        ✅ 02 - Market Analysis
        ✅ 03 - Team Credentials
        ✅ 04 - Competitive Analysis
        ✅ 05 - Risk Analysis

        Next: 06 - Financial Model

        Ready to continue! Type 'continue' to proceed.
```

## Critical Validation Points

Claude will automatically check critical investment criteria:

### After Market Analysis (Stage 02)
```
⚠️ TAM Validation: $120M ✅ PASS (≥$100M required)
```

### After Team Credentials (Stage 03)
```
⚠️ Technical Co-founder: Yes ✅ PASS (required)
```

### After Financial Model (Stage 06)
```
⚠️ LTV/CAC Ratio: 4.2:1 ✅ PASS (≥3:1 required)
⚠️ Path to Profitability: Month 24 ✅ PASS (≤36 months)
```

If any criteria **FAIL**, Claude will:
- Alert you immediately
- Explain why it's a concern
- Offer options to fix
- Wait for your decision

## Advantages of Using Orchestrator

### vs. Manual Execution

| Manual | With Orchestrator |
|--------|------------------|
| Track dependencies yourself | ✅ Auto-tracked |
| Remember what files to provide | ✅ Auto-requested |
| Manually copy prompts | ✅ Auto-loaded |
| Track progress on paper | ✅ Auto-tracked |
| Remember to validate criteria | ✅ Auto-validated |
| Save/resume manually | ✅ Built-in |

### Key Benefits

1. **Guided Experience** - Claude knows exactly what to do next
2. **No Missed Steps** - Dependencies enforced automatically
3. **Quality Assurance** - Built-in validation at every stage
4. **Save/Resume** - Pause anytime, resume later
5. **Review Points** - Approve each stage before continuing
6. **Error Prevention** - Can't skip required stages
7. **Progress Tracking** - Always know where you are
8. **Consistency** - Standardized outputs every time

## Timeline Expectations

### With Orchestrator

- **Total Time:** 25-35 hours (same as manual)
- **Session Duration:** As long or short as you want
- **Pause/Resume:** Unlimited times
- **Typical Pattern:**
  - Day 1-2: Stage 1
  - Day 3-5: Stages 2-5 (can work on multiple)
  - Day 6-8: Stages 6-7
  - Day 9-10: Stages 8-9
  - Day 11-12: Stage 10
  - Day 13: Final review and package

### Claude's Speed

- **Questions:** Instant
- **Document Generation:** 2-5 minutes per stage
- **Research:** 5-10 minutes when needed
- **Review Checkpoints:** Waiting for you

**Bottleneck:** Your time to provide information and review outputs (not Claude's speed)

## Tips for Best Results

### Prepare in Advance

Before starting:
- ✅ Gather all source documents
- ✅ Have company information ready
- ✅ Know your target market
- ✅ Have team information available
- ✅ Understand your business model

### During Execution

- ✅ Answer questions thoroughly (not one-word answers)
- ✅ Review outputs carefully at checkpoints
- ✅ Ask Claude to revise if something's wrong
- ✅ Save generated documents as you go
- ✅ Take breaks between stages (don't rush)

### At Review Checkpoints

- ✅ Read the summary carefully
- ✅ Check critical criteria
- ✅ Request revisions if needed (not failures)
- ✅ Approve only when satisfied
- ✅ Save the output file

### If You Need Help

Ask Claude:
- "Can you explain this section?"
- "Why is this important for investors?"
- "Can you give me an example?"
- "What should I say for [question]?"
- "Can you research this for me?"

Claude will help!

## Troubleshooting

### Issue: Claude doesn't seem to be following the workflow

**Solution:** Make sure you loaded the **entire** [00_ORCHESTRATOR_PROMPT.md](00_ORCHESTRATOR_PROMPT.md) file. Copy all text from top to bottom.

### Issue: Claude asks for files I don't have

**Solution:** Tell Claude you don't have them yet. Claude can work with what you have and flag items for later validation.

### Issue: I want to skip a stage

**Solution:** Not recommended - each stage builds on previous ones. But if you must, use `skip` command. Note: Downstream stages may have gaps.

### Issue: I made a mistake in an earlier stage

**Solution:** Use `revise [stage number]` command. Claude will help you revise. Note: You may need to update downstream stages that used that data.

### Issue: I need to stop in the middle

**Solution:** Type `pause`. Claude will save your progress and tell you how to resume later.

### Issue: Claude's output has [NEEDS VALIDATION] tags

**Solution:** Normal! These mark assumptions or estimates. You can provide real data later and Claude will update.

## Advanced: Multiple Sessions

You can work on multiple stages in parallel by:

1. Starting separate Claude sessions
2. Each loads the orchestrator
3. Each works on different stages
4. All share the same output files

Example:
- Session 1: Working on Market Analysis (02)
- Session 2: Working on Team Credentials (03)
- Session 3: Working on Competitive Analysis (04)

**Note:** Make sure to track which session is working on what!

## Ready to Start?

### Three Ways to Begin

1. **Fully Guided** (Recommended for first-time users)
   - Load orchestrator
   - Type `start`
   - Follow all prompts

2. **With Existing Documents**
   - Load orchestrator
   - Type `start`
   - Upload your documents when asked
   - Claude extracts data and fills gaps

3. **Resume Previous Session**
   - Load orchestrator
   - Type `resume [company name]`
   - Provide previous output files
   - Continue where you left off

### Next Steps

1. Open Claude Code (or Claude chat)
2. Load [00_ORCHESTRATOR_PROMPT.md](00_ORCHESTRATOR_PROMPT.md)
3. Type `start`
4. Begin your journey to complete investor collateral!

---

## Questions?

Common questions:

**Q: How long does the whole process take?**
A: 25-35 hours spread over 10-15 days, same as manual execution. The orchestrator just makes it easier and prevents errors.

**Q: Can I use this with ChatGPT or other AIs?**
A: Yes! The orchestrator prompt works with any AI that can follow instructions and manage state. May need minor adjustments for different AI models.

**Q: What if I disagree with Claude's output?**
A: Request revisions at any checkpoint. Claude will ask what to change and regenerate. You have full control.

**Q: Can I edit the generated documents myself?**
A: Yes! They're markdown files. Edit them however you want. But if you change significant data, consider updating downstream stages.

**Q: Is this better than doing it manually?**
A: It's the same workflow, same prompts, same quality. The orchestrator just:
- Keeps you on track
- Manages complexity
- Validates quality
- Prevents errors
- Makes it easier

You decide if that's valuable!

---

**Ready? Load the orchestrator and type `start`!** 🚀
