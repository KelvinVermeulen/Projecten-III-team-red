#Automatisation script configuration DFS, shareVerkoop

#STILL IN PROGRESS!#

New-SmbShare -Name ShareVerkoop -Path: D:\ShareVerkoop -EncryptData $False -FullAccess "IT Administratie" -ReadAccess "Ontwikkeling" -ChangeAccess "Verkoop"
New-DfsnRoot –Path D:\ShareVerkoop -TargetPath \verkoopData -Type Domainv2 | Format-List