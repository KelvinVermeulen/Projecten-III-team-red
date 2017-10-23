Function Exit-WithCode {
  <#
  .SYNOPSIS
  Exits function
  .DESCRIPTION
  Exits function with error code
  #>

  param ($exitcode)

  Write-Host "Exiting script with error $exitcode."

  cmd /c pause

  $host.SetShouldExit($exitcode)
  exit
}

Function Get-LocalAdminsGroup {

  param ($strcomputer)

  $admins = Get-WmiObject -ComputerName $strcomputer -Query "select * from win32_groupuser where GroupComponent=""Win32_Group.Domain='$strcomputer',Name='administrators'"""

  $admins |% {
    $_.partcomponent –match “.+Domain=(.+),Name=(.+)$” > $nul
    $matches[1].trim('"') + “” + $matches[2].trim('"')
  }
}

Function Verify-Domain {
  <#
  .SYNOPSIS
  Confirms domain used to install SCCM
  .DESCRIPTION
  Requests user confirmation to use current domain.  If no, prompt user for domain to use.  Verifies domain is reachable.
  .EXAMPLE
  Verify-Domain
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "0InitialChecks.log"
    Write-Host "Verifying domain to install SCCM"
    Add-content $LogPath "Verifying domain to install SCCM"
  }

  Process {

    $Domain = (Get-WmiObject Win32_ComputerSystem).Domain

    $choice = ""
    While ($choice -notmatch "[y|n]"){
      [console]::ForegroundColor = "Green"
      $choice = read-host "Do you want to use '$Domain' as the domain to configure SCCM? (Y/N)"
      [console]::ForegroundColor = "White"
    }

    if ($choice -eq "y"){
      Write-Host "Domain to install SCCM is $Domain"
      Add-content $LogPath "Domain to install SCCM is $Domain"
      Return $Domain
    }
    if ($choice -eq "n"){
      [console]::ForegroundColor = "Green"
      $Domain = Read-Host "In what Domain should SCCM be configured?"
      [console]::ForegroundColor = "White"
      While (!(Test-Connection $Domain -Quiet)) {
        Write-Warning "Could not connect to $Domain..."
        [console]::ForegroundColor = "Green"
        $Domain = Read-Host "In what Domain should SCCM be configured?"
        [console]::ForegroundColor = "White"
      }

      $domainDN = $domain.replace(".",",DC=")
      $domainDN = "DC=$domainDN"
      Try {
          if (([ADSI]::exists("LDAP://$DomainDN"))) {
            Return $Domain
          }
      }
      Catch {
        Write-Error "!Could not confirm domain '$Domain'. Exiting with code 301"
        Add-content $LogPath "!Could not add CM Computer object as SQL Server local admin. Exiting with code 301"
        Exit-WithCode 301
      }
    }
  }

  End {
    Write-Host "Domain to install SCCM verified"
    Add-content $LogPath "Domain to install SCCM verified"
  }
}

Function Verify-CMObject {
  <#
  .SYNOPSIS
  Confirms CM server name used to install SCCM
  .DESCRIPTION
  Requests user confirmation of CM server name.  If no, quit.  Verifies server is domain joined.
  .EXAMPLE
  Verify-CMObject
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "0InitialChecks.log"
    Write-Host "Verifying SCCM target server"
    Add-content $LogPath "Verifying SCCM target server"
  }

  Process {

    $CMComputer = (Get-WmiObject Win32_ComputerSystem).Name

    $choice = ""
    While ($choice -notmatch "[y|n]"){
      [console]::ForegroundColor = "Green"
      $choice = read-host "Are you installing SCCM on '$CMComputer' (this machine)? (Y/N)"
      [console]::ForegroundColor = "White"
    }

    if ($choice -eq "n"){
      Write-Error "!Please run this script on the proposed SCCM server instead. Exiting with code 302"
      Add-content $LogPath "!Please run this script on the proposed SCCM server instead. Exiting with code 302"
      Exit-WithCode 303
    }

    Try {

      $searcher = new-object DirectoryServices.DirectorySearcher([ADSI]"")
      $searcher.filter = "(&(objectClass=computer)(SAMAccountName=$CMComputer$))"
      $searcher.CacheResults = $true
      $searcher.SearchScope = “Subtree”
      $searcher.PageSize = 1
      $FoundCMObj = $searcher.FindAll()

      if ($FoundCMObj.Count) {
        Write-Host "Installing SCCM on $CMComputer"
        Add-content $LogPath "Installing SCCM on $CMComputer"
        Return $CMComputer
      }
      else {
        Throw
      }
    }
    Catch {
      Write-Error "!Could not confirm server is domain joined. Exiting with code 303"
      Add-content $LogPath "!Could not confirm server is domain joined. Exiting with code 303"
      Exit-WithCode 303
    }
  }

  End {
    Write-Host "SCCM target verified"
    Add-content $LogPath "SCCM target verified"
  }
}

