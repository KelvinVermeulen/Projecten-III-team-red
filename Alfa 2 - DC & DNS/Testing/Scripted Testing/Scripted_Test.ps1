#Variables ###########################################################################################
$Windowsversion = "Microsoft Windows Server 2016 Standard"
$ipv4 = "192.168.1.1"
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

#Checking Network Configuration ###########################################################
echo "[$(Get-Date -format 'hh:mm:ss')] Checking the Network Configuration:"
    
    $ip = Test-Connection ${ipv4} -Count 1 | Select IPV4Address
    if ($ip.IPV4Address.IPAddressToString -eq "172.16.0.1")
            {
                echo "[$(Get-Date -format 'hh:mm:ss')][OK] IP-address"
                $successcount +=1
            }
    Else
            {
        echo "[$(Get-Date -format 'hh:mm:ss')][FAILED] IP-address"
        Write-Host "[$(Get-Date -format 'hh:mm:ss')][ERROR]The IP-address is"$ip.IPV4Address.IPAddressToString"." -ForegroundColor Red
        $failedcount +=1
            }

echo "--------------------------------------------------------------"

echo "--------------------------------------------------------------"
echo "SUCCESFUL = ${successcount} FAILED = ${failedcount}"