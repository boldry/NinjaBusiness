Option Explicit

' ============================================================================
' Summary Rollup Sheet Generator
' ============================================================================
' This VBA module creates a consolidated Summary sheet that aggregates
' all 6 product sheets into a single executive dashboard
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

        ' Add formulas for product overview
        ' Ninja Notes B2C
        .Range("B" & productStartRow).Formula = "='Ninja Notes B2C'!B" & GetKPIRow("B2C", "Ending ARR")
        .Range("C" & productStartRow).Formula = "='Ninja Notes B2C'!B" & GetKPIRow("B2C", "Total Revenue")
        .Range("D" & productStartRow).Formula = "='Ninja Notes B2C'!B" & GetKPIRow("B2C", "Total COGS")
        .Range("E" & productStartRow).Formula = "=C" & productStartRow & "-D" & productStartRow
        .Range("F" & productStartRow).Formula = "=IF(C" & productStartRow & "=0,0,E" & productStartRow & "/C" & productStartRow & ")"

        ' Ninja Notes Enterprise
        .Range("B" & (productStartRow + 1)).Formula = "='Ninja Notes Enterprise'!B" & GetKPIRow("Enterprise", "Ending ARR")
        .Range("C" & (productStartRow + 1)).Formula = "='Ninja Notes Enterprise'!B" & GetKPIRow("Enterprise", "Total Revenue")
        .Range("D" & (productStartRow + 1)).Formula = "='Ninja Notes Enterprise'!B" & GetKPIRow("Enterprise", "Total COGS")
        .Range("E" & (productStartRow + 1)).Formula = "=C" & (productStartRow + 1) & "-D" & (productStartRow + 1)
        .Range("F" & (productStartRow + 1)).Formula = "=IF(C" & (productStartRow + 1) & "=0,0,E" & (productStartRow + 1) & "/C" & (productStartRow + 1) & ")"

        ' Omni Sales
        .Range("B" & (productStartRow + 2)).Formula = "='Omni Sales'!B" & GetKPIRow("Sales", "Ending ARR")
        .Range("C" & (productStartRow + 2)).Formula = "='Omni Sales'!B" & GetKPIRow("Sales", "Total Revenue")
        .Range("D" & (productStartRow + 2)).Formula = "='Omni Sales'!B" & GetKPIRow("Sales", "Total COGS")
        .Range("E" & (productStartRow + 2)).Formula = "=C" & (productStartRow + 2) & "-D" & (productStartRow + 2)
        .Range("F" & (productStartRow + 2)).Formula = "=IF(C" & (productStartRow + 2) & "=0,0,E" & (productStartRow + 2) & "/C" & (productStartRow + 2) & ")"

        ' Omni Service
        .Range("B" & (productStartRow + 3)).Formula = "='Omni Service'!B" & GetKPIRow("Service", "Ending ARR")
        .Range("C" & (productStartRow + 3)).Formula = "='Omni Service'!B" & GetKPIRow("Service", "Total Revenue")
        .Range("D" & (productStartRow + 3)).Formula = "='Omni Service'!B" & GetKPIRow("Service", "Total COGS")
        .Range("E" & (productStartRow + 3)).Formula = "=C" & (productStartRow + 3) & "-D" & (productStartRow + 3)
        .Range("F" & (productStartRow + 3)).Formula = "=IF(C" & (productStartRow + 3) & "=0,0,E" & (productStartRow + 3) & "/C" & (productStartRow + 3) & ")"

        ' Omni Concierge
        .Range("B" & (productStartRow + 4)).Formula = "='Omni Concierge'!B" & GetKPIRow("Concierge", "Vendor ARR")
        .Range("C" & (productStartRow + 4)).Formula = "='Omni Concierge'!B" & GetKPIRow("Concierge", "Total Revenue")
        .Range("D" & (productStartRow + 4)).Formula = "='Omni Concierge'!B" & GetKPIRow("Concierge", "Total COGS")
        .Range("E" & (productStartRow + 4)).Formula = "=C" & (productStartRow + 4) & "-D" & (productStartRow + 4)
        .Range("F" & (productStartRow + 4)).Formula = "=IF(C" & (productStartRow + 4) & "=0,0,E" & (productStartRow + 4) & "/C" & (productStartRow + 4) & ")"

        ' Sona Hardware (no ARR)
        .Range("B" & (productStartRow + 5)).Value = "-"
        .Range("C" & (productStartRow + 5)).Formula = "='Sona Hardware'!B" & GetKPIRow("Sona", "Total Revenue")
        .Range("D" & (productStartRow + 5)).Formula = "='Sona Hardware'!B" & GetKPIRow("Sona", "Total COGS")
        .Range("E" & (productStartRow + 5)).Formula = "=C" & (productStartRow + 5) & "-D" & (productStartRow + 5)
        .Range("F" & (productStartRow + 5)).Formula = "=IF(C" & (productStartRow + 5) & "=0,0,E" & (productStartRow + 5) & "/C" & (productStartRow + 5) & ")"

        ' Totals
        .Range("B" & productTotalRow).Formula = "=SUM(B" & productStartRow & ":B" & (productStartRow + 4) & ")"
        .Range("C" & productTotalRow).Formula = "=SUM(C" & productStartRow & ":C" & (productStartRow + 5) & ")"
        .Range("D" & productTotalRow).Formula = "=SUM(D" & productStartRow & ":D" & (productStartRow + 5) & ")"
        .Range("E" & productTotalRow).Formula = "=SUM(E" & productStartRow & ":E" & (productStartRow + 5) & ")"
        .Range("F" & productTotalRow).Formula = "=IF(C" & productTotalRow & "=0,0,E" & productTotalRow & "/C" & productTotalRow & ")"

        ' Format
        .Range("B" & productStartRow & ":E" & productTotalRow).NumberFormat = "$#,##0"
        .Range("F" & productStartRow & ":F" & productTotalRow).NumberFormat = "0.0%"
        .Range("B" & productTotalRow & ":F" & productTotalRow).Font.Bold = True

        ' ========================================================================
        ' SECTION 3: CONSOLIDATED MONTHLY PROJECTIONS
        ' ========================================================================

        r = productTotalRow + 3

        .Range("A" & r).Value = "CONSOLIDATED MONTHLY PROJECTIONS - 2026"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Font.Size = 12
        r = r + 2

        Dim startRow As Integer
        startRow = r

        ' Column headers for months
        .Range("A" & startRow).Value = "Metric"
        Dim months As Variant
        months = Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

        For i = 0 To 11
            .Cells(startRow, i + 2).Value = months(i)
            .Cells(startRow, i + 2).Font.Bold = True
            .Cells(startRow, i + 2).HorizontalAlignment = xlCenter
        Next i

        r = startRow + 1

        ' --- RECURRING REVENUE ---
        .Range("A" & r).Value = "RECURRING REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(146, 208, 80)
        r = r + 1

        ' Notes B2C MRR
        .Range("A" & r).Value = "Notes B2C MRR"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Ninja Notes B2C'!" & GetMonthColumn(i) & "45"  ' Total MRR row
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Notes Enterprise MRR
        .Range("A" & r).Value = "Notes Enterprise MRR"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Ninja Notes Enterprise'!" & GetMonthColumn(i) & "42"  ' MRR row
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Sales MRR
        .Range("A" & r).Value = "Omni Sales MRR"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Sales'!" & GetMonthColumn(i) & "49"  ' Monthly Recurring Revenue row
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Service MRR
        .Range("A" & r).Value = "Omni Service MRR"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Service'!" & GetMonthColumn(i) & "49"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Concierge Vendor MRR
        .Range("A" & r).Value = "Omni Concierge Vendor MRR"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Concierge'!" & GetMonthColumn(i) & "64"  ' Total Vendor MRR row
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

        ' Omni Sales One-Time
        .Range("A" & r).Value = "Omni Sales (Setup + Add-ons)"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Sales'!" & GetMonthColumn(i) & "56"  ' Vendor Setup Revenue
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Service One-Time
        .Range("A" & r).Value = "Omni Service (Setup + Add-ons)"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Service'!" & GetMonthColumn(i) & "56"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Concierge One-Time
        .Range("A" & r).Value = "Omni Concierge (Vendor + Shows)"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Concierge'!" & GetMonthColumn(i) & "80"  ' Total One-Time Revenue
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

        ' --- USAGE REVENUE ---
        .Range("A" & r).Value = "USAGE REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 192, 203)
        r = r + 1

        ' Omni Sales Usage
        .Range("A" & r).Value = "Omni Sales Usage"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Sales'!" & GetMonthColumn(i) & "60"  ' Vendor Usage Revenue
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Service Usage
        .Range("A" & r).Value = "Omni Service Usage"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Service'!" & GetMonthColumn(i) & "60"
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Omni Concierge Usage
        .Range("A" & r).Value = "Omni Concierge Usage"
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Omni Concierge'!" & GetMonthColumn(i) & "82"  ' Total Usage Revenue
        Next i
        .Range("B" & r & ":M" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Total Usage Revenue
        .Range("A" & r).Value = "TOTAL USAGE REVENUE"
        .Range("A" & r).Font.Bold = True
        Dim usageStartRow As Integer
        usageStartRow = r - 3
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=SUM(" & GetColumnLetter(monthCol) & usageStartRow & ":" & GetColumnLetter(monthCol) & (r - 1) & ")"
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

        ' Sona Hardware
        .Range("A" & r).Value = "Sona Hardware"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Sona Hardware'!" & GetMonthColumn(i) & "39"  ' Total Revenue
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

        ' --- TOTAL COGS ---
        .Range("A" & r).Value = "TOTAL COGS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 192, 0)
        r = r + 1

        ' Sum all product COGS
        .Range("A" & r).Value = "All Products COGS"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            .Cells(r, i + 1).Formula = "='Ninja Notes B2C'!" & GetMonthColumn(i) & "64+" & _
                                       "'Ninja Notes Enterprise'!" & GetMonthColumn(i) & "49+" & _
                                       "'Omni Sales'!" & GetMonthColumn(i) & "72+" & _
                                       "'Omni Service'!" & GetMonthColumn(i) & "72+" & _
                                       "'Omni Concierge'!" & GetMonthColumn(i) & "90+" & _
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
        r = r + 2

        ' Quarter headers
        .Range("A" & r).Value = "Metric"
        .Range("B" & r).Value = "Q1"
        .Range("C" & r).Value = "Q2"
        .Range("D" & r).Value = "Q3"
        .Range("E" & r).Value = "Q4"
        .Range("F" & r).Value = "2026 Total"
        .Range("A" & r & ":F" & r).Font.Bold = True
        .Range("A" & r & ":F" & r).HorizontalAlignment = xlCenter
        .Range("A" & r & ":F" & r).Interior.Color = RGB(189, 215, 238)
        r = r + 1

        Dim qStartRow As Integer
        qStartRow = r

        ' Recurring Revenue
        .Range("A" & r).Value = "Recurring Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalRecurRevRow & ":D" & totalRecurRevRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalRecurRevRow & ":G" & totalRecurRevRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalRecurRevRow & ":J" & totalRecurRevRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalRecurRevRow & ":M" & totalRecurRevRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' One-Time Revenue
        .Range("A" & r).Value = "One-Time Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalOneTimeRevRow & ":D" & totalOneTimeRevRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalOneTimeRevRow & ":G" & totalOneTimeRevRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalOneTimeRevRow & ":J" & totalOneTimeRevRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalOneTimeRevRow & ":M" & totalOneTimeRevRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Usage Revenue
        .Range("A" & r).Value = "Usage Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalUsageRevRow & ":D" & totalUsageRevRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalUsageRevRow & ":G" & totalUsageRevRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalUsageRevRow & ":J" & totalUsageRevRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalUsageRevRow & ":M" & totalUsageRevRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Hardware Revenue
        .Range("A" & r).Value = "Hardware Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & hardwareRevRow & ":D" & hardwareRevRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & hardwareRevRow & ":G" & hardwareRevRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & hardwareRevRow & ":J" & hardwareRevRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & hardwareRevRow & ":M" & hardwareRevRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Total Revenue
        .Range("A" & r).Value = "Total Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & (qStartRow) & ":B" & (r - 1) & ")"
        .Range("C" & r).Formula = "=SUM(C" & (qStartRow) & ":C" & (r - 1) & ")"
        .Range("D" & r).Formula = "=SUM(D" & (qStartRow) & ":D" & (r - 1) & ")"
        .Range("E" & r).Formula = "=SUM(E" & (qStartRow) & ":E" & (r - 1) & ")"
        .Range("F" & r).Formula = "=SUM(F" & (qStartRow) & ":F" & (r - 1) & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Interior.Color = RGB(146, 208, 80)
        r = r + 1

        ' Total COGS
        .Range("A" & r).Value = "Total COGS"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalCogsRow & ":D" & totalCogsRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalCogsRow & ":G" & totalCogsRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalCogsRow & ":J" & totalCogsRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalCogsRow & ":M" & totalCogsRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Gross Profit
        .Range("A" & r).Value = "Gross Profit"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=B" & (r - 2) & "-B" & (r - 1)
        .Range("C" & r).Formula = "=C" & (r - 2) & "-C" & (r - 1)
        .Range("D" & r).Formula = "=D" & (r - 2) & "-D" & (r - 1)
        .Range("E" & r).Formula = "=E" & (r - 2) & "-E" & (r - 1)
        .Range("F" & r).Formula = "=F" & (r - 2) & "-F" & (r - 1)
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Gross Margin %
        .Range("A" & r).Value = "Gross Margin %"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=IF(B" & (r - 3) & "=0,0,B" & (r - 1) & "/B" & (r - 3) & ")"
        .Range("C" & r).Formula = "=IF(C" & (r - 3) & "=0,0,C" & (r - 1) & "/C" & (r - 3) & ")"
        .Range("D" & r).Formula = "=IF(D" & (r - 3) & "=0,0,D" & (r - 1) & "/D" & (r - 3) & ")"
        .Range("E" & r).Formula = "=IF(E" & (r - 3) & "=0,0,E" & (r - 1) & "/E" & (r - 3) & ")"
        .Range("F" & r).Formula = "=IF(F" & (r - 3) & "=0,0,F" & (r - 1) & "/F" & (r - 3) & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "0.0%"

        ' ========================================================================
        ' SECTION 5: COMPANY KPIs
        ' ========================================================================

        r = r + 3
        .Range("A" & r).Value = "COMPANY KPIs - 2026"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Font.Size = 12
        .Range("A" & r).Interior.Color = RGB(68, 114, 196)
        .Range("A" & r).Font.Color = RGB(255, 255, 255)
        r = r + 2

        ' Total ARR
        .Range("A" & r).Value = "Total ARR (Dec 31, 2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=B" & productTotalRow
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        ' Revenue Mix
        .Range("A" & r).Value = "2026 Revenue Mix:"
        .Range("A" & r).Font.Bold = True
        r = r + 1

        Dim yearTotalRevRow As Integer
        yearTotalRevRow = qStartRow + 4  ' Total Revenue in quarterly section

        .Range("A" & r).Value = "  % Recurring"
        .Range("B" & r).Formula = "=F" & qStartRow & "/F" & yearTotalRevRow
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 1

        .Range("A" & r).Value = "  % One-Time"
        .Range("B" & r).Formula = "=F" & (qStartRow + 1) & "/F" & yearTotalRevRow
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 1

        .Range("A" & r).Value = "  % Usage"
        .Range("B" & r).Formula = "=F" & (qStartRow + 2) & "/F" & yearTotalRevRow
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 1

        .Range("A" & r).Value = "  % Hardware"
        .Range("B" & r).Formula = "=F" & (qStartRow + 3) & "/F" & yearTotalRevRow
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' Blended Gross Margin
        .Range("A" & r).Value = "Blended Gross Margin % (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=F" & productTotalRow
        .Range("B" & r).NumberFormat = "0.0%"
        .Range("B" & r).Font.Bold = True

        ' ========================================================================
        ' FORMATTING
        ' ========================================================================

        ' Column widths
        .Columns("A:A").ColumnWidth = 40
        .Columns("B:M").ColumnWidth = 14

        ' Freeze panes
        .Activate
        .Range("B" & (startRow + 1)).Select
        ActiveWindow.FreezePanes = True

        ' Add borders
        Dim dataRange As Range
        Set dataRange = .Range("A" & startRow & ":M" & (startRow + 35))
        dataRange.Borders.LineStyle = xlContinuous
        dataRange.Borders.Weight = xlThin

    End With

    Application.ScreenUpdating = True

    MsgBox "Summary sheet created successfully!" & vbCrLf & vbCrLf & _
           "Note: Ensure all product sheets exist before using this summary.", vbInformation