Function Verify-SQObject {
  <#
  .SYNOPSIS
  Confirms SQ server name used to support SCCM install
  .DESCRIPTION
  Prompt user for SQ name.  Verifies server is online and domain joined.
  .EXAMPLE
  Verify-SQObject
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "0InitialChecks.log"
    Write-Host "Verifying SQL Server supporting SCCM"
    Add-content $LogPath "Verifying SQL Server supporting SCCM"
  }

  Process {

    [console]::ForegroundColor = "Green"
    $SQComputer = Read-Host "What SQL server will support SCCM?"
    [console]::ForegroundColor = "White"
    While (!(Test-Connection $SQComputer -Quiet)) {
      Write-Warning "Could not connect to $SQComputer..."
      [console]::ForegroundColor = "Green"
      $SQComputer = Read-Host "What SQL server will support SCCM?"
      [console]::ForegroundColor = "White"
    }

    Try {
      $searcher = new-object DirectoryServices.DirectorySearcher([ADSI]"")
      $searcher.filter = "(&(objectClass=computer)(SAMAccountName=$SQComputer$))"
      $searcher.CacheResults = $true
      $searcher.SearchScope = “Subtree”
      $searcher.PageSize = 1
      $FoundSQObj = $searcher.FindAll()

      if ($FoundSQObj.Count) {

        Write-Host "SQL supporting SCCM is $SQComputer"
        Add-content $LogPath "SQL supporting SCCM is $SQComputer"
        Return $SQComputer
      }
      else {
        Throw
      }
    }
    Catch {
      Write-Error "!Could not connect to SQ machine or SQ machine is not domain-joined. Exiting with code 304"
      Add-content $LogPath "!Could not connect to SQ machine or SQ machine is not domain-joined. Exiting with code 304"
      Exit-WithCode 304
    }
  }

  End {
    Write-Host "SQL Server verified"
    Add-content $LogPath "SQL Server verified"
  }
}

