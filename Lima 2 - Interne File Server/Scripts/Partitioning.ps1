#Script to automate the partitioning 

#Disk 0
Initialize-Disk 0

New-Partition -DiskNumber 0 -Size 20GB -AssignDriverLetter 
Format-Volume -DriveLetter  -FileSystem NTFS
Set-Volume -DriveLetter E -NewFileSystemLabel "VerkoopData"
Set-Partition -DriveLetter XXX -NewDriveLetter D

New-Partition -DiskNumber 0 -Size 20GB -AssignDriverLetter 
Format-Volume -DriveLetter  -FileSystem NTFS
Set-Volume -DriveLetter E -NewFileSystemLabel "OntwikkelingData"
Set-Partition -DriveLetter XXX -NewDriveLetter E

#Disk 1
Initialize-Disk 1

New-Partition -DiskNumber 1 -Size 20GB -AssignDriverLetter 
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter E -NewFileSystemLabel "ITData"
Set-Partition -DriveLetter #XXX -NewDriveLetter F

New-Partition -DiskNumber 1 -Size 20GB -AssignDriverLetter 
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter E -NewFileSystemLabel "DirData"
Set-Partition -DriveLetter #XXX -NewDriveLetter G

New-Partition -DiskNumber 1 -Size 20GB -AssignDriverLetter 
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter  -NewFileSystemLabel "AdminData"
Set-Partition -DriveLetter #XXX -NewDriveLetter H

New-Partition -DiskNumber 1 -Size 20GB -AssignDriverLetter 
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter  -NewFileSystemLabel "HomeDirs"
Set-Partition -DriveLetter #XXX -NewDriveLetter Y

New-Partition -DiskNumber 1 -Size 20GB -AssignDriverLetter 
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter  -NewFileSystemLabel "ProfileDirs"
Set-Partition -DriveLetter #XXX -NewDriveLetter Z