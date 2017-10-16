<#
.Net Framework 4.5.2 is installed

RSAT-ADDS is installed (installed by default)

The forest functional level must be at least Windows Server 2008
#>

install-WindowsFeature RSAT-ADDS
Install-WindowsFeature NET-Framework-45-Features


