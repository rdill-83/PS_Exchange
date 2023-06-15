### Exchange_Database_Essential-Info

#### Essential Info CMDLET:
```
Get-MailboxDatabase | FL Name,EDBFilePath,LogFolderPath,CircularLoggingEnabled,*FullBackup
```

#### View All Mailbox DB Info CMDLET:
``
Get-MailboxDatabase | FL *
``
#### Pertinent DB Info:
``
Get-MailboxDatabase Private_01 | FL Name,OriginatingServer,*Quota,EDBFilePath,LogFolderPath
``

#### DB Mount & Health Status CMDLET:
``
Get-MailboxDatabaseCopyStatus
``

#### View Mailbox Database Status:
``
Get-MailboxDatabase -Status | FL Name,*Backup*
``

#### List Exchange Database Size & Available Capacity:
``
Get-MailboxDatabase -Status | Select ServerName,Name,DatabaseSize,AvailableNewMailboxSpace
``

#### List Exchange Database Size & Available Capacity - Sorted:
``
Get-MailboxDatabase -Status | Sort DatabaseSize | Select ServerName,Name,DatabaseSize,AvailableNewMailboxSpace,EDBFilePath,OriginatingServer
``

#### PS - DB Size Quota AuditSyntax Example:
``
Get-MailboxDatabase DATABASE-NAME | Get-Mailbox | Where {$_.UseDatabaseQuotaDefaults -like "*False*"} | Sort Name | FT Name, PrimarySMTPAddress, UseDatabaseQuotaDefaults, ProhibitSendReceiveQuota
``

#### PS - DB Size Quota Audit w/ Ignore Discover Mailbox:
``
Get-MailboxDatabase DATABASE-NAME | Get-Mailbox | Where {$_.UseDatabaseQuotaDefaults -like "*False*" -and $_.Name -notlike 'Discovery*'} | Sort Name | FT Name, PrimarySMTPAddress, UseDatabaseQuotaDefaults, ProhibitSendReceiveQuota
``
