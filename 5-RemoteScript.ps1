write-output "I am process $pid"

$FilePath = "C:\PowershellDebugging\RunSpaceData.txt"
$RunSpaceData = @{
    Computername = $ENV:COMPUTERNAME
    PID          = $PID
    RunSpace     = [Runspace]::DefaultRunspace.id
}
Out-File -FilePath $FilePath -InputObject (Convertto-json $RunSpaceData)
Write-output (Convertto-json $RunSpaceData)
#Wait
$Seconds = 3000
#Wait-Debugger
For ($Counter = 0; $Counter -lt $Seconds; $Counter++) {
    Start-Sleep -Seconds 1 
    Write-Output "Waiting $Counter seconds out of $Seconds"
}

