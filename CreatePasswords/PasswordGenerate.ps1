#Password Generator
$MinPwLength = 16
$MaxPwLength = 20
$HowMany = 20
$Exclude = '()<>[]:;@\,.!%^&''"|'

If ($MinPwLength -gt $MaxPwLength -or $HowMany -lt 1){Write-Host "User error!";Exit}
$b = New-Object byte[](1)
$rng = [System.Security.Cryptography.RandomNumberGenerator]::Create()
$Exclude = $Exclude.ToCharArray()
For($i=0;$i -lt $HowMany;$i++){
	$pw = New-Object byte[](0)
	$numbers = $True
	$uppercase = $True
	$lowercase = $True
	$special = $True
	Do{
		$rng.GetBytes($b)
		If(($b -ge 32) -and ($b -le 126) -and ($b -ne $pw[-1]) -and !([char]$b[0] -in $Exclude) ){
			$pw += $b
			If (($b -ge 48) -And ($b -le 57)){$numbers = $False}
			ElseIf (($b -ge 65) -And ($b -le 90)){$uppercase = $False}
			ElseIf (($b -ge 97) -And ($b -le 122)){$lowercase = $False}
			Else {$special = $False}
			If ($pw.Length -gt $MaxPwLength){$pw = $pw[($pw.Length-$MaxPwLength)..($pw.Length)]}
		}
	}While (($pw.Length -lt $MinPwLength) -or $numbers -or $uppercase -or $lowercase -or $special)
	$pw = [System.Text.Encoding]::ASCII.GetString($pw)
	Write-Host "$($pw.Length)`t$pw"
}