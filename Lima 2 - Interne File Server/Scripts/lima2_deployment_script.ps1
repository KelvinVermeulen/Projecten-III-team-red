       
<#       
Name: Name of the Virtual Machine
Path: Path where will be stored VM files
NewVHDPath: Create a VHD(X) file to the specified path (Dynamic disk)
New-VHDSizeBytes: Size of the VHD(X) file
Generation: VM generation (1 or 2)
MemoryStartupBytes: Memory assigned to the VM (static Memory)
SwitchName: switch name where the network adapter will be connected
#> 

#als er een fout in het script is; verwijder lokaal de inhoud van de directory van C:\Hyper-V\
           
#variables 

$WSISO = "D:\school\project\WinServ16Unattend1schijf.iso"  #WinSer2016 Iso
$CLI1VHD = 100GB                 #Hard disk 1
$CLI2VHD = 100GB                 #Hard disk 2
$SRV1 = "Lima2_WinSer2016"                #WinSer2016 box
$VMLOC = "C:\HyperV"
$NetworkSwitch5 = "Switch5"	# Name of the Network Switch

# Create VM Folder and Network Switch
MD $VMLOC -ErrorAction SilentlyContinue
$TestSwitch = Get-VMSwitch -Name $NetworkSwitch5 -ErrorAction SilentlyContinue; if ($TestSwitch.Count -EQ 0){New-VMSwitch -Name $NetworkSwitch5 -SwitchType Private}
# Create Virtual Machines
New-VM -Name $SRV1 -Path $VMLOC -NewVHDPath $VMLOC\$SRV1\Disk1.vhdx,$VMLOC\$SRV1\Disk2.vhdx -NewVHDSizeBytes $CLI1VHD, $CLI2VHD -SwitchName $NetworkSwitch5
# Configure Virtual Machines
Set-VMDvdDrive -VMName $SRV1 -Path $WSISO

Get-VM $SRV1 | Add-VMHardDiskDrive -ControllerType SCSI -ControllerNumber 0

#mount-vhd -Path $VHDPath   ?
#new-partition
#set-partition

Start-VM $SRV1

       

       
