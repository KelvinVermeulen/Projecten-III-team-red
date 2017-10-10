
ECHO "Installing OS roles and features"

Install-WindowsFeature AS-HTTP-Activation, Desktop-Experience, NET-Framework-45-Features,
 RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt,
 RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45,
 Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression,
 Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext,
 Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console,
 Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression,
 Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation, RSAT-ADDS
ECHO "Done installing roles en features"

ECHO "Installing Pre-Requisites"
Install-WindowsFeature ADLDS
ECHO "done installing ADLDS"

ECHO "Exchange Management Shell opt"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementScriptingTools,IIS-ManagementScriptingTools,IIS-IIS6ManagementCompatibility,IIS-LegacySnapIn,IIS-ManagementConsole,IIS-Metabase,IIS-WebServerManagementTools,IIS-WebServerRole
ECHO "done installing EMS"

ECHO "RSAT-ADDS feature for AD"
Install-WindowsFeature RSAT-ADDS
ECHO "done installing RSAT-ADDS"

Restart-Computer