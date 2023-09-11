## Exchange Receive Connectors:

### View ReceiveConnector Security Settings:

#### List All ReceiveConnectors:
``
Get-ReceiveConnector | Sort Identity
``

#### List ReceiveConnectors w/ Pertinent Info:
``
Get-ReceiveConnector | FL Identity,Bindings,Enabled,MaxInbound*
``

#### List ReceiveConnectors w/ Expanded Pertinent Info:
``
Get-ReceiveConnector -Server SERVER-NAME | Select Identity,Name,Enabled,ProtocolLoggingLevel,MaxMessageSize,MaxLocalHopCount,MaxHopCount,AuthMechanism,PermissionGroups,RemoteIPRanges,Bindings,FQDN
``

#### View ReceiveConnector Security Settings:
``
Get-ReceiveConnector | Sort Identity | FL Identity,AuthMechanism,PermissionGroups
``

#### Exchange PS - RecieveConnector Ingress Statistics:
###### View the rate of mail flow per connector
``
Get-ReceiveConnector | Where {$_.Identity -Like "*"} | Select Name,Bindings,MaxInboundConnectionPerSource,TarpitInterval
``

#### Set MaxInbound Connections for Receive Connector:

##### View Receive Connectors:
``
Get-ReceiveConnector -Server SVR_NAME | FL Identity,Bindings,Enabled,*MaxInbound*
``

##### View Specific ReceiveConnector:
``
Get-ReceiveConnector '<connector-name>'
``
*IE
``
Get-ReceiveConnector '<svr-name>\<connector-name>'
``

##### Adjust ReceiveConnector Settings (w/ example values):
``
Set-ReceiveConnector '<connector-name>' -MaxInboundConnection 5000 -MaxInboundConnectionPerSource 500 -MaxInboundConnectionPercentagePerSource 20
``

### Incase you ever need to stop all inbound mailflow for `<insert reason>`
#### Stop All Inbound Mail Flow CMDLET:
``
Get-ReceiveConnector | Set-ReceiveConnector -Enabled $False
``
#### Start All Inbound Mail Flow CMDLET:
``
Get-ReceiveConnector | Set-ReceiveConnector -Enabled $True
``