Function Verify-SQLService {
  <#
  .SYNOPSIS
  Verifies SQL Service is running via domain service account and build version is acceptable
  .DESCRIPTION
  Checks to ensure SQL Service account is not using system type accounts, then checks build version:
  Version	Build
  SQL 2008 SP2 CU 9:    10.00.4330  2007.100.4330.0
  SQL 2008 SP3 CU 4:    10.00.5775  2007.100.5775.0
  SQL 2008 R2 SP1 CU 6: 10.50.2811  2009.100.2811.0
  SQL 2008 R2 SP2:      10.50.4000  2009.100.4000.0
  SQL 2012 CU 2:        11.00.2325  2011.110.2325.0
  SQL 2012 SP1:         11.00.3000  2011.110.3000.0
  .EXAMPLE
  Verify-SQLService
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "0InitialChecks.log"
    Write-Host "Verifying SQL Service account is domain joined"
    Add-content $LogPath "Verifying SQL Service account is domain joined"
  }

  Process {

    Try {

      [console]::ForegroundColor = "Green"
      $SQLInstance = Read-Host "What is the name of the SQL instance to connect to SCCM? (e.g. SQ01vInst01)"
      [console]::ForegroundColor = "White"

      $SQLService = Get-WmiObject win32_service -ComputerName $SQComputer -filter "name LIKE 'MSSQL%$SQLInstance' OR name LIKE '$SQLInstance'"

      While (!($SQLService)) {
        Write-Warning "Could not connect to that service account..."
        [console]::ForegroundColor = "Green"
        $SQLInstance = Read-Host "What is the name of the SQL instance to connect to SCCM? (e.g. SQ01vInst01)?"
        [console]::ForegroundColor = "White"

        $SQLService = Get-WmiObject win32_service -ComputerName $SQComputer -filter "name LIKE 'MSSQL%$SQLInstance' OR name LIKE '$SQLInstance'"
      }

      If(($SQLService.StartName -eq "LocalSystem") -or ($SQLService.StartName -eq "NT AUTHORITYNetworkService") `
      -or ($SQLService.StartName -eq "NT AUTHORITYLocalService") -or ($SQLService.StartName -eq "LocalService") `
      -or ($SQLService.StartName -match "NT Service")) {
        echo $SQLService.startname
        Write-Error "!SQL instance is not running under domain account.  Please change service to run as domain account and try again. Exiting with code 305"
        Add-content $LogPath "!SQL instance is not running under domain account.  Please change service to run as domain account and try again. Exiting with code 305"
        Exit-WithCode 305
      }
      else {
        Write-Host "SQL Service account $($SQLService.StartName) is domain joined."
        Add-content $LogPath "SQL Service account $($SQLService.StartName) is domain joined."
      }
    }
    Catch {
      Write-Error "!Could not connect to SQ machine or SQ machine instance. Exiting with code 305.1"
      Add-content $LogPath "!Could not connect to SQ machine or SQ machine instance. Exiting with code 305.1"
      Exit-WithCode 3051
    }

    Try {

      $CMOVer = (Get-WmiObject -ComputerName $SQComputer -Namespace rootMicrosoftSqlserver -Query "SELECT Name FROM __Namespace WHERE Name LIKE 'ComputerManagement%'").Name

      $SQLServerBuildNumber = (Get-WmiObject -ComputerName $SQComputer -Namespace rootMicrosoftSqlserver$CMOVer -Query "SELECT * FROM SqlServiceAdvancedProperty WHERE PropertyName = 'FILEVERSION' AND SqlServiceType = 1 AND ServiceName LIKE '%$SQLInstance'").PropertyStrValue

      if ($SQLServerBuildNumber -ge "2011.110.2325.0") {
        $BuildCompatiable = $true
      }
      elseif($SQLServerBuildNumber -ge "2009.100.2811.0" -and $SQLServerBuildNumber -lt "2011") {
        $BuildCompatiable = $true
      }
      elseif($SQLServerBuildNumber -ge "2007.100.5775.0" -and $SQLServerBuildNumber -lt "2009") {
        $BuildCompatiable = $true
      }
      elseif($SQLServerBuildNumber -ge "2007.100.4330.0" -and $SQLServerBuildNumber -lt "2007.100.5770.0") {
        $BuildCompatiable = $true
      }
      else {
        Throw
      }

      Write-Host "SQL instance file version ($SQLServerBuildNumber) is supported."
      Add-content $LogPath "SQL instance file version ($SQLServerBuildNumber) is supported."

    }
    Catch {
      Write-Error "!SQL instance does not meet versioning requirements.  Please have SQL admin upgrade SQL instance to required version. Exiting with code 305.2"
      Add-content $LogPath "!SQL instance does not meet versioning requirements.  Please have SQL admin upgrade SQL instance to required version. Exiting with code 305.2"
      Exit-WithCode 3052
    }
  }

  End {
    Write-Host "SQL Service verified"
    Add-content $LogPath "SQL Service verified"
  }
}

