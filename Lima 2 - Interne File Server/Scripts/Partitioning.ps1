#Script to automate the partitioning 

#Disk 0
Initialize-Disk 0

New-Partition -DiskNumber 0 -Size 20GB -DriveLetter D 
Format-Volume -DriveLetter D -FileSystem NTFS
Set-Volume -DriveLetter D -NewFileSystemLabel "VerkoopData"

New-Partition -DiskNumber 0 -Size 20GB -DriveLetter E
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter E -NewFileSystemLabel "OntwikkelingData"

#Disk 1
Initialize-Disk 1

New-Partition -DiskNumber 1 -Size 20GB -DriveLetter F
Format-Volume -DriveLetter F -FileSystem NTFS
Set-Volume -DriveLetter F -NewFileSystemLabel "ITData"

New-Partition -DiskNumber 1 -Size 20GB -DriveLetter G
Format-Volume -DriveLetter G -FileSystem NTFS
Set-Volume -DriveLetter G -NewFileSystemLabel "DirData"

New-Partition -DiskNumber 1 -Size 20GB -DriveLetter H 
Format-Volume -DriveLetter H -FileSystem NTFS
Set-Volume -DriveLetter H -NewFileSystemLabel "AdminData"

New-Partition -DiskNumber 1 -Size 20GB -DriveLetter Y 
Format-Volume -DriveLetter Y -FileSystem NTFS
Set-Volume -DriveLetter Y -NewFileSystemLabel "HomeDirs"

New-Partition -DiskNumber 1 -Size 20GB -DriveLetter Z
Format-Volume -DriveLetter Z -FileSystem NTFS
Set-Volume -DriveLetter Z -NewFileSystemLabel "ProfileDirs"

