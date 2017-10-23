################################################# 
#
# Author: Nickolaj Andersen
# Blog: http://www.scconfigmgr.com
# Twitter: @NickolajA
# Date: 2013-07-08
# Version: 1.5.0
# 
# Examples:
# 
# .\Install-SCCMPrereqs.ps1 -SiteType CAS
# .\Install-SCCMPrereqs.ps1 -SiteType Primary
# .\Install-SCCMPrereqs.ps1 -SiteType Secondary
# .\Install-SCCMPrereqs.ps1 -SystemRole ApplicationCatalog
# .\Install-SCCMPrereqs.ps1 -ExtendSchema
# .\Install-SCCMPrereqs.ps1 -InstallWADK
# .\Install-SCCMPrereqs.ps1 -InstallWSUS
#
#################################################
 
[CmdletBinding()]
param(
[ValidateSet("CAS","Primary","Secondary")]
[string]$SiteType,
[ValidateSet("ApplicationCatalog")]
[string]$SystemRole,
[switch]$ExtendSchema,
[switch]$InstallWADK,
[switch]$InstallWSUS
)

$WarningPreference = "SilentlyContinue"

function Install-NETFramework3.5 {
    $a = 0
    $NETFeature = @("NET-Framework-Core")
    $NETFeaturesCount = $NETFeature.Count
    $NETFeature | ForEach-Object {
        $a++
        Write-Progress -id 1 -Activity "Installing Windows Features" -Status "Windows Feature $($a) of $($NETFeaturesCount)" -PercentComplete (($a / $NETFeaturesCount)*100)
        Write-Host "Installing: $_"
        Add-WindowsFeature $_ | Out-Null
    }
}
 
function Install-WindowsFeatures {
	$i = 0
    $WinFeatures = @("BITS","BITS-IIS-Ext","BITS-Compact-Server","RDC","WAS-Process-Model","WAS-Config-APIs","WAS-Net-Environment","Web-Server","Web-ISAPI-Ext","Web-ISAPI-Filter","Web-Net-Ext","Web-Net-Ext45","Web-ASP-Net","Web-ASP-Net45","Web-ASP","Web-Windows-Auth","Web-Basic-Auth","Web-URL-Auth","Web-IP-Security","Web-Scripting-Tools","Web-Mgmt-Service","Web-Stat-Compression","Web-Dyn-Compression","Web-Metabase","Web-WMI","Web-HTTP-Redirect","Web-Log-Libraries","Web-HTTP-Tracing","UpdateServices-RSAT","UpdateServices-API","UpdateServices-UI")
    $WinFeaturesCount = $WinFeatures.Count
    $WinFeatures | ForEach-Object {
        $i++
        Write-Progress -id 1 -Activity "Installing Windows Features" -Status "Windows Feature $($i) of $($WinFeaturesCount)" -PercentComplete (($i / $WinFeaturesCount)*100)
        Write-Host "Installing:" $_
        Add-WindowsFeature $_ | Out-Null
    }
    Write-Host "Windows Features successfully installed"
    Write-Host ""
}
 
function Install-WindowsFeaturesSecondary {
    $c = 0
    $SecFeatures = @("BITS","BITS-IIS-Ext","BITS-Compact-Server","RDC","WAS-Process-Model","WAS-Config-APIs","WAS-Net-Environment","Web-Server","Web-ISAPI-Ext","Web-Windows-Auth","Web-Basic-Auth","Web-URL-Auth","Web-IP-Security","Web-Scripting-Tools","Web-Mgmt-Service","Web-Metabase","Web-WMI")
    $SecFeaturesCount = $SecFeatures.Count
    $SecFeatures | ForEach-Object {
        $c++
        Write-Progress -id 1 -Activity "Installing Windows Features" -Status "Windows Feature $($c) of $($SecFeaturesCount)" -PercentComplete (($c / $SecFeaturesCount)*100)
        Write-Host "Installing:" $_
        Add-WindowsFeature $_ | Out-Null
    }
    Write-Host "Windows Features successfully installed"
}
 
