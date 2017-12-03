
#shares & permissions

new-smbshare -name VerkoopData -Path: D:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "Verkoop"
new-smbshare -name OntwikkelingData -Path: E:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "Ontwikkeling"
new-smbshare -name ITData -Path: F:\ -EncryptData $False -FullAccess "IT Administratie"
new-smbshare -name DirData -Path: G:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "Directie"
new-smbshare -name AdminData -Path: H:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "Administratie"
new-smbshare -name HomeDirs -Path: Y:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "everyone"
new-smbshare -name ProfileDirs -Path: Z:\ -EncryptData $False -FullAccess "IT Administratie" -ChangeAccess "everyone"
new-smbshare -name ShareVerkoop -Path: D:\ -EncryptData $False -FullAccess "IT Administratie" -ReadAccess "Ontwikkeling" -ChangeAccess "Verkoop"
 
# quotas
# http://techgenix.com/powershell-file-management-part3/

$Action = New-FsrmAction -Type Command -Command "c:\windows\system32\cmd.exe" -CommandParameters "echo  >> c:\log.txt" -ShouldLogError
$Threshold = New-FsrmQuotaThreshold -Percentage 90 -Action $action
# example thingy : New-FsrmQuota -Path "C:\Shares" -Size 128MB -Threshold $Threshold -Softlimit (softlimit does not enforce the threshold, but just logs it)

New-FsrmQuota -Path "D:\" -Description "VerkoopData Quota" -Size 100MB -Threshhold $Threshold
New-FsrmQuota -Path "G:\" -Description "DirData Quota" -Size 100MB -Threshhold $Threshold
New-FsrmQuota -Path "H:\" -Description "AdminData Quota" -Size 100MB -Threshhold $Threshold

New-FsrmQuota -Path "E:\" -Description "OntwikkelingData Quota" -Size 200MB -Threshhold $Threshold
New-FsrmQuota -Path "F:\" -Description "ITData Quota" -Size 200MB -Threshhold $Threshold

# shadowcopy

# is enabling shadowcopies even possible with powershell? 
# activation of vss seems gui-only? https://mcpmag.com/articles/2015/12/07/creating-volume-shadow-copies.aspx
