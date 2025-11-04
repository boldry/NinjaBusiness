Option Explicit

' ============================================================================
' NINJA BUSINESS 2026 FINANCIAL MODEL - MASTER GENERATOR
' ============================================================================
' This is the master VBA script that generates the complete 2026 financial
' model workbook with all 6 product sheets + consolidated Summary sheet.
'
' INSTRUCTIONS:
' 1. Open a new Excel workbook
' 2. Press Alt+F11 to open VBA Editor
' 3. Insert > Module
' 4. Copy and paste ALL VBA files from the tools folder into the module:
'    - This file (Generate_Complete_Financial_Model.vba)
'    - Generate_NinjaNotesB2C_Sheet.vba
'    - Generate_NinjaNotesEnterprise_Sheet.vba
'    - Generate_OmniSales_Sheet.vba
'    - Generate_OmniService_Sheet.vba
'    - Generate_OmniConcierge_Sheet.vba
'    - Generate_SonaHardware_Sheet.vba
'    - Generate_Summary_Sheet.vba
' 5. Run this macro: Generate_Complete_Financial_Model
' 6. Wait for completion message
'
' OUTPUT:
' - 7 sheets total:
'   1. Summary (executive dashboard)
'   2. Ninja Notes B2C
'   3. Ninja Notes Enterprise
'   4. Omni Sales
'   5. Omni Service
'   6. Omni Concierge
'   7. Sona Hardware
'
' ============================================================================

Sub Generate_Complete_Financial_Model()

    Dim startTime As Double
    Dim elapsedTime As Double

    startTime = Timer

    ' Disable screen updating and calculations for faster processing
    Application.ScreenUpdating = False
    Application.Calculation = xlCalculationManual
    Application.EnableEvents = False

    On Error GoTo ErrorHandler

    ' Display progress message
    Application.StatusBar = "Generating 2026 Financial Model - Please wait..."

    ' ========================================================================
    ' STEP 1: Generate all product sheets
    ' ========================================================================

    Application.StatusBar = "Generating Ninja Notes B2C sheet... (1/7)"
    Call Create_NinjaNotesB2C_Sheet

    Application.StatusBar = "Generating Ninja Notes Enterprise sheet... (2/7)"
    Call Create_NinjaNotesEnterprise_Sheet

    Application.StatusBar = "Generating Omni Sales sheet... (3/7)"
    Call Create_OmniSales_Sheet

    Application.StatusBar = "Generating Omni Service sheet... (4/7)"
    Call Create_OmniService_Sheet

    Application.StatusBar = "Generating Omni Concierge sheet... (5/7)"
    Call Create_OmniConcierge_Sheet

    Application.StatusBar = "Generating Sona Hardware sheet... (6/7)"
    Call Create_SonaHardware_Sheet

    ' ========================================================================
    ' STEP 2: Generate Summary sheet (must be last as it references others)
    ' ========================================================================

    Application.StatusBar = "Generating Summary rollup sheet... (7/7)"
    Call Create_Summary_Sheet

    ' ========================================================================
    ' STEP 3: Final calculations and formatting
    ' ========================================================================

    Application.StatusBar = "Finalizing workbook..."

    ' Re-enable calculations and calculate everything
    Application.Calculation = xlCalculationAutomatic
    Application.Calculate

    ' Activate Summary sheet
    ThisWorkbook.Sheets("Summary").Activate
    ThisWorkbook.Sheets("Summary").Range("A1").Select

    ' Re-enable screen updating and events
    Application.ScreenUpdating = True
    Application.EnableEvents = True

    ' Calculate elapsed time
    elapsedTime = Round(Timer - startTime, 2)

    ' Clear status bar
    Application.StatusBar = False

    ' Success message
    MsgBox "✓ 2026 Financial Model Generated Successfully!" & vbCrLf & vbCrLf & _
           "Generated Sheets:" & vbCrLf & _
           "  • Summary (Consolidated Dashboard)" & vbCrLf & _
           "  • Ninja Notes B2C" & vbCrLf & _
           "  • Ninja Notes Enterprise" & vbCrLf & _
           "  • Omni Sales" & vbCrLf & _
           "  • Omni Service" & vbCrLf & _
           "  • Omni Concierge" & vbCrLf & _
           "  • Sona Hardware" & vbCrLf & vbCrLf & _
           "Time elapsed: " & elapsedTime & " seconds" & vbCrLf & vbCrLf & _
           "Yellow cells contain editable assumptions." & vbCrLf & _
           "Modify assumptions to see instant updates across all sheets.", _
           vbInformation, "Ninja Business Financial Model"

    Exit Sub

ErrorHandler:
    ' Re-enable everything in case of error
    Application.ScreenUpdating = True
    Application.Calculation = xlCalculationAutomatic
    Application.EnableEvents = True
    Application.StatusBar = False

    MsgBox "⚠ Error generating financial model:" & vbCrLf & vbCrLf & _
           "Error " & Err.Number & ": " & Err.Description & vbCrLf & vbCrLf & _
           "Please ensure all VBA files are properly loaded in the module.", _
           vbCritical, "Error"

End Sub

' ============================================================================
' OPTIONAL: UTILITY MACROS
' ============================================================================

Sub Clear_All_Sheets()
    ' WARNING: This deletes all sheets except Sheet1
    ' Use this to start fresh

    Dim ws As Worksheet
    Dim response As VbMsgBoxResult

    response = MsgBox("WARNING: This will delete all sheets except Sheet1." & vbCrLf & vbCrLf & _
                      "Are you sure you want to continue?", _
                      vbYesNo + vbExclamation, "Clear All Sheets")

    If response = vbNo Then Exit Sub

    Application.DisplayAlerts = False

    For Each ws In ThisWorkbook.Worksheets
        If ws.Name <> "Sheet1" Then
            ws.Delete
        End If
    Next ws

    Application.DisplayAlerts = True

    MsgBox "All sheets cleared. Ready to generate new model.", vbInformation

End Sub

Sub Recalculate_All_Sheets()
    ' Forces full recalculation of all sheets

    Application.StatusBar = "Recalculating all sheets..."
    Application.CalculateFullRebuild
    Application.StatusBar = False

    MsgBox "All sheets recalculated successfully.", vbInformation

End Sub

' ============================================================================
' INSTRUCTIONS FOR USE
' ============================================================================

' HOW TO RUN:
' -----------
' 1. Open this workbook in Excel
' 2. Press Alt+F11 (opens VBA Editor)
' 3. In the Project Explorer, find this module
' 4. Press F5 or click Run > Run Sub/UserForm
' 5. Select "Generate_Complete_Financial_Model"
' 6. Click Run
'
' TROUBLESHOOTING:
' ----------------
' - If you get errors, ensure ALL .vba files are copied into the same module
' - Make sure you're starting with a blank workbook or run Clear_All_Sheets first
' - Check that no sheets are protected
' - Ensure macros are enabled (File > Options > Trust Center > Macro Settings)
'
' CUSTOMIZATION:
' --------------
' - All yellow cells contain editable assumptions
' - Modify any assumption to see instant updates across all sheets
' - The Summary sheet provides a consolidated view of all products
'
' SAVING:
' -------
' - Save as .xlsm (Excel Macro-Enabled Workbook) to preserve VBA code
' - Or save as .xlsx if you don't need to regenerate (formulas will remain)

' ============================================================================
