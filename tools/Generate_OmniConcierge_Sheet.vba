Option Explicit

' ============================================================================
' Omni Concierge Financial Model Generator
' ============================================================================
' This VBA module creates a complete financial model for Omni Concierge
' with vendor subscriptions, usage revenue, full-show deployments, and talk-hour COGS
' ============================================================================

Sub Create_OmniConcierge_Sheet()

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim i As Integer
    Dim monthCol As Integer

    ' Create or clear the sheet
    On Error Resume Next
    Set ws = ThisWorkbook.Sheets("Omni Concierge")
    If ws Is Nothing Then
        Set ws = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
        ws.Name = "Omni Concierge"
    Else
        ws.Cells.Clear
    End If
    On Error GoTo 0

    Application.ScreenUpdating = False

    ' ========================================================================
    ' SECTION 1: ASSUMPTIONS (Rows 1-50)
    ' ========================================================================

    With ws
        ' Header
        .Range("A1").Value = "OMNI CONCIERGE - 2026 FINANCIAL MODEL"
        .Range("A1").Font.Bold = True
        .Range("A1").Font.Size = 14

        .Range("A3").Value = "ASSUMPTIONS (Editable - Yellow Cells)"
        .Range("A3").Font.Bold = True
        .Range("A3").Font.Size = 12
        .Range("A3").Interior.Color = RGB(255, 242, 204)

        ' === VENDOR SUBSCRIPTIONS ===
        .Range("A5").Value = "VENDOR SUBSCRIPTIONS"
        .Range("A5").Font.Bold = True
        .Range("A5").Font.Size = 11
        .Range("A5").Interior.Color = RGB(217, 217, 217)

        .Range("A6").Value = "One-Time Setup per Vendor"
        .Range("B6").Value = 3000
        .Range("B6").NumberFormat = "$#,##0"

        .Range("A7").Value = "Monthly Subscription per Vendor"
        .Range("B7").Value = 250
        .Range("B7").NumberFormat = "$#,##0"

        .Range("A8").Value = "Annual Content Update ($/year)"
        .Range("B8").Value = 1500
        .Range("B8").NumberFormat = "$#,##0"

        .Range("A9").Value = "Content Update ($/month, auto)"
        .Range("B9").Formula = "=B8/12"
        .Range("B9").NumberFormat = "$#,##0.00"
        .Range("B9").Font.Italic = True

        .Range("A10").Value = "Total MRR per Vendor (auto)"
        .Range("B10").Formula = "=B7+B9"
        .Range("B10").NumberFormat = "$#,##0.00"
        .Range("B10").Font.Italic = True
        .Range("B10").Font.Bold = True

        ' === VENDOR USAGE ===
        .Range("A12").Value = "VENDOR USAGE"
        .Range("A12").Font.Bold = True
        .Range("A12").Font.Size = 11
        .Range("A12").Interior.Color = RGB(217, 217, 217)

        .Range("A13").Value = "Usage Rate ($/talk-hour)"
        .Range("B13").Value = 9
        .Range("B13").NumberFormat = "$#,##0.00"

        .Range("A14").Value = "Talk-Hours per Vendor per Year"
        .Range("B14").Value = 421

        .Range("A15").Value = "Talk-Hours per Vendor per Month (auto)"
        .Range("B15").Formula = "=B14/12"
        .Range("B15").NumberFormat = "0.00"
        .Range("B15").Font.Italic = True

        ' === VENDOR ACQUISITION ===
        .Range("A17").Value = "VENDOR ACQUISITION"
        .Range("A17").Font.Bold = True
        .Range("A17").Font.Size = 11
        .Range("A17").Interior.Color = RGB(217, 217, 217)

        .Range("A18").Value = "Starting Vendors (Jan 1, 2026)"
        .Range("B18").Value = 0

        .Range("A19").Value = "Q1 New Vendors"
        .Range("B19").Value = 0

        .Range("A20").Value = "Q2 New Vendors"
        .Range("B20").Value = 25

        .Range("A21").Value = "Q3 New Vendors"
        .Range("B21").Value = 40

        .Range("A22").Value = "Q4 New Vendors"
        .Range("B22").Value = 60

        .Range("A24").Value = "Total New Vendors (2026)"
        .Range("B24").Formula = "=B19+B20+B21+B22"
        .Range("B24").Font.Bold = True

        ' === VENDOR CHURN ===
        .Range("A26").Value = "VENDOR CHURN"
        .Range("A26").Font.Bold = True
        .Range("A26").Font.Size = 11
        .Range("A26").Interior.Color = RGB(217, 217, 217)

        .Range("A27").Value = "Monthly Vendor Churn %"
        .Range("B27").Value = 0.1
        .Range("B27").NumberFormat = "0.0%"

        .Range("A28").Value = "Annual Churn % (reference)"
        .Range("B28").Formula = "=1-(1-B27)^12"
        .Range("B28").NumberFormat = "0.0%"
        .Range("B28").Font.Italic = True

        ' === FULL-SHOW DEPLOYMENTS ===
        .Range("D5").Value = "FULL-SHOW DEPLOYMENTS"
        .Range("D5").Font.Bold = True
        .Range("D5").Font.Size = 11
        .Range("D5").Interior.Color = RGB(217, 217, 217)

        .Range("D6").Value = "Total Shows in 2026"
        .Range("E6").Value = 12

        .Range("D7").Value = "Q1 Shows"
        .Range("E7").Value = 0

        .Range("D8").Value = "Q2 Shows"
        .Range("E8").Value = 3

        .Range("D9").Value = "Q3 Shows"
        .Range("E9").Value = 4

        .Range("D10").Value = "Q4 Shows"
        .Range("E10").Value = 5

        .Range("D12").Value = "Setup Fee per Show"
        .Range("E12").Value = 75000
        .Range("E12").NumberFormat = "$#,##0"

        .Range("D13").Value = "Talk-Hours per Show"
        .Range("E13").Value = 1833

        .Range("D14").Value = "Usage Revenue per Show (auto)"
        .Range("E14").Formula = "=E13*B13"
        .Range("E14").NumberFormat = "$#,##0"
        .Range("E14").Font.Italic = True

        .Range("D15").Value = "Total Revenue per Show (auto)"
        .Range("E15").Formula = "=E12+E14"
        .Range("E15").NumberFormat = "$#,##0"
        .Range("E15").Font.Italic = True
        .Range("E15").Font.Bold = True

        ' === COGS (TALK-HOURS BASED) ===
        .Range("D17").Value = "COGS (TALK-HOURS BASED)"
        .Range("D17").Font.Bold = True
        .Range("D17").Font.Size = 11
        .Range("D17").Interior.Color = RGB(217, 217, 217)

        .Range("D18").Value = "Infrastructure Cost per Talk-Hour"
        .Range("E18").Value = 4
        .Range("E18").NumberFormat = "$#,##0.00"

        .Range("D19").Value = "Voice Cost per Talk-Hour"
        .Range("E19").Value = 4
        .Range("E19").NumberFormat = "$#,##0.00"

        .Range("D20").Value = "Total COGS per Talk-Hour (auto)"
        .Range("E20").Formula = "=E18+E19"
        .Range("E20").NumberFormat = "$#,##0.00"
        .Range("E20").Font.Bold = True

        ' Format all assumption cells as editable (yellow background)
        Dim editableRanges As String
        editableRanges = "B6:B8,B13:B14,B18:B22,B27,E6:E10,E12:E13,E18:E19"
        .Range(editableRanges).Interior.Color = RGB(255, 255, 153)
        .Range(editableRanges).Font.Bold = True

        ' ========================================================================
        ' SECTION 2: MONTHLY CALCULATIONS (Rows 52+)
        ' ========================================================================

        Dim startRow As Integer
        startRow = 52

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

        ' --- VENDOR TRACKING ---
        .Range("A" & r).Value = "VENDOR TRACKING"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        ' Beginning Vendors
        .Range("A" & r).Value = "Beginning Vendors"
        .Cells(r, 2).Formula = "=$B$18"
        For i = 2 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(r, monthCol - 1).Offset(3, 0).Address(False, False)
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0.0"
        Next i
        r = r + 1

        ' New Vendors Added
        .Range("A" & r).Value = "New Vendors Added"
        ' Q1 (Jan-Mar)
        For i = 1 To 3
            .Cells(r, i + 1).Formula = "=$B$19/3"
        Next i
        ' Q2 (Apr-Jun)
        For i = 4 To 6
            .Cells(r, i + 1).Formula = "=$B$20/3"
        Next i
        ' Q3 (Jul-Sep)
        For i = 7 To 9
            .Cells(r, i + 1).Formula = "=$B$21/3"
        Next i
        ' Q4 (Oct-Dec)
        For i = 10 To 12
            .Cells(r, i + 1).Formula = "=$B$22/3"
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0.00"
        Next i
        r = r + 1

        ' Churned Vendors
        .Range("A" & r).Value = "Churned Vendors"
        Dim beginVendorsRow As Integer
        beginVendorsRow = r - 2
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(beginVendorsRow, monthCol).Address(False, False) & "*$B$27"
            .Cells(r, monthCol).NumberFormat = "0.00"
        Next i
        r = r + 1

        ' Ending Vendors
        .Range("A" & r).Value = "Ending Vendors"
        Dim newVendorsRow, churnVendorsRow As Integer
        newVendorsRow = r - 2
        churnVendorsRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(beginVendorsRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(newVendorsRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(churnVendorsRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0.0"
        Next i
        Dim endingVendorsRow As Integer
        endingVendorsRow = r
        r = r + 2

        ' --- VENDOR RECURRING REVENUE ---
        .Range("A" & r).Value = "VENDOR RECURRING REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(146, 208, 80)
        r = r + 1

        ' Subscription MRR
        .Range("A" & r).Value = "Subscription MRR (Vendors × $250)"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingVendorsRow, monthCol).Address(False, False) & "*$B$7"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Content Update MRR
        .Range("A" & r).Value = "Content Update MRR (Vendors × $125)"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingVendorsRow, monthCol).Address(False, False) & "*$B$9"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Total Vendor MRR
        .Range("A" & r).Value = "Total Vendor MRR"
        .Range("A" & r).Font.Bold = True
        Dim subMrrRow, contentMrrRow As Integer
        subMrrRow = r - 2
        contentMrrRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(subMrrRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(contentMrrRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        Dim totalVendorMrrRow As Integer
        totalVendorMrrRow = r
        r = r + 2

        ' --- VENDOR ONE-TIME REVENUE ---
        .Range("A" & r).Value = "VENDOR ONE-TIME REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 217, 102)
        r = r + 1

        ' New Vendors This Month
        .Range("A" & r).Value = "New Vendors This Month"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(newVendorsRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "0.00"
        Next i
        r = r + 1

        ' Vendor Setup Revenue
        .Range("A" & r).Value = "Vendor Setup Revenue"
        .Range("A" & r).Font.Bold = True
        Dim newVendorsThisMonthRow As Integer
        newVendorsThisMonthRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(newVendorsThisMonthRow, monthCol).Address(False, False) & "*$B$6"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        Dim vendorSetupRevRow As Integer
        vendorSetupRevRow = r
        r = r + 2

        ' --- VENDOR USAGE REVENUE ---
        .Range("A" & r).Value = "VENDOR USAGE REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 192, 203)
        r = r + 1

        ' Vendor Talk-Hours
        .Range("A" & r).Value = "Vendor Talk-Hours"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(endingVendorsRow, monthCol).Address(False, False) & "*$B$15"
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        Dim vendorTalkHoursRow As Integer
        vendorTalkHoursRow = r
        r = r + 1

        ' Vendor Usage Revenue
        .Range("A" & r).Value = "Vendor Usage Revenue"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(vendorTalkHoursRow, monthCol).Address(False, False) & "*$B$13"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        Dim vendorUsageRevRow As Integer
        vendorUsageRevRow = r
        r = r + 2

        ' --- FULL-SHOW REVENUE ---
        .Range("A" & r).Value = "FULL-SHOW REVENUE (ONE-TIME)"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 165, 0)
        r = r + 1

        ' Shows This Month
        .Range("A" & r).Value = "Shows This Month"
        ' Q1 (Jan-Mar)
        For i = 1 To 3
            .Cells(r, i + 1).Formula = "=$E$7/3"
        Next i
        ' Q2 (Apr-Jun)
        For i = 4 To 6
            .Cells(r, i + 1).Formula = "=$E$8/3"
        Next i
        ' Q3 (Jul-Sep)
        For i = 7 To 9
            .Cells(r, i + 1).Formula = "=$E$9/3"
        Next i
        ' Q4 (Oct-Dec)
        For i = 10 To 12
            .Cells(r, i + 1).Formula = "=$E$10/3"
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0.00"
        Next i
        Dim showsThisMonthRow As Integer
        showsThisMonthRow = r
        r = r + 1

        ' Show Setup Revenue
        .Range("A" & r).Value = "Show Setup Revenue"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(showsThisMonthRow, monthCol).Address(False, False) & "*$E$12"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Show Talk-Hours
        .Range("A" & r).Value = "Show Talk-Hours"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(showsThisMonthRow, monthCol).Address(False, False) & "*$E$13"
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        Dim showTalkHoursRow As Integer
        showTalkHoursRow = r
        r = r + 1

        ' Show Usage Revenue
        .Range("A" & r).Value = "Show Usage Revenue"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(showTalkHoursRow, monthCol).Address(False, False) & "*$B$13"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Total Show Revenue
        .Range("A" & r).Value = "Total Show Revenue"
        .Range("A" & r).Font.Bold = True
        Dim showSetupRevRow, showUsageRevRow As Integer
        showSetupRevRow = r - 3
        showUsageRevRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(showSetupRevRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(showUsageRevRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        Dim totalShowRevRow As Integer
        totalShowRevRow = r
        r = r + 2

        ' --- TOTAL REVENUE SUMMARY ---
        .Range("A" & r).Value = "TOTAL REVENUE SUMMARY"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(112, 173, 71)
        .Range("A" & r).Font.Color = RGB(255, 255, 255)
        r = r + 1

        ' Total Recurring Revenue
        .Range("A" & r).Value = "Total Recurring Revenue (Vendor MRR)"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalVendorMrrRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        Dim totalRecurRevRow As Integer
        totalRecurRevRow = r
        r = r + 1

        ' Total One-Time Revenue
        .Range("A" & r).Value = "Total One-Time Revenue (Setup + Shows)"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(vendorSetupRevRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(totalShowRevRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        Dim totalOneTimeRevRow As Integer
        totalOneTimeRevRow = r
        r = r + 1

        ' Total Usage Revenue
        .Range("A" & r).Value = "Total Usage Revenue (Vendor + Show)"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(vendorUsageRevRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(showUsageRevRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        Dim totalUsageRevRow As Integer
        totalUsageRevRow = r
        r = r + 1

        ' Grand Total Revenue
        .Range("A" & r).Value = "GRAND TOTAL REVENUE"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalRecurRevRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(totalOneTimeRevRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(totalUsageRevRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
            .Cells(r, monthCol).Interior.Color = RGB(146, 208, 80)
        Next i
        Dim grandTotalRevRow As Integer
        grandTotalRevRow = r
        r = r + 2

        ' --- COGS ---
        .Range("A" & r).Value = "COGS (TALK-HOURS BASED)"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 192, 0)
        r = r + 1

        ' Total Talk-Hours
        .Range("A" & r).Value = "Total Talk-Hours (Vendor + Show)"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(vendorTalkHoursRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(showTalkHoursRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "#,##0"
        Next i
        Dim totalTalkHoursRow As Integer
        totalTalkHoursRow = r
        r = r + 1

        ' Infrastructure Costs
        .Range("A" & r).Value = "Infrastructure Costs ($4/hr)"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalTalkHoursRow, monthCol).Address(False, False) & "*$E$18"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Voice Costs
        .Range("A" & r).Value = "Voice Costs ($4/hr)"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(totalTalkHoursRow, monthCol).Address(False, False) & "*$E$19"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Total COGS
        .Range("A" & r).Value = "Total COGS ($8/hr)"
        .Range("A" & r).Font.Bold = True
        Dim infraCostRow, voiceCostRow As Integer
        infraCostRow = r - 2
        voiceCostRow = r - 1
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(infraCostRow, monthCol).Address(False, False) & "+" & _
                                          .Cells(voiceCostRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
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
            .Cells(r, monthCol).Formula = "=" & .Cells(grandTotalRevRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(totalCogsRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        Dim grossProfitRow As Integer
        grossProfitRow = r
        r = r + 1

        ' Gross Margin %
        .Range("A" & r).Value = "Gross Margin % (Blended)"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=IF(" & .Cells(grandTotalRevRow, monthCol).Address(False, False) & "=0,0," & _
                                          .Cells(grossProfitRow, monthCol).Address(False, False) & "/" & _
                                          .Cells(grandTotalRevRow, monthCol).Address(False, False) & ")"
            .Cells(r, monthCol).NumberFormat = "0.0%"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        r = r + 1

        ' Recurring-Only Margin %
        .Range("A" & r).Value = "Recurring-Only Margin %"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=IF(" & .Cells(totalRecurRevRow, monthCol).Address(False, False) & "=0,0," & _
                                          "(" & .Cells(totalRecurRevRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(totalCogsRow, monthCol).Address(False, False) & ")/" & _
                                          .Cells(totalRecurRevRow, monthCol).Address(False, False) & ")"
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

        ' Avg Vendors
        .Range("A" & r).Value = "Avg Vendors"
        .Range("B" & r).Formula = "=AVERAGE(B" & endingVendorsRow & ":D" & endingVendorsRow & ")"
        .Range("C" & r).Formula = "=AVERAGE(E" & endingVendorsRow & ":G" & endingVendorsRow & ")"
        .Range("D" & r).Formula = "=AVERAGE(H" & endingVendorsRow & ":J" & endingVendorsRow & ")"
        .Range("E" & r).Formula = "=AVERAGE(K" & endingVendorsRow & ":M" & endingVendorsRow & ")"
        .Range("F" & r).Formula = "=AVERAGE(B" & endingVendorsRow & ":M" & endingVendorsRow & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "0.0"
        r = r + 1

        ' Total Shows
        .Range("A" & r).Value = "Total Shows"
        .Range("B" & r).Formula = "=$E$7"
        .Range("C" & r).Formula = "=$E$8"
        .Range("D" & r).Formula = "=$E$9"
        .Range("E" & r).Formula = "=$E$10"
        .Range("F" & r).Formula = "=$E$6"
        .Range("B" & r & ":F" & r).NumberFormat = "0"
        r = r + 1

        ' Total Talk-Hours
        .Range("A" & r).Value = "Total Talk-Hours"
        .Range("B" & r).Formula = "=SUM(B" & totalTalkHoursRow & ":D" & totalTalkHoursRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalTalkHoursRow & ":G" & totalTalkHoursRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalTalkHoursRow & ":J" & totalTalkHoursRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalTalkHoursRow & ":M" & totalTalkHoursRow & ")"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "#,##0"
        r = r + 1

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

        ' Total Revenue
        .Range("A" & r).Value = "Total Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=B" & (r - 3) & "+B" & (r - 2) & "+B" & (r - 1)
        .Range("C" & r).Formula = "=C" & (r - 3) & "+C" & (r - 2) & "+C" & (r - 1)
        .Range("D" & r).Formula = "=D" & (r - 3) & "+D" & (r - 2) & "+D" & (r - 1)
        .Range("E" & r).Formula = "=E" & (r - 3) & "+E" & (r - 2) & "+E" & (r - 1)
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

        ' --- VENDOR METRICS ---
        .Range("A" & r).Value = "VENDOR METRICS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Starting Vendors (Jan 1)"
        .Range("B" & r).Formula = "=$B$18"
        .Range("B" & r).NumberFormat = "0"
        r = r + 1

        .Range("A" & r).Value = "Ending Vendors (Dec 31)"
        .Range("B" & r).Formula = "=M" & endingVendorsRow
        .Range("B" & r).NumberFormat = "0.0"
        r = r + 1

        .Range("A" & r).Value = "Vendor Growth"
        .Range("B" & r).Formula = "=B" & (r - 1) & "-B" & (r - 2)
        .Range("B" & r).NumberFormat = "0.0"
        r = r + 1

        .Range("A" & r).Value = "Total Vendors Added (2026)"
        .Range("B" & r).Formula = "=$B$24"
        .Range("B" & r).NumberFormat = "0"
        r = r + 1

        .Range("A" & r).Value = "Total Vendors Churned (2026)"
        .Range("B" & r).Formula = "=SUM(B" & churnVendorsRow & ":M" & churnVendorsRow & ")"
        .Range("B" & r).NumberFormat = "0.0"
        r = r + 1

        .Range("A" & r).Value = "Vendor ARR (Dec 31)"
        .Range("B" & r).Formula = "=M" & totalVendorMrrRow & "*12"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "Avg MRR per Vendor"
        .Range("B" & r).Formula = "=$B$10"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 2

        ' --- SHOW METRICS ---
        .Range("A" & r).Value = "SHOW METRICS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Total Shows (2026)"
        .Range("B" & r).Formula = "=$E$6"
        .Range("B" & r).NumberFormat = "0"
        r = r + 1

        .Range("A" & r).Value = "Avg Revenue per Show"
        .Range("B" & r).Formula = "=$E$15"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "Total Show Revenue (2026)"
        .Range("B" & r).Formula = "=SUM(B" & totalShowRevRow & ":M" & totalShowRevRow & ")"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 2

        ' --- REVENUE MIX ---
        .Range("A" & r).Value = "REVENUE MIX"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Total Recurring Revenue (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalRecurRevRow & ":M" & totalRecurRevRow & ")"
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        Dim yrRecurRevRow As Integer
        yrRecurRevRow = r
        r = r + 1

        .Range("A" & r).Value = "Total One-Time Revenue (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalOneTimeRevRow & ":M" & totalOneTimeRevRow & ")"
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Total Usage Revenue (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalUsageRevRow & ":M" & totalUsageRevRow & ")"
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "TOTAL REVENUE (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=B" & (r - 3) & "+B" & (r - 2) & "+B" & (r - 1)
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        Dim yrTotalRevRow As Integer
        yrTotalRevRow = r
        r = r + 1

        .Range("A" & r).Value = "% Recurring"
        .Range("B" & r).Formula = "=B" & (r - 4) & "/B" & (r - 1)
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 1

        .Range("A" & r).Value = "% One-Time"
        .Range("B" & r).Formula = "=B" & (r - 4) & "/B" & (r - 2)
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 1

        .Range("A" & r).Value = "% Usage"
        .Range("B" & r).Formula = "=B" & (r - 4) & "/B" & (r - 3)
        .Range("B" & r).NumberFormat = "0.0%"
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
        Dim yrCogsRow As Integer
        yrCogsRow = r
        r = r + 1

        .Range("A" & r).Value = "Gross Profit (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=B" & yrTotalRevRow & "-B" & yrCogsRow
        .Range("B" & r).NumberFormat = "$#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Gross Margin % (Blended)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=IF(B" & yrTotalRevRow & "=0,0,B" & (r - 1) & "/B" & yrTotalRevRow & ")"
        .Range("B" & r).NumberFormat = "0.0%"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Recurring-Only Margin %"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=IF(B" & yrRecurRevRow & "=0,0,(B" & yrRecurRevRow & "-B" & yrCogsRow & ")/B" & yrRecurRevRow & ")"
        .Range("B" & r).NumberFormat = "0.0%"
        .Range("B" & r).Font.Bold = True
        r = r + 2

        ' LTV
        .Range("A" & r).Value = "Vendor LTV (MRR per Vendor / Churn)"
        Dim mrrPerVendorRef, churnRef As Integer
        mrrPerVendorRef = r - 26  ' Avg MRR per Vendor
        churnRef = r + 2  ' Will add churn rate below
        .Range("B" & r).Formula = "=B" & mrrPerVendorRef & "/$B$27"
        .Range("B" & r).NumberFormat = "$#,##0"
        r = r + 1

        .Range("A" & r).Value = "Note: CAC requires marketing spend data"
        .Range("A" & r).Font.Italic = True
        .Range("A" & r).Font.Size = 9

        ' ========================================================================
        ' FORMATTING
        ' ========================================================================

        ' Column widths
        .Columns("A:A").ColumnWidth = 45
        .Columns("B:M").ColumnWidth = 13

        ' Freeze panes
        .Activate
        .Range("B54").Select
        ActiveWindow.FreezePanes = True

        ' Add borders to monthly projections
        Dim dataRange As Range
        Set dataRange = .Range("A" & startRow & ":M" & (startRow + 50))
        dataRange.Borders.LineStyle = xlContinuous
        dataRange.Borders.Weight = xlThin

    End With

    Application.ScreenUpdating = True

    MsgBox "Omni Concierge sheet created successfully!", vbInformation

End Sub
