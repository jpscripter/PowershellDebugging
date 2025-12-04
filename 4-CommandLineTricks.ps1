# Errors and Debugging
trap{
    Write-output "Error detected: start"
    Wait-Debugger
    $psitem
    Write-output "Error detected: end"
}

Try{
    Get-Item "C:\DoesNotExist.txt"

}Catch{
    Wait-Debugger
    Write-Output "Errored"
}

#Conditional Triggers
Set-PSBreakpoint -Variable counter -Action {If ($Counter -eq 1){Break}}

For ($Counter = 0; $Counter -LT 3; $Counter++){
    "Looping $Counter"
}

# Custom PSDebugging Prompt
Set-PSBreakpoint -Variable 'Counter' -Action {Write-Warning -Message "Counter = $Counter"}


#remove all breakpoints
Get-PSBreakpoint | Remove-PSBreakpoint