#Locatie moet misschien aangepast worden
#Mount-DiskImage 'C:\Users\vagrant\Desktop\en_sql_server_2016_enterprise_x64_dvd_8701793.iso'
#bootable usb
Write-Host 'Disk mounten'
Mount-DiskImage 'C:\Users\Administrator\Documents\Installattie\en_sql_server_2016_enterprise_x64_dvd_8701793.iso'
Write-Host 'SQL Installeren'
#Locatie moet misschien aangepast worden // Verschillende schijfmogelijkheden (standaard D:\)
D:\setup.exe /configurationfile="E:\ConfigurationFile.ini"
