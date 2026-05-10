<#
.SYNOPSIS
ITIL Incident Intake Assistant

.DESCRIPTION
Interactive PowerShell script for structured IT support intake.
Collects troubleshooting information and provides an initial
ITIL-oriented assessment.

.AUTHOR
Vantastisch

.VERSION
1.0

.DATE
2026-05-10

.UPDATES
v1.0 - Initial release


#>

#=================================================
# PARAMETERS
#=================================================



#=================================================
# INITIALIZATION
#=================================================

Clear-Host

$CurrentDate = Get-Date -Format "yyyy-MM-dd HH:mm"



#=================================================
# FUNCTIONS
#=================================================

function Get-IncidentInformation {

    $IncidentData = [PSCustomObject]@{

        UserName          = Read-Host "Enter affected user name"
        IssueDescription  = Read-Host "Describe the issue"
        WorkingServices   = Read-Host "What is still working?"
        NotWorkingServices= Read-Host "What is not working?"
        IssueStart        = Read-Host "When did the issue start?"
        IssueFrequency    = Read-Host "Is the issue constant or intermittent?"
       AffectedUsers     = [int](Read-Host "How many users are affected?")
        ErrorMessage      = Read-Host "Is there an error message?"

    }

    return $IncidentData
}

function Get-IncidentClassification {

    param($Incident)

    # Major Incident
    if (
        $Incident.AffectedUsers -ge 10 -or
        $Incident.NotWorkingServices -match "(?i)all|system down|critical|entire"
    ) {
        return "Major Incident"
    }

    # Problem
    elseif (
        $Incident.AffectedUsers -gt 1 -or
        $Incident.IssueFrequency -match "(?i)recurring|often|intermittent"
    ) {
        return "Problem"
    }

    # Service Request
    elseif ($Incident.IssueDescription -match "(?i)\bps\s*login\b|password reset|login|account") {
        return "Service Request"
    }

    else {
        return "Incident"
    }
}

function Show-Summary {

    param($Incident, $Classification)

    Write-Host ""
    Write-Host "===== TICKET SUMMARY ====="
    Write-Host ""

    Write-Host "User:" $Incident.UserName
    Write-Host "Issue:" $Incident.IssueDescription
    Write-Host "Working:" $Incident.WorkingServices
    Write-Host "Not Working:" $Incident.NotWorkingServices
    Write-Host "Start:" $Incident.IssueStart
    Write-Host "Affected Users:" $Incident.AffectedUsers
    Write-Host "Error:" $Incident.ErrorMessage
    Write-Host ""
    Write-Host "Classification:" $Classification
    Write-Host ""
}



#=================================================
# MAIN
#=================================================

# MAIN

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host " ITIL Incident Intake Assistant"
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "WARNING: This script does NOT store any data." -ForegroundColor Green
Write-Host "All information will be lost after closing the session." -ForegroundColor Red
Write-Host ""

$Incident = Get-IncidentInformation

$Classification = Get-IncidentClassification -Incident $Incident

Show-Summary -Incident $Incident -Classification $Classification

Write-Host ""
Write-Host "WARNING: This script does NOT store any data." -ForegroundColor Green
Write-Host "All information will be lost after closing the session." -ForegroundColor Red
Write-Host ""

Read-Host "Press ENTER to close"


#=================================================
# OUTPUT
#=================================================