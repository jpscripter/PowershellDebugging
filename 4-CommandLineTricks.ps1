# Errors and Debugging With Trap
$ErrorActionPreference = "stop"
trap{
    Write-output "Error detected: start"
    Wait-Debugger
    $psitem
    Write-output "Error detected: end"
}
Get-Content "c:\DoesNotExist.txt"

# errors and debugging with try/catch
Try{
    Get-Item "C:\DoesNotExist.txt"

}Catch{
    Wait-Debugger
    Write-Output "Errored"
}


#Conditional Triggers
# break here will only trigger when $Counter equals 1
Set-PSBreakpoint -Variable counter -Action {If ($Counter -eq 1){Break}}

For ($Counter = 0; $Counter -LT 3; $Counter++){
    "Looping $Counter"
}


# Custom PSDebugging Prompt
Set-PSBreakpoint -Variable 'Counter' -Action {Write-Warning -Message "Counter = $Counter"}


#remove all breakpoints
Get-PSBreakpoint | Remove-PSBreakpoint