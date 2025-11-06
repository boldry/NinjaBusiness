# Ninja Business 2026 Financial Model Generator

## Overview

This VBA-based tool generates a comprehensive 2026 financial model for all Ninja Business products with editable assumptions, monthly/quarterly projections, and automated KPI calculations.

## Generated Sheets

The model creates **7 sheets**:

1. **Summary** - Consolidated executive dashboard
2. **Ninja Notes B2C** - Self-serve subscription model (Free/Entry/Pro tiers)
3. **Ninja Notes Enterprise** - B2B seat-based licensing
4. **Omni Sales** - Mid-market solution (recurring + one-time + usage revenue)
5. **Omni Service** - Enterprise solution (10x larger than Sales)
6. **Omni Concierge** - Vendor subscriptions + full-show deployments
7. **Sona Hardware** - Hardware device sales

## How to Use

### Step 1: Prepare Excel

1. Open a **new blank Excel workbook**
2. Press `Alt+F11` to open the VBA Editor
3. Click **Insert > Module** to create a new module

### Step 2: Load VBA Code

Copy and paste **ALL** of the following VBA files into the module (in any order):

```
✓ Generate_Complete_Financial_Model.vba (Master script)
✓ Generate_NinjaNotesB2C_Sheet.vba
✓ Generate_NinjaNotesEnterprise_Sheet.vba
✓ Generate_OmniSales_Sheet.vba
✓ Generate_OmniService_Sheet.vba
✓ Generate_OmniConcierge_Sheet.vba
✓ Generate_SonaHardware_Sheet.vba
✓ Generate_Summary_Sheet.vba
```

**Important:** You need to copy the entire contents of each file into the same module.

### Step 3: Run the Generator

1. In the VBA Editor, press `F5` or click **Run > Run Sub/UserForm**
2. Select `Generate_Complete_Financial_Model` from the list
3. Click **Run**
4. Wait for the completion message (typically 5-10 seconds)

### Step 4: Customize Assumptions

All **yellow cells** contain editable assumptions. Modify any assumption to see instant updates across all sheets:

- Pricing models
- User/customer growth targets
- Churn rates
- COGS assumptions
- Usage patterns

## Product Sheet Details

### 1. Ninja Notes B2C

**Features:**
- 3 tiers: Free (40%), Entry (40%), Pro (20%)
- Free-to-paid conversion (5% monthly, configurable)
- Declining churn curve (10% → 6%)
- Infrastructure + usage-based COGS
- Monthly ARR/MRR tracking

**Key Assumptions:**
- Entry tier: $18/mo
- Pro tier: $30/mo
- Starting users: 250
- Quarterly growth targets: Q1: 800, Q2: 1,200, Q3: 1,800, Q4: 2,700

---

### 2. Ninja Notes Enterprise

**Features:**
- B2B seat licensing
- Low churn (0.5% monthly ≈ 6% annual)
- Logo and seat tracking
- LTV calculations

**Key Assumptions:**
- Price: $35/seat/month
- Seats per logo: 400
- New logos: Q1: 2, Q2: 2, Q3: 3, Q4: 3

---

### 3. Omni Sales

**Features:**
- Recurring subscription ($75/user/mo × 50 users = $3,750 MRR)
- One-time revenue (implementation $15K + add-ons $10K)
- Voice/text usage-based COGS
- Recurring-only margin tracking

**Key Assumptions:**
- Users per customer: 50
- New customers: Q1: 4, Q2: 4, Q3: 5, Q4: 6
- Voice COGS: $4/hr (1 hr/wk/user)
- Text COGS: $0.20/hr (5 hrs/wk/user)

---

### 4. Omni Service

**Features:**
- Same structure as Omni Sales, scaled 10x
- 500 users per customer (vs 50)
- Higher implementation fees ($25K vs $15K)

**Key Assumptions:**
- Users per customer: 500
- MRR per customer: $37,500
- New customers: Q1: 0, Q2: 2, Q3: 3, Q4: 4

---

### 5. Omni Concierge

**Features:**
- **Vendor subscriptions**: $250/mo + $125/mo content updates
- **Vendor usage**: Talk-hours @ $9/hr
- **Full-show deployments**: $75K setup + usage per show
- High churn (10% monthly, configurable)
- Talk-hours based COGS ($8/hr total: $4 infra + $4 voice)

**Key Assumptions:**
- New vendors: Q1: 0, Q2: 25, Q3: 40, Q4: 60
- Shows: Q1: 0, Q2: 3, Q3: 4, Q4: 5
- Talk-hours per vendor/month: 35.08
- Talk-hours per show: 1,833

---

### 6. Sona Hardware

**Features:**
- One-time device sales (no recurring revenue)
- Attach rate validation (5% of Enterprise seats)
- Gross margin tracking

