$FilePath = "C:\RunSpaceData.txt"
$RunSpaceData = @{
    Computername = $ENV:COMPUTERNAME
    PID          = $PID
    RunSpace     = [Runspace]::DefaultRunspace.id
}
Out-File -FilePath $FilePath -InputObject (Convertto-json $RunSpaceData)
#Wait
$Seconds = 300
For ($Counter = 0; $Counter -lt $Seconds; $Counter++) {
    Start-Sleep -Seconds 1 
}



#Run from your IDE such as the ISE
# Entering The Runspace
whoami.exe
$FilePath = "C:\RunSpaceData.txt"
$Content = Get-Content -Path $FilePath -Raw
$RunSpaceData = ConvertFrom-Json -InputObject $content
If ($RunSpaceData.ComputerName -NE $ENV:COMPUTERNAME) {
    $PSSession = Enter-PSSession -ComputerName $RunSpaceData.ComputerName
    Invoke-Command -ScriptBlock { Enter-PSHostProcess -ID $args } -ArgumentList $RunSpaceData.PID -Session $PSSession
    "Debug-Runspace -id $($RunSpaceData.RunSpace)" | clip
}
Else {
    $RunSpaceData
    Enter-PSHostProcess -ID $RunSpaceData.PID
    #get-Runspace
    "Debug-Runspace -ID $($RunSpaceData.RunSpace)" | clip
}
# ? or h for help

#List powershell processes
Get-PSHostProcessInfo

#Enter different powershell process
#If running as a different user, This requires admin rights
