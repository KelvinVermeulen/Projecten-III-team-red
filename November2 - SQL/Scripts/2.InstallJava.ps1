#Java.exe moet via bootable usb meegegeven worden.
Write-Host 'Java installeren'
Start-Process -FilePath "C:\Users\Administrator\Documents\Installattie\JreJava.exe" -ArgumentList '/s' -wait -PassThru