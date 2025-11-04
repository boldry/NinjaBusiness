Option Explicit

' ============================================================================
' Ninja Notes B2C Financial Model Generator
' ============================================================================
' This VBA module creates a complete financial model sheet for Ninja Notes B2C
' with editable assumptions, monthly projections, and KPI calculations
' ============================================================================

Sub Create_NinjaNotesB2C_Sheet()

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim i As Integer
    Dim monthCol As Integer

    ' Create or clear the sheet
    On Error Resume Next
    Set ws = ThisWorkbook.Sheets("Ninja Notes B2C")
    If ws Is Nothing Then
        Set ws = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
        ws.Name = "Ninja Notes B2C"
    Else
        ws.Cells.Clear
    End If
    On Error GoTo 0

    Application.ScreenUpdating = False

    ' ========================================================================
    ' SECTION 1: ASSUMPTIONS (Rows 1-35)
    ' ========================================================================

    With ws
        ' Header
        .Range("A1").Value = "NINJA NOTES B2C - 2026 FINANCIAL MODEL"
        .Range("A1").Font.Bold = True
        .Range("A1").Font.Size = 14

        .Range("A3").Value = "ASSUMPTIONS (Editable - Yellow Cells)"
        .Range("A3").Font.Bold = True
        .Range("A3").Font.Size = 12
        .Range("A3").Interior.Color = RGB(255, 242, 204)

        ' Pricing
        .Range("A5").Value = "PRICING"
        .Range("A5").Font.Bold = True
        .Range("A6").Value = "Free Tier ($/mo)"
        .Range("B6").Value = 0
        .Range("A7").Value = "Entry Tier ($/mo)"
        .Range("B7").Value = 18
        .Range("A8").Value = "Pro Tier ($/mo)"
        .Range("B8").Value = 30

        ' User Mix
        .Range("A10").Value = "USER MIX (Must sum to 100%)"
        .Range("A10").Font.Bold = True
        .Range("A11").Value = "Free %"
        .Range("B11").Value = 0.4
        .Range("B11").NumberFormat = "0%"
        .Range("A12").Value = "Entry %"
        .Range("B12").Value = 0.4
        .Range("B12").NumberFormat = "0%"
        .Range("A13").Value = "Pro %"
        .Range("B13").Value = 0.2
        .Range("B13").NumberFormat = "0%"
        .Range("A14").Value = "Total Mix Check"
        .Range("B14").Formula = "=B11+B12+B13"
        .Range("B14").NumberFormat = "0%"
        .Range("B14").Font.Bold = True

        .Range("A16").Value = "Paid User Ratio (Auto-calculated)"
        .Range("A16").Font.Italic = True
        .Range("A17").Value = "Entry % of Paid"
        .Range("B17").Formula = "=B12/(B12+B13)"
        .Range("B17").NumberFormat = "0%"
        .Range("A18").Value = "Pro % of Paid"
        .Range("B18").Formula = "=B13/(B12+B13)"
        .Range("B18").NumberFormat = "0%"

        ' Starting Users
        .Range("A20").Value = "STARTING USERS (Jan 1, 2026)"
        .Range("A20").Font.Bold = True
        .Range("A21").Value = "Total Users"
        .Range("B21").Value = 250
        .Range("A22").Value = "Free Users (Auto)"
        .Range("B22").Formula = "=B21*B11"
        .Range("B22").NumberFormat = "0"
        .Range("A23").Value = "Entry Users (Auto)"
        .Range("B23").Formula = "=B21*B12"
        .Range("B23").NumberFormat = "0"
        .Range("A24").Value = "Pro Users (Auto)"
        .Range("B24").Formula = "=B21*B13"
        .Range("B24").NumberFormat = "0"

        ' New User Adds
        .Range("A26").Value = "NEW USER ADDS (Total users per quarter)"
        .Range("A26").Font.Bold = True
        .Range("A27").Value = "Q1 New Adds"
        .Range("B27").Value = 800
        .Range("A28").Value = "Q2 New Adds"
        .Range("B28").Value = 1200
        .Range("A29").Value = "Q3 New Adds"
        .Range("B29").Value = 1800
        .Range("A30").Value = "Q4 New Adds"
        .Range("B30").Value = 2700

        ' Churn Rates
        .Range("D5").Value = "CHURN RATES (All tiers)"
        .Range("D5").Font.Bold = True
        .Range("D6").Value = "Starting Churn % (Month 1)"
        .Range("E6").Value = 0.1
        .Range("E6").NumberFormat = "0.0%"
        .Range("D7").Value = "Ending Churn % (Month 12)"
        .Range("E7").Value = 0.06
        .Range("E7").NumberFormat = "0.0%"
        .Range("D8").Value = "Monthly Decline"
        .Range("E8").Formula = "=(E6-E7)/11"
        .Range("E8").NumberFormat = "0.00%"

        ' Free-to-Paid Conversion
        .Range("D10").Value = "FREE-TO-PAID CONVERSION"
        .Range("D10").Font.Bold = True
        .Range("D11").Value = "Conversion Rate (% per month)"
        .Range("E11").Value = 0.05
        .Range("E11").NumberFormat = "0.0%"
        .Range("D12").Value = "Split to Entry (uses paid ratio)"
        .Range("E12").Formula = "=B17"
        .Range("E12").NumberFormat = "0%"
        .Range("D13").Value = "Split to Pro (uses paid ratio)"
        .Range("E13").Formula = "=B18"
        .Range("E13").NumberFormat = "0%"

        ' COGS - Infrastructure
        .Range("D15").Value = "COGS - INFRASTRUCTURE"
        .Range("D15").Font.Bold = True
        .Range("D16").Value = "Server Cost per 5,000 users"
        .Range("E16").Value = 1600
        .Range("E16").NumberFormat = "$#,##0.00"
        .Range("D17").Value = "Users per Server Tier"
        .Range("E17").Value = 5000

        ' COGS - Model Usage
        .Range("D19").Value = "COGS - MODEL USAGE"
        .Range("D19").Font.Bold = True
        .Range("D20").Value = "Cost per Usage Hour"
        .Range("E20").Value = 0.55
        .Range("E20").NumberFormat = "$0.00"
        .Range("D21").Value = "Free Usage (hours/week)"
        .Range("E21").Value = 1
        .Range("D22").Value = "Entry Usage (hours/week)"
        .Range("E22").Value = 3
        .Range("D23").Value = "Pro Usage (hours/week)"
        .Range("E23").Value = 5
        .Range("D24").Value = "Weeks per Month"
        .Range("E24").Value = 4.33

        ' Format all assumption cells as editable (yellow background)
        Dim editableRanges As String
        editableRanges = "B6:B8,B11:B13,B21,B27:B30,E6:E7,E11,E16:E17,E20:E24"
        .Range(editableRanges).Interior.Color = RGB(255, 255, 153)
        .Range(editableRanges).Font.Bold = True

        ' ========================================================================
        ' SECTION 2: MONTHLY CALCULATIONS (Rows 37+)
        ' ========================================================================

        Dim startRow As Integer
        startRow = 37

        .Range("A" & startRow).Value = "MONTHLY PROJECTIONS - 2026"
        .Range("A" & startRow).Font.Bold = True
        .Range("A" & startRow).Font.Size = 12

        startRow = startRow + 2

        ' Column headers for months
        .Range("A" & startRow).Value = "Metric"
        Dim months As Variant
        months = Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

        For i = 0 To 11
            .Cells(startRow, i + 2).Value = months(i)
            .Cells(startRow, i + 2).Font.Bold = True
            .Cells(startRow, i + 2).HorizontalAlignment = xlCenter
        Next i

        Dim r As Integer
        r = startRow + 1

        ' --- FREE TIER CALCULATIONS ---
        .Range("A" & r).Value = "FREE TIER"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        ' Monthly Churn Rate
        .Range("A" & r).Value = "Monthly Churn %"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=$E$6-$E$8*" & (i - 1)
            .Cells(r, monthCol).NumberFormat = "0.0%"
        Next i
        r = r + 1

        ' Beginning Free Users
        .Range("A" & r).Value = "Beginning Free Users"
        .Cells(r, 2).Formula = "=$B$22" ' Jan starts with assumption
        For i = 2 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(r, monthCol - 1).Offset(5, 0).Address(False, False) ' Previous month ending
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0"
        Next i
        r = r + 1

        ' New Free Adds
        .Range("A" & r).Value = "New Free Adds"
        ' Q1 (Jan-Mar)
        For i = 1 To 3
            .Cells(r, i + 1).Formula = "=$B$27*$B$11/3"
        Next i
        ' Q2 (Apr-Jun)
        For i = 4 To 6
            .Cells(r, i + 1).Formula = "=$B$28*$B$11/3"
        Next i
        ' Q3 (Jul-Sep)
        For i = 7 To 9
            .Cells(r, i + 1).Formula = "=$B$29*$B$11/3"
        Next i
        ' Q4 (Oct-Dec)
        For i = 10 To 12
            .Cells(r, i + 1).Formula = "=$B$30*$B$11/3"
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0"
        Next i
        r = r + 1

        ' Churned Free Users
        .Range("A" & r).Value = "Churned Free Users"
        For i = 1 To 12
            monthCol = i + 1
            Dim beginFreeRow As Integer
            beginFreeRow = r - 2
            Dim churnRateRow As Integer
            churnRateRow = r - 3
            .Cells(r, monthCol).Formula = "=" & .Cells(beginFreeRow, monthCol).Address(False, False) & "*" & .Cells(churnRateRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0"
        Next i
        r = r + 1

        ' Conversions to Paid
        .Range("A" & r).Value = "Conversions to Paid"
        For i = 1 To 12
            monthCol = i + 1
            beginFreeRow = r - 3
            .Cells(r, monthCol).Formula = "=" & .Cells(beginFreeRow, monthCol).Address(False, False) & "*$E$11"
            .Cells(r, monthCol).NumberFormat = "0"
        Next i
        r = r + 1

        ' Ending Free Users
        .Range("A" & r).Value = "Ending Free Users"
        For i = 1 To 12
            monthCol = i + 1
            Dim beginRow, newRow, churnRow, convRow As Integer
            beginRow = r - 4
            newRow = r - 3
            churnRow = r - 2
            convRow = r - 1
            .Cells(r, monthCol).Formula = "=" & .Cells(beginRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(newRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(churnRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(convRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0"
        Next i
        r = r + 2

        ' --- ENTRY TIER CALCULATIONS ---
        .Range("A" & r).Value = "ENTRY TIER"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        ' Beginning Entry Users
        .Range("A" & r).Value = "Beginning Entry Users"
        .Cells(r, 2).Formula = "=$B$23" ' Jan starts with assumption
        For i = 2 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(r, monthCol - 1).Offset(5, 0).Address(False, False) ' Previous month ending
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0"
        Next i
        r = r + 1

        ' New Entry Adds
        .Range("A" & r).Value = "New Entry Adds"
        ' Q1 (Jan-Mar)
        For i = 1 To 3
            .Cells(r, i + 1).Formula = "=$B$27*$B$12/3"
        Next i
        ' Q2 (Apr-Jun)
        For i = 4 To 6
            .Cells(r, i + 1).Formula = "=$B$28*$B$12/3"
        Next i
        ' Q3 (Jul-Sep)
        For i = 7 To 9
            .Cells(r, i + 1).Formula = "=$B$29*$B$12/3"
        Next i
        ' Q4 (Oct-Dec)
        For i = 10 To 12
            .Cells(r, i + 1).Formula = "=$B$30*$B$12/3"
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0"
        Next i
        r = r + 1

        ' Churned Entry Users
        .Range("A" & r).Value = "Churned Entry Users"
        For i = 1 To 12
            monthCol = i + 1
            Dim beginEntryRow As Integer
            beginEntryRow = r - 2
            ' Reference the churn rate from Free section (it's the same)
            Dim freeChurnRow As Integer
            freeChurnRow = startRow + 2 ' Row with "Monthly Churn %"
            .Cells(r, monthCol).Formula = "=" & .Cells(beginEntryRow, monthCol).Address(False, False) & "*" & .Cells(freeChurnRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0"
        Next i
        r = r + 1

        ' Conversions from Free
        .Range("A" & r).Value = "Conversions from Free"
        For i = 1 To 12
            monthCol = i + 1
            ' Reference the "Conversions to Paid" row in Free section
            Dim freeConvRow As Integer
            freeConvRow = startRow + 6 ' Row with "Conversions to Paid"
            .Cells(r, monthCol).Formula = "=" & .Cells(freeConvRow, monthCol).Address(False, False) & "*$E$12"
            .Cells(r, monthCol).NumberFormat = "0"
        Next i
        r = r + 1

        ' Ending Entry Users
        .Range("A" & r).Value = "Ending Entry Users"
        For i = 1 To 12
            monthCol = i + 1
            beginRow = r - 4
            newRow = r - 3
            churnRow = r - 2
            convRow = r - 1
            .Cells(r, monthCol).Formula = "=" & .Cells(beginRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(newRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(churnRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(convRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0"
        Next i
        r = r + 2

        ' --- PRO TIER CALCULATIONS ---
        .Range("A" & r).Value = "PRO TIER"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        ' Beginning Pro Users
        .Range("A" & r).Value = "Beginning Pro Users"
        .Cells(r, 2).Formula = "=$B$24" ' Jan starts with assumption
        For i = 2 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(r, monthCol - 1).Offset(5, 0).Address(False, False) ' Previous month ending
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0"
        Next i
        r = r + 1

        ' New Pro Adds
        .Range("A" & r).Value = "New Pro Adds"
        ' Q1 (Jan-Mar)
        For i = 1 To 3
            .Cells(r, i + 1).Formula = "=$B$27*$B$13/3"
        Next i
        ' Q2 (Apr-Jun)
        For i = 4 To 6
            .Cells(r, i + 1).Formula = "=$B$28*$B$13/3"
        Next i
        ' Q3 (Jul-Sep)
        For i = 7 To 9
            .Cells(r, i + 1).Formula = "=$B$29*$B$13/3"
        Next i
        ' Q4 (Oct-Dec)
        For i = 10 To 12
            .Cells(r, i + 1).Formula = "=$B$30*$B$13/3"
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0"
        Next i
        r = r + 1

        ' Churned Pro Users
        .Range("A" & r).Value = "Churned Pro Users"
        For i = 1 To 12
            monthCol = i + 1
            Dim beginProRow As Integer
            beginProRow = r - 2
            freeChurnRow = startRow + 2
            .Cells(r, monthCol).Formula = "=" & .Cells(beginProRow, monthCol).Address(False, False) & "*" & .Cells(freeChurnRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0"
        Next i
        r = r + 1

        ' Conversions from Free
        .Range("A" & r).Value = "Conversions from Free"
        For i = 1 To 12
            monthCol = i + 1
            freeConvRow = startRow + 6
            .Cells(r, monthCol).Formula = "=" & .Cells(freeConvRow, monthCol).Address(False, False) & "*$E$13"
            .Cells(r, monthCol).NumberFormat = "0"
        Next i
        r = r + 1

        ' Ending Pro Users
        .Range("A" & r).Value = "Ending Pro Users"
        For i = 1 To 12
            monthCol = i + 1
            beginRow = r - 4
            newRow = r - 3
            churnRow = r - 2
            convRow = r - 1
            .Cells(r, monthCol).Formula = "=" & .Cells(beginRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(newRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(churnRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(convRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0"
        Next i
        r = r + 2

        ' --- REVENUE CALCULATIONS ---
        .Range("A" & r).Value = "REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(146, 208, 80)
        r = r + 1

        ' Entry MRR
        .Range("A" & r).Value = "Entry MRR"
        Dim endingEntryRow As Integer
        endingEntryRow = startRow + 14 ' Ending Entry Users row
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingEntryRow, monthCol).Address(False, False) & "*$B$7"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Pro MRR
        .Range("A" & r).Value = "Pro MRR"
        Dim endingProRow As Integer
        endingProRow = startRow + 21 ' Ending Pro Users row
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingProRow, monthCol).Address(False, False) & "*$B$8"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Total MRR
        .Range("A" & r).Value = "Total MRR"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(r - 2, monthCol).Address(False, False) & "+" & .Cells(r - 1, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 1

        ' Monthly Revenue (same as MRR for subscription model)
        .Range("A" & r).Value = "Monthly Revenue"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(r - 1, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 2

        ' --- COGS CALCULATIONS ---
        .Range("A" & r).Value = "COGS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 192, 0)
        r = r + 1

        ' Total Users
        .Range("A" & r).Value = "Total Users (Free+Entry+Pro)"
        Dim endingFreeRow As Integer
        endingFreeRow = startRow + 7 ' Ending Free Users row
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingFreeRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(endingEntryRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(endingProRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        r = r + 1

        ' Infrastructure Cost
        .Range("A" & r).Value = "Infrastructure Cost"
        Dim totalUsersRow As Integer
        totalUsersRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalUsersRow, monthCol).Address(False, False) & "/$E$17*$E$16"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Free Usage Hours
        .Range("A" & r).Value = "Free Usage Hours"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingFreeRow, monthCol).Address(False, False) & "*$E$21*$E$24"
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        r = r + 1

        ' Entry Usage Hours
        .Range("A" & r).Value = "Entry Usage Hours"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingEntryRow, monthCol).Address(False, False) & "*$E$22*$E$24"
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        r = r + 1

        ' Pro Usage Hours
        .Range("A" & r).Value = "Pro Usage Hours"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingProRow, monthCol).Address(False, False) & "*$E$23*$E$24"
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        r = r + 1

        ' Total Usage Hours
        .Range("A" & r).Value = "Total Usage Hours"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(r - 3, monthCol).Address(False, False) & "+" & _
                                          .Cells(r - 2, monthCol).Address(False, False) & "+" & _
                                          .Cells(r - 1, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        r = r + 1

        ' Usage Costs
        .Range("A" & r).Value = "Usage Costs"
        Dim totalHoursRow As Integer
        totalHoursRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalHoursRow, monthCol).Address(False, False) & "*$E$20"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Total COGS
        .Range("A" & r).Value = "Total COGS"
        .Range("A" & r).Font.Bold = True
        Dim infraCostRow As Integer
        infraCostRow = r - 6
        Dim usageCostRow As Integer
        usageCostRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(infraCostRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(usageCostRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
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
        Dim revenueRow As Integer
        revenueRow = startRow + 26 ' Monthly Revenue row
        Dim totalCogsRow As Integer
        totalCogsRow = r - 2
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(revenueRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(totalCogsRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 1

        ' Gross Margin %
        .Range("A" & r).Value = "Gross Margin %"
        .Range("A" & r).Font.Bold = True
        Dim grossProfitRow As Integer
        grossProfitRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=IF(" & .Cells(revenueRow, monthCol).Address(False, False) & "=0,0," & _
                                          .Cells(grossProfitRow, monthCol).Address(False, False) & "/" & _
                                          .Cells(revenueRow, monthCol).Address(False, False) & ")"
            .Cells(r, monthCol).NumberFormat = "0.0%"
            .Cells(r, monthCol).Font.Bold = True
        Next i

        ' ========================================================================
        ' SECTION 3: QUARTERLY ROLLUPS
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
        .Range("B" & r & ":F" & r).Font.Bold = True
        .Range("B" & r & ":F" & r).HorizontalAlignment = xlCenter
        r = r + 1

        ' Avg Free Users
        .Range("A" & r).Value = "Avg Free Users"
        .Range("B" & r).Formula = "=AVERAGE(B" & endingFreeRow & ":D" & endingFreeRow & ")"
        .Range("C" & r).Formula = "=AVERAGE(E" & endingFreeRow & ":G" & endingFreeRow & ")"
        .Range("D" & r).Formula = "=AVERAGE(H" & endingFreeRow & ":J" & endingFreeRow & ")"
        .Range("E" & r).Formula = "=AVERAGE(K" & endingFreeRow & ":M" & endingFreeRow & ")"
        .Range("F" & r).Formula = "=AVERAGE(B" & endingFreeRow & ":M" & endingFreeRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "#,##0"
        r = r + 1

        ' Avg Entry Users
        .Range("A" & r).Value = "Avg Entry Users"
        .Range("B" & r).Formula = "=AVERAGE(B" & endingEntryRow & ":D" & endingEntryRow & ")"
        .Range("C" & r).Formula = "=AVERAGE(E" & endingEntryRow & ":G" & endingEntryRow & ")"
        .Range("D" & r).Formula = "=AVERAGE(H" & endingEntryRow & ":J" & endingEntryRow & ")"
        .Range("E" & r).Formula = "=AVERAGE(K" & endingEntryRow & ":M" & endingEntryRow & ")"
        .Range("F" & r).Formula = "=AVERAGE(B" & endingEntryRow & ":M" & endingEntryRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "#,##0"
        r = r + 1

        ' Avg Pro Users
        .Range("A" & r).Value = "Avg Pro Users"
        .Range("B" & r).Formula = "=AVERAGE(B" & endingProRow & ":D" & endingProRow & ")"
        .Range("C" & r).Formula = "=AVERAGE(E" & endingProRow & ":G" & endingProRow & ")"
        .Range("D" & r).Formula = "=AVERAGE(H" & endingProRow & ":J" & endingProRow & ")"
        .Range("E" & r).Formula = "=AVERAGE(K" & endingProRow & ":M" & endingProRow & ")"
        .Range("F" & r).Formula = "=AVERAGE(B" & endingProRow & ":M" & endingProRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "#,##0"
        r = r + 1

        ' Total New Adds
        .Range("A" & r).Value = "Total New Adds"
        .Range("B" & r).Formula = "=$B$27"
        .Range("C" & r).Formula = "=$B$28"
        .Range("D" & r).Formula = "=$B$29"
        .Range("E" & r).Formula = "=$B$30"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "#,##0"
        r = r + 1

        ' Avg Churn %
        .Range("A" & r).Value = "Avg Churn %"
        Dim churnRateRow As Integer
        churnRateRow = startRow + 2
        .Range("B" & r).Formula = "=AVERAGE(B" & churnRateRow & ":D" & churnRateRow & ")"
        .Range("C" & r).Formula = "=AVERAGE(E" & churnRateRow & ":G" & churnRateRow & ")"
        .Range("D" & r).Formula = "=AVERAGE(H" & churnRateRow & ":J" & churnRateRow & ")"
        .Range("E" & r).Formula = "=AVERAGE(K" & churnRateRow & ":M" & churnRateRow & ")"
        .Range("F" & r).Formula = "=AVERAGE(B" & churnRateRow & ":M" & churnRateRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "0.0%"
        r = r + 1

        ' Total Conversions
        .Range("A" & r).Value = "Total Conversions (Free→Paid)"
        freeConvRow = startRow + 6
        .Range("B" & r).Formula = "=SUM(B" & freeConvRow & ":D" & freeConvRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & freeConvRow & ":G" & freeConvRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & freeConvRow & ":J" & freeConvRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & freeConvRow & ":M" & freeConvRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "#,##0"
        r = r + 1

        ' Quarterly Revenue
        .Range("A" & r).Value = "Quarterly Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & revenueRow & ":D" & revenueRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & revenueRow & ":G" & revenueRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & revenueRow & ":J" & revenueRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & revenueRow & ":M" & revenueRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
        r = r + 1

        ' Quarterly COGS
        .Range("A" & r).Value = "Quarterly COGS"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalCogsRow & ":D" & totalCogsRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalCogsRow & ":G" & totalCogsRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalCogsRow & ":J" & totalCogsRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalCogsRow & ":M" & totalCogsRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
        r = r + 1

        ' Gross Profit
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

        ' Gross Margin %
        .Range("A" & r).Value = "Gross Margin %"
        .Range("A" & r).Font.Bold = True
        Dim qRevRow, qGPRow As Integer
        qRevRow = r - 3
        qGPRow = r - 1
        .Range("B" & r).Formula = "=IF(B" & qRevRow & "=0,0,B" & qGPRow & "/B" & qRevRow & ")"
        .Range("C" & r).Formula = "=IF(C" & qRevRow & "=0,0,C" & qGPRow & "/C" & qRevRow & ")"
        .Range("D" & r).Formula = "=IF(D" & qRevRow & "=0,0,D" & qGPRow & "/D" & qRevRow & ")"
        .Range("E" & r).Formula = "=IF(E" & qRevRow & "=0,0,E" & qGPRow & "/E" & qRevRow & ")"
        .Range("F" & r).Formula = "=IF(F" & qRevRow & "=0,0,F" & qGPRow & "/F" & qRevRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "0.0%"
        .Range("B" & r & ":F" & r).Font.Bold = True

        ' ========================================================================
        ' SECTION 4: KPIs SUMMARY
        ' ========================================================================

        r = r + 3
        .Range("A" & r).Value = "KPIs SUMMARY - 2026"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Font.Size = 12
        .Range("A" & r).Interior.Color = RGB(68, 114, 196)
        .Range("A" & r).Font.Color = RGB(255, 255, 255)
        r = r + 2

        ' Starting Users
        .Range("A" & r).Value = "Starting Total Users (Jan 1)"
        .Range("B" & r).Formula = "=$B$21"
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "Ending Total Users (Dec 31)"
        .Range("B" & r).Formula = "=M" & totalUsersRow
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "User Growth %"
        .Range("B" & r).Formula = "=(B" & (r - 1) & "-B" & (r - 2) & ")/B" & (r - 2)
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' Starting Paid Users
        .Range("A" & r).Value = "Starting Paid Users (Jan 1)"
        .Range("B" & r).Formula = "=$B$23+$B$24"
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "Ending Paid Users (Dec 31)"
        .Range("B" & r).Formula = "=M" & endingEntryRow & "+M" & endingProRow
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "Paid User Growth %"
        .Range("B" & r).Formula = "=(B" & (r - 1) & "-B" & (r - 2) & ")/B" & (r - 2)
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' ARR
        .Range("A" & r).Value = "Starting ARR (Jan 1)"
        .Range("B" & r).Formula = "=B" & (startRow + 25) & "*12"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "Ending ARR (Dec 31)"
        .Range("B" & r).Formula = "=M" & (startRow + 25) & "*12"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "ARR Growth %"
        .Range("B" & r).Formula = "=IF(B" & (r - 2) & "=0,0,(B" & (r - 1) & "-B" & (r - 2) & ")/B" & (r - 2) & ")"
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' Blended ARPU
        .Range("A" & r).Value = "Avg MRR per Paid User (Blended ARPU)"
        Dim yearRevRow As Integer
        yearRevRow = r - 10 ' Reference to quarterly rollup 2026 Total revenue
        Dim avgPaidRow As Integer
        .Range("B" & r).Formula = "=AVERAGE(B" & revenueRow & ":M" & revenueRow & ")/(AVERAGE(B" & endingEntryRow & ":M" & endingEntryRow & ")+AVERAGE(B" & endingProRow & ":M" & endingProRow & "))"
        .Range("B" & r).NumberFormat = "$0.00"
        r = r + 2

        ' Total Users Added
        .Range("A" & r).Value = "Total Users Added (2026)"
        .Range("B" & r).Formula = "=$B$27+$B$28+$B$29+$B$30"
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        ' Total Conversions
        .Range("A" & r).Value = "Total Conversions (Free→Paid)"
        .Range("B" & r).Formula = "=SUM(B" & freeConvRow & ":M" & freeConvRow & ")"
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "Conversion Rate %"
        .Range("B" & r).Formula = "=$E$11"
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' Average Churn Rate
        .Range("A" & r).Value = "Average Churn Rate (2026)"
        .Range("B" & r).Formula = "=AVERAGE(B" & churnRateRow & ":M" & churnRateRow & ")"
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' Financial Summary
        .Range("A" & r).Value = "Total Revenue (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & revenueRow & ":M" & revenueRow & ")"
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Total COGS (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalCogsRow & ":M" & totalCogsRow & ")"
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Gross Profit (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=B" & (r - 2) & "-B" & (r - 1)
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Gross Margin % (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=IF(B" & (r - 3) & "=0,0,B" & (r - 1) & "/B" & (r - 3) & ")"
        .Range("B" & r).NumberFormat = "0.0%"
        .Range("B" & r).Font.Bold = True
        r = r + 2

        ' LTV (Simple calculation)
        .Range("A" & r).Value = "LTV (Simple: ARPU / Avg Churn)"
        Dim arpuRowRef, churnRowRef As Integer
        arpuRowRef = r - 14 ' Blended ARPU row
        churnRowRef = r - 6 ' Avg churn rate row
        .Range("B" & r).Formula = "=B" & arpuRowRef & "/B" & churnRowRef
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "Note: CAC requires marketing spend data (not in this product sheet)"
        .Range("A" & r).Font.Italic = True
        .Range("A" & r).Font.Size = 9

        ' ========================================================================
        ' FORMATTING
        ' ========================================================================

        ' Column widths
        .Columns("A:A").ColumnWidth = 35
        .Columns("B:M").ColumnWidth = 12

        ' Freeze panes at row 39 (after assumptions)
        .Activate
        .Range("B39").Select
        ActiveWindow.FreezePanes = True

        ' Add borders to monthly projections
        Dim dataRange As Range
        Set dataRange = .Range("A" & startRow & ":M" & (startRow + 45))
        dataRange.Borders.LineStyle = xlContinuous
        dataRange.Borders.Weight = xlThin

    End With

    Application.ScreenUpdating = True

    MsgBox "Ninja Notes B2C sheet created successfully!", vbInformation

End Sub