Function Verify-SchemaExt {
  <#
  .SYNOPSIS
  Verifies SCCM domain Schema extension
  .DESCRIPTION
  Checks for the existence of extended schema attributes for SCCM
  .EXAMPLE
  Verify-SchemaExt
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "0InitialChecks.log"
    $DomainDN = ([ADSI]'').DistinguishedName
    Write-Host "Verifying AD Schema is extended"
    Add-content $LogPath "Verifying AD Schema is extended"
  }

  Process {

    if([adsi]::Exists("LDAP://CN=Ms-SMS-Version,CN=Schema,CN=Configuration,$DomainDN")) {
      Write-Host "Schema has been extended..."
      Add-content $LogPath "Schema has been extended..."
    }
    else {
      Write-Warning "Schema has not been extended for SCCM...Attempting to extend schema"
      Add-content $LogPath "Schema has not been extended for SCCM...Attempting to extend schema"
      Try {
        & ./ExtADSch.exe | Wait-Process -Timeout 300 -ErrorAction Stop
      }
      Catch {
        Write-Warning "!SCCM Schema extensions could not be verified.  Please have AD team verify schema is extended."
        Add-content $LogPath "!SCCM Schema extensions could not be verified.  Please have AD team verify schema is extended."
      }
    }
  }

  End {
    Write-Host "Extended AD Schema verified"
    Add-content $LogPath "Extended AD Schema verified"
  }
}

Function Verify-Media {
  <#
  .SYNOPSIS
  Verifies proper media to install exists
  .DESCRIPTION
  Checks script execution folder to ensure proper media is in place before install
  .EXAMPLE
  Verify-Media
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "0InitialChecks.log"
    Write-Host "Verifying required media is present."
    Add-content $LogPath "Verifying required media is present."
  }

  Process {

    if (!(Test-Path .SCCMPrereqs)) {
      Write-Error "!Required media is not found: SCCMPrereqs. Exiting with Error 400..."
      Add-content $LogPath "!Required media is not found: SCCMPrereqs. Exiting with Error 400..."
      Exit-WithCode 400
    }
    if (!(Test-Path .sxs)) {
      Write-Error "!Required media is not found: sxs. Exiting with Error 400..."
      Add-content $LogPath "!Required media is not found: sxs. Exiting with Error 400..."
      Exit-WithCode 400
    }
    if (!(Test-Path .ADK)) {
      Write-Error "!Required media is not found: ADK. Exiting with Error 400..."
      Add-content $LogPath "!Required media is not found: ADK. Exiting with Error 400..."
      Exit-WithCode 400
    }

    if (!(Test-Path .ExtADSch.exe)) {
      Write-Error "!Required media is not found: ExtADSch.exe. Exiting with Error 400..."
      Add-content $LogPath "!Required media is not found: ExtADSch.exe. Exiting with Error 400..."
      Exit-WithCode 400
    }
  }

  End {
    Write-Host "Required media verified present."
    Add-content $LogPath "Required media verified present."
  }
}

Function Detect-OS {
  <#
  .SYNOPSIS
  Detects OS
  .DESCRIPTION
  Uses WMI call to OS to get OS version.  Verifies OS Version is able to continue script.
  .EXAMPLE
  Detect-OS
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "0InitialChecks.log"
    Write-Host "Detecting OS Version."
    Add-content $LogPath "Detecting OS Version."
  }

  Process {

    $Script:OSVer = ((Get-WmiObject -class Win32_OperatingSystem).Version).Substring(0,3)
    if ($OSVer -gt 6.1) {  #Windows Server 2012
      Write-Host "Operating System detected is Windows Server 2012"
      Add-content $LogPath "Operating System detected is Windows Server 2012"
    }
    elseif ($OSVer -gt 6.0) { #Windows 2008 R2
      Write-Host "Operating System detected is Windows Server 2008 R2"
      Add-content $LogPath "Operating System detected is Windows Server 2008 R2"
    }
    elseif ($OSVer -eq 6.0) { #Windows 2008
      Write-Host "Operating System detected is Windows Server 2008"
      Add-content $LogPath "Operating System detected is Windows Server 2008"
    }
    else {
      Write-Error "!Operating System detected is not compatible.  Exiting..."
      Add-content $LogPath "!Operating System detected is not compatible.  Exiting with Error 401..."
      Exit-WithCode 401
    }
  }

  End {
    Write-Host "OS Version detection complete."
    Add-content $LogPath "OS Version detection complete."
    Return $OSVer
  }
}

