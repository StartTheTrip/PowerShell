# NETSH WRAPPER TO LIST SSIDS IN NETWORK SETTINGS.
# Dumps SSID and Password

$list = (netsh.exe wlan show profiles)
if ($list -match "No SSIDs to show."){
	Write-Output $list
	exit
}

$ListOfSSID = ($list | Select-string -pattern "\w*All User Profile.*: (.*)" -allmatches).Matches | ForEach-Object {$_.Groups[1].Value}
$NumberOfWifi = $ListOfSSID.count
Write-Warning "[$(Get-Date)] I've found $NumberOfWifi Wi-Fi Connection settings stored in your system $($env:computername) : "
foreach ($SSID in $ListOfSSID){
    try {
        $passphrase = ($(netsh.exe wlan show profiles name=`"$SSID`" key=clear) |
                    Select-String -pattern ".*Key Content.*:(.*)" -allmatches).Matches |
                        ForEach-Object {$_.Groups[1].Value}
    }
    catch {
        $passphrase = "N/A"
    }
    Write-Output "$SSID : $passphrase"
}