**Key Assumptions:**
- ASP: $65/device
- COGS: $30/device
- Margin: 53.8%
- Expected devices: 200 (5% × 4,000 Enterprise seats)

---

### 7. Summary (Consolidated Dashboard)

**Features:**
- Product overview snapshot
- Revenue by type (recurring, one-time, usage, hardware)
- Monthly projections across all products
- Quarterly rollups
- Company-wide KPIs
- Revenue mix analysis

**Automatically aggregates:**
- All recurring revenue (B2C + Enterprise + Sales + Service + Concierge)
- All one-time revenue (Sales + Service + Concierge setup + shows)
- All usage revenue (Sales + Service + Concierge talk-hours)
- Hardware revenue (Sona)
- Total COGS and profitability

## Key Metrics Tracked

### Revenue Metrics
- ARR (Annual Recurring Revenue)
- MRR (Monthly Recurring Revenue)
- Total revenue (recurring + one-time + usage + hardware)
- Revenue mix percentages

### Customer/User Metrics
- Total customers/users by product
- Customer/user growth rates
- Churn rates
- Free-to-paid conversion (B2C)
- Logo counts (Enterprise)

### Financial Metrics
- COGS by category (infrastructure, voice, text, hardware)
- Gross profit
- Gross margin % (blended and recurring-only)
- LTV (Lifetime Value)

### Unit Economics
- ARPU (Average Revenue Per User)
- MRR per customer/logo
- Margin per device
- Cost per talk-hour

## COGS Models

### Ninja Notes (B2C & Enterprise)
- **Infrastructure**: $1,600 per 5,000 users
- **Usage**: $0.55 per hour
- Usage hours: 1 hr/wk (Free), 3 hrs/wk (Entry), 5 hrs/wk (Pro/Enterprise)

### Omni Sales & Service
- **Infrastructure**: $1,600 per 5,000 users
- **Voice**: $4.00 per hour (1 hr/wk per user)
- **Text**: $0.20 per hour (5 hrs/wk per user)

### Omni Concierge
- **Infrastructure**: $4.00 per talk-hour
- **Voice**: $4.00 per talk-hour
- **Total**: $8.00 per talk-hour

### Sona Hardware
- **Landed COGS**: $30 per device

## Troubleshooting

### Error: "Compile error: Sub or Function not defined"
- Ensure ALL 8 .vba files are copied into the same module
- Don't split files across multiple modules

### Formulas showing #REF! errors
- Product sheets must be generated before Summary sheet
- Run the complete generator script (don't run individual sheet generators manually)

### Slow performance
- Normal for first generation (5-10 seconds)
- Subsequent recalculations are instant

### Values not updating
- Check that calculation mode is set to Automatic
- Press `Ctrl+Alt+F9` to force full recalculation

## Saving Your Model

### Save as .xlsm (Recommended)
- Preserves VBA code for regeneration
- File > Save As > Excel Macro-Enabled Workbook (.xlsm)

### Save as .xlsx
- Removes VBA code but keeps formulas
- Can no longer regenerate, but model still works

## Customization Tips

1. **Change quarterly targets**: Edit yellow cells in assumptions section
2. **Adjust pricing**: Modify ASP/pricing assumptions
3. **Update COGS**: Change infrastructure and usage cost assumptions
4. **Modify churn**: Adjust churn rate assumptions (monthly %)
5. **Add/remove quarters**: Currently locked to 2026 (12 months)

## Advanced Usage

### Regenerate Individual Sheets
You can run individual sheet generators if needed:
- `Create_NinjaNotesB2C_Sheet`
- `Create_NinjaNotesEnterprise_Sheet`
- etc.

**Note**: Summary sheet must be regenerated last if you regenerate any product sheet.

### Utility Macros
- `Clear_All_Sheets` - Deletes all sheets except Sheet1 (fresh start)
- `Recalculate_All_Sheets` - Forces full recalculation

## File Structure

```
tools/
├── README_Financial_Model_Generator.md (this file)
├── Generate_Complete_Financial_Model.vba (master script)
├── Generate_NinjaNotesB2C_Sheet.vba
├── Generate_NinjaNotesEnterprise_Sheet.vba
├── Generate_OmniSales_Sheet.vba
├── Generate_OmniService_Sheet.vba
├── Generate_OmniConcierge_Sheet.vba
├── Generate_SonaHardware_Sheet.vba
└── Generate_Summary_Sheet.vba
```

## Support

For issues or questions:
- Review the assumptions in `2026_Product_Assumptions.md`
- Check that all assumptions match your business requirements
- Verify yellow cells contain correct starting values

## Version History

- **v1.0** (2025) - Initial release
  - 6 product sheets + Summary rollup
  - Monthly/quarterly projections
  - Editable assumptions
  - Automated KPI calculations

---

**Generated by**: Claude Code
**Based on**: `2026_Product_Assumptions.md`
**Framework**: Ninja Concepts AI Venture Studio