Function Install-NetFramework3.5 {
  <#
  .SYNOPSIS
  Installs .Net Framework 3.5
  .DESCRIPTION
  Will check for .NetFX3.5 installed already.  If not, will install.
  .EXAMPLE
  Install-NetFramework3.5
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "1NetFX3.5Install.log"
    Write-Host "Detecting and installing .Net Framework 3.5."
    Add-content $LogPath "Detecting and installing .Net Framework 3.5."
  }

  Process {

    Write-Host "Checking for .Net-Framework 3.5 currently installed"

    if ($OSVer -gt 6.1) {  #Windows Server 2012

      $NetFXInstallState = (Get-WindowsFeature NET-Framework-Features).InstallState
      if ($NetFXInstallState -eq "Installed") {
        Write-Host ".Net Framework 3.5 is already installed"
        Add-content $LogPath ".Net Framework 3.5 is already installed"
        Return #$NetFXInstallState
      }

      Write-Host "Installing .Net Framework 3.5..."

      $NetFXInstalled = Get-WindowsFeature NET-Framework-Features | Install-WindowsFeature -IncludeAllSubFeature -Source .sxs
      if ($NetFXInstalled.Success) {
        Write-Host ".Net Framework 3.5 installed successfully."
        Add-content $LogPath ".Net Framework 3.5 installed successfully."
      }
      else {
        Write-Error "!.Net Framework 3.5 did not install successfully. Exiting with code 402"
        Add-content $LogPath "!.Net Framework 3.5 did not install successfully. Exiting with code 402"
        Exit-WithCode 402
      }
    }
    else {  #Windows Server 2008 [R2]

      Import-Module ServerManager

      $NetFXInstallState = (Get-WindowsFeature NET-Framework).Installed

      if ($NetFXInstallState) {
        Write-Host ".Net Framework 3.5 is already installed"
        Add-content $LogPath ".Net Framework 3.5 is already installed"
        Return #$NetFXInstallState
      }

      $NetFXInstalled = Add-WindowsFeature NET-Framework -IncludeAllSubFeature

      if ($NetFXInstalled.Success) {

        Write-Host ".Net Framework 3.5 installed successfully."
        Add-content $LogPath ".Net Framework 3.5 installed successfully."

      }
      else {
        Write-Error "!.Net Framework 3.5 did not install successfully. Exiting with code 402"
        Add-content $LogPath "!.Net Framework 3.5 did not install successfully. Exiting with code 402"
        Exit-WithCode 402
      }
    }
  }

  End {
    Write-Host ".Net Framework detect/install complete."
    Add-content $LogPath ".Net Framework detect/install complete."
  }
}

Function Install-SCCMRequiredFeatures {
  <#
  .SYNOPSIS
  Installs SCCM Required Windows Features
  .DESCRIPTION
  Installs RDC, WSUS, BITS, and WMI for IIS 6.0
  .EXAMPLE
  Install-SCCMRequiredFeatures
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "2WindowsFeaturesInstall.log"
    Write-Host "Detecting and installing required Windows Features for SCCM."
    Add-content $LogPath "Detecting and installing required Windows Features for SCCM."
  }

  Process {

    $choice = ""
    $InstallFeatures = @()
    While ($choice -notmatch "[y|n]"){
      [console]::ForegroundColor = "Green"
      $choice = read-host "Do you want to install WSUS? (Y/N)"
      [console]::ForegroundColor = "White"
    }

    if ($choice -eq "n"){
      $InstallFeatures = @("RDC", "BITS", "Web-WMI")
    }

    if ($OSVer -gt 6.1) {  #Windows Server 2012
      if ($choice -eq "y"){
        $InstallFeatures = @("RDC", "UpdateServices", "BITS", "Web-WMI")
      }

      $WFInstalled = Install-WindowsFeature $InstallFeatures
      if ($WFInstalled.Success) {

        Write-Host "Required Windows Features installed successfully."
        Add-content $LogPath "Required Windows Features installed successfully."

      }
      else {

        Write-Error "!Required Windows Features did not install successfully. Exiting with code 403"
        Add-content $LogPath "!Required Windows Features did not install successfully. Exiting with code 403"
        Exit-WithCode 403
      }

    }
    else {  #Windows Server 2008 [R2]

      if ($choice -eq "y"){
        $InstallFeatures = @("RDC", "OOB-WSUS", "BITS", "Web-WMI")
      }

      Import-Module ServerManager
      $WFInstalled = Add-WindowsFeature $InstallFeatures
      if ($WFInstalled.Success) {

        Write-Host "Required Windows Features installed successfully."
        Add-content $LogPath "Required Windows Features installed successfully."

      }
      else {

        Write-Error "!Required Windows Features did not install successfully. Exiting with code 403"
        Add-content $LogPath "!Required Windows Features did not install successfully. Exiting with code 403"
        Exit-WithCode 403
      }
    }
  }

  End {
    Write-Host "Detect/install of required Windows Features complete."
    Add-content $LogPath "Detect/install of required Windows Features complete."
  }
}

