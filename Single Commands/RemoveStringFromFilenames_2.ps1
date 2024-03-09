#Run this command
Get-ChildItem | Rename-Item -NewName {$_.Name -replace "REPLACE - ", "" }
# For Funny Names
#Get-ChildItem | Rename-Item -NewName {$_.Name -replace "?REPLACE - ", "" }