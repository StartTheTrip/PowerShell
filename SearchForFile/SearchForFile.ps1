#Search for files in directories

Function Search-ForFile($Location=""){
    Write-Host "Windows: Search for files`n`nv0.1 by StartTheTrip`n`n"
    if ( [string]::IsNullOrWhiteSpace($preString) ) {
    $preString = Read-Host -Prompt "Enter filename, e.g. journal.txt"
	if ($preString -eq '') {
		Write-Host "You must provide text to remove, exiting..."
		Start-Sleep -s 5
		exit
		}
	$stringToSearch = $preString
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null
    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select folder containing files to rename"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $Location
    if($foldername.ShowDialog() -eq "OK")
    {
		$folder += $foldername.SelectedPath
        Get-ChildItem -Path $folder -Filter "$preString" -Recurse -ErrorAction SilentlyContinue
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


Search-ForFile