Function Enable-BITSUploads {
  <#
  .SYNOPSIS
  Enables BITS uploads in IIS
  .DESCRIPTION
  Connects to IIS Default Website and enables BITS Uploads
  .EXAMPLE
  Enable-BITSUploads
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "2WindowsFeaturesInstall.log"
    Write-Host "Enabling BITS uploads for IIS."
    Add-content $LogPath "Enabling BITS uploads for IIS."
  }

  Process {

    Try {

      $IISSCCM = New-Object System.DirectoryServices.DirectoryEntry("IIS:$CMComputerw3svc1root")
      $IISSCCM.EnableBITSUploads()
      $IISSCCM.CommitChanges()
    }
    Catch {

      Write-Error "!BITS was not enabled in IIS. Exiting with code 403.1"
      Add-content $LogPath "!BITS was not enabled in IIS. Exiting with code 403.1"
      Exit-WithCode 4031
    }
  }

  End {
    Write-Host "BITS uploads for IIS enabled."
    Add-content $LogPath "BITS uploads for IIS enabled."
  }
}

Function Install-SQLNativeClient {
  <#
  .SYNOPSIS
  Installs SQL 2012 Native Client (v 11.0)
  .DESCRIPTION
  Installs SQL 2012 Native Client (v 11.0) required for SCCM 2012
  .EXAMPLE
  Install-SQLNativeClient
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "4SQLNativeClientInstall.log"
    Write-Host "Installing SQL Native Client 11.0."
    Add-content $LogPath "Installing SQL Native Client 11.0."
  }

  Process {
    Write-Host “SQL Native Client installing.  Please wait for the installation to finish (~2 minutes). If the installation does not complete within 5 minutes, the setup will fail.”
    Try {
      & msiexec.exe /i SCCMPrereqssqlncli.msi /passive IACCEPTSQLNCLILICENSETERMS=YES | Wait-Process -Timeout 300 -ErrorAction Stop
    }
    Catch {
      Write-Error "!SQL Native Client did not install correctly: Took longer than 5 minutes to complete. Exiting with code 404"
      Add-content $LogPath "!SQL Native Client did not install correctly: Took longer than 5 minutes to complete. Exiting with code 404"
      Exit-WithCode 404
    }

    $SQLClient11Installed = Get-ItemProperty -Path HKLM:SoftwareODBCODBCINST.INI"ODBC Drivers" | GM | ? { $_.Name -eq "SQL Server Native Client 11.0" -and $_.Definition -match "Installed" }

    if ($SQLClient11Installed) {
      Write-Host “SQL Native Client installed successfully.”
      Add-content $LogPath "SQL Native Client installed successfully."
    }
    else {
      Write-Error "!SQL Native Client did not install correctly. Exiting with code 404"
      Add-content $LogPath "!SQL Native Client did not install correctly. Exiting with code 404"
      Exit-WithCode 404
    }
  }

  End {
    Write-Host "SQL Native Client 11.0 install complete."
    Add-content $LogPath "SQL Native Client 11.0 install complete."
  }
}

