# Complete Row Reference Audit
## All Product Sheets - Exact Row Numbers for Cross-Sheet Formulas

---

## ✅ NINJA NOTES B2C (VERIFIED)

### Monthly Projections Section
- **Start Row**: 37 (Section header)
- **Column Headers**: Row 39 (Metric, Jan, Feb, Mar...)
- **Data Starts**: Row 40

### Critical Monthly Rows:
- **Total MRR**: Row **65** ⚠️ **SUMMARY NEEDS THIS**
- **Monthly Revenue**: Row **66**
- **Total COGS**: Row **76** ⚠️ **SUMMARY NEEDS THIS**

### KPI Summary Section
- **Start**: Row 98 (KPIs SUMMARY - 2026)
- **Ending ARR (Dec 31)**: Row **109** ⚠️ **SUMMARY NEEDS THIS**
- **Total Revenue (2026)**: Row **120** ⚠️ **SUMMARY NEEDS THIS**
- **Total COGS (2026)**: Row **121** ⚠️ **SUMMARY NEEDS THIS**

---

## ✅ NINJA NOTES ENTERPRISE (VERIFIED)

### Monthly Projections Section
- **Start Row**: 32 (Section header)
- **Column Headers**: Row 34 (Metric, Jan, Feb, Mar...)
- **Data Starts**: Row 35

### Critical Monthly Rows:
- **MRR**: Row **43** ⚠️ **SUMMARY NEEDS THIS**
- **Monthly Revenue**: Row **44**
- **Total COGS**: Row **51** ⚠️ **SUMMARY NEEDS THIS**
  - ❌ **BUG FOUND**: Code line 324 sets `totalCogsRow = 52` (WRONG - should be 51)

### KPI Summary Section
- **Start**: Row 71 (KPIs SUMMARY - 2026)
- **Ending ARR (Dec 31)**: Row **84** ⚠️ **SUMMARY NEEDS THIS**
- **Total Revenue (2026)**: Row **99** ⚠️ **SUMMARY NEEDS THIS**
- **Total COGS (2026)**: Row **100** ⚠️ **SUMMARY NEEDS THIS**

---

## ✅ OMNI SALES (VERIFIED - MULTIPLE BUGS FOUND)

### Monthly Projections Section
- **Start Row**: 37 (Section header)
- **Column Headers**: Row 39 (Metric, Jan, Feb, Mar...)
- **Data Starts**: Row 40

### Critical Monthly Rows:
- **MRR**: Row **48** ⚠️ **SUMMARY NEEDS THIS**
- **Monthly Recurring Revenue**: Row **49**
- **Total One-Time Revenue**: Row **55**
  - ❌ **BUG**: Line 340 sets `oneTimeRevRow = 56` (WRONG - should be 55)
- **Monthly Total Revenue**: Row **58**
  - ❌ **BUG**: Line 455 sets `totalRevenueRow = 59` (WRONG - should be 58)
- **Infrastructure Cost**: Row **62**
  - ❌ **BUG**: Line 433 sets `infraCostRow = 61` (WRONG - should be 62)
- **Total COGS**: Row **68** ⚠️ **SUMMARY NEEDS THIS**
  - ❌ **BUG**: Line 457 sets `totalCogsRow = 69` (WRONG - should be 68)

### KPI Summary Section
- **Start**: Row 91 (KPIs SUMMARY - 2026)
- **Ending ARR (Dec 31)**: Row **100** ⚠️ **SUMMARY NEEDS THIS**
- **Total Recurring Revenue (2026)**: Row **110**
- **Total One-Time Revenue (2026)**: Row **111**
- **Total Revenue (2026)**: Row **112** ⚠️ **SUMMARY NEEDS THIS**
- **Total COGS (2026)**: Row **122** ⚠️ **SUMMARY NEEDS THIS**

---

## ✅ OMNI SERVICE (VERIFIED - IDENTICAL TO SALES)

### Monthly Projections Section
- **Start Row**: 37 (Section header)
- **Column Headers**: Row 39 (Metric, Jan, Feb, Mar...)
- **Data Starts**: Row 40
- **Structure**: IDENTICAL to Omni Sales (copy-pasted, only pricing/volume differs)

### Critical Monthly Rows:
- **MRR**: Row **48** ⚠️ **SUMMARY NEEDS THIS**
- **Monthly Recurring Revenue**: Row **49**
- **Total One-Time Revenue**: Row **55**
  - ❌ **BUG**: Line 340 sets `oneTimeRevRow = 56` (WRONG - should be 55)
- **Monthly Total Revenue**: Row **58**
  - ❌ **BUG**: Line 455 sets `totalRevenueRow = 59` (WRONG - should be 58)
- **Infrastructure Cost**: Row **62**
  - ❌ **BUG**: Line 433 sets `infraCostRow = 61` (WRONG - should be 62)