function Install-WSUSFeatures {
    $d = 0
    $WSUSFeatures = @("UpdateServices","UpdateServices-WidDB","UpdateServices-Services","UpdateServices-RSAT","UpdateServices-API","UpdateServices-UI")
    $WSUSFeaturesCount = $WSUSFeatures.Count
    $WSUSFeatures | ForEach-Object {
        $d++
        Write-Progress -id 1 -Activity "Installing WSUS Features" -Status "WSUS Feature $($d) of $($WSUSFeaturesCount)" -PercentComplete (($d / $WSUSFeaturesCount)*100)
        Write-Host "Installing:" $_
        Add-WindowsFeature $_ | Out-Null
    }
    Write-Host "WSUS Features successfully installed"
    Write-Host ""
}
 
function Configure-WSUS {
    $WSUSContentFolder = Read-Host "Enter the path where you want to store the WSUS content, e.g. 'C:\WSUS'"
    if (!(Test-Path -Path $WSUSContentFolder)) {
            New-Item $WSUSContentFolder -ItemType Directory | Out-Null
    }
    $WSUSUtil = "$Env:ProgramFiles\Update Services\Tools\WsusUtil.exe"
    $WSUSUtilArgs = "POSTINSTALL CONTENT_DIR=$WSUSContentFolder"
    Write-Host ""
    Write-Host "Starting the WSUS PostInstall configuration"
    Start-Process -FilePath $WSUSUtil -ArgumentList $WSUSUtilArgs -NoNewWindow -Wait
    Write-Host ""
    Write-Host -ForegroundColor Green "Successfully installed and configured WSUS"
}
 
function Set-ExtendADAchema {
    if ($ExtendSchema -eq $true) {
        $RegExp = "^[A-Z]*\:$"
        $DriveLetter = Read-Host "Enter drive (e.g. 'D:') letter for ConfigMgr source files"
        if ($DriveLetter -match $RegExp) {
            $Schema = $true
        }
        else {
            Write-Warning "Wrong drive letter specified" -ErrorAction Stop
        }
    }
    if ($Schema) {
        $DC = Read-Host "Enter a Domain Controller NetBIOS name"
        $GetPath = Get-ChildItem -Recurse -Filter "EXTADSCH.EXE" -Path $DriveLetter\SMSSETUP\BIN\X64
        $Path = $GetPath.DirectoryName + "\EXTADSCH.EXE"
        $Destination = "\\" + $DC + "\C$"
        Copy-Item $Path $Destination -Force
        Invoke-WmiMethod -Class Win32_Process -Name Create -ArgumentList "C:\EXTADSCH.EXE" -ComputerName $DC | Out-Null
    }
    $Content = Get-Content -Path "\\$DC\C$\extadsch.log"
    if ($Content -match "Successfully extended the Active Directory schema") {
        Write-Host "Active Directory was successfully extended"
    }
    else {
        Write-Warning "Active Directory was not extended successfully, refer to C:\ExtADSch.log on domain controller"
    }
}
 
function Get-PrereqFiles {
    $RegExp = "^[A-Z]*\:$"
    $DriveLetter = Read-Host "Enter drive letter (e.g. 'D:') for ConfigMgr source files"
        if ($DriveLetter -match $RegExp) {
                $Prereq = $true
            }
        else {
            Write-Warning "Wrong drive letter specified. Enter drive letter like 'D:'" -ErrorAction Stop
        }
    if ($Prereq) {
        $dldest = "C:\ConfigMgr_Prereq"
        if (!(Test-Path -Path $dldest)) {
            New-Item $dldest -ItemType Directory | Out-Null
        }
        try {
            if (Test-Path "$DriveLetter\SMSSETUP\BIN\X64\setupdl.exe") {
                $Download = $true
            }
        }
        catch {
            Write-Warning "$DriveLetter\SMSSETUP\BIN\X64\setupdl.exe is not found" -ErrorAction Stop
        }
        if ($Download) {
            Write-Host "Downloading Configuration Manager prerequisites to $($dldest), this may take a couple of minutes"
            Start-Process -FilePath "$DriveLetter\SMSSETUP\BIN\X64\setupdl.exe" -ArgumentList "$dldest" -Wait
            Write-Host "Successfully downloaded Configuration Manager prerequisites"
        }
    }
}
 