End Sub

' ============================================================================
' HELPER FUNCTIONS
' ============================================================================

Function GetKPIRow(productType As String, kpiName As String) As Integer
    ' Returns approximate row numbers for KPIs in each product sheet
    ' These are estimates based on the VBA code structure

    Select Case productType
        Case "B2C"
            Select Case kpiName
                Case "Ending ARR": GetKPIRow = 97  ' Estimated
                Case "Total Revenue": GetKPIRow = 106
                Case "Total COGS": GetKPIRow = 107
            End Select
        Case "Enterprise"
            Select Case kpiName
                Case "Ending ARR": GetKPIRow = 78
                Case "Total Revenue": GetKPIRow = 93
                Case "Total COGS": GetKPIRow = 94
            End Select
        Case "Sales", "Service"
            Select Case kpiName
                Case "Ending ARR": GetKPIRow = 129
                Case "Total Revenue": GetKPIRow = 145
                Case "Total COGS": GetKPIRow = 149
            End Select
        Case "Concierge"
            Select Case kpiName
                Case "Vendor ARR": GetKPIRow = 131
                Case "Total Revenue": GetKPIRow = 147
                Case "Total COGS": GetKPIRow = 151
            End Select
        Case "Sona"
            Select Case kpiName
                Case "Total Revenue": GetKPIRow = 72
                Case "Total COGS": GetKPIRow = 73
            End Select
    End Select
End Function

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
