#robocopy source destination system files test run
#/l is for test run
#/XD excludes a folder
#/XO skips older files which exist
#/copy:dt error 5 fix - access denied msg

#Merge Example - RUN TEST RUN FIRST /L
#robocopy "I:\Source" "D:\Destination" /IS /E

#Merge but skip files which exist but are older modified time
#robocopy "I:\Source" "D:\Destination" /IS /E /XO

#SMB to NAS, exclude a folder
#robocopy "I:\Source" "D:\Destination"  /IS /E /XO /XD "I:\Source\Unsorted" 

#Test run
robocopy "I:\Source" "D:\Destination" /IS /E /L

#error 5 fix - access denied msg
#robocopy "I:\Source" "D:\Destination" /IS /E /COPY:DT