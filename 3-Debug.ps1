#Debug 1
Set-Location C:\Debugging
$FilePath = "C:\RunSpaceData.txt"
Import-Module .\Module.psm1

$Loops = 10
$BreakPoint = 3

:LoopName For ($Counter = 0; $Counter -LT $loops; $Counter++){
    If ($Counter = $BreakPoint){
        Break LoopName
    }
    "Sleeping $Counter"
    Start-UDFSleep
}
