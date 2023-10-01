# ExchangeOnline - Shared Mailbox Access Report

# Retrieve Shared Mailboxes:
$Mailboxes = Get-Mailbox -RecipientTypeDetails SharedMailbox -ResultSize Unlimited

# Run Shared Mailbox Access Report - Console Output:
$Mailboxes | Get-MailboxPermission | Where {$_.User -notLike '*self'} | Sort Identity | FT Identity,User,Deny,AccessRights,isInherited

# Run Shared Mailbox Access Report - CSV Output:
$mailboxes | Get-MailboxPermission | Where {$_.User -notLike '*SELF'} | Select Identity,User,Deny,AccessRights,isInherited | Export-CSV -LiteralPath "C:\Exchange_SharedMailbox_AccessReport_$(Get-Date -f yyyy-MM-dd).csv" -NoTypeInformation

