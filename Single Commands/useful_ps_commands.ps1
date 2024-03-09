Get ChildItem -Path

Get-ChildItem

#IMPORT ALL MODULES:
Get-Module -ListAvailable | Import-Module 

#IMPORT PSDIAGNOSTICS MODULE
Import-Module PSDiagnostics

#IMPORT PSDIAGNOSTICS BUT ONLY BRING FUNCTIONS STATED
Import-Module PSDiagnostics -Function Disable-PSTrace, Enable-PSTrace

#IMPORT SPECIFIC MODULES VIA VARIABLE
$module = Get-Module -ListAvailable PsDiagnostics, Dism
$module

IMPORT REMOTE AND LOCAL SAME TIME
Get-Module -PSSession $session -ListAvailable -name PSDiagnostics

Import-Module PSDiagnostics -Prefix DEMO

Import-Module -ModuleInfo $module

#OUTPUT POWERSHELL VERSION
$PSVersionTable

#LIST PROPERTIES FOR SERVICE
Get-Service -ServiceName 'Dnscache' | Get-Member -MemberType Property
Get-Service -ServiceName 'Dnscache' | Select-Object -Property 'StartType'
Get-Service -ServiceName 'Dnscache' | Get-Member -MemberType 'AliasProperty'

$svc = Get-Service -ServiceName 'Dnscache'
$svc

#tab:
$svc
#press tab to see diff options, e.g. returns $svc.Name

#LIST METHODS
Get-Service | Get-Member -MemberType 'Method'

Get-Service -ServiceName * | Select-Object -Property 'Status','DisplayName'

#In VSCode execute using F8

#COMMAND DISCOVERY

#LIST ALL VERB COMMANDS RELATED TO ADD
Get-Commmand -Verb Add

Get-Command -Noun Computer
Get-Command -CommandType Cmdlet
Get-Command *event*

Find-Command 
PSGetCommandInfo

Get-Help Add-Member -Full | Out-String -Stream | Select-String -Pattern Clixml