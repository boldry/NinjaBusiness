Option Explicit

' ============================================================================
' Summary Rollup Sheet Generator - CORRECTED VERSION
' ============================================================================
' This VBA module creates a consolidated Summary sheet that aggregates
' all 6 product sheets into a single executive dashboard
'
' CORRECTED: All row references have been verified and fixed based on
' the complete row audit (ROW_REFERENCE_AUDIT_COMPLETE.md)
' ============================================================================

Sub Create_Summary_Sheet()

    Dim ws As Worksheet
    Dim i As Integer
    Dim monthCol As Integer

    ' Create or clear the sheet - make it the first sheet
    On Error Resume Next
    Set ws = ThisWorkbook.Sheets("Summary")
    If ws Is Nothing Then
        Set ws = ThisWorkbook.Sheets.Add(Before:=ThisWorkbook.Sheets(1))
        ws.Name = "Summary"
    Else
        ws.Cells.Clear
        ws.Move Before:=ThisWorkbook.Sheets(1)
    End If
    On Error GoTo 0

    Application.ScreenUpdating = False

    ' ========================================================================
    ' SECTION 1: HEADER & OVERVIEW
    ' ========================================================================

    With ws
        ' Title
        .Range("A1").Value = "2026 FINANCIAL MODEL - CONSOLIDATED SUMMARY"
        .Range("A1").Font.Bold = True
        .Range("A1").Font.Size = 16
        .Range("A1").Interior.Color = RGB(68, 114, 196)
        .Range("A1").Font.Color = RGB(255, 255, 255)
        .Range("A1:F1").Merge

        .Range("A3").Value = "Executive Dashboard - All Products Consolidated"
        .Range("A3").Font.Size = 11
        .Range("A3").Font.Italic = True

        ' ========================================================================
        ' SECTION 2: PRODUCT OVERVIEW SNAPSHOT
        ' ========================================================================

        Dim r As Integer
        r = 5

        .Range("A" & r).Value = "PRODUCT OVERVIEW - 2026 TOTALS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Font.Size = 12
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 2

        ' Headers
        .Range("A" & r).Value = "Product"
        .Range("B" & r).Value = "ARR (Dec 31)"
        .Range("C" & r).Value = "Total Revenue"
        .Range("D" & r).Value = "Total COGS"
        .Range("E" & r).Value = "Gross Profit"
        .Range("F" & r).Value = "Margin %"
        .Range("A" & r & ":F" & r).Font.Bold = True
        .Range("A" & r & ":F" & r).Interior.Color = RGB(189, 215, 238)
        r = r + 1

        ' Product rows (will be populated with formulas)
        Dim products As Variant
        products = Array("Ninja Notes B2C", "Ninja Notes Enterprise", "Omni Sales", "Omni Service", "Omni Concierge", "Sona Hardware")

        Dim productStartRow As Integer
        productStartRow = r

        For i = 0 To UBound(products)
            .Range("A" & r).Value = products(i)
            r = r + 1
        Next i

        ' Total row
        .Range("A" & r).Value = "TOTAL"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 242, 204)
        Dim productTotalRow As Integer
        productTotalRow = r

        ' ========================================================================
        ' Add formulas for product overview - CORRECTED ROW REFERENCES
        ' ========================================================================

        ' Ninja Notes B2C (Ending ARR: 109, Total Revenue: 120, Total COGS: 121)
        .Range("B" & productStartRow).Formula = "='Ninja Notes B2C'!B109"
        .Range("C" & productStartRow).Formula = "='Ninja Notes B2C'!B120"
        .Range("D" & productStartRow).Formula = "='Ninja Notes B2C'!B121"
        .Range("E" & productStartRow).Formula = "=C" & productStartRow & "-D" & productStartRow
        .Range("F" & productStartRow).Formula = "=IF(C" & productStartRow & "=0,0,E" & productStartRow & "/C" & productStartRow & ")"

        ' Ninja Notes Enterprise (Ending ARR: 84, Total Revenue: 99, Total COGS: 100)
        .Range("B" & (productStartRow + 1)).Formula = "='Ninja Notes Enterprise'!B84"
        .Range("C" & (productStartRow + 1)).Formula = "='Ninja Notes Enterprise'!B99"
        .Range("D" & (productStartRow + 1)).Formula = "='Ninja Notes Enterprise'!B100"
        .Range("E" & (productStartRow + 1)).Formula = "=C" & (productStartRow + 1) & "-D" & (productStartRow + 1)
        .Range("F" & (productStartRow + 1)).Formula = "=IF(C" & (productStartRow + 1) & "=0,0,E" & (productStartRow + 1) & "/C" & (productStartRow + 1) & ")"

        ' Omni Sales (Ending ARR: 100, Total Revenue: 112, Total COGS: 122)
        .Range("B" & (productStartRow + 2)).Formula = "='Omni Sales'!B100"
        .Range("C" & (productStartRow + 2)).Formula = "='Omni Sales'!B112"
        .Range("D" & (productStartRow + 2)).Formula = "='Omni Sales'!B122"
        .Range("E" & (productStartRow + 2)).Formula = "=C" & (productStartRow + 2) & "-D" & (productStartRow + 2)
        .Range("F" & (productStartRow + 2)).Formula = "=IF(C" & (productStartRow + 2) & "=0,0,E" & (productStartRow + 2) & "/C" & (productStartRow + 2) & ")"

        ' Omni Service (Ending ARR: 100, Total Revenue: 112, Total COGS: 122)
        .Range("B" & (productStartRow + 3)).Formula = "='Omni Service'!B100"
        .Range("C" & (productStartRow + 3)).Formula = "='Omni Service'!B112"
        .Range("D" & (productStartRow + 3)).Formula = "='Omni Service'!B122"
        .Range("E" & (productStartRow + 3)).Formula = "=C" & (productStartRow + 3) & "-D" & (productStartRow + 3)
        .Range("F" & (productStartRow + 3)).Formula = "=IF(C" & (productStartRow + 3) & "=0,0,E" & (productStartRow + 3) & "/C" & (productStartRow + 3) & ")"

        ' Omni Concierge (Vendor ARR: 122, Total Revenue: 134, Total COGS: 140)
        .Range("B" & (productStartRow + 4)).Formula = "='Omni Concierge'!B122"
        .Range("C" & (productStartRow + 4)).Formula = "='Omni Concierge'!B134"
        .Range("D" & (productStartRow + 4)).Formula = "='Omni Concierge'!B140"
        .Range("E" & (productStartRow + 4)).Formula = "=C" & (productStartRow + 4) & "-D" & (productStartRow + 4)
        .Range("F" & (productStartRow + 4)).Formula = "=IF(C" & (productStartRow + 4) & "=0,0,E" & (productStartRow + 4) & "/C" & (productStartRow + 4) & ")"

        ' Sona Hardware (No ARR, Total Revenue: 68, Total COGS: 69)
        .Range("B" & (productStartRow + 5)).Value = "-"
        .Range("C" & (productStartRow + 5)).Formula = "='Sona Hardware'!B68"
        .Range("D" & (productStartRow + 5)).Formula = "='Sona Hardware'!B69"
        .Range("E" & (productStartRow + 5)).Formula = "=C" & (productStartRow + 5) & "-D" & (productStartRow + 5)
        .Range("F" & (productStartRow + 5)).Formula = "=IF(C" & (productStartRow + 5) & "=0,0,E" & (productStartRow + 5) & "/C" & (productStartRow + 5) & ")"

        ' Total row formulas
        .Range("B" & productTotalRow).Formula = "=SUM(B" & productStartRow & ":B" & (productTotalRow - 1) & ")"
        .Range("C" & productTotalRow).Formula = "=SUM(C" & productStartRow & ":C" & (productTotalRow - 1) & ")"
        .Range("D" & productTotalRow).Formula = "=SUM(D" & productStartRow & ":D" & (productTotalRow - 1) & ")"
        .Range("E" & productTotalRow).Formula = "=C" & productTotalRow & "-D" & productTotalRow
        .Range("F" & productTotalRow).Formula = "=IF(C" & productTotalRow & "=0,0,E" & productTotalRow & "/C" & productTotalRow & ")"

        ' Format all overview cells
        .Range("B" & productStartRow & ":F" & productTotalRow).NumberFormat = "$#,##0"
        .Range("F" & productStartRow & ":F" & productTotalRow).NumberFormat = "0.0%"
        .Range("B" & productTotalRow & ":F" & productTotalRow).Font.Bold = True

        ' ========================================================================
        ' SECTION 3: CONSOLIDATED MONTHLY PROJECTIONS - CORRECTED REFERENCES
        ' ========================================================================

        r = r + 3

        .Range("A" & r).Value = "CONSOLIDATED MONTHLY PROJECTIONS - 2026"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Font.Size = 12
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 2

        ' Column headers for months
        .Range("A" & r).Value = "Revenue Type"
        Dim months As Variant
        months = Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

        For i = 0 To 11
            .Cells(r, i + 2).Value = months(i)
            .Cells(r, i + 2).Font.Bold = True
            .Cells(r, i + 2).HorizontalAlignment = xlCenter
        Next i
        r = r + 1

        ' --- RECURRING REVENUE ---
        .Range("A" & r).Value = "RECURRING REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(146, 208, 80)
        r = r + 1

        ' Notes B2C MRR (Row 65 - CORRECTED from 45)
        .Range("A" & r).Value = "Notes B2C MRR"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Ninja Notes B2C'!" & GetMonthColumn(i) & "65"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Notes Enterprise MRR (Row 43 - CORRECTED from 42)
        .Range("A" & r).Value = "Notes Enterprise MRR"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Ninja Notes Enterprise'!" & GetMonthColumn(i) & "43"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Sales MRR (Row 49 - already correct)
        .Range("A" & r).Value = "Omni Sales MRR"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Sales'!" & GetMonthColumn(i) & "49"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Service MRR (Row 49 - already correct)
        .Range("A" & r).Value = "Omni Service MRR"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Service'!" & GetMonthColumn(i) & "49"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Concierge Vendor MRR (Row 64 - already correct)
        .Range("A" & r).Value = "Omni Concierge Vendor MRR"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Concierge'!" & GetMonthColumn(i) & "64"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Total Recurring Revenue
        .Range("A" & r).Value = "TOTAL RECURRING REVENUE"
        .Range("A" & r).Font.Bold = True
        Dim recurRevStartRow As Integer
        recurRevStartRow = r - 5
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=SUM(" & GetColumnLetter(monthCol) & recurRevStartRow & ":" & GetColumnLetter(monthCol) & (r - 1) & ")"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":M" & r).Font.Bold = True
        .Range("B" & r & ":M" & r).Interior.Color = RGB(146, 208, 80)
        Dim totalRecurRevRow As Integer
        totalRecurRevRow = r
        r = r + 2

        ' --- ONE-TIME REVENUE ---
        .Range("A" & r).Value = "ONE-TIME REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 217, 102)
        r = r + 1

        ' Omni Sales One-Time (Row 55 - CORRECTED from 56)
        .Range("A" & r).Value = "Omni Sales (Setup + Add-ons)"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Sales'!" & GetMonthColumn(i) & "55"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Service One-Time (Row 55 - CORRECTED from 56)
        .Range("A" & r).Value = "Omni Service (Setup + Add-ons)"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Service'!" & GetMonthColumn(i) & "55"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Concierge One-Time (Row 83 - CORRECTED from 80)
        .Range("A" & r).Value = "Omni Concierge (Vendor + Shows)"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Concierge'!" & GetMonthColumn(i) & "83"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Total One-Time Revenue
        .Range("A" & r).Value = "TOTAL ONE-TIME REVENUE"
        .Range("A" & r).Font.Bold = True
        Dim oneTimeStartRow As Integer
        oneTimeStartRow = r - 3
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=SUM(" & GetColumnLetter(monthCol) & oneTimeStartRow & ":" & GetColumnLetter(monthCol) & (r - 1) & ")"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":M" & r).Font.Bold = True
        .Range("B" & r & ":M" & r).Interior.Color = RGB(255, 217, 102)
        Dim totalOneTimeRevRow As Integer
        totalOneTimeRevRow = r
        r = r + 2

        ' --- USAGE REVENUE (Concierge only) ---
        .Range("A" & r).Value = "USAGE REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 192, 203)
        r = r + 1

        ' Omni Concierge Usage (Row 84 - CORRECTED from 82)
        .Range("A" & r).Value = "Omni Concierge Usage"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Concierge'!" & GetMonthColumn(i) & "84"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":M" & r).Font.Bold = True
        .Range("B" & r & ":M" & r).Interior.Color = RGB(255, 192, 203)
        Dim totalUsageRevRow As Integer
        totalUsageRevRow = r
        r = r + 2

        ' --- HARDWARE REVENUE ---
        .Range("A" & r).Value = "HARDWARE REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(192, 192, 192)
        r = r + 1

        ' Sona Hardware (Row 39 - already correct)
        .Range("A" & r).Value = "Sona Hardware"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Sona Hardware'!" & GetMonthColumn(i) & "39"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":M" & r).Font.Bold = True
        .Range("B" & r & ":M" & r).Interior.Color = RGB(192, 192, 192)
        Dim hardwareRevRow As Integer
        hardwareRevRow = r
        r = r + 2

        ' --- GRAND TOTAL REVENUE ---
        .Range("A" & r).Value = "GRAND TOTAL REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(112, 173, 71)
        .Range("A" & r).Font.Color = RGB(255, 255, 255)
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & GetColumnLetter(monthCol) & totalRecurRevRow & "+" & _
                                          GetColumnLetter(monthCol) & totalOneTimeRevRow & "+" & _
                                          GetColumnLetter(monthCol) & totalUsageRevRow & "+" & _
                                          GetColumnLetter(monthCol) & hardwareRevRow
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":M" & r).Font.Bold = True
        .Range("B" & r & ":M" & r).Interior.Color = RGB(112, 173, 71)
        Dim grandTotalRevRow As Integer
        grandTotalRevRow = r
        r = r + 2

        ' --- TOTAL COGS (ALL CORRECTED) ---
        .Range("A" & r).Value = "TOTAL COGS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 192, 0)
        r = r + 1

        ' Sum all product COGS with CORRECTED row references
        .Range("A" & r).Value = "All Products COGS"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Ninja Notes B2C'!" & GetMonthColumn(i) & "76+" & _
                                       "'Ninja Notes Enterprise'!" & GetMonthColumn(i) & "51+" & _
                                       "'Omni Sales'!" & GetMonthColumn(i) & "68+" & _
                                       "'Omni Service'!" & GetMonthColumn(i) & "68+" & _
                                       "'Omni Concierge'!" & GetMonthColumn(i) & "91+" & _
                                       "'Sona Hardware'!" & GetMonthColumn(i) & "44"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":M" & r).Font.Bold = True
        .Range("B" & r & ":M" & r).Interior.Color = RGB(255, 192, 0)
        Dim totalCogsRow As Integer
        totalCogsRow = r
        r = r + 2

        ' --- PROFITABILITY ---
        .Range("A" & r).Value = "PROFITABILITY"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(84, 130, 53)
        .Range("A" & r).Font.Color = RGB(255, 255, 255)
        r = r + 1

        ' Gross Profit
        .Range("A" & r).Value = "Gross Profit"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & GetColumnLetter(monthCol) & grandTotalRevRow & "-" & GetColumnLetter(monthCol) & totalCogsRow
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":M" & r).Font.Bold = True
        Dim grossProfitRow As Integer
        grossProfitRow = r
        r = r + 1

        ' Gross Margin %
        .Range("A" & r).Value = "Gross Margin %"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=IF(" & GetColumnLetter(monthCol) & grandTotalRevRow & "=0,0," & _
                                          GetColumnLetter(monthCol) & grossProfitRow & "/" & _
                                          GetColumnLetter(monthCol) & grandTotalRevRow & ")"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "0.0%"
        .Range("B" & r & ":M" & r).Font.Bold = True

        ' ========================================================================
        ' SECTION 4: QUARTERLY ROLLUPS
        ' ========================================================================

        r = r + 3

        .Range("A" & r).Value = "QUARTERLY ROLLUPS - 2026"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Font.Size = 12
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 2

        ' Quarter headers
        .Range("A" & r).Value = "Metric"
        .Range("B" & r).Value = "Q1"
        .Range("C" & r).Value = "Q2"
        .Range("D" & r).Value = "Q3"
        .Range("E" & r).Value = "Q4"
        .Range("F" & r).Value = "2026 Total"
        .Range("A" & r & ":F" & r).Font.Bold = True
        .Range("A" & r & ":F" & r).Interior.Color = RGB(189, 215, 238)
        r = r + 1

        ' Total Recurring Revenue by Quarter
        .Range("A" & r).Value = "Total Recurring Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalRecurRevRow & ":D" & totalRecurRevRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalRecurRevRow & ":G" & totalRecurRevRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalRecurRevRow & ":J" & totalRecurRevRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalRecurRevRow & ":M" & totalRecurRevRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
        r = r + 1

        ' Total One-Time Revenue by Quarter
        .Range("A" & r).Value = "Total One-Time Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalOneTimeRevRow & ":D" & totalOneTimeRevRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalOneTimeRevRow & ":G" & totalOneTimeRevRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalOneTimeRevRow & ":J" & totalOneTimeRevRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalOneTimeRevRow & ":M" & totalOneTimeRevRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
        r = r + 1

        ' Total Usage Revenue by Quarter
        .Range("A" & r).Value = "Total Usage Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalUsageRevRow & ":D" & totalUsageRevRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalUsageRevRow & ":G" & totalUsageRevRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalUsageRevRow & ":J" & totalUsageRevRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalUsageRevRow & ":M" & totalUsageRevRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
        r = r + 1

        ' Hardware Revenue by Quarter
        .Range("A" & r).Value = "Hardware Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & hardwareRevRow & ":D" & hardwareRevRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & hardwareRevRow & ":G" & hardwareRevRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & hardwareRevRow & ":J" & hardwareRevRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & hardwareRevRow & ":M" & hardwareRevRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
        r = r + 1

        ' Grand Total Revenue by Quarter
        .Range("A" & r).Value = "GRAND TOTAL REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & (r - 4) & ":B" & (r - 1) & ")"
        .Range("C" & r).Formula = "=SUM(C" & (r - 4) & ":C" & (r - 1) & ")"
        .Range("D" & r).Formula = "=SUM(D" & (r - 4) & ":D" & (r - 1) & ")"
        .Range("E" & r).Formula = "=SUM(E" & (r - 4) & ":E" & (r - 1) & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
        .Range("B" & r & ":F" & r).Interior.Color = RGB(112, 173, 71)
        r = r + 1

        ' Total COGS by Quarter
        .Range("A" & r).Value = "Total COGS"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalCogsRow & ":D" & totalCogsRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalCogsRow & ":G" & totalCogsRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalCogsRow & ":J" & totalCogsRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalCogsRow & ":M" & totalCogsRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
        .Range("B" & r & ":F" & r).Interior.Color = RGB(255, 192, 0)
        r = r + 1

        ' Gross Profit by Quarter
        .Range("A" & r).Value = "Gross Profit"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=B" & (r - 2) & "-B" & (r - 1)
        .Range("C" & r).Formula = "=C" & (r - 2) & "-C" & (r - 1)
        .Range("D" & r).Formula = "=D" & (r - 2) & "-D" & (r - 1)
        .Range("E" & r).Formula = "=E" & (r - 2) & "-E" & (r - 1)
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
        r = r + 1

        ' Gross Margin % by Quarter
        .Range("A" & r).Value = "Gross Margin %"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=IF(B" & (r - 2) & "=0,0,B" & (r - 1) & "/B" & (r - 2) & ")"
        .Range("C" & r).Formula = "=IF(C" & (r - 2) & "=0,0,C" & (r - 1) & "/C" & (r - 2) & ")"
        .Range("D" & r).Formula = "=IF(D" & (r - 2) & "=0,0,D" & (r - 1) & "/D" & (r - 2) & ")"
        .Range("E" & r).Formula = "=IF(E" & (r - 2) & "=0,0,E" & (r - 1) & "/E" & (r - 2) & ")"
        .Range("F" & r).Formula = "=IF(F" & (r - 2) & "=0,0,F" & (r - 1) & "/F" & (r - 2) & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "0.0%"
        .Range("B" & r & ":F" & r).Font.Bold = True

        ' ========================================================================
        ' SECTION 5: REVENUE MIX ANALYSIS
        ' ========================================================================

        r = r + 3

        .Range("A" & r).Value = "REVENUE MIX ANALYSIS - 2026"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Font.Size = 12
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 2

        .Range("A" & r).Value = "Revenue Type"
        .Range("B" & r).Value = "Amount"
        .Range("C" & r).Value = "% of Total"
        .Range("A" & r & ":C" & r).Font.Bold = True
        .Range("A" & r & ":C" & r).Interior.Color = RGB(189, 215, 238)
        r = r + 1

        Dim revMixStartRow As Integer
        revMixStartRow = r

        .Range("A" & r).Value = "Recurring Revenue"
        .Range("B" & r).Formula = "=SUM(B" & totalRecurRevRow & ":M" & totalRecurRevRow & ")"
        r = r + 1

        .Range("A" & r).Value = "One-Time Revenue"
        .Range("B" & r).Formula = "=SUM(B" & totalOneTimeRevRow & ":M" & totalOneTimeRevRow & ")"
        r = r + 1

        .Range("A" & r).Value = "Usage Revenue"
        .Range("B" & r).Formula = "=SUM(B" & totalUsageRevRow & ":M" & totalUsageRevRow & ")"
        r = r + 1

        .Range("A" & r).Value = "Hardware Revenue"
        .Range("B" & r).Formula = "=SUM(B" & hardwareRevRow & ":M" & hardwareRevRow & ")"
        r = r + 1

        .Range("A" & r).Value = "TOTAL"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & revMixStartRow & ":B" & (r - 1) & ")"
        .Range("B" & r).Font.Bold = True
        .Range("B" & r).Interior.Color = RGB(255, 242, 204)

        ' Add % formulas
        For i = revMixStartRow To r
            .Range("C" & i).Formula = "=IF($B$" & r & "=0,0,B" & i & "/$B$" & r & ")"
            .Range("C" & i).NumberFormat = "0.0%"
        Next i

        .Range("B" & revMixStartRow & ":B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        .Range("C" & r).Font.Bold = True

        ' ========================================================================
        ' FORMATTING
        ' ========================================================================

        ' Column widths
        .Columns("A:A").ColumnWidth = 35
        .Columns("B:M").ColumnWidth = 13

        ' Freeze panes
        .Activate
        .Range("B8").Select
        ActiveWindow.FreezePanes = True

    End With

    Application.ScreenUpdating = True

    MsgBox "✓ Summary Sheet Created Successfully!" & vbCrLf & vbCrLf & _
           "All row references have been corrected and verified." & vbCrLf & _
           "Cross-sheet formulas now point to the correct cells.", _
           vbInformation, "Summary Sheet Generator"

End Sub

' ============================================================================
' HELPER FUNCTIONS - NO CHANGES NEEDED
' ============================================================================

Function GetMonthColumn(monthNumber As Integer) As String
    ' Returns column letter for a given month (1=B, 2=C, etc.)
    GetMonthColumn = Chr(65 + monthNumber)  ' 65 is 'A' in ASCII
End Function

Function GetColumnLetter(colNumber As Integer) As String
    ' Returns column letter from column number
    If colNumber <= 26 Then
        GetColumnLetter = Chr(64 + colNumber)
    Else
        GetColumnLetter = Chr(64 + Int((colNumber - 1) / 26)) & Chr(65 + ((colNumber - 1) Mod 26))
    End If
End Function
