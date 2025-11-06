# Financial Model Row Reference Audit

## Purpose
This document maps the exact row numbers for key metrics in each product sheet to ensure the Summary sheet formulas reference the correct cells.

---

## Ninja Notes B2C

### Monthly Projections Section
- **Start Row**: 37 (Section header: "MONTHLY PROJECTIONS - 2026")
- **Column Header Row**: 39 (Metric, Jan, Feb, Mar...)
- **Data starts**: Row 40

### Row Mapping (from VBA trace):
```
Row 40: "FREE TIER" header
Row 41: "Monthly Churn %"
Row 42: "Beginning Free Users"
Row 43: "New Free Adds"
Row 44: "Churned Free Users"
Row 45: "Conversions to Paid"
Row 46: "Ending Free Users"
Row 47: (blank)

Row 48: "ENTRY TIER" header
Row 49: "Beginning Entry Users"
Row 50: "New Entry Adds"
Row 51: "Churned Entry Users"
Row 52: "Conversions from Free"
Row 53: "Ending Entry Users"
Row 54: (blank)

Row 55: "PRO TIER" header
Row 56: "Beginning Pro Users"
Row 57: "New Pro Adds"
Row 58: "Churned Pro Users"
Row 59: "Conversions from Free"
Row 60: "Ending Pro Users"
Row 61: (blank)

Row 62: "REVENUE" header
Row 63: "Entry MRR"
Row 64: "Pro MRR"
Row 65: "Total MRR" ⚠️ SUMMARY REFERENCES THIS
Row 66: "Monthly Revenue"
Row 67: (blank)

Row 68: "COGS" header
Row 69: "Total Users (Free+Entry+Pro)"
Row 70: "Infrastructure Cost"
Row 71: "Free Usage Hours"
Row 72: "Entry Usage Hours"
Row 73: "Pro Usage Hours"
Row 74: "Total Usage Hours"
Row 75: "Usage Costs"
Row 76: "Total COGS" ⚠️ SUMMARY REFERENCES THIS
Row 77: (blank)

Row 78: "PROFITABILITY" header
Row 79: "Gross Profit"
Row 80: "Gross Margin %"
Row 81: "Recurring-Only Margin %"
```

### Quarterly Rollups Section
Starts at Row ~84

### KPIs Summary Section
Starts at Row ~97

**Need to trace exact KPI rows for:**
- Starting ARR (Jan 1)
- Ending ARR (Dec 31) ⚠️ **Summary needs this**
- Total Revenue (2026) ⚠️ **Summary needs this**
- Total COGS (2026) ⚠️ **Summary needs this**

---

## Summary Sheet References to Fix

### Currently Referenced (from Generate_Summary_Sheet.vba):

```vba
' B2C - Product Overview
.Range("B" & productStartRow).Formula = "='Ninja Notes B2C'!B" & GetKPIRow("B2C", "Ending ARR")

' B2C - Monthly MRR
For i = 1 To 12
    .Cells(r, i + 1).Formula = "='Ninja Notes B2C'!" & GetMonthColumn(i) & "45"  ' Total MRR row
Next i

' B2C - Monthly COGS
.Cells(r, monthCol).Formula = "='Ninja Notes B2C'!" & GetMonthColumn(i) & "64"
```

### Issues Found:
1. **Row 45 reference for MRR is WRONG** - Should be Row 65 (Total MRR)
2. **Row 64 reference for COGS is WRONG** - Should be Row 76 (Total COGS)
3. **GetKPIRow function returns estimated values** - Need exact rows

---

## Action Items

### Priority 1: Fix Monthly Projection References
- [ ] B2C Total MRR: Change from Row 45 → Row 65
- [ ] B2C Total COGS: Change from Row 64 → Row 76
- [ ] Enterprise MRR: Verify Row 42
- [ ] Enterprise Total COGS: Verify Row 49
- [ ] Omni Sales Monthly Recurring Revenue: Verify Row 49
- [ ] Omni Sales Total COGS: Verify Row 72
- [ ] Omni Service Monthly Recurring Revenue: Verify Row 49
- [ ] Omni Service Total COGS: Verify Row 72
- [ ] Omni Concierge Total Vendor MRR: Verify Row 64
- [ ] Omni Concierge Total COGS: Verify Row 90
- [ ] Sona Hardware Total Revenue: Verify Row 39
- [ ] Sona Hardware Total COGS: Verify Row 44

### Priority 2: Fix KPI Summary References
Need to count exact rows in KPI Summary section for each product:
- [ ] B2C Ending ARR row
- [ ] B2C Total Revenue (2026) row
- [ ] B2C Total COGS (2026) row
- [ ] Enterprise Ending ARR row
- [ ] Enterprise Total Revenue (2026) row
- [ ] Enterprise Total COGS (2026) row
- [ ] All other products...

---

## Methodology for Audit

1. Open each product sheet VBA file
2. Trace through the code line-by-line counting `r = r + 1` increments
3. Document where startRow begins
4. Map each critical metric's row number
5. Update Summary sheet formulas accordingly

---

## Status
🔴 **CRITICAL ERRORS FOUND** - Summary sheet formulas will not work correctly with current row references.

**Next Step**: Create corrected version of Generate_Summary_Sheet.vba with accurate row numbers.
