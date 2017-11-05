### User manual autounattend.xml

- in de map sources van de iso het bestand install.wim lokaal kopiëren.
- in windows system image manager: install.wim openen, SERVERDATACENTER selecteren, catalog files worden aangemaakt...
- ga naar components and packages, components en rightclick op 'amd64_microsoft-windows-internal-core-winPE_10.0.14393.0_neutral' en click add setting to pass 1.

- in de answer file panel odner components, 1 windowsPE, amd64..., dan kan je rechts de waarden invullen. bij inputlocale en userlocale 'nl-be' bij systemlocale en UILanguage 'en-US'.
- amd64... openklappen, bij setupUILanguage - UILanguage 'en-US' invullen.
- onder windows image pane component amd64_Microsoft-Windows-setup_xxx_neutral, add setting to pass 1.
- onder amd64_Microsoft-Windows-Setup_neutral in answer file pane diskconfiguration rightclick en insert new disk.
- DiskID = 1, willWipe = True
- createPartition: order 1, size 32Gb, type primary. nog een partitie order 2, size 50 type primary, idem voor 3de maar dan order 3.
- nieuwe Disk met DiskID = 2, zelfde procedure als vorige maar dan 5 partities.
- new modifyPartition active = true, extend = false, format = NTFS, label System, letter C, order 1 partitionID 1
- new modifyPartition voor resterende partitites. Zelfde procedure, enkel acvtive = false, label en letters aanpassen.
- In answerFilePane: ImageInstal &rarr osImage, installToAvailablePartition false, willShowUI Allways (kan je kiezen)
- klap osimage open, installTo &rarr beide op 1(overeenkomde disk en partitie)
- installFrom &rarr rightclick, insertMetaData. key = /IMAGE/NAME, value = Windows Server 2016 SERVERDATACENTER
- terug in answerFilePane &rarr userData: acceptEula = true, Fullname = Lima2, Org = Team Red.
- onder userData &rarr productKey willSHowUi = always.

- Nieuw component: amd64_Microsoft-Windows-Shell-Setup_XXX_neutral &rarr add settin to pass 4 specialize.
- ComputerName= Lima 2, key invullen en Timezone=Romance Standard Time, registeredOrganization = '-'.
- in answerFilePane: windows shell setup openklappen
- terug zelfde component rightclick en Add setting to pass 7 oobeSystem
- registeredOrganization en owner = '-'
- autoLogon &rarr enabled = true, LogonCount 2, username = Administrator (domain local.red maar nu nog niet ingevuld voor test)
- Passwoord onder autologon &rarr Invullen (Admin123 nu als test)
- Onder UserAccounts &rarr Zelfde adminpasswoord invullen.

!!VALIDATE ANSWER FILE &rarr normaal dat er validation messages komen, echter mogen er geen errors zijn!! Nu answer file opslaan in root van ISO als "autounattend.xml"