#Get all established connections
Get-NetTcpConnection
Get-NetTCPConnection | Select-Object -Property *
#ports only
Get-NetTCPConnection -State Listen
#Track process
Get-Process -Id 692
#give name
Get-NetTCPConnection | Select-Object -Property *,@{'Name' = 'ProcessName';'Expression'={(Get-Process -Id $_.OwningProcess).Name}}
#track state
Get-NetTCPConnection | Select-Object -Property *,@{'Name' = 'ProcessName';'Expression'={(Get-Process -Id $_.OwningProcess).Name}}
#remote only
Get-NetTCPConnection -RemotePort 443