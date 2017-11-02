#Computer naam wijzigen
Rename-computer -newname ns1
Restart-computer

#DC en DNS installeren en domeinnaam instellen
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName "red.local" -SafeModeAdministratorPassword:(ConvertTo-SecureString -String "Aa12345" -AsPlainText -Force) -CreateDnsDelegation:$true -DatabasePath "C:\Windows\NTDS" -DomainMode "Win2012R2" -DomainNetbiosName "RED" -ForestMode "Win2012R2" -InstallDns: $true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion: $false -SysvolPath "C:\Windows\SYSVOL" -Force: $true

#OU aanmaken
New-ADOrganizationalUnit -Name "RED" ;

#Sub OU aanmaken
New-ADOrganizationalUnit -Name "Administratie" -Path "OU=RED,DC=red,DC=local";
New-ADOrganizationalUnit -Name "Directie" -Path "OU=RED,DC=red,DC=local";
New-ADOrganizationalUnit -Name "IT Administratie" -Path "OU=RED,DC=red,DC=local";
New-ADOrganizationalUnit -Name "Ontwikkeling" -Path "OU=RED,DC=red,DC=local";
New-ADOrganizationalUnit -Name "Verkoop" -Path "OU=RED,DC=red,DC=local";
New-ADOrganizationalUnit -Name "Werkstations" -Path "OU=RED,DC=red,DC=local";

#Groepen aanmaken
New-ADGroup -Name "Administratie" -SamAccountName "Administratie" -GroupCategory Security -GroupScope Global -DisplayName "Administratie" -Path "OU=RED,OU=Administratie,DC=red,DC=local"
New-ADGroup -Name "Directie" -SamAccountName "Directie" -GroupCategory Security -GroupScope Global -DisplayName "Directie" -Path "OU=RED,OU=Directie,DC=red,DC=local"
New-ADGroup -Name "IT Administratie" -SamAccountName "IT Administratie" -GroupCategory Security -GroupScope Global -DisplayName "IT Administratie" -Path "OU=RED,OU=IT Administratie,DC=red,DC=local"
New-ADGroup -Name "Ontwikkeling" -SamAccountName "Ontwikkeling" -GroupCategory Security -GroupScope Global -DisplayName "Ontwikkeling" -Path "OU=RED,OU=Ontwikkeling,DC=red,DC=local"
New-ADGroup -Name "Verkoop" -SamAccountName "Verkoop" -GroupCategory Security -GroupScope Global -DisplayName "Verkoop" -Path "OU=RED,OU=Verkoop,DC=red,DC=local"

#Gebruiker aanmaken in de groep Administratie
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "John Smet" -Name "John Smet" -Path "OU=Administratie,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "John" -UserPrincipalName ("john.smet"+"@hilbay.gent") -Enabled $true -ChangePasswordAtLogon $true;
$user = Get-ADUser "CN=John Smet,OU=Administratie,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Administratie,OU=Administratie,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep Directie
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Lien Smet" -Name "Lien Smet" -Path "OU=Directie,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Lien" -UserPrincipalName ("lien.smet"+"@hilbay.gent") -Enabled $true -ChangePasswordAtLogon $true;
$user = Get-ADUser "CN=Lien Smet,OU=Directie,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Directie,OU=Directie,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep IT Administratie
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Henry Smet" -Name "Henry Smet" -Path "OU=IT Administratie,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Henry" -UserPrincipalName ("henry.smet"+"@hilbay.gent") -Enabled $true -ChangePasswordAtLogon $true;
$user = Get-ADUser "CN=Henry Smet,OU=IT Administratie,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=IT Administratie,OU=IT Administratie,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep Ontwikkeling
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Laura Smet" -Name "Laura Smet" -Path "OU=Ontwikkeling,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Laura" -UserPrincipalName ("laura.smet"+"@hilbay.gent") -Enabled $true -ChangePasswordAtLogon $true;
$user = Get-ADUser "CN=Laura Smet,OU=Ontwikkeling,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Ontwikkeling,OU=Ontwikkeling,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Gebruiker aanmaken in de groep Verkoop
New-AdUser  -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -Force)  -DisplayName "Dirk Smet" -Name "Dirk Smet" -Path "OU=Verkoop,OU=RED,DC=red,DC=local" -Surname "Smet" -GivenName "Dirk" -UserPrincipalName ("dirk.smet"+"@hilbay.gent") -Enabled $true -ChangePasswordAtLogon $true;
$user = Get-ADUser "CN=Dirk Smet,OU=Verkoop,OU=RED,DC=red,DC=local";
$group = Get-ADGroup "CN=Verkoop,OU=Verkoop,OU=RED,DC=red,DC=local";
Add-ADGroupMember $group -Members $user;

#Groep policies aanmaken en linken met OU's
new-gpo -name ControlPanelGameLink | new-gplink -target "OU=RED,OU=Administratie,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=RED,OU=Verkoop,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=RED,OU=IT Administratie,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=RED,OU=Ontwikkeling,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=RED,OU=Directie,DC=red,dc=local"

#Groep policies aanmaken en linken met OU's
new-gpo -name Netwerkadapter | new-gplink -target "OU=RED,OU=Verkoop,DC=red,dc=local"
New-GPLink -Name Netwerkadapter -Target "OU=RED,OU=IT Administratie,DC=red,dc=local"

#Policies importeren
Import-GPO -BackupID "058EA888-9327-48D6-98A4-DCA8FF5ACC64" -Path "" -TargetName "Netwerkadapter"
Import-GPO -BackupID "C1C534A3-1039-42B5-9C3A-CBFBD710B182" -Path "" -TargetName "ControlPanelGameLink"
