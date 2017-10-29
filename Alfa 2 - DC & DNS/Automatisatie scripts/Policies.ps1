new-gpo -name ControlPanelGameLink | new-gplink -target "OU=Administratie,OU=Hilbay,DC=hilbay,dc=gent"
New-GPLink -Name ControlPanelGameLink -Target "OU=Verkoop,OU=Hilbay,DC=hilbay,dc=gent"
New-GPLink -Name ControlPanelGameLink -Target "OU=IT Administratie,OU=Hilbay,DC=hilbay,dc=gent"
New-GPLink -Name ControlPanelGameLink -Target "OU=Ontwikkeling,OU=Hilbay,DC=hilbay,dc=gent"
New-GPLink -Name ControlPanelGameLink -Target "OU=Directie,OU=Hilbay,DC=hilbay,dc=gent"

new-gpo -name Netwerkadapter | new-gplink -target "OU=Verkoop,OU=Hilbay,DC=hilbay,dc=gent"
New-GPLink -Name Netwerkadapter -Target "OU=IT Administratie,OU=Hilbay,DC=hilbay,dc=gent"

Import-GPO -BackupID "058EA888-9327-48D6-98A4-DCA8FF5ACC64" -Path "" -TargetName "Netwerkadapter"
Import-GPO -BackupID "C1C534A3-1039-42B5-9C3A-CBFBD710B182" -Path "" -TargetName "ControlPanelGameLink"
