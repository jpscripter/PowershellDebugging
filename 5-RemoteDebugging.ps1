Start-process Powershell.exe -ArgumentList "-file C:\PowershellDebugging\5-RemoteScript.ps1" -WindowStyle Normal
start-sleep -Seconds 5 

# Entering The Runspace
whoami.exe
$FilePath = "C:\PowershellDebugging\RunSpaceData.txt"
$Content = Get-Content -Path $FilePath -Raw
$RunSpaceData = ConvertFrom-Json -InputObject $content
$RunSpaceData

#Connect to remote computer then runspace
If ($RunSpaceData.ComputerName -NE $ENV:COMPUTERNAME) {
    $PSSession = Enter-PSSession -ComputerName $RunSpaceData.ComputerName
    Invoke-Command -ScriptBlock { Enter-PSHostProcess -ID $args } -ArgumentList $RunSpaceData.PID -Session $PSSession
}else{
    Enter-PSHostProcess -ID $RunSpaceData.PID
}
"Debug-Runspace -ID $($RunSpaceData.RunSpace)" | clip




#List powershell processes
#Enter different powershell process
#If running as a different user, This requires admin rights

Get-PSHostProcessInfo
Enter-PSHostProcess -ID $RunSpaceData.PID
get-runspace
