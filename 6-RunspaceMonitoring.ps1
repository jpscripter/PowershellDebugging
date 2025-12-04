Start-process Powershell.exe -ArgumentList "-file C:\PowershellDebugging\5-RemoteScript.ps1" -WindowStyle Normal

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


# Investigate runspace without entering it
$runspace = Get-runspace -id 1

#current command
$callstack = $runspace.Debugger.GetCallStack()
$callstack
$callstack.position

#script block
$callstack.invocationInfo.mycommand.scriptblock