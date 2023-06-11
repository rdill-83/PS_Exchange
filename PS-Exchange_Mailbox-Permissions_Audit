### PS-Exchange_Mailbox-Permissions_Audit

#### User Mailbox Permissions Audit:
Get-Mailbox -ResultSize Unlimited -RecipientTypeDetails UserMailbox | Get-MailboxPermission | Where {$_.AccessRights -like '*' -and $_.User.ToString() -ne "NT Authority\System" -and $_.user.ToString() -ne "NT Authority\Self"} | Select Identity,User,AccessRights

#### Shared Mailbox Permissions Audit:
Get-Mailbox -ResultSize unlimited -RecipientTypeDetails Sharedmailbox | Get-MailboxPermission | Where {$_.AccessRights -like '*' -and $_.User.ToString() -ne "NT Authority\System" -and $_.User.ToString() -ne "NT Authority\Self"} | Select Identity,User,AccessRights
