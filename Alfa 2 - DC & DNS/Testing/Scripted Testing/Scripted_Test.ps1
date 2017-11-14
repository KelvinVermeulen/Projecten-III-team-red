#Variables ###########################################################################################
$Windowsversion = "Microsoft Windows Server 2016 Standard"
$successcount = 0
$failedcount = 0

echo "--------------------------------------------------------------"
#Check if the correct version is installed ###########################################################
echo "[$(Get-Date -format 'hh:mm:ss')] Checking windows server version:"
if (
(Get-WmiObject -class Win32_OperatingSystem).Caption |
 Select-String -Pattern ${Windowsversion} -Quiet)
{
    echo "[$(Get-Date -format 'hh:mm:ss')][OK] Windows Version"
    $successcount +=1
}
Else
{
    echo "[$(Get-Date -format 'hh:mm:ss')][FAILED] Windows Version"
    Write-Host "[$(Get-Date -format 'hh:mm:ss')][ERROR]The installed OS is $((Get-WmiObject -class Win32_OperatingSystem).Caption)." -ForegroundColor Red
    $failedcount +=1
}

echo "--------------------------------------------------------------"
#Check if the correct version is installed ###########################################################
echo "[$(Get-Date -format 'hh:mm:ss')] Checking the Network Configuration:"
if (
(Get-WmiObject -class Win32_OperatingSystem).Caption |
 Select-String -Pattern ${Windowsversion} -Quiet)
{
    echo "[$(Get-Date -format 'hh:mm:ss')][OK] Windows Version"
    $successcount +=1
}
Else
{
    echo "[$(Get-Date -format 'hh:mm:ss')][FAILED] Windows Version"
    Write-Host "[$(Get-Date -format 'hh:mm:ss')][ERROR]The installed OS is $((Get-WmiObject -class Win32_OperatingSystem).Caption)." -ForegroundColor Red
    $failedcount +=1
}

echo "--------------------------------------------------------------"

echo "--------------------------------------------------------------"
echo "SUCCESFUL = ${successcount} FAILED = ${failedcount}"