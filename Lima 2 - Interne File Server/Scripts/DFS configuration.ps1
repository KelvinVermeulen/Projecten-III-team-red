#Automatisation script configuration DFS, shareVerkoop

#STILL IN PROGRESS!#

#Make folder
$folders = (‘C:\dfsroots\files’,’D:\ShareVerkoop’)  mkdir -path $folders
#Make share
$folders | ForEach-Object {$sharename = (Get-Item $_).name; New-SMBShare -Name $shareName -Path $_ -FullAccess Everyone}
#DFNSroot
New-DfsnRoot -Path \\red.local\ShareVerkoop -TargetPath \\lima2\ShareVerkoop -Type DomainV2

#Add folder target to namespace
$folders | Where-Object {$_ -like "*ShareVerkoop*"} | ForEach-Object {$name = (Get-Item $_).name; 
$DfsPath = (‘\\red.local\ShareVerkoop\’ + $name); 
$targetPath = (‘\\lima2\’ + $name);
New-DfsnFolderTarget -Path $dfsPath -TargetPath $targetPath}