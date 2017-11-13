
#Checking pre-requisites
ECHO "Checking pre-requisites"
ECHO "Installing OS roles and features"
Install-WindowsFeature AS-HTTP-Activation, Desktop-Experience,
 RPC-over-HTTP-proxy, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth,
 Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging,
 Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter,
 Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service,
 Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression,
 Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation
ECHO "Done installing roles en features"

ECHO "Installing NET-Framework-45-Features"
Install-WindowsFeature NET-Framework-45-Features
ECHO "Done installing NET-Framework-45-Features"

ECHO "Installing Pre-Requisites"
Install-WindowsFeature RSAT-ADDS,
RSAT-Clustering,RSAT-Clustering-CmdInterface,
RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell
ECHO "done installing ADLDS"


#Restarting PC !NEED TO BE AT END!
Write-Host "Press any key to restart"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

Restart-Computer
