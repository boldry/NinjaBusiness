Option Explicit

' ============================================================================
' Sona Hardware Financial Model Generator
' ============================================================================
' This VBA module creates a financial model for Sona Hardware
' Simple hardware sales model with ASP, COGS, and quarterly device sales
' ============================================================================

Sub Create_SonaHardware_Sheet()

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim i As Integer
    Dim monthCol As Integer

    ' Create or clear the sheet
    On Error Resume Next
    Set ws = ThisWorkbook.Sheets("Sona Hardware")
    If ws Is Nothing Then
        Set ws = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
        ws.Name = "Sona Hardware"
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
        .Range("A1").Value = "SONA HARDWARE - 2026 FINANCIAL MODEL"
        .Range("A1").Font.Bold = True
        .Range("A1").Font.Size = 14

        .Range("A3").Value = "ASSUMPTIONS (Editable - Yellow Cells)"
        .Range("A3").Font.Bold = True
        .Range("A3").Font.Size = 12
        .Range("A3").Interior.Color = RGB(255, 242, 204)

        ' === PRICING & COSTS ===
        .Range("A5").Value = "PRICING & COSTS"
        .Range("A5").Font.Bold = True
        .Range("A5").Font.Size = 11
        .Range("A5").Interior.Color = RGB(217, 217, 217)

        .Range("A6").Value = "ASP (Average Selling Price per Device)"
        .Range("B6").Value = 65
        .Range("B6").NumberFormat = "$#,##0.00"

        .Range("A7").Value = "Landed COGS per Device"
        .Range("B7").Value = 30
        .Range("B7").NumberFormat = "$#,##0.00"

        .Range("A8").Value = "Gross Margin per Device (auto)"
        .Range("B8").Formula = "=B6-B7"
        .Range("B8").NumberFormat = "$#,##0.00"
        .Range("B8").Font.Italic = True
        .Range("B8").Font.Bold = True

        .Range("A9").Value = "Gross Margin % (auto)"
        .Range("B9").Formula = "=B8/B6"
        .Range("B9").NumberFormat = "0.0%"
        .Range("B9").Font.Italic = True
        .Range("B9").Font.Bold = True

        ' === 2026 SOFTWARE FEE ===
        .Range("A11").Value = "2026 SOFTWARE FEE"
        .Range("A11").Font.Bold = True
        .Range("A11").Font.Size = 11
        .Range("A11").Interior.Color = RGB(217, 217, 217)

        .Range("A12").Value = "Software Fee per Device ($/month)"
        .Range("B12").Value = 0
        .Range("B12").NumberFormat = "$#,##0.00"
        .Range("A13").Value = "Note: Future OTA upgrade fees not modeled in 2026"
        .Range("A13").Font.Italic = True
        .Range("A13").Font.Size = 9

        ' === DEVICE SALES (ATTACH RULE REFERENCE) ===
        .Range("A15").Value = "DEVICE SALES - ATTACH RULE REFERENCE"
        .Range("A15").Font.Bold = True
        .Range("A15").Font.Size = 11
        .Range("A15").Interior.Color = RGB(217, 217, 217)

        .Range("A16").Value = "Attach Rate % (of Enterprise seats)"
        .Range("B16").Value = 0.05
        .Range("B16").NumberFormat = "0.0%"

        .Range("A17").Value = "Expected Enterprise Seats Sold 2026"
        .Range("B17").Value = 4000
        .Range("B17").NumberFormat = "#,##0"
        .Range("A18").Value = "(Reference: 10 logos × 400 seats from Enterprise sheet)"
        .Range("A18").Font.Italic = True
        .Range("A18").Font.Size = 9

        .Range("A20").Value = "Expected Devices from Attach (auto)"
        .Range("B20").Formula = "=B17*B16"
        .Range("B20").NumberFormat = "#,##0"
        .Range("B20").Font.Italic = True
        .Range("B20").Font.Bold = True

        ' === QUARTERLY DEVICE SALES (MANUAL OVERRIDE) ===
        .Range("D5").Value = "QUARTERLY DEVICE SALES (Manual Entry)"
        .Range("D5").Font.Bold = True
        .Range("D5").Font.Size = 11
        .Range("D5").Interior.Color = RGB(217, 217, 217)

        .Range("D6").Value = "Q1 Devices Sold"
        .Range("E6").Value = 50

        .Range("D7").Value = "Q2 Devices Sold"
        .Range("E7").Value = 50

        .Range("D8").Value = "Q3 Devices Sold"
        .Range("E8").Value = 75

        .Range("D9").Value = "Q4 Devices Sold"
        .Range("E9").Value = 75

        .Range("D11").Value = "Total Devices (2026)"
        .Range("E11").Formula = "=E6+E7+E8+E9"
        .Range("E11").Font.Bold = True
        .Range("E11").NumberFormat = "#,##0"

        .Range("D12").Value = "Note: Adjust quarterly sales to match Enterprise sheet"
        .Range("D12").Font.Italic = True
        .Range("D12").Font.Size = 9

        ' Format all assumption cells as editable (yellow background)
        Dim editableRanges As String
        editableRanges = "B6:B7,B12,B16:B17,E6:E9"
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

        ' --- DEVICE SALES ---
        .Range("A" & r).Value = "DEVICE SALES"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        ' Devices Sold
        .Range("A" & r).Value = "Devices Sold"
        .Range("A" & r).Font.Bold = True
        ' Q1 (Jan-Mar)
        For i = 1 To 3
            .Cells(r, i + 1).Formula = "=$E$6/3"
        Next i
        ' Q2 (Apr-Jun)
        For i = 4 To 6
            .Cells(r, i + 1).Formula = "=$E$7/3"
        Next i
        ' Q3 (Jul-Sep)
        For i = 7 To 9
            .Cells(r, i + 1).Formula = "=$E$8/3"
        Next i
        ' Q4 (Oct-Dec)
        For i = 10 To 12
            .Cells(r, i + 1).Formula = "=$E$9/3"
        Next i
        For i = 2 To 13
            .Cells(r, i).NumberFormat = "0.00"
            .Cells(r, i).Font.Bold = True
        Next i
        Dim devicesSoldRow As Integer
        devicesSoldRow = r
        r = r + 2

        ' --- REVENUE ---
        .Range("A" & r).Value = "REVENUE"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(146, 208, 80)
        r = r + 1

        ' Device Revenue
        .Range("A" & r).Value = "Device Revenue (Devices × ASP)"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(devicesSoldRow, monthCol).Address(False, False) & "*$B$6"
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        Dim deviceRevenueRow As Integer
        deviceRevenueRow = r
        r = r + 1

        ' Software Revenue (future)
        .Range("A" & r).Value = "Software Revenue (not in 2026)"
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Value = 0
            .Cells(r, monthCol).NumberFormat = "$#,##0"
        Next i
        r = r + 1

        ' Total Revenue
        .Range("A" & r).Value = "Total Revenue"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(deviceRevenueRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
            .Cells(r, monthCol).Interior.Color = RGB(146, 208, 80)
        Next i
        Dim totalRevenueRow As Integer
        totalRevenueRow = r
        r = r + 2

        ' --- COGS ---
        .Range("A" & r).Value = "COGS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(255, 192, 0)
        r = r + 1

        ' Device COGS
        .Range("A" & r).Value = "Device COGS (Devices × Landed Cost)"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=" & .Cells(devicesSoldRow, monthCol).Address(False, False) & "*$B$7"
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
            .Cells(r, monthCol).Formula = "=" & .Cells(totalRevenueRow, monthCol).Address(False, False) & "-" & _
                                          .Cells(totalCogsRow, monthCol).Address(False, False)
            .Cells(r, monthCol).NumberFormat = "$#,##0"
            .Cells(r, monthCol).Font.Bold = True
        Next i
        Dim grossProfitRow As Integer
        grossProfitRow = r
        r = r + 1

        ' Gross Margin %
        .Range("A" & r).Value = "Gross Margin %"
        .Range("A" & r).Font.Bold = True
        For i = 1 To 12
            monthCol = i + 1
            .Cells(r, monthCol).Formula = "=IF(" & .Cells(totalRevenueRow, monthCol).Address(False, False) & "=0,0," & _
                                          .Cells(grossProfitRow, monthCol).Address(False, False) & "/" & _
                                          .Cells(totalRevenueRow, monthCol).Address(False, False) & ")"
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

        ' Devices Sold
        .Range("A" & r).Value = "Devices Sold"
        .Range("B" & r).Formula = "=$E$6"
        .Range("C" & r).Formula = "=$E$7"
        .Range("D" & r).Formula = "=$E$8"
        .Range("E" & r).Formula = "=$E$9"
        .Range("F" & r).Formula = "=SUM(B" & r & ":E" & r & ")"
        .Range("B" & r & ":F" & r).NumberFormat = "#,##0"
        .Range("B" & r & ":F" & r).Font.Bold = True
        r = r + 1

        ' Total Revenue
        .Range("A" & r).Value = "Total Revenue"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalRevenueRow & ":D" & totalRevenueRow & ")"
        .Range("C" & r).Formula = "=SUM(E" & totalRevenueRow & ":G" & totalRevenueRow & ")"
        .Range("D" & r).Formula = "=SUM(H" & totalRevenueRow & ":J" & totalRevenueRow & ")"
        .Range("E" & r).Formula = "=SUM(K" & totalRevenueRow & ":M" & totalRevenueRow & ")"
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

        ' --- DEVICE METRICS ---
        .Range("A" & r).Value = "DEVICE METRICS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Total Devices Sold (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & devicesSoldRow & ":M" & devicesSoldRow & ")"
        .Range("B" & r).NumberFormat = "#,##0"
        .Range("B" & r).Font.Bold = True
        r = r + 1

        .Range("A" & r).Value = "Avg Devices per Month"
        .Range("B" & r).Formula = "=B" & (r - 1) & "/12"
        .Range("B" & r).NumberFormat = "0.0"
        r = r + 2

        ' --- FINANCIAL METRICS ---
        .Range("A" & r).Value = "FINANCIAL METRICS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Total Revenue (2026)"
        .Range("A" & r).Font.Bold = True
        .Range("B" & r).Formula = "=SUM(B" & totalRevenueRow & ":M" & totalRevenueRow & ")"
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

        ' --- UNIT ECONOMICS ---
        .Range("A" & r).Value = "UNIT ECONOMICS"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Avg Selling Price (ASP)"
        .Range("B" & r).Formula = "=$B$6"
        .Range("B" & r).NumberFormat = "$#,##0.00"
        r = r + 1

        .Range("A" & r).Value = "Avg COGS per Device"
        .Range("B" & r).Formula = "=$B$7"
        .Range("B" & r).NumberFormat = "$#,##0.00"
        r = r + 1

        .Range("A" & r).Value = "Avg Margin per Device"
        .Range("B" & r).Formula = "=$B$8"
        .Range("B" & r).NumberFormat = "$#,##0.00"
        r = r + 1

        .Range("A" & r).Value = "Margin % per Device"
        .Range("B" & r).Formula = "=$B$9"
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 2

        ' --- ATTACH RATE VALIDATION ---
        .Range("A" & r).Value = "ATTACH RATE VALIDATION"
        .Range("A" & r).Font.Bold = True
        .Range("A" & r).Interior.Color = RGB(217, 217, 217)
        r = r + 1

        .Range("A" & r).Value = "Expected Enterprise Seats (2026)"
        .Range("B" & r).Formula = "=$B$17"
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "Target Attach Rate %"
        .Range("B" & r).Formula = "=$B$16"
        .Range("B" & r).NumberFormat = "0.0%"
        r = r + 1

        .Range("A" & r).Value = "Expected Devices (from attach)"
        .Range("B" & r).Formula = "=$B$20"
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "Actual Devices Sold (2026)"
        Dim totalDevicesSoldRef As Integer
        totalDevicesSoldRef = r - 17
        .Range("B" & r).Formula = "=B" & totalDevicesSoldRef
        .Range("B" & r).NumberFormat = "#,##0"
        r = r + 1

        .Range("A" & r).Value = "Variance (Actual - Expected)"
        .Range("B" & r).Formula = "=B" & (r - 1) & "-B" & (r - 2)
        .Range("B" & r).NumberFormat = "#,##0"
        Dim varianceCell As String
        varianceCell = "B" & r
        .Range(varianceCell).Formula = "=B" & (r - 1) & "-B" & (r - 2)
        ' Add conditional formatting manually if needed
        r = r + 1

        .Range("A" & r).Value = "Actual Attach Rate %"
        .Range("B" & r).Formula = "=IF($B$17=0,0,B" & (r - 2) & "/$B$17)"
        .Range("B" & r).NumberFormat = "0.0%"

        ' ========================================================================
        ' FORMATTING
        ' ========================================================================

        ' Column widths
        .Columns("A:A").ColumnWidth = 40
        .Columns("B:M").ColumnWidth = 13

        ' Freeze panes
        .Activate
        .Range("B34").Select
        ActiveWindow.FreezePanes = True

        ' Add borders to monthly projections
        Dim dataRange As Range
        Set dataRange = .Range("A" & startRow & ":M" & (startRow + 15))
        dataRange.Borders.LineStyle = xlContinuous
        dataRange.Borders.Weight = xlThin

    End With

    Application.ScreenUpdating = True

    MsgBox "Sona Hardware sheet created successfully!", vbInformation

End Sub
