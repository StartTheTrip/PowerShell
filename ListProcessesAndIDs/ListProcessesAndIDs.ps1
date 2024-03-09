#Stops executables and collects a list of processes, printers, serialnumber, manufacturer and model for Windows system
#AV Kill can be used to stop a process, a list of AV executables is included, commented out to protect
#PS Set Variables and Date
$fpth = Get-Location
$avfile = 'input\AVList.txt'
$servers = 'input\servers.txt'
$processfile = 'log\processes.txt'
$eventsfile = 'log\events.txt'
$infofile = 'log\windowsinfo.txt'
$printers = 'log\printers.txt'
Get-Date > $infofile
#Out-File -FilePath $avfile

# AV Kill
$av_data = Get-Content $avfile
#taskkill /IM notepad.exe >$null 2>&1
foreach($line in $av_data) {
#    taskkill /IM $line >$null 2>&1
}

#System info
wmic process get Caption,ParentProcessId,ProcessId | Out-File -FilePath $processfile
Write-Output 'SYSTEM INFO:' >> $infofile
wmic computersystem get name >> $infofile
wmic bios get serialnumber >> $infofile
wmic computersystem get manufacturer >> $infofile
wmic computersystem get model >> $infofile
hostname > $servers

$remote = Get-Content $servers
foreach($server in $remote) {
#Get-EventLog -List -Logname Security -Newest 10 >> $eventsfile
Get-EventLog -List -ComputerName $server >> $eventsfile
}

wmic printer get name >> $printers