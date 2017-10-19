$DBServer = 'November2'
$ConfigDB = 'spFarmConfiguration'
$CentralAdminContentDB = 'spCentralAdministration'
$CentralAdminPort = '2016'
$PassPhrase = 'YOURPASS1'
$SecPassPhrase = ConvertTo-SecureString $PassPhrase -AsPlaintext -Force

$FarmAcc = 'red\spFarmAcc'
$FarmPassword = 'YOURPASS1'
$FarmAccPWD = ConvertTo-SecureString $FarmPassword  -AsPlaintext -Force
$cred_FarmAcc = New-Object System.Management.Automation.PsCredential $FarmAcc,$FarmAccPWD

--WebFrontEnd, Application, DistributedCache, Search, Custom, SingleServerFarm
$ServerRole = "Custom"



Write-Host " - Enabling SP PowerShell cmdlets..."
If ((Get-PsSnapin |?{$_.Name -eq "Microsoft.SharePoint.PowerShell"})-eq $null)
{
    Add-PsSnapin Microsoft.SharePoint.PowerShell | Out-Null
}
Start-SPAssignment -Global | Out-Null



Write-Host " - Creating configuration database..."
New-SPConfigurationDatabase -DatabaseName "$ConfigDB" -DatabaseServer "$DBServer" -AdministrationContentDatabaseName "$CentralAdminContentDB" -Passphrase $SecPassPhrase -FarmCredentials $cred_FarmAcc -LocalServerRole $ServerRole

Write-Host " - Installing Help Collection..."
Install-SPHelpCollection -All

Write-Host " - Securing Resources..."
Initialize-SPResourceSecurity

Write-Host " - Installing Services..."
Install-SPService

Write-Host " - Installing Features..."
$Features = Install-SPFeature -AllExistingFeatures -Force

Write-Host " - Creating Central Admin..."
$NewCentralAdmin = New-SPCentralAdministration -Port $CentralAdminPort -WindowsAuthProvider "NTLM"

Write-Host " - Waiting for Central Admin to provision..." -NoNewline
sleep 5
Write-Host "Created!"

Write-Host " - Installing Application Content..."
Install-SPApplicationContent



Stop-SPAssignment -Global | Out-Null
