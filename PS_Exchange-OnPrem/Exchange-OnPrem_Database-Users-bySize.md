### ExchangePS - Database Users by Size
(Lists Database Users by Size)

##### Full CMDLET (blank example):
``
Get-MailboxDatabase <DATABASE-NAME> | Get-MailboxStatistics | Sort TotalItemSize -Descending | FT DisplayName, LastLoggedOnUserAccount, TotalItemSize, ItemCount, LastLogonTime
``

##### ONLY Active Users - Esssential Info CMDLET:
``
Get-MailboxDatabase <DATABASE-NAME> | Get-Mailbox | Get-MailboxStatistics | Sort TotalItemSize -Descending | FT DisplayName,TotalItemSize,ItemCount,LastLogonTime
``

##### OVER WARNING QUOTA AUDIT W/ TOP OFFENDERS*
``
Get-MailboxDatabase <DATABASE-NAME> | Get-MailboxStatistics | Sort TotalItemSize -Descending | FT DisplayName, TotalItemSize, ItemCount, TotalDeletedItemSize, DeletedItemCount, DatabaseIssueWarningQuota -Auto | Select -First 15
``

##### Full Database User Details (Impractical / Ugly / Thorough)
``
Get-MailboxDatabase <DATABASE-NAME> | Get-MailboxStatistics | FL *
``
