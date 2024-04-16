<#
Script to add printer

Created By: John Bernat
Created Date: 20231122

Note: Execution may prompt to Set execution policy, enter 'y' and hit enter
The powershell window will close when complete
#>


$PrintServer = ''
$PrinterName = ''


Add-Printer -ConnectionName \\${PrintServer}\${PrinterName}