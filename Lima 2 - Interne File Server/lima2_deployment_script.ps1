-`New-VM -Name Lima2_WinSer2016
       -Path 'C:\Users\theso\Desktop\Super Phun Thyme\2017-2018\Projecten III\p3ops-red\Lima 2 - Interne File Server'
       -NewVHDPath 'C:\Users\theso\Desktop\Super Phun Thyme\2017-2018\Projecten III\p3ops-red\Lima 2 - Interne File Server'
       -NewVHDSizeBytes 50GB `
       -Generation 1
       -MemoryStartupBytes 2GB `

       
       
Name: Name of the Virtual Machine
Path: Path where will be stored VM files
NewVHDPath: Create a VHD(X) file to the specified path (Dynamic disk)
New-VHDSizeBytes: Size of the VHD(X) file
Generation: VM generation (1 or 2)
MemoryStartupBytes: Memory assigned to the VM (static Memory)
SwitchName: switch name where the network adapter will be connected