# This script configures the Hyper-V machines used for the 50331 Course.
# PowerShell 3.0 and Windows Server 2012 or Windows 8 Pro are required to perform this setup.
# The C:\ Drive should have at least 200GB of free space available.
# All the files on the 50331 Student CD should be copied to C:\Labfiles before performing this setup.

# Variables
$SRV1 = "Lima2_WinSer2016"                #WinSer2016 box
$VHD2 = 'D:\HyperV\Schijf2.vhdx'			#location disk 2
$SRAM = 1GB				                # RAM assigned to Server Operating System
$WSISO = "D:\school\project\iso's_met_unattend\Server2016-1Schijf.iso"  #WinSer2016 Iso
$SRV1VHD = 100GB                 #Hard disk 1
$SRV2VHD = 100GB               #Hard disk 2
$VMLOC = "D:\HyperV"
$NetworkSwitch5 = "Switch5"	# Name of the Network Switch

# Create VM Folder and Network Switch
MD $VMLOC -ErrorAction SilentlyContinue
$TestSwitch = Get-VMSwitch -Name $NetworkSwitch5 -ErrorAction SilentlyContinue; if ($TestSwitch.Count -EQ 0){New-VMSwitch -Name $NetworkSwitch5 -SwitchType Private}

# Create Virtual Machines

New-VM -Name $SRV1 -Path $VMLOC -MemoryStartupBytes $SRAM -NewVHDPath $VMLOC\$SRV1.vhdx -NewVHDSizeBytes $SRV1VHD -SwitchName $NetworkSwitch5

New-VHD -Path $VHD2 -Dynamic -SizeBytes $SRV2VHD
Add-VMHardDiskDrive -VMName $SRV1 -Path $VHD2

# Configure Virtual Machines
Set-VMDvdDrive -VMName $SRV1 -Path $WSISO
Start-VM $SRV1
