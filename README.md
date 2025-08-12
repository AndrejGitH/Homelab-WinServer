
# Homelab Windows Server – Quick Overview

_For detailed setup and process documentation, see the [Docs folder](https://github.com/AndrejGitH/Homelab-WinServer/tree/master/Docs)._

## Visual Walkthrough

### 1. Virtualization Lab Setup




*Configured three virtual machines (WinServerDC, WinServerUI, Sales-Smith) on Hyper-V to simulate realistic business infrastructure.*

<img width="476" height="118" alt="1-Hyper-V" src="https://github.com/user-attachments/assets/8c7bccf7-97c0-4aac-bd68-00ad1c00cf86" />


### 2. Group Policy (GPO) Deployment



*Implemented Group Policies to enforce user restrictions and desktop standards. Automated policy refresh across the domain using PowerShell scripting.*

![2-GPO-Control Panel](https://github.com/user-attachments/assets/1dbc1b33-2a82-4697-ad8e-323fceb9679b)
![3-GPUPDATE  Script](https://github.com/user-attachments/assets/beb4cfc0-b3dc-424f-9f85-93e9f60b0b72)


### 3. Remote Desktop Administration


*Remote Desktop for secure admin access and efficient troubleshooting from WinServerDC to client VM.*
  ![5-RemoteDesktop](https://github.com/user-attachments/assets/70e79973-97c7-480a-b1fe-ee8c2d64e266)


### 4. Proxy Server & Web Monitoring


*Set up CCProxy on the server, filtering and logging web traffic for user accountability and network insight.*
![7-CCProxy Log](https://github.com/user-attachments/assets/1b184fad-6b69-436e-b2c1-7c3dcdf61f06)


### 5. Monitoring & Alerting


*Configured central monitoring using Event Viewer and live alerts for proactive system care.*
![9-EventViewerMonitoringWokerPc](https://github.com/user-attachments/assets/9c3a0d27-9dd4-4a79-959d-2f5b226cc67e)
![10-PerMonitorAlertDiskSpace](https://github.com/user-attachments/assets/82395a80-4b95-41d7-891f-59fe3daa96ed)


### 6. File Server – Mapped Drive


*Mapped shared S: drive to all sales users via Group Policy for seamless file access.*
![11-FileServer-DriveMaps](https://github.com/user-attachments/assets/31657c8f-19e0-46a0-8ade-8cd4e261b639)
![12-SalesPC-SharedDrive](https://github.com/user-attachments/assets/5ccf882c-ed61-4167-b352-09baa5b358d1)


### 7.  PowerShell Scripting Practice

I’ve practiced PowerShell scripting for common IT tasks like:

- Automating Group Policy updates across all domain computers  
- Creating Active Directory users quickly and securely via scripts
- Removing Active Directory users quickly and securely via scripts

See:
https://github.com/AndrejGitH/Homelab-WinServer/tree/master/Scripts

### 8. Backup (Veeam and Windows Local Backup)
![Veeam_Github](https://github.com/user-attachments/assets/0a09033a-a184-42ea-9daf-0acc1d9702c5)

![WinBackup_Github](https://github.com/user-attachments/assets/0bc403ba-3e69-4657-82d2-f5d62d4864d8)

### 9. WSUS
![Wsus_github](https://github.com/user-attachments/assets/4e4da202-516e-4801-b1cf-8b8f182d7ad2)




