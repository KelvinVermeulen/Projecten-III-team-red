
#Groep policies aanmaken en linken met OU's
new-gpo -name ControlPanelGameLink | new-gplink -target "OU=Administratie,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=Verkoop,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=IT Administratie,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=Ontwikkeling,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=Directie,OU=RED,DC=red,dc=local"

#Groep policies aanmaken en linken met OU's
new-gpo -name Netwerkadapter | new-gplink -target "OU=Verkoop,OU=RED,DC=red,dc=local"
New-GPLink -Name Netwerkadapter -Target "OU=IT Administratie,OU=RED,DC=red,dc=local"

#Groep policies aanmaken en linken met OU's
new-gpo -name FileServer | new-gplink -target "OU=Administratie,OU=RED,DC=red,dc=local"
New-GPLink -Name FileServer -Target "OU=Verkoop,OU=RED,DC=red,dc=local"
New-GPLink -Name FileServer -Target "OU=IT Administratie,OU=RED,DC=red,dc=local"
New-GPLink -Name FileServer -Target "OU=Ontwikkeling,OU=RED,DC=red,dc=local"
New-GPLink -Name FileServer -Target "OU=Directie,OU=RED,DC=red,dc=local"

#Policies importeren
Import-GPO -BackupID "058EA888-9327-48D6-98A4-DCA8FF5ACC64" -Path "F:\backup\" -TargetName "Netwerkadapter"
Import-GPO -BackupID "C1C534A3-1039-42B5-9C3A-CBFBD710B182" -Path "F:\backup\" -TargetName "ControlPanelGameLink"
Import-GPO -BackupID "7F004945-6DF1-4DD0-9E1D-2F2977A22CB3" -Path "F:\backup\" -TargetName "FileServer"
