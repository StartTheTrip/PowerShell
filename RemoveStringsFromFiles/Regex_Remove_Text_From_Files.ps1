#Removes text from filename based on simple regex
Function Get-Folder($Location="")

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $Location

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder


}
Function Get-RemoveString($Location="",$stringToRemove="DONOTEDITTHISPROTECTION") {
	Write-Host "Windows: Remove Text from Filename`n`nv0.1 by StartTheTrip`n`n"
	if ( [string]::IsNullOrWhiteSpace($preString) ) {
	$preString = Read-Host -Prompt "Enter regex to remove text from file name, e.g. \d\d\d\d\d\d\d\d_(attachment)_\d\d\d\d\d\d\d\d_"
	if ($preString -eq '') {
		Write-Host "You must provide text to remove, exiting..."
		Start-Sleep -s 5
		exit
		}
	$stringToRemove = $preString
    }
	[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null
    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select folder containing files to rename"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $Location
    if($foldername.ShowDialog() -eq "OK")
    {
		$folder += $foldername.SelectedPath
		Write-Host "`nRemoving:`n$stringToRemove `n`nFrom the name of all files in:`n$folder`n"
		$confirmation = Read-Host "Are you Sure? Enter yes to continue"
		if ($confirmation -eq 'yes') {
        Get-ChildItem -Path $folder -File | Rename-Item -NewName { ($_.BaseName -replace $stringToRemove) + $_.Extension }
		Write-Host "`nFinished...`nCheck: $folder`n`nExiting..."
		Start-Sleep -s 3
		exit
		} 
		else { 
		Write-Host "Confirmation failed, exiting..."
		Start-Sleep -s 3
		exit
		}
    }
}


#Get-Folder
Get-RemoveString