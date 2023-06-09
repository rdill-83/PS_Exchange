### Exchange PS - Identitify Disconnected Mailboxes

###### (Below CMDLETs Identitify Disabled / Soft Deleted Mailboxes)

#### Disabled Mailbox:
``
Get-MailboxStatistics -Database Private02 | Where { $_.DisconnectReason -eq "Disabled" } | Format-List DisplayName, LegacyDN, MailboxGUID, DisconnectReason
``

#### Soft-Deleted Mailboxes:
``
Get-MailboxDatabase | Get-MailboxStatistics | Where { $_.DisconnectReason -eq "SoftDeleted" } | ft DisplayName,Database,DisconnectDate
``

#### Disconnected Mailboxes per Database:
``
Get-MailboxStatistics -Database <database-name> | Where {$_.DisconnectReason} | Sort Displayname | FT DisplayName,DisconnectReason,DisconnectDate,LastLogOffTime
``

#### Live Example - Disconnected Mailboxes per Database:
``
Get-MailboxStatistics -Database <database-name> | Where {$_.DisconnectReason} | Sort Displayname | FT DisplayName,TotalItemSize,DisconnectReason,DisconnectDate,LastLogOffTime
``

#### List All Disabled type Disconnected Mailboxes:
``
Get-MailboxDatabase | Get-MailboxStatistics | Where {$_.DisconnectReason -eq 'Disabled'} | Sort Database | FT DisplayName,TotalItemSize,DisconnectDate,DisconnectReason,Database
``

#### List ALL Disconnected Mailboxes:
``
Get-MailboxDatabase | Get-MailboxStatistics | Where {$_.DisconnectReason} | Sort Database | FT DisplayName,TotalItemSize,DisconnectDate,DisconnectReason,Database
``

###### Source:
https://technet.microsoft.com/en-us/library/bb232039(v=exchg.160).aspx



#### Generate Report - All Disconnected Mailboxes:

``Get-mailboxdatabase | Get-MailboxStatistics | ? { $_.disconnectreason } | select Database,disconnectDate, disconnectReason, DisplayName, @{label="WindowsEmailAddress";expression={ get-user -identity ($_).MailboxGuid.Guid | select -expandproperty WindowsEmailAddress } } | Export-Csv -NoTypeInformation $env:userprofile\mailbox_report.csv
``



