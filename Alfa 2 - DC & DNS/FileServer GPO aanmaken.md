# FileServer configuration GPO

1. 1Group Policy Management Forest: red.local Domains red.local
2. 2Rechtermuisklik op red.local Create GPO in this domain, and Link it here…
3. 3Naam: FileServer
4. 4Rechtermuisklik op FileServer Edit…
5. 5User configuration Preferences Windows Settings Dirve Maps
6. 6Aanmaken drives:

| Aanmaken voor | Action | Location | Use | Hide/Show this drive | Targeting |
| --- | --- | --- | --- | --- | --- |
| Shareverkoop | Create | [\\lima2\ShareVerkoop](smb://lima2/ShareVerkoop) | S | Show this drive | IT Administratie
OR VerkoopOR Ontwikkeling |
| profiledirs | Create | [\\lima2\ProfileDirs](smb://lima2/ProfileDirs) | T | Show this drive | VerkoopOR OntwikkelingOR IT AdministratieOR DirectieOR Administratie |
| HOMEdirs | Create | [\\lima2\HomeDirs](smb://lima2/HomeDirs) | U | Show this drive | VerkoopOR OntwikkelingOR IT AdministratieOR DirectieOR Administratie |
| Admindata | Create | [\\lima2\AdminData](smb://lima2/AdminData) | V | Show this drive | AdministratieOR IT Administratie |
| Dirdata | Create | [\\lima2\DirData](smb://lima2/DirData) | W | Show this drive | DirectieOR IT Administratie |
| ITData | Create | [\\lima2\ITData](smb://lima2/ITData) | X | Show this drive | IT Administratie |
| Ontwikkelingsdata | Create | [\\lima2\OntwikkelingsData](smb://lima2/OntwikkelingsData) | Y | Show this drive | OntwikkelingOR IT Administratie |
| Verkoopdata | Create | [\\lima2\VerkoopData](smb://lima2/VerkoopData) | Z | Show this drive | VerkoopOR IT Administratie |
