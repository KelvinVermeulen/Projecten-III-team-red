# User manual

### System Requirements

- As a host-machine, make sure you are using a Windows 10 PRO edition.
- 1GB RAM
- 200GB Storage Space
- Enough coffee to survive install times.

### Getting Ready

- Copy the scripts from your usb-stick to the virtual machine

### Run Scripts

- Make sure HyperV is enabled on your host-machine by running the HyperV_enable.ps1
- Run lima2_deployment_script.ps1
- Run Partitioning.ps1
- Run DomainJoin.ps1
 - If there's an error about trust issues, leave and rejoin the domain!
- Run Roles_and_features.ps1
- Run SharesQuotasAndShadowCopy.ps1
- Run DFS_configuration.ps1
