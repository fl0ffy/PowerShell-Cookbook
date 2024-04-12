<# Script to recursively change file extensions
DateCreated: 12 APR 2024

Found here: https://stackoverflow.com/questions/21611551/recursively-renaming-files-with-powershell
#>

$FROM_EXT = '.txt'
$TO_EXT = '.sh'

Get-ChildItem -File -Recurse | % { Rename-Item -Path $_.PSPath -NewName $_.Name.replace($FROM_EXT, $TO_EXT)}
