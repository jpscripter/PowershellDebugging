Set-Location C:\PowershellDebugging
#start-process Powershell.exe -ArgumentList "-file C:\PowershellDebugging\3-Debugger2.ps1" -WindowStyle Normal

# This has a bug
$FilePath = "C:\PowershellDebugging\RunSpaceData.txt"
Import-Module .\Module.psm1

$Loops = 10
$BreakPoint = 3

:LoopName For ($Counter = 0; $Counter -LT $loops; $Counter++){
    If ($Counter = $BreakPoint){
        Write-output "We're done here"
        #Wait-Debugger
        Break LoopName
    }
    "Sleeping $Counter"
    Start-UDFSleep
}

# This also works
#Set-PSBreakpoint -Script C:\PowershellDebugging\3-Debugger2.ps1 -Line 13