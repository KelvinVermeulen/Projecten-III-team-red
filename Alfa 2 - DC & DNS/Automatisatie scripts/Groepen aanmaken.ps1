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
New-ADGroup -Name "Administratie" -SamAccountName "Administratie" -GroupCategory Security -GroupScope Global -DisplayName "Administratie"
New-ADGroup -Name "Directie" -SamAccountName "Directie" -GroupCategory Security -GroupScope Global -DisplayName "Directie"
New-ADGroup -Name "IT Administratie" -SamAccountName "IT Administratie" -GroupCategory Security -GroupScope Global -DisplayName "IT Administratie"
New-ADGroup -Name "Ontwikkeling" -SamAccountName "Ontwikkeling" -GroupCategory Security -GroupScope Global -DisplayName "Ontwikkeling"
New-ADGroup -Name "Verkoop" -SamAccountName "Verkoop" -GroupCategory Security -GroupScope Global -DisplayName "Verkoop"
New-ADGroup -Name "Werkstations" -SamAccountName "Werkstations" -GroupCategory Security -GroupScope Global -DisplayName "Werkstations"

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
