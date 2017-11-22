#Java.exe moet via bootable usb meegegeven worden.
Write-Host '.Net Installeren'
Mount-DiskImage "en_windows_server_2016_x64_dvd_9327751.iso"
Install-Module servermanager
install-WindowsFeature Net-Framework-Core -source F:\sources\sxs
Write-Host 'Java installeren'
Start-Process -FilePath "C:\Users\Administrator\Documents\Installattie\JreJava.exe" -ArgumentList '/s' -wait -PassThru
