# PS-Exchange_ConvertToSharedMailbox-Bulk.ps1

## Convert CSV List of Users to Shared Mailboxes

### Note - CSV Requires Header title 'mailbox'


$mailboxes = Import-CSV -Path .\<your-file>.csv

### Foreach-Object Method:
$Mailboxes | foreach-object {Get-Mailbox -Identity $_.mailbox}


### Convert To Shared Mailbox - WhatIf Sanity Check:
$Mailboxes | foreach-object {Get-Mailbox -Identity $_.mailbox | Set-Mailbox -Type Shared -WhatIf}

### Convert To Shared Mailbox - Bulk:
$mailboxes | Foreach-Object {Get-Mailbox -Identity $_.Mailbox | Set-Mailbox -Type Shared}
