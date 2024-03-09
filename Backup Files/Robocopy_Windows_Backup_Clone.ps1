#copy including empty subdirectories and multithread and restart
robocopy 'd:\*' '\\media\\location' /b /e /mt /A-:SH /z

#mirror directory, exclude windowsapps
robocopy D:\ H:\Backup\D /MIR /Z /XA:H /A-:SH /W:5 /XD D:\WindowsApps

#if the folder is hidden use the following:
attrib -h  -s  -a G:\Backup Folder

###
#check space available on the external disk
#get the folder names
#sort them
#count them
#grab a chunk of them [half, third, quarter?] and write them to the external disk
#check external disk space remaining
#repeat until the external disk is near capacity
#send the remaining stuff to the other disk

robocopy D:\ F:\27-01-2024\D /MIR /Z /XA:H /A-:SH /W:5 /XD D:\WindowsApps "D:\WPSystem"