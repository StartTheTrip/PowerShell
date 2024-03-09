#This script repeats the same thing, it is a reference, don't run
import-csv input\change.csv | ForEach-Object {Set-ADUser -Identity $_.SamAccountName -PasswordNeverExpires:$FALSE}

also

#1: GET ALL USERS FOR TEXT FILE - might need full string for group name
Get-ADGroupMember -Identity "GROUP_IDENTITY_NAME" | Select-Object Name | Sort-Object Name |
Export-Csv -Path log\GROUP_NAME.csv -NoTypeInformation


#1 ALT: GET ALL USERS WITH PASSWORD NEVER EXPIRES TO TRUE

Get-ADGroupMember -Identity "GROUP_IDENTITY_NAME" | where {
$_.passwordNeverExpires -eq "true" } |  Select-Object DistinguishedName,Name,Enabled |
Export-csv log\GROUP_IDENTITY_NAME.csv -NoTypeInformation

#notes:
get-aduser -filter * -properties Name, PasswordNeverExpires | where {
$_.passwordNeverExpires -eq "true" } |  Select-Object DistinguishedName,Name,Enabled |
Export-csv log\pw_never_expires.csv -NoTypeInformation

#2: FOR A SINGLE USER OR FROM FILE

$users = Import-CSV log\users.csv
ForEach($user in $users)
{
	#Might not need the line below
	Where-Object {$.passwordNeverExpires -eq "true"} 
	#Don't need the line below as the accounts are fed in via the CSV
	#| Where-Object {#GROUP_NAME -eq "CN=GROUP_NAME,OU=Example,DC=prod,DC=example,DC=example,DC=example}
	#Set-ADUser $user -PasswordNeverExpires $false
	
	#MAIN
	Where-Object {$.passwordNeverExpires -eq "true"} |
	Set-ADUser -Identity $user -PasswordNeverExpires:$false
	#alt
	Set-ADUser -Identity $user -PasswordNeverExpires $false
}

#3: FOR ALL USERS PULLING WITHOUT FILE

$users = CN=GROUP_NAME,OU=Example,DC=prod,DC=example,DC=example,DC=example

$users = Get-ADGroupMember -Identity "GROUP_MEMBER" | Select-Object Name
ForEach($user in $users)
{
Set-ADUser -Identity $user -PasswordNeverExpires:$false
#alt
Set-ADUser -Identity $user -PasswordNeverExpires $false
}