Function Add-CMToSQLocalAdmin {
  <#
  .SYNOPSIS
  Add CM computer account to SQ local admins group
  .DESCRIPTION
  This function will collect the CM computer object from the domain and the SQ local admins group.  It will then attempt to add the CM computer object to the SQL local admins group.
  .EXAMPLE
  Add-CMToSQLocalAdmin "DomainName" "CMComputerName" "SQComputerName"
  #>
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory=$True,
    ValueFromPipeline=$False,
      HelpMessage="In what Domain is the CM Computer located?")]
    [Alias('D')]
    [ValidateLength(3,30)]
    [string[]]$Domain = (Get-WmiObject Win32_ComputerSystem).Domain,

    [Parameter(Mandatory=$True,
    ValueFromPipeline=$False,
      HelpMessage="What is the CM computer name?")]
    [Alias('CM')]
    [ValidateLength(3,30)]
    [string[]]$CMComputer,

    [Parameter(Mandatory=$True,
    ValueFromPipeline=$False,
      HelpMessage="What is the SQ computer name?")]
    [Alias('SQ')]
    [ValidateLength(3,30)]
    [string[]]$SQComputer
  )

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "5AddCMComputerToSQLocalAdmins.log"
    $CMComputerAccount = "$CMComputer$"
    Write-Host "Adding SCCM machine as local administrator to SQL host."
    Add-content $LogPath "Adding SCCM machine as local administrator to SQL host."
  }

  Process {

    Try {
      $LocalAdmins = Get-LocalAdminsGroup $SQComputer
      $LocalAdmins | % {
        if ($_ -match $CMComputer) {
          Write-Host "SCCM machine account already local admin on SQL host."
          Add-content $LogPath "SCCM machine account already local admin on SQL host."
          $CMAdmin = $True
        }
      }
      if (!$CMadmin) {
        Write-Host "Searching for CM computer object..."
        $CMComputerObject = [ADSI]("WinNT://$Domain/$CMComputerAccount")
        Write-Host "Searching for SQL Server Local Admins group..."
        $SQLocalAdminsGroup = [ADSI]("WinNT://$SQComputer/Administrators")
        Write-Host "Adding CM Computer to SQL Server Local Admins group..."
        $SQLocalAdminsGroup.PSBase.Invoke("Add",$CMComputerObject.PSBase.Path)
      }
    }
    Catch {

      Write-Error "!Could not add CM Computer object as SQL Server local admin. Exiting with code 405"
      Add-content $LogPath "!Could not add CM Computer object as SQL Server local admin. Exiting with code 405. PowerShell error: $Error[1]"
      Exit-WithCode 405
    }
  }

  End {
    Write-Host "SCCM machine admin rights complete."
    Add-content $LogPath "SCCM machine admin rights complete."
  }
}

Function Add-CMADAccess {
  <#
  .SYNOPSIS
  Adds Full Control to System Management folder in AD
  .DESCRIPTION
  Adds Full Control to System Management folder in AD
  .EXAMPLE
  Add-CMADAccess $Domain
  #>
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory=$True,
    ValueFromPipeline=$False,
      HelpMessage="In what Domain is the CM Computer located?")]
    [Alias('D')]
    [ValidateLength(3,30)]
    [string[]]$Domain = (Get-WmiObject Win32_ComputerSystem).Domain
  )

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $LogPath = "6AddCMComputerFullControltoSysManAD.log"
    $CMComputer = "$CMComputer$"
    Write-Host "Adding full permissions for SCCM machine account to System Management AD container."
    Add-content $LogPath "Adding full permissions for SCCM machine account to System Management AD container."
  }

  Process {

    $DomainDN = ([ADSI]'').DistinguishedName
    $Path = "OU=Computers,OU=test,DC=contoso,DC=com"
    $SysManObj = [ADSI]("LDAP://CN=System Management,CN=System,$DomainDN")

    if(!$SysManObj) { #Create System Management Container if it doesn't exist

      Try {
        $SystemDN = [ADSI]("LDAP://CN=System,$DomainDN")
        $SysManContainer = $SystemDN.Create("Container", "CN=System Management")
        $SysManContainer.SetInfo()
      }
      Catch {

        Write-Warning "!Could not create System Management container for SCCM install.  Please have AD team perform this function."
        Add-content $LogPath "!Could not create System Management container for SCCM install.  Please have AD team perform this function."
      }
    }

    $ActiveDirectoryRights = "GenericAll"
    $AccessControlType = "Allow"
    $Inherit = "SelfAndChildren"
    $nullGUID = [guid]'00000000-0000-0000-0000-000000000000'

    Try {

      Write-Host "Attempting to add permissions..."
      Add-content $LogPath "Attempting to add permissions..."
      $CMNTAccount = New-Object System.Security.Principal.NTAccount("$Domain$CMComputer")
      $ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $CMNTAccount, $ActiveDirectoryRights, $AccessControlType, $Inherit, $nullGUID
      $SysManObj.psbase.ObjectSecurity.AddAccessRule($ACE)
      $SysManObj.psbase.commitchanges()
    }
    Catch {

      Write-Warning "!Could not add full control permissions to System Management container for CM machine.  Please have AD team perform this function."
      Add-content $LogPath "!Could not add full control permissions to System Management container for CM machine.  Please have AD team perform this function."
    }
  }

  End {
    Write-Host "Permissions update complete."
    Add-content $LogPath "Permissions update complete."
  }
}