function Install-WindowsADK {
    $ADKInstalledFeatures = @()
    $ComputerName = $env:COMPUTERNAME
    $UninstallKey = "SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
    $Registry = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine',$ComputerName)
    $RegistryKey = $Registry.OpenSubKey($UninstallKey)
    $SubKeys = $RegistryKey.GetSubKeyNames()
    ForEach ($Key in $SubKeys) {
        $CurrentKey = $UninstallKey + "\\" + $Key
        $CurrentSubKey = $Registry.OpenSubKey($CurrentKey)
        $DisplayName = $CurrentSubKey.GetValue("DisplayName")
        if ($DisplayName -like "Windows PE x86 x64") {
            $ADKInstalledFeatures += $DisplayName
        }
        elseif ($DisplayName -like "User State Migration Tool") {
            $ADKInstalledFeatures += $DisplayName
        }
        elseif ($DisplayName -like "Windows Deployment Tools") {
            $ADKInstalledFeatures += $DisplayName
        }
    }
    Write-Host ""
    Write-Host "# Choose how you'd like to install Windows ADK"
    Write-Host "# "
    Write-Host "# ----------------------------------------------------------------------------------"
    Write-Host "# 1. Online install - Download and silent install"
    Write-Host "# 2. Offline install - Silent install of previously downloaded Windows ADK files"
    Write-Host "# ----------------------------------------------------------------------------------"
    Write-Host ""
    $Answer = Read-Host "Please enter your selection [1,2] and press Enter"

    switch ($Answer) {
        1 {$SelectedOption = "Online"}
        2 {$SelectedOption = "Offline"}
    }
    if (($SelectedOption -like "Online") -AND ($ADKInstalledFeatures.Length -ne 3)) {
        $dlfolder = "C:\Downloads"
        if (!(Test-Path -Path $dlfolder)) {
            New-Item $dlfolder -ItemType Directory | Out-Null
        }
        Write-Host ""
        $ADKURL = "http://download.microsoft.com/download/9/9/F/99F5E440-5EB5-4952-9935-B99662C3DF70/adk/adksetup.exe"
        $ADKObject = New-Object System.Net.WebClient
        $Global:DownloadComplete = $False
        $EventDataComplete = Register-ObjectEvent $ADKObject DownloadFileCompleted -SourceIdentifier WebClient.DownloadFileComplete -Action {$Global:DownloadComplete = $True}
        $EventDataProgress = Register-ObjectEvent $ADKObject DownloadProgressChanged -SourceIdentifier WebClient.DownloadProgressChanged -Action { $Global:DPCEventArgs = $EventArgs }    
        Write-Progress -Activity "Downloading Windows ADK Setup" -Status $ADKURL
        $ADKObject.DownloadFileAsync($ADKURL, "$dlfolder\adksetup.exe")
        while (!($Global:DownloadComplete)) {                
            $PercentComplete = $Global:DPCEventArgs.ProgressPercentage
            if ($PercentComplete -ne $null) {
                Write-Progress -Activity "Downloading Windows ADK Setup" -Status $ADKURL -PercentComplete $PercentComplete
            }
        }
        Write-Progress -Activity "Downloading Windows ADK Setup" -Status $ADKURL -Complete
        Unregister-Event -SourceIdentifier WebClient.DownloadProgressChanged
        Unregister-Event -SourceIdentifier WebClient.DownloadFileComplete
        $ADKOnArguments = "/norestart /q /ceip off /features OptionId.WindowsPreinstallationEnvironment OptionId.DeploymentTools OptionId.UserStateMigrationTool"
        Write-Host "Windows ADK is now being installed from the web, which will take time depending on your internet connection"
        Write-Host ""
        Start-Process -FilePath "$dlfolder\adksetup.exe" -ArgumentList $ADKOnArguments
        do {
            $ADKProcess = Get-WmiObject -Class Win32_Process -Filter 'Name="adksetup.exe"'
            Write-Host "." -NoNewline
            Start-Sleep -s 5
        }
        while ($ADKProcess)
        Write-Host "`n`n"
        Write-Host -ForegroundColor Green "Windows ADK has been successfully installed"
    }
    elseif (($SelectedOption -like "Offline") -AND ($ADKInstalledFeatures.Length -ne 3)) {
        Write-Host ""
        $SetupLocation = Read-Host "Please enter a path for the Windows ADK setup (e.g. C:\WindowsADK)"
        $ADKOffArguments = "/norestart /q /ceip off /features OptionId.WindowsPreinstallationEnvironment OptionId.DeploymentTools OptionId.UserStateMigrationTool"
        Write-Host "Windows ADK is now installing in the background, give it a few minutes to complete"
        Write-Host ""
        Start-Process -FilePath "$SetupLocation\adksetup.exe" -ArgumentList $ADKOffArguments
        do {
            $ADKProcess = Get-WmiObject -Class Win32_Process -Filter 'Name="adksetup.exe"'
            Write-Host "." -NoNewline
            Start-Sleep -s 5
        }
        while ($ADKProcess)
        Write-Host "`n`n"
        Write-Host -ForegroundColor Green "Windows ADK has been successfully installed"
    }    
    else {
        if ($ADKInstalledFeatures.Length -eq 3) {
            Write-Host ""
            Write-Host -ForegroundColor Green "All required Windows ADK features are already installed, skipping install"
        }
    }
}

