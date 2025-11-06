Option Explicit

' ============================================================================
' Omni Sales Financial Model Generator
' ============================================================================
' This VBA module creates a complete financial model sheet for Omni Sales
' with recurring + one-time revenue, voice/text COGS model, and KPI calculations
' ============================================================================

Sub Create_OmniSales_Sheet()

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim i As Integer
    Dim monthCol As Integer

    ' Create or clear the sheet
    On Error Resume Next
    Set ws = ThisWorkbook.Sheets("Omni Sales")
    If ws Is Nothing Then
        Set ws = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
        ws.Name = "Omni Sales"
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
        .Range("A1").Value = "OMNI SALES - 2026 FINANCIAL MODEL"
        .Range("A1").Font.Bold = True
        .Range("A1").Font.Size = 14

        .Range("A3").Value = "ASSUMPTIONS (Editable - Yellow Cells)"
        .Range("A3").Font.Bold = True
        .Range("A3").Font.Size = 12
        .Range("A3").Interior.Color = RGB(255, 242, 204)

        ' Pricing & Deployment
        .Range("A5").Value = "PRICING & DEPLOYMENT"
        .Range("A5").Font.Bold = True
        .Range("A6").Value = "Price per User ($/mo)"
        .Range("B6").Value = 75
        .Range("B6").NumberFormat = "$0.00"
        .Range("A7").Value = "Users per Customer"
        .Range("B7").Value = 50
        .Range("A8").Value = "MRR per Customer (auto)"
        .Range("B8").Formula = "=B6*B7"
        .Range("B8").NumberFormat = "$#,##0"
        .Range("B8").Font.Italic = True
        .Range("A9").Value = "ARR per Customer (auto)"
        .Range("B9").Formula = "=B8*12"
        .Range("B9").NumberFormat = "$#,##0"
        .Range("B9").Font.Italic = True
        .Range("A10").Value = "Contract Term (reference)"
        .Range("B10").Value = "2-3 years (billed monthly)"
        .Range("B10").Font.Italic = True

        ' Customer Acquisition
        .Range("A12").Value = "CUSTOMER ACQUISITION"
        .Range("A12").Font.Bold = True
        .Range("A13").Value = "Starting Customers (Jan 1, 2026)"
        .Range("B13").Value = 0
        .Range("A14").Value = "Q1 New Customers"
        .Range("B14").Value = 4
        .Range("A15").Value = "Q2 New Customers"
        .Range("B15").Value = 4
        .Range("A16").Value = "Q3 New Customers"
        .Range("B16").Value = 5
        .Range("A17").Value = "Q4 New Customers"
        .Range("B17").Value = 6

        .Range("A19").Value = "Total New Customers (2026)"
        .Range("B19").Formula = "=B14+B15+B16+B17"
        .Range("B19").Font.Bold = True

        ' One-Time Revenue
        .Range("A21").Value = "ONE-TIME REVENUE (100% attach)"
        .Range("A21").Font.Bold = True
        .Range("A22").Value = "Implementation Services per Customer"
        .Range("B22").Value = 15000
        .Range("B22").NumberFormat = "$#,##0"
        .Range("A23").Value = "One-Time Add-ons per Customer"
        .Range("B23").Value = 10000
        .Range("B23").NumberFormat = "$#,##0"
        .Range("A24").Value = "Total One-Time per Customer"
        .Range("B24").Formula = "=B22+B23"
        .Range("B24").NumberFormat = "$#,##0"
        .Range("B24").Font.Bold = True

        ' Churn
        .Range("D5").Value = "CHURN & RETENTION"
        .Range("D5").Font.Bold = True
        .Range("D6").Value = "Monthly Customer Churn %"
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

        ' COGS - Voice & Text Usage
        .Range("D13").Value = "COGS - VOICE & TEXT USAGE"
        .Range("D13").Font.Bold = True
        .Range("D14").Value = "Voice Cost per Hour"
        .Range("E14").Value = 4
        .Range("E14").NumberFormat = "$0.00"
        .Range("D15").Value = "Voice Usage (hours/week/user)"
        .Range("E15").Value = 1
        .Range("D16").Value = "Text Cost per Hour"
        .Range("E16").Value = 0.2
        .Range("E16").NumberFormat = "$0.00"
        .Range("D17").Value = "Text Usage (hours/week/user)"
        .Range("E17").Value = 5
        .Range("D18").Value = "Weeks per Month"
        .Range("E18").Value = 4.33

        ' Format all assumption cells as editable (yellow background)
        Dim editableRanges As String
        editableRanges = "B6:B7,B13:B17,B22:B23,E6,E10:E11,E14:E18"
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

        ' --- CUSTOMER & USER TRACKING ---
        .Range("A" & r).Value = "CUSTOMER & USER TRACKING"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        ' Beginning Customers
        .Range("A" & r).Value = "Beginning Customers"
        .Cells(r, 2).Formula = "=$B$13" ' Jan starts with assumption (0)
        For i = 2 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(r, monthCol - 1).Offset(3, 0).Address(False, False) ' Previous month ending
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0.0"
        Next i
        r = r + 1

        ' New Customers Added
        .Range("A" & r).Value = "New Customers Added"
        ' Q1 (Jan-Mar)
        For i = 1 To 3
            .Cells(r, i + 1).Formula = "=$B$14/3"
        Next i
        ' Q2 (Apr-Jun)
        For i = 4 To 6
            .Cells(r, i + 1).Formula = "=$B$15/3"
        Next i
        ' Q3 (Jul-Sep)
        For i = 7 To 9
            .Cells(r, i + 1).Formula = "=$B$16/3"
        Next i
        ' Q4 (Oct-Dec)
        For i = 10 To 12
            .Cells(r, i + 1).Formula = "=$B$17/3"
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0.00"
        Next i
        r = r + 1

        ' Churned Customers
        .Range("A" & r).Value = "Churned Customers"
        Dim beginCustomersRow As Integer
        beginCustomersRow = r - 2
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(beginCustomersRow, monthCol).Address(False, False) & "*$E$6"
            .Cells(r, monthCol).NumberFormat = "0.00"
        Next i
        r = r + 1

        ' Ending Customers
        .Range("A" & r).Value = "Ending Customers"
        Dim newCustomersRow, churnCustomersRow As Integer
        newCustomersRow = r - 2
        churnCustomersRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(beginCustomersRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(newCustomersRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(churnCustomersRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0.0"
        Next i
        r = r + 1

        ' Total Users
        .Range("A" & r).Value = "Total Users"
        .Range("A" & r).Font.Bold = True
        Dim endingCustomersRow As Integer
        endingCustomersRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingCustomersRow, monthCol).Address(False, False) & "*$B$7"
            .Cells(r, monthCol).NumberFormat = "#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 2

        ' --- RECURRING REVENUE ---
        .Range("A" & r).Value = "RECURRING REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(146, 208, 80)
        r = r + 1

        ' MRR
        .Range("A" & r).Value = "MRR (Users × $75)"
        .Range("A" & r).Font.Bold = True
        Dim totalUsersRow As Integer
        totalUsersRow = r - 3
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalUsersRow, monthCol).Address(False, False) & "*$B$6"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 1

        ' Monthly Recurring Revenue
        .Range("A" & r).Value = "Monthly Recurring Revenue"
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

        ' --- ONE-TIME REVENUE ---
        .Range("A" & r).Value = "ONE-TIME REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 217, 102)
        r = r + 1

        ' New Customers This Month (for one-time revenue)
        .Range("A" & r).Value = "New Customers This Month"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(newCustomersRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0.00"
        Next i
        r = r + 1

        ' Implementation Revenue
        .Range("A" & r).Value = "Implementation Revenue"
        Dim newCustThisMonthRow As Integer
        newCustThisMonthRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(newCustThisMonthRow, monthCol).Address(False, False) & "*$B$22"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Add-on Revenue
        .Range("A" & r).Value = "Add-on Revenue"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(newCustThisMonthRow, monthCol).Address(False, False) & "*$B$23"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Total One-Time Revenue
        .Range("A" & r).Value = "Total One-Time Revenue"
        .Range("A" & r).Font.Bold = True
        Dim implRevRow, addonRevRow As Integer
        implRevRow = r - 2
        addonRevRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(implRevRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(addonRevRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 2

        ' --- TOTAL REVENUE ---
        .Range("A" & r).Value = "TOTAL REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(112, 173, 71)
        .Range("A" & r).Font.Color = RGB(255, 255, 255)
        r = r + 1

        ' Monthly Total Revenue
        .Range("A" & r).Value = "Monthly Total Revenue"
        .Range("A" & r).Font.Bold = True
        Dim recurRevRow, oneTimeRevRow As Integer
        recurRevRow = startRow + 10 ' Monthly Recurring Revenue
        oneTimeRevRow = r - 2 ' Total One-Time Revenue
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(recurRevRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(oneTimeRevRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 2

        ' --- COGS CALCULATIONS ---
        .Range("A" & r).Value = "COGS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 192, 0)
        r = r + 1

        ' Total Users (reference)
        .Range("A" & r).Value = "Total Users"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalUsersRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        r = r + 1

        ' Infrastructure Cost
        .Range("A" & r).Value = "Infrastructure Cost"
        Dim totalUsersRefRow As Integer
        totalUsersRefRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalUsersRefRow, monthCol).Address(False, False) & "/$E$11*$E$10"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Voice Hours
        .Range("A" & r).Value = "Voice Hours"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalUsersRefRow, monthCol).Address(False, False) & "*$E$15*$E$18"
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        r = r + 1

        ' Voice Costs
        .Range("A" & r).Value = "Voice Costs"
        Dim voiceHoursRow As Integer
        voiceHoursRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(voiceHoursRow, monthCol).Address(False, False) & "*$E$14"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Text Hours
        .Range("A" & r).Value = "Text Hours"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalUsersRefRow, monthCol).Address(False, False) & "*$E$17*$E$18"
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        r = r + 1

        ' Text Costs
        .Range("A" & r).Value = "Text Costs"
        Dim textHoursRow As Integer
        textHoursRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(textHoursRow, monthCol).Address(False, False) & "*$E$16"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Total Usage Costs
        .Range("A" & r).Value = "Total Usage Costs (Voice + Text)"
        Dim voiceCostRow, textCostRow As Integer
        voiceCostRow = r - 3
        textCostRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(voiceCostRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(textCostRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Total COGS
        .Range("A" & r).Value = "Total COGS"
        .Range("A" & r).Font.Bold = True
        Dim infraCostRow, totalUsageCostRow As Integer
        infraCostRow = r - 7
        totalUsageCostRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(infraCostRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(totalUsageCostRow, monthCol).Address(False, False)
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
        Dim totalRevenueRow As Integer
        totalRevenueRow = startRow + 20 ' Monthly Total Revenue
        Dim totalCogsRow As Integer
        totalCogsRow = r - 2
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalRevenueRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(totalCogsRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 1

        ' Gross Margin %
        .Range("A" & r).Value = "Gross Margin % (Blended)"
        .Range("A" & r).Font.Bold = True
        Dim grossProfitRow As Integer
        grossProfitRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=IF(" & .Cells(totalRevenueRow, monthCol).Address(False, False) & "=0,0," & _
                                          .Cells(grossProfitRow, monthCol).Address(False, False) & "/" & _
                                          .Cells(totalRevenueRow, monthCol).Address(False, False) & ")"
            .Cells(r, monthCol).NumberFormat = "0.0%"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 1

        ' Recurring-Only Margin %
        .Range("A" & r).Value = "Recurring-Only Margin %"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=IF(" & .Cells(recurRevRow, monthCol).Address(False, False) & "=0,0," & _
                                          "(" & .Cells(recurRevRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(totalCogsRow, monthCol).Address(False, False) & ")/" & _
                                          .Cells(recurRevRow, monthCol).Address(False, False) & ")"
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

        ' Avg Customers
        .Range("A" & r).Value = "Avg Customers"
        .Range("B" & r).Formula = "=AVERAGE(B" & endingCustomersRow & ":D" & endingCustomersRow & ")"
        .Range("C" & r).Formula = "=AVERAGE(E" & endingCustomersRow & ":G" & endingCustomersRow & ")"
        .Range("D" & r).Formula = "=AVERAGE(H" & endingCustomersRow & ":J" & endingCustomersRow & ")"
        .Range("E" & r).Formula = "=AVERAGE(K" & endingCustomersRow & ":M" & endingCustomersRow & ")"
        .Range("F" & r).Formula = "=AVERAGE(B" & endingCustomersRow & ":M" & endingCustomersRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "0.0"
        r = r + 1

        ' Avg Users
        .Range("A" & r).Value = "Avg Users"
        .Range("B" & r).Formula = "=AVERAGE(B" & totalUsersRow & ":D" & totalUsersRow & ")"
        .Range("C" & r).Formula = "=AVERAGE(E" & totalUsersRow & ":G" & totalUsersRow & ")"
        .Range("D" & r).Formula = "=AVERAGE(H" & totalUsersRow & ":J" & totalUsersRow & ")"
        .Range("E" & r).Formula = "=AVERAGE(K" & totalUsersRow & ":M" & totalUsersRow & ")"
        .Range("F" & r).Formula = "=AVERAGE(B" & totalUsersRow & ":M" & totalUsersRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "#,##0"
        r = r + 1

        ' New Customers Added
        .Range("A" & r).Value = "New Customers Added"
        .Range("B" & r).Formula = "=$B$14"
        .Range("C" & r).Formula = "=$B$15"
        .Range("D" & r).Formula = "=$B$16"
        .Range("E" & r).Formula = "=$B$17"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "0"
        r = r + 1

        ' Total Recurring Revenue
        .Range("A" & r).Value = "Total Recurring Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & recurRevRow & ":D" & recurRevRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & recurRevRow & ":G" & recurRevRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & recurRevRow & ":J" & recurRevRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & recurRevRow & ":M" & recurRevRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Total One-Time Revenue
        .Range("A" & r).Value = "Total One-Time Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & oneTimeRevRow & ":D" & oneTimeRevRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & oneTimeRevRow & ":G" & oneTimeRevRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & oneTimeRevRow & ":J" & oneTimeRevRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & oneTimeRevRow & ":M" & oneTimeRevRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        r = r + 1

        ' Total Revenue
        .Range("A" & r).Value = "Total Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=B" & (r - 2) & "+B" & (r - 1)
        .Range("C" & r).Formula = "=C" & (r - 2) & "+C" & (r - 1)
        .Range("D" & r).Formula = "=D" & (r - 2) & "+D" & (r - 1)
        .Range("E" & r).Formula = "=E" & (r - 2) & "+E" & (r - 1)
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "$#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
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
        .Range("A" & r).Value = "Gross Margin % (Blended)"
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
        r = r + 1

        ' Recurring-Only Margin %
        .Range("A" & r).Value = "Recurring-Only Margin %"
        .Range("A" & r).Font.Bold = True
        Dim qRecurRevRow, qCogsRow As Integer
        qRecurRevRow = r - 7
        qCogsRow = r - 4
        .Range("B" & r).Formula = "=IF(B" & qRecurRevRow & "=0,0,(B" & qRecurRevRow & "-B" & qCogsRow & ")/B" & qRecurRevRow & ")"
        .Range("C" & r).Formula = "=IF(C" & qRecurRevRow & "=0,0,(C" & qRecurRevRow & "-C" & qCogsRow & ")/C" & qRecurRevRow & ")"
        .Range("D" & r).Formula = "=IF(D" & qRecurRevRow & "=0,0,(D" & qRecurRevRow & "-D" & qCogsRow & ")/D" & qRecurRevRow & ")"
        .Range("E" & r).Formula = "=IF(E" & qRecurRevRow & "=0,0,(E" & qRecurRevRow & "-E" & qCogsRow & ")/E" & qRecurRevRow & ")"
        .Range("F" & r).Formula = "=IF(F" & qRecurRevRow & "=0,0,(F" & qRecurRevRow & "-F" & qCogsRow & ")/F" & qRecurRevRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "0.0%"

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

        .Range("A" & r).Value = "Starting Customers (Jan 1)"
        .Range("B" & r).Formula = "=$B$13"
        .Range("B" & r).NumberFormat = "0"
        r = r + 1

        .Range("A" & r).Value = "Ending Customers (Dec 31)"
        .Range("B" & r).Formula = "=M" & endingCustomersRow
        .Range("B" & r).NumberFormat = "0.0"
        r = r + 1

        .Range("A" & r).Value = "Customer Growth"
        .Range("B" & r).Formula = "=B" & (r - 1) & "-B" & (r - 2)
        .Range("B" & r).NumberFormat = "0.0"
        r = r + 1

        .Range("A" & r).Value = "Customer Growth %"
        .Range("B" & r).Formula = "=IF(B" & (r - 3) & "=0,""N/A"",(B" & (r - 2) & "-B" & (r - 3) & ")/B" & (r - 3) & ")"
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

        .Range("A" & r).Value = "Avg MRR per Customer"
        .Range("B" & r).Formula = "=$B$8"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "Avg Users per Customer"
        .Range("B" & r).Formula = "=$B$7"
        .Range("B" & r).NumberFormat = "0"
        r = r + 1

        .Range("A" & r).Value = "Avg MRR per User"
        .Range("B" & r).Formula = "=$B$6"
        .Range("B" & r).NumberFormat = "$0.00"
        r = r + 1

        .Range("A" & r).Value = "Avg One-Time Revenue per Customer"
        .Range("B" & r).Formula = "=$B$24"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 2

        ' --- REVENUE MIX ---
        .Range("A" & r).Value = "REVENUE MIX"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        Dim yearRecurRevRow, yearOneTimeRevRow, yearTotalRevRow As Integer
        yearRecurRevRow = r + 1  ' Will reference quarterly rollup
        yearOneTimeRevRow = r + 2
        yearTotalRevRow = r + 3

        .Range("A" & r).Value = "Total Recurring Revenue (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & recurRevRow & ":M" & recurRevRow & ")"
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Total One-Time Revenue (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & oneTimeRevRow & ":M" & oneTimeRevRow & ")"
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Total Revenue (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=B" & (r - 2) & "+B" & (r - 1)
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "% Recurring"
        .Range("B" & r).Formula = "=B" & (r - 3) & "/B" & (r - 1)
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 1

        .Range("A" & r).Value = "% One-Time"
        .Range("B" & r).Formula = "=B" & (r - 3) & "/B" & (r - 2)
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' --- CHURN & RETENTION ---
        .Range("A" & r).Value = "CHURN & RETENTION"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Monthly Customer Churn %"
        .Range("B" & r).Formula = "=$E$6"
        .Range("B" & r).NumberFormat = "0.00%"
        r = r + 1

        .Range("A" & r).Value = "Total Customers Added (2026)"
        .Range("B" & r).Formula = "=$B$19"
        .Range("B" & r).NumberFormat = "0"
        r = r + 1

        .Range("A" & r).Value = "Total Customers Churned (2026)"
        .Range("B" & r).Formula = "=SUM(B" & churnCustomersRow & ":M" & churnCustomersRow & ")"
        .Range("B" & r).NumberFormat = "0.00"
        r = r + 2

        ' --- PROFITABILITY ---
        .Range("A" & r).Value = "PROFITABILITY"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Total COGS (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalCogsRow & ":M" & totalCogsRow & ")"
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Gross Profit (2026)"
        .Range("A" & r).Font.Bold = True
        Dim yearTotRevRef As Integer
        yearTotRevRef = r - 19  ' Total Revenue (2026) from revenue mix section
        .Range("B" & r).Formula = "=B" & yearTotRevRef & "-B" & (r - 1)
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Gross Margin % (Blended)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=IF(B" & (r - 2) & "=0,0,B" & (r - 1) & "/B" & (r - 2) & ")"
        .Range("B" & r).NumberFormat = "0.0%"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Recurring-Only Margin %"
        .Range("A" & r).Font.Bold = True
        Dim yearRecurRevRef, yearCogsRef As Integer
        yearRecurRevRef = r - 22  ' Total Recurring Revenue from revenue mix
        yearCogsRef = r - 3
        .Range("B" & r).Formula = "=IF(B" & yearRecurRevRef & "=0,0,(B" & yearRecurRevRef & "-B" & yearCogsRef & ")/B" & yearRecurRevRef & ")"
        .Range("B" & r).NumberFormat = "0.0%"
        .Range("B" & r).Font.Bold = True
        r = r + 2

        ' LTV
        .Range("A" & r).Value = "LTV per Customer (MRR/Churn)"
        Dim mrrPerCustRef, churnRef As Integer
        mrrPerCustRef = r - 32  ' Avg MRR per Customer from unit economics
        churnRef = r - 7  ' Monthly churn %
        .Range("B" & r).Formula = "=B" & mrrPerCustRef & "/B" & churnRef
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "Note: CAC requires marketing spend data (not in this product sheet)"
        .Range("A" & r).Font.Italic = True
        .Range("A" & r).Font.Size = 9

        ' ========================================================================
        ' FORMATTING
        ' ========================================================================

        ' Column widths
        .Columns("A:A").ColumnWidth = 40
        .Columns("B:M").ColumnWidth = 13

        ' Freeze panes
        .Activate
        .Range("B39").Select
        ActiveWindow.FreezePanes = True

        ' Add borders to monthly projections
        Dim dataRange As Range
        Set dataRange = .Range("A" & startRow & ":M" & (startRow + 40))
        dataRange.Borders.LineStyle = xlContinuous
        dataRange.Borders.Weight = xlThin

    End With

    Application.ScreenUpdating = True

    MsgBox "Omni Sales sheet created successfully!", vbInformation

End Sub
