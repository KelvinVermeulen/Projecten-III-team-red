Write-Host 'Stopping VM WinSer16'
Stop-VM -Name WinSer16
Write-Host 'WinSer16 Stopped'
Write-Host 'Adding Dvd Disks'
Write-Host 'Adding 1/2: Windows Server 2016 ISO'
Add-VMDvdDrive -VMName WinSer16 -ControllerLocation 1 -ControllerNumber 0
Set-VMDvdDrive -VMName WinSer16 -ControllerLocation 1 -ControllerNumber 0 -Path C:\ISO\WindowsServer2016EN.iso
Write-Host 'Windows Server 2016 ISO Added'
Write-Host 'Adding 2/2: Windows SharePoint Server 2016 ISO'
Add-VMDvdDrive -VMName WinSer16 -ControllerLocation 0 -ControllerNumber 1
Set-VMDvdDrive -VMName WinSer16 -ControllerLocation 0 -ControllerNumber 1 -Path C:\ISO\WindowsSharePointServer2016EN.iso
Write-Host 'Windows SharePoint Server 2016 ISO Added'
Write-Host 'Done'
Write-Host 'Changing Location'
#Robin cleyman
#Set-Location 'C:\Users\Robin Cleyman\Documents\HoGent\AJ3S1\Projecten III - Systeembeheer\git\p3ops-red\Mike 2 - SharePoint'
#Robin D'Hondt
Set-Location 'C:\Users\marev\Desktop\School\Projecten III\p3ops-red\Mike 2 - SharePoint'
Write-Host 'Ready for vagrant up'
Start-VM -Name WinSer16