function Install-AppCatFeatures {
    $ACWindowsFeatures = @("NET-Framework-Features","NET-Framework-Core","NET-HTTP-Activation","NET-Non-HTTP-Activ","NET-WCF-Services45","NET-WCF-HTTP-Activation45","RDC","RSAT","RSAT-Role-Tools","WAS","WAS-Process-Model","WAS-NET-Environment","WAS-Config-APIs","Web-Server","Web-WebServer","Web-Common-Http","Web-Static-Content","Web-Default-Doc","Web-App-Dev","Web-ASP-Net","Web-ASP-Net45","Web-Net-Ext","Web-Net-Ext45","Web-ISAPI-Ext","Web-ISAPI-Filter","Web-Security","Web-Windows-Auth","Web-Filtering","Web-Mgmt-Tools","Web-Mgmt-Console","Web-Scripting-Tools","Web-Mgmt-Compat","Web-Metabase","Web-Lgcy-Mgmt-Console","Web-Lgcy-Scripting","Web-WMI")
    $ACWindowsFeaturesCount = $ACWindowsFeatures.Count
    $i = 0
    $ACWindowsFeatures | ForEach-Object {
        $i++
        Write-Progress -id 1 -Activity "Windows Features Installation" -Status "Installing Windows Feature $($_), $($i) of $($ACWindowsFeaturesCount)" -PercentComplete (($i / $ACWindowsFeaturesCount)*100)
        Write-Host "Installing: $($_)"
        Add-WindowsFeature $_ | Out-Null
    }
    Write-Host ""
    Write-Host -ForegroundColor Green "Prerequisites for the Application Catalog has successfully been installed"
}

$WarningPreference = "SilentlyContinue"
$ScriptBeginning = Get-Date
 
function Install-SitePrereq {
    Install-NETFramework3.5
    Install-WindowsFeatures
    Get-PrereqFiles
}
 
function Install-SecondaryPrereq {
    Install-NETFramework3.5
    Install-WindowsFeaturesSecondary
}
 
if ($InstallWADK) {
    Install-WindowsADK
}
 
if ($ExtendSchema) {
    Set-ExtendADAchema
}
 
if ($InstallWSUS) {
    Install-WSUSFeatures
    Configure-WSUS
}
 
if (($SiteType -like "CAS") -OR ($SiteType -like "Primary")) {
    Install-SitePrereq
    Write-Host ""
    Write-Host -ForegroundColor Green "Prerequisites installed successfully"
}
elseif ($SiteType -like "Secondary") {
    Install-SecondaryPrereq
    Write-Host ""
    Write-Host -ForegroundColor Green "Prerequisites installed successfully"
}
elseif ($SiteType -eq $null) {
    Write-Warning "The parameter SiteType was not defined"
}

if ($SystemRole -like "ApplicationCatalog") {
    Install-AppCatFeatures
}

$ScriptEnding = Get-Date
$Measure = $ScriptEnding - $ScriptBeginning
Write-Host ""
Write-Host -ForegroundColor Green "Execution time: $([math]::round($Measure.TotalSeconds)) seconds"