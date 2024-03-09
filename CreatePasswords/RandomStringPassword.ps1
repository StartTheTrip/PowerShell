#Creates a password for Wifi Network, saves to clipboard
Param (
	[int]$Length = 32,
	[switch]$SpecialCharacters,
	[validateset('ClearTXT','Base64','SecureString')]
	[string]$returnType = 'ClearTXT',
	[switch]$NoClipBoard
)

if ($Length -lt 10){
	Write-Warning 'Password is less than 10 Chars long'
	break
}

$password = New-Object -TypeName System.Collections.Generic.List[Char]
$pwOptionList = New-Object -TypeName System.Collections.Generic.List[PsObject]
$pwOptionList.Add([PSCustomObject]@{charArray        = 97..122})
$pwOptionList.Add([PSCustomObject]@{numbers          = 48..57})
$pwOptionList.Add([PSCustomObject]@{capitalCharArray = 65..90})

if ($SpecialCharacters){
	$pwOptionList.Add([PSCustomObject]@{specialChars = (33..47) + (58..64) + (91..95) + (123..126)})
}

for ($i = 0 ; $i -lt $Length; $i++){

	$randomIndex = get-random -Minimum 0 -Maximum $pwOptionList.count
	$typeChoice  = $pwOptionList[$randomIndex].psObject.Properties.value

	$randomIndex = get-random -Minimum 0 -Maximum $typeChoice.Count
	$password.Add([char]$typeChoice[$randomIndex])
}

$pw = $password -join ''

#verify password
if ($pw -notmatch "[A-Za-z0-9]"){
	if ($SpecialCharacters -and $pw -notmatch "[^A-Za-z0-9]"){
		New-RandomPassword -Length $Length -returnType $returnType -SpecialCharacters
	} else {
		New-RandomPassword -Length $Length -returnType $returnType
	}
}

switch ($returnType) {
	'Base64' {
		$b64 = [convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($pw))

		if (-not $NoClipBoard){
			$b64 | Set-Clipboard
		}
		return $b64
	}
	'SecureString' {
		$secure = ConvertTo-SecureString $pw -AsPlainText -Force
		return $secure
	}
	Default {
		if (-not $NoClipBoard){
			$pw | Set-Clipboard
		}
		return $pw
	}
}
