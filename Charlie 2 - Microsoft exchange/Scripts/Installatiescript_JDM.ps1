#Check if exchangefiles already exist
if(Test-Path ExchangeFiles)
{
$directoryInfo = Get-ChildItem ExchangeFiles | Measure-Object
if($directoryInfo.count -eq 0)
{
	Remove-Item ExchangeFiles 
}
}


#Checking pre-requisites
ECHO "Checking pre-requisites"
ECHO "Installing OS roles and features"
Install-WindowsFeature AS-HTTP-Activation, Desktop-Experience, 
 RPC-over-HTTP-proxy, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45,
 Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression,
 Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext,
 Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console,
 Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression,
 Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation
ECHO "Done installing roles en features"

ECHO "Installing NET-Framework-45-Features"
Install-WindowsFeature NET-Framework-45-Features
ECHO "Done installing NET-Framework-45-Features"

ECHO "Installing Pre-Requisites"
Install-WindowsFeature ADLDS
ECHO "done installing ADLDS"

ECHO "Exchange Management Shell opt"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementScriptingTools,
IIS-ManagementScriptingTools,IIS-IIS6ManagementCompatibility,IIS-LegacySnapIn,IIS-ManagementConsole,
IIS-Metabase,IIS-WebServerManagementTools,IIS-WebServerRole
ECHO "done installing EMS opt"

ECHO "RSAT-ADDS feature for AD"
Install-WindowsFeature RSAT-ADDS, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt,
RSAT-Clustering-PowerShell
ECHO "done installing RSAT-ADDS"
ECHO "DONE checking Pre-Requisites"


#making exchangefiles folder
ECHO "Making folder for setupfiles"
if(!(Test-Path ExchangeFiles))
{
new-item ExchangeFiles -itemtype directory 
}else
{
ECHO "Already created"
}
ECHO "Place Setupfiles in C:\Users\Administrator\Documents\ExchangeFiles "

Write-Host "Press any key to continue"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

#running setupfiles
start-sleep -m 5
.\ExchangeFiles\Exchange2016-x64.exe 

#entering DIR & pressing enter
start-sleep -m 50000
$wshShell = new-object -com wscript.shell
$wshShell.SendKeys("C:\Users\Administrator\Documents\ExchangeFiles")
start-sleep -m 5
$wshShell.SendKeys("{Enter}") 
$wshShell.SendKeys("{Enter}")
ECHO "Extracting"

######NOT DONE########
#Checking if extraction is complete
start-sleep -m 500
$ProcessActive = Get-Process |  Where {$_.name -Match "Extracting"} | Format-Wide -Column 1
$CheckNull = $ProcessActive -eq $false

do
{
ECHO "test"
start-sleep -m 50000
$ProcessActive = Get-Process |  Where {$_.name -Match "Extracting"} 
$CheckTrue = $ProcessActive -eq $True
ECHO "Still extracting"
}
while($CheckNull -eq $true)
####################

#Running setup.exe
.\ExchangeFiles\setup /PrepareAD /OrganizationName:"Red" /IAcceptExchangeServerLicenseTerms




#Restarting PC !NEED TO BE AT END!
Write-Host "Press any key to restart"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

Restart-Computer
