Set-Location C:\Debugging

#Transcript example

Start-Transcript -Path "$env:temp\DebugTranscript.log" -force
foreach ($i in 1..3) {
    Write-Output $i
    Write-verbose -message "Verbose $i"
    Write-Debug -Message "Debug $i"
    Write-Warning -Message "Warning $i"
    Write-Error -Message "Error $i" -erroraction Continue

    # Debug and Verbose Have to be enabled to log in transcripts
    $VerbosePreference = 'Continue'
    $DebugPreference = 'Continue'
}
Stop-Transcript
start-process -FilePath (Where.exe notepad)[0] -ArgumentList "$env:temp\DebugTranscript.log"





#Trace Example
Set-PSDebug -Trace 2
$MaxLoops = 10
$BreakPoint = 3

:LoopName For ($Counter = 0; $Counter -LT $Maxloops; $Counter++) {
    If ($Counter = $BreakPoint) {
        Break LoopName
    }
    "Sleeping $Counter"
    #Inspect Module
    start-sleep –seconds 1
}
