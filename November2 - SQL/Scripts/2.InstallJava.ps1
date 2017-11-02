#Java.exe moet via bootable usb meegegeven worden.
Write-Host 'Java installeren'
Start-Process -FilePath "c:\reqs\JreJava.exe" -ArgumentList '/s' -wait -PassThru