Function Install-ADK {
  <#
  .SYNOPSIS
  Installs Windows Assessment and Deployment Kit tools
  .DESCRIPTION
  Installs ADK Tools required for SCCM 2012: USMT, Preinstallation environment, and Deployment Tools
  .EXAMPLE
  Install-ADK
  #>

  Begin {
    Write-Host "--------------------------------------------------------------------" -ForegroundColor Cyan
    $InstallPath = "C:Program Files (x86)Windows Kits8.1"
    $LogPath = "3ADKSetup.log"
    $FeaturesToInstall = "OptionId.UserStateMigrationTool OptionId.WindowsPreinstallationEnvironment OptionId.DeploymentTools"
    $ErrorLog = "3ADKSetupError.log"
    Write-Host "Installing Windows ADK components."
    Add-content $LogPath "Installing Windows ADK components."
  }

  Process {

    Write-Host “ADK Setup beginning.  Please wait for the installation to finish (~5 minutes).  `
    If the installation does not complete within 10 minutes, the setup will fail.”

    Try {
      & ADKADKSetup.exe /q /ceip off /l $LogPath /norestart /installpath $InstallPath /features $FeaturesToInstall | Wait-Process -Timeout 600 -ErrorAction Stop
    }
    Catch {
      Write-Error "!ADK Setup did not complete correctly: Took longer than 10 minutes to complete.  Please examine ADK Setup log. Exiting with code 406"
      Add-content $ErrorLog "!ADK Setup did not complete correctly: Took longer than 10 minutes to complete.  Please examine ADK Setup log. . Exiting with code 406"
      Exit-WithCode 406
    }

    Write-Host “ADK Setup has finished”
    sleep -Seconds 3
    Add-content $LogPath "ADK Setup has finished."

    if (!(Test-Path $InstallPath)) {

      Write-Error "!ADK Setup did not complete correctly.  Please examine ADK Setup log. Exiting with code 406"
      Add-content  "!ADK Setup did not complete correctly.  Please examine ADK Setup log. Exiting with code 406"
      Exit-WithCode 406

    }
  }

  End {
    Write-Host "Windows ADK components install complete."
    Add-content $LogPath "Windows ADK components install complete."
  }

}

$Domain = Verify-Domain

$CMComputer = Verify-CMObject

$SQComputer = Verify-SQObject

Verify-SQLService

#Verify-SchemaExt

Verify-Media

[double]$OSVer = Detect-OS

Install-NetFramework3.5

Install-SCCMRequiredFeatures

Enable-BITSUploads

Install-SQLNativeClient

Add-CMToSQLocalAdmin $Domain $CMComputer $SQComputer

Add-CMADAccess $Domain

Install-ADK

Write-Host "SCCM 2012 Prerequisite Software Installation complete.  Please reboot..."
