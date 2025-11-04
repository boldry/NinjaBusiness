Option Explicit

' ============================================================================
' Ninja Notes Enterprise Financial Model Generator
' ============================================================================
' This VBA module creates a complete financial model sheet for Ninja Notes Enterprise
' with editable assumptions, monthly projections, and KPI calculations
' ============================================================================

Sub Create_NinjaNotesEnterprise_Sheet()

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim i As Integer
    Dim monthCol As Integer

    ' Create or clear the sheet
    On Error Resume Next
    Set ws = ThisWorkbook.Sheets("Ninja Notes Enterprise")
    If ws Is Nothing Then
        Set ws = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
        ws.Name = "Ninja Notes Enterprise"
    Else
        ws.Cells.Clear
    End If
    On Error GoTo 0

    Application.ScreenUpdating = False

    ' ========================================================================
    ' SECTION 1: ASSUMPTIONS (Rows 1-30)
    ' ========================================================================

    With ws
        ' Header
        .Range("A1").Value = "NINJA NOTES ENTERPRISE - 2026 FINANCIAL MODEL"
        .Range("A1").Font.Bold = True
        .Range("A1").Font.Size = 14

        .Range("A3").Value = "ASSUMPTIONS (Editable - Yellow Cells)"
        .Range("A3").Font.Bold = True
        .Range("A3").Font.Size = 12
        .Range("A3").Interior.Color = RGB(255, 242, 204)

        ' Pricing & Deployment
        .Range("A5").Value = "PRICING & DEPLOYMENT"
        .Range("A5").Font.Bold = True
        .Range("A6").Value = "Price per Seat ($/mo)"
        .Range("B6").Value = 35
        .Range("B6").NumberFormat = "$0.00"
        .Range("A7").Value = "Average Seats per New Logo"
        .Range("B7").Value = 400
        .Range("A8").Value = "Contract Term (reference)"
        .Range("B8").Value = "1-2 years (billed monthly)"
        .Range("B8").Font.Italic = True

        ' Logo Acquisition
        .Range("A10").Value = "LOGO ACQUISITION"
        .Range("A10").Font.Bold = True
        .Range("A11").Value = "Starting Logos (Jan 1, 2026)"
        .Range("B11").Value = 0
        .Range("A12").Value = "Q1 New Logos"
        .Range("B12").Value = 2
        .Range("A13").Value = "Q2 New Logos"
        .Range("B13").Value = 2
        .Range("A14").Value = "Q3 New Logos"
        .Range("B14").Value = 3
        .Range("A15").Value = "Q4 New Logos"
        .Range("B15").Value = 4

        .Range("A17").Value = "Total New Logos (2026)"
        .Range("B17").Formula = "=B12+B13+B14+B15"
        .Range("B17").Font.Bold = True

        ' Churn
        .Range("D5").Value = "CHURN & RETENTION"
        .Range("D5").Font.Bold = True
        .Range("D6").Value = "Monthly Logo Churn %"
        .Range("E6").Value = 0.005
        .Range("E6").NumberFormat = "0.00%"
        .Range("D7").Value = "Annual Churn % (reference)"
        .Range("E7").Formula = "=1-(1-E6)^12"
        .Range("E7").NumberFormat = "0.0%"
        .Range("E7").Font.Italic = True

        ' COGS - Infrastructure
        .Range("D9").Value = "COGS - INFRASTRUCTURE"
        .Range("D9").Font.Bold = True
        .Range("D10").Value = "Server Cost per 5,000 users"
        .Range("E10").Value = 1600
        .Range("E10").NumberFormat = "$#,##0.00"
        .Range("D11").Value = "Users per Server Tier"
        .Range("E11").Value = 5000

        ' COGS - Model Usage
        .Range("D13").Value = "COGS - MODEL USAGE"
        .Range("D13").Font.Bold = True
        .Range("D14").Value = "Cost per Usage Hour"
        .Range("E14").Value = 0.55
        .Range("E14").NumberFormat = "$0.00"
        .Range("D15").Value = "Enterprise Usage (hours/week/seat)"
        .Range("E15").Value = 5
        .Range("D16").Value = "Weeks per Month"
        .Range("E16").Value = 4.33

        ' Format all assumption cells as editable (yellow background)
        Dim editableRanges As String
        editableRanges = "B6:B7,B11:B15,E6,E10:E11,E14:E16"
        .Range(editableRanges).Interior.Color = RGB(255, 255, 153)
        .Range(editableRanges).Font.Bold = True

        ' ========================================================================
        ' SECTION 2: MONTHLY CALCULATIONS (Rows 32+)
        ' ========================================================================

        Dim startRow As Integer
        startRow = 32

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

        ' --- LOGO & SEAT TRACKING ---
        .Range("A" & r).Value = "LOGO & SEAT TRACKING"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        ' Beginning Logos
        .Range("A" & r).Value = "Beginning Logos"
        .Cells(r, 2).Formula = "=$B$11" ' Jan starts with assumption (0)
        For i = 2 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(r, monthCol - 1).Offset(3, 0).Address(False, False) ' Previous month ending
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0"
        Next i
        r = r + 1

        ' New Logos Added
        .Range("A" & r).Value = "New Logos Added"
        ' Q1 (Jan-Mar)
        For i = 1 To 3
            .Cells(r, i + 1).Formula = "=$B$12/3"
        Next i
        ' Q2 (Apr-Jun)
        For i = 4 To 6
            .Cells(r, i + 1).Formula = "=$B$13/3"
        Next i
        ' Q3 (Jul-Sep)
        For i = 7 To 9
            .Cells(r, i + 1).Formula = "=$B$14/3"
        Next i
        ' Q4 (Oct-Dec)
        For i = 10 To 12
            .Cells(r, i + 1).Formula = "=$B$15/3"
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0.0"
        Next i
        r = r + 1

        ' Churned Logos
        .Range("A" & r).Value = "Churned Logos"
        Dim beginLogosRow As Integer
        beginLogosRow = r - 2
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(beginLogosRow, monthCol).Address(False, False) & "*$E$6"
            .Cells(r, monthCol).NumberFormat = "0.00"
        Next i
        r = r + 1

        ' Ending Logos
        .Range("A" & r).Value = "Ending Logos"
        Dim newLogosRow, churnLogosRow As Integer
        newLogosRow = r - 2
        churnLogosRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(beginLogosRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(newLogosRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(churnLogosRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0.0"
        Next i
        r = r + 1

        ' Total Seats
        .Range("A" & r).Value = "Total Seats"
        .Range("A" & r).Font.Bold = True
        Dim endingLogosRow As Integer
        endingLogosRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingLogosRow, monthCol).Address(False, False) & "*$B$7"
            .Cells(r, monthCol).NumberFormat = "#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 2

        ' --- REVENUE CALCULATIONS ---
        .Range("A" & r).Value = "REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(146, 208, 80)
        r = r + 1

        ' MRR
        .Range("A" & r).Value = "MRR (Total Seats × Price)"
        .Range("A" & r).Font.Bold = True
        Dim totalSeatsRow As Integer
        totalSeatsRow = r - 3
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalSeatsRow, monthCol).Address(False, False) & "*$B$6"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 1

        ' Monthly Revenue (same as MRR for subscription model)
        .Range("A" & r).Value = "Monthly Revenue"
        .Range("A" & r).Font.Bold = True
        Dim mrrRow As Integer
        mrrRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(mrrRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 2

        ' --- COGS CALCULATIONS ---
        .Range("A" & r).Value = "COGS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 192, 0)
        r = r + 1

        ' Total Users (same as seats)
        .Range("A" & r).Value = "Total Users (Seats)"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalSeatsRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        r = r + 1

        ' Infrastructure Cost
        .Range("A" & r).Value = "Infrastructure Cost"
        Dim totalUsersRow As Integer
        totalUsersRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalUsersRow, monthCol).Address(False, False) & "/$E$11*$E$10"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Usage Hours
        .Range("A" & r).Value = "Usage Hours"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalUsersRow, monthCol).Address(False, False) & "*$E$15*$E$16"
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        r = r + 1

        ' Usage Costs
        .Range("A" & r).Value = "Usage Costs"
        Dim usageHoursRow As Integer
        usageHoursRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(usageHoursRow, monthCol).Address(False, False) & "*$E$14"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Total COGS
        .Range("A" & r).Value = "Total COGS"
        .Range("A" & r).Font.Bold = True
        Dim infraCostRow, usageCostRow As Integer
        infraCostRow = r - 3
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
        revenueRow = startRow + 9 ' Monthly Revenue row
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

        ' Avg Logos
        .Range("A" & r).Value = "Avg Logos"
        .Range("B" & r).Formula = "=AVERAGE(B" & endingLogosRow & ":D" & endingLogosRow & ")"
        .Range("C" & r).Formula = "=AVERAGE(E" & endingLogosRow & ":G" & endingLogosRow & ")"
        .Range("D" & r).Formula = "=AVERAGE(H" & endingLogosRow & ":J" & endingLogosRow & ")"
        .Range("E" & r).Formula = "=AVERAGE(K" & endingLogosRow & ":M" & endingLogosRow & ")"
        .Range("F" & r).Formula = "=AVERAGE(B" & endingLogosRow & ":M" & endingLogosRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "0.0"
        r = r + 1

        ' Avg Total Seats
        .Range("A" & r).Value = "Avg Total Seats"
        .Range("B" & r).Formula = "=AVERAGE(B" & totalSeatsRow & ":D" & totalSeatsRow & ")"
        .Range("C" & r).Formula = "=AVERAGE(E" & totalSeatsRow & ":G" & totalSeatsRow & ")"
        .Range("D" & r).Formula = "=AVERAGE(H" & totalSeatsRow & ":J" & totalSeatsRow & ")"
        .Range("E" & r).Formula = "=AVERAGE(K" & totalSeatsRow & ":M" & totalSeatsRow & ")"
        .Range("F" & r).Formula = "=AVERAGE(B" & totalSeatsRow & ":M" & totalSeatsRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "#,##0"
        r = r + 1

        ' New Logos Added
        .Range("A" & r).Value = "New Logos Added"
        .Range("B" & r).Formula = "=$B$12"
        .Range("C" & r).Formula = "=$B$13"
        .Range("D" & r).Formula = "=$B$14"
        .Range("E" & r).Formula = "=$B$15"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "0"
        r = r + 1

        ' Avg Churn %
        .Range("A" & r).Value = "Monthly Churn %"
        .Range("B" & r).Formula = "=$E$6"
        .Range("C" & r).Formula = "=$E$6"
        .Range("D" & r).Formula = "=$E$6"
        .Range("E" & r).Formula = "=$E$6"
        .Range("F" & r).Formula = "=$E$6"
        .Range("B" & r & ":F" & r).NumberFormat = "0.00%"
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

        ' --- GROWTH METRICS ---
        .Range("A" & r).Value = "GROWTH METRICS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        ' Starting Logos
        .Range("A" & r).Value = "Starting Logos (Jan 1)"
        .Range("B" & r).Formula = "=$B$11"
        .Range("B" & r).NumberFormat = "0"
        r = r + 1

        .Range("A" & r).Value = "Ending Logos (Dec 31)"
        .Range("B" & r).Formula = "=M" & endingLogosRow
        .Range("B" & r).NumberFormat = "0.0"
        r = r + 1

        .Range("A" & r).Value = "Logo Growth"
        .Range("B" & r).Formula = "=B" & (r - 1) & "-B" & (r - 2)
        .Range("B" & r).NumberFormat = "0.0"
        r = r + 1

        .Range("A" & r).Value = "Logo Growth %"
        .Range("B" & r).Formula = "=IF(B" & (r - 3) & "=0,""N/A"",(B" & (r - 2) & "-B" & (r - 3) & ")/B" & (r - 3) & ")"
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' Starting/Ending Seats
        .Range("A" & r).Value = "Starting Seats (Jan 1)"
        .Range("B" & r).Formula = "=B" & totalSeatsRow
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "Ending Seats (Dec 31)"
        .Range("B" & r).Formula = "=M" & totalSeatsRow
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "Seat Growth %"
        .Range("B" & r).Formula = "=IF(B" & (r - 2) & "=0,""N/A"",(B" & (r - 1) & "-B" & (r - 2) & ")/B" & (r - 2) & ")"
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' ARR
        .Range("A" & r).Value = "Starting ARR (Jan 1)"
        .Range("B" & r).Formula = "=B" & mrrRow & "*12"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "Ending ARR (Dec 31)"
        .Range("B" & r).Formula = "=M" & mrrRow & "*12"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "ARR Growth %"
        .Range("B" & r).Formula = "=IF(B" & (r - 2) & "=0,""N/A"",(B" & (r - 1) & "-B" & (r - 2) & ")/B" & (r - 2) & ")"
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' --- UNIT ECONOMICS ---
        .Range("A" & r).Value = "UNIT ECONOMICS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Avg MRR per Logo"
        .Range("B" & r).Formula = "=AVERAGE(B" & mrrRow & ":M" & mrrRow & ")/AVERAGE(B" & endingLogosRow & ":M" & endingLogosRow & ")"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "Avg Seats per Logo"
        .Range("B" & r).Formula = "=$B$7"
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "Avg MRR per Seat"
        .Range("B" & r).Formula = "=$B$6"
        .Range("B" & r).NumberFormat = "$0.00"
        r = r + 2

        ' --- CHURN & RETENTION ---
        .Range("A" & r).Value = "CHURN & RETENTION"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Monthly Logo Churn %"
        .Range("B" & r).Formula = "=$E$6"
        .Range("B" & r).NumberFormat = "0.00%"
        r = r + 1

        .Range("A" & r).Value = "Annual Logo Churn % (implied)"
        .Range("B" & r).Formula = "=$E$7"
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 1

        .Range("A" & r).Value = "Total Logos Added (2026)"
        .Range("B" & r).Formula = "=$B$17"
        .Range("B" & r).NumberFormat = "0"
        r = r + 1

        .Range("A" & r).Value = "Total Logos Churned (2026)"
        .Range("B" & r).Formula = "=SUM(B" & churnLogosRow & ":M" & churnLogosRow & ")"
        .Range("B" & r).NumberFormat = "0.00"
        r = r + 2

        ' --- FINANCIAL SUMMARY ---
        .Range("A" & r).Value = "FINANCIAL SUMMARY"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

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
        .Range("A" & r).Value = "LTV per Logo (Simple: MRR/Logo / Churn)"
        Dim mrrPerLogoRow, churnRateRef As Integer
        mrrPerLogoRow = r - 14 ' Avg MRR per Logo
        churnRateRef = r - 9 ' Monthly logo churn %
        .Range("B" & r).Formula = "=B" & mrrPerLogoRow & "/B" & churnRateRef
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

        ' Freeze panes at row 34 (after assumptions)
        .Activate
        .Range("B34").Select
        ActiveWindow.FreezePanes = True

        ' Add borders to monthly projections
        Dim dataRange As Range
        Set dataRange = .Range("A" & startRow & ":M" & (startRow + 22))
        dataRange.Borders.LineStyle = xlContinuous
        dataRange.Borders.Weight = xlThin

    End With

    Application.ScreenUpdating = True

    MsgBox "Ninja Notes Enterprise sheet created successfully!", vbInformation

End Sub
