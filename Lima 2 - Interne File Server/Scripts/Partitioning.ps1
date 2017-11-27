#Script to automate the partitioning 

#Disk 0
Initialize-Disk 0

New-Partition -DiskNumber 0 -Size 20GB -DriveLetter D 
Format-Volume -DriveLetter  -FileSystem NTFS
Set-Volume -DriveLetter E -NewFileSystemLabel "VerkoopData"

New-Partition -DiskNumber 0 -Size 20GB -DriveLetter E
Format-Volume -DriveLetter  -FileSystem NTFS
Set-Volume -DriveLetter E -NewFileSystemLabel "OntwikkelingData"

#Disk 1
Initialize-Disk 1

New-Partition -DiskNumber 1 -Size 20GB -DriveLetter F
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter E -NewFileSystemLabel "ITData"

New-Partition -DiskNumber 1 -Size 20GB -DriveLetter G
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter E -NewFileSystemLabel "DirData"

New-Partition -DiskNumber 1 -Size 20GB -DriveLetter H 
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter  -NewFileSystemLabel "AdminData"

New-Partition -DiskNumber 1 -Size 20GB -DriveLetter Y 
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter  -NewFileSystemLabel "HomeDirs"

New-Partition -DiskNumber 1 -Size 20GB -DriveLetter Z
Format-Volume -DriveLetter E -FileSystem NTFS
Set-Volume -DriveLetter  -NewFileSystemLabel "ProfileDirs"

