Set-Location C:\Debugging

# Script with logic bug we need to step through
$Folders = Get-ChildItem -Recurse -Directory

Foreach ($Folder in $Folders) {
    $Files = Get-ChildItem -Path $Folder.Fullanme
    if ($Files.Extension.Where({ $PSitem -Like '*PS*' }) -NE $Null) {
        Write-Output -InputObject "$Folder contains Powershell Files"
        
    }
}