- **Total COGS**: Row **68** ⚠️ **SUMMARY NEEDS THIS**
  - ❌ **BUG**: Line 457 sets `totalCogsRow = 69` (WRONG - should be 68)

### KPI Summary Section
- **Start**: Row 91 (KPIs SUMMARY - 2026)
- **Ending ARR (Dec 31)**: Row **100** ⚠️ **SUMMARY NEEDS THIS**
- **Total Recurring Revenue (2026)**: Row **110**
- **Total One-Time Revenue (2026)**: Row **111**
- **Total Revenue (2026)**: Row **112** ⚠️ **SUMMARY NEEDS THIS**
- **Total COGS (2026)**: Row **122** ⚠️ **SUMMARY NEEDS THIS**

---

## ✅ OMNI CONCIERGE (VERIFIED)

### Monthly Projections Section
- **Start Row**: 52 (Section header)
- **Column Headers**: Row 54 (Metric, Jan, Feb, Mar...)
- **Data Starts**: Row 55

### Critical Monthly Rows:
- **Total Vendor MRR**: Row **64** ⚠️ **SUMMARY NEEDS THIS**
- **Total COGS**: Row **91** ⚠️ **SUMMARY NEEDS THIS**

### KPI Summary Section
- **Start**: Row 114 (KPIs SUMMARY - 2026)
- **Vendor ARR (Dec 31)**: Row **122** ⚠️ **SUMMARY NEEDS THIS**
- **Total Recurring Revenue (2026)**: Row **131**
- **Total One-Time Revenue (2026)**: Row **132**
- **Total Usage Revenue (2026)**: Row **133**
- **TOTAL REVENUE (2026)**: Row **134** ⚠️ **SUMMARY NEEDS THIS**
- **Total COGS (2026)**: Row **140** ⚠️ **SUMMARY NEEDS THIS**

---

## ✅ SONA HARDWARE (VERIFIED)

### Monthly Projections Section
- **Start Row**: 32 (Section header)
- **Column Headers**: Row 34 (Metric, Jan, Feb, Mar...)
- **Data Starts**: Row 35

### Critical Monthly Rows:
- **Devices Sold**: Row **36**
- **Device Revenue**: Row **39** ⚠️ **SUMMARY NEEDS THIS**
- **Total Revenue**: Row **41** (equals Device Revenue for 2026)
- **Device COGS**: Row **44** ⚠️ **SUMMARY NEEDS THIS** (= Total COGS)

### KPI Summary Section
- **Start**: Row 61 (KPIs SUMMARY - 2026)
- **Total Revenue (2026)**: Row **68** ⚠️ **SUMMARY NEEDS THIS**
- **Total COGS (2026)**: Row **69** ⚠️ **SUMMARY NEEDS THIS**

---

## CURRENT SUMMARY SHEET ERRORS

### From Generate_Summary_Sheet.vba GetKPIRow Function:

```vba
Case "B2C"
    Case "Ending ARR": GetKPIRow = 97  ' ❌ WRONG - Should be 109
    Case "Total Revenue": GetKPIRow = 106 ' ❌ WRONG - Should be 120
    Case "Total COGS": GetKPIRow = 107 ' ❌ WRONG - Should be 121
```

### Monthly Reference Errors in Summary:
```vba
' B2C Total MRR - WRONG
.Cells(r, i + 1).Formula = "='Ninja Notes B2C'!" & GetMonthColumn(i) & "45"
' ❌ Row 45 is "Conversions to Paid" - Should be Row 65

' B2C Total COGS - WRONG
.Cells(r, monthCol).Formula = "='Ninja Notes B2C'!" & GetMonthColumn(i) & "64"
' ❌ Row 64 is "Pro MRR" - Should be Row 76
```

---

## NEXT STEPS

1. ✅ Verify Ninja Notes Enterprise rows
2. ✅ Verify Omni Sales rows
3. ✅ Verify Omni Service rows
4. ✅ Verify Omni Concierge rows
5. ✅ Verify Sona Hardware rows
6. ⏭️ Create corrected Generate_Summary_Sheet.vba
7. ⏭️ Test all cross-sheet formulas

---

## STATUS
- **B2C**: ✅ COMPLETE (Rows 65, 76, 109, 120, 121)
- **Enterprise**: ✅ COMPLETE (Rows 43, 51, 84, 99, 100) - ❌ **1 BUG**
- **Omni Sales**: ✅ COMPLETE (Rows 48, 68, 100, 112, 122) - ❌ **4 BUGS**
- **Omni Service**: ✅ COMPLETE (Rows 48, 68, 100, 112, 122) - ❌ **4 BUGS (same as Sales)**
- **Omni Concierge**: ✅ COMPLETE (Rows 64, 91, 122, 134, 140)
- **Sona Hardware**: ✅ COMPLETE (Rows 39, 44, 68, 69)

**AUDIT COMPLETE** - All 6 products verified. Found **9 total bugs** across products.
