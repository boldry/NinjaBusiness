# Quick Conversation Saver for Cursor AI
# Usage: .\save_conversation.ps1 -ProjectName "MyProject" -Topic "Brief Description"

param(
    [Parameter(Mandatory=$false)]
    [string]$ProjectName = "General",
    
    [Parameter(Mandatory=$false)]
    [string]$Topic = "Conversation",
    
    [Parameter(Mandatory=$false)]
    [string]$Tags = ""
)

# Get current date and time
$Date = Get-Date -Format "yyyy-MM-dd"
$Time = Get-Date -Format "HH:mm"
$Timestamp = Get-Date -Format "yyyy-MM-dd_HHmm"

# Create sanitized filename
$SafeProjectName = $ProjectName -replace '[^\w\-]', '_'
$SafeTopic = $Topic -replace '[^\w\-]', '_'
$FileName = "${Timestamp}_${SafeProjectName}_${SafeTopic}.md"

# Create file paths
$ArchiveRoot = "C:\Users\1dale\.cursor\NinjaBusiness\venture_fund\work by Dale\conversation_archive"
$ByDatePath = Join-Path $ArchiveRoot "by_date\$Date"
$ByProjectPath = Join-Path $ArchiveRoot "by_project\$SafeProjectName"

# Create directories if they don't exist
New-Item -ItemType Directory -Path $ByDatePath -Force | Out-Null
New-Item -ItemType Directory -Path $ByProjectPath -Force | Out-Null

# Create the main file in by_date
$MainFilePath = Join-Path $ByDatePath $FileName

# Create conversation file from template
$Content = @"
# Conversation Log

**Date:** $Date  
**Time:** $Time  
**Project:** $ProjectName  
**Topic:** $Topic  
**Tags:** $Tags

---

## Context
[Paste your context here - what were you working on?]

---

## Conversation

### User:
[Paste your question/request here]

### AI Assistant:
[Paste AI response here]

---

## Key Takeaways
- [Add important points here]

---

## Files Modified/Created
- [List files changed during this conversation]

---

## Follow-up Actions
- [ ] [Add action items here]

---

## Notes
[Any additional notes or observations]
"@

# Save the file
$Content | Out-File -FilePath $MainFilePath -Encoding UTF8

# Create a shortcut in by_project directory
$ProjectLinkPath = Join-Path $ByProjectPath $FileName
Copy-Item -Path $MainFilePath -Destination $ProjectLinkPath

Write-Host ""
Write-Host "[SUCCESS] Conversation file created successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Main file location:" -ForegroundColor Cyan
Write-Host "   $MainFilePath" -ForegroundColor White
Write-Host ""
Write-Host "Project copy:" -ForegroundColor Cyan
Write-Host "   $ProjectLinkPath" -ForegroundColor White
Write-Host ""
Write-Host "Opening file in default editor..." -ForegroundColor Yellow

# Open the file in default editor
Start-Process $MainFilePath

Write-Host ""
Write-Host "TIP: Copy your conversation from Cursor and paste it into the opened file!" -ForegroundColor Magenta
Write-Host ""

