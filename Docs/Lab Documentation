# Lab Documentation: Windows Server Homelab

## 1. Virtual Environment Deployment

- **Hypervisor:** Hyper-V  
- **Deployed Virtual Machines:**
    - **WinServerDC:** Windows Server 2022 – Domain Controller
    - **WinServerUI:** Windows Server 2022 – File & Proxy Server
    - **Sales-Smith:** Windows 10 – Simulated sales employee workstation

## 2. Domain Controller Configuration (WinServerDC)

- **Roles Installed:**
    - Active Directory Domain Services (AD DS)
    - Domain Name System (DNS)
    - Dynamic Host Configuration Protocol (DHCP)
- **Promoted WinServerDC to a Domain Controller:**
    - Created root forest/domain for centralized authentication and management.

## 3. File Server & Shared Storage Setup (WinServerUI)

- **File Server Role:**  
    - Installed on WinServerUI for secure, central storage.
- **Shared Folder:**
    - Created a dedicated folder (`Sales-Shared`) for departmental documents.
    - Configured NTFS and share permissions to grant access only to “Sales Users.”
- **Drive Mapping:**
    - Mapped `Sales-Shared` as network drive S: for all Sales Users via Group Policy Preferences.
    - Ensured all users see S: as a standard volume in File Explorer on logon.

## 4. Proxy Server Deployment & Web Monitoring (WinServerUI)

- **CCProxy Installation:**  
    - Installed CCProxy on WinServerUI as a web filter and monitoring solution.
- **Configuration Steps:**
    - Limited proxy access to the Sales-Smith workstation’s IP.
    - Aligned HTTP proxy port (e.g., 808) in both CCProxy and client manual proxy settings.
    - Added Windows Firewall inbound rule for port 808 (TCP).
    - Verified all VM network connectivity.
- **Monitoring:**  
    - Utilized CCProxy’s Monitor tab to log and review web activity from the client PC.

## 5. Organizational Structure and User Provisioning

- **Created Organizational Unit:**  
    - “Zilina” for logical separation in Active Directory.
- **Sales Users Group:**  
    - Created global group "Sales Users" within Zilina OU.
    - Added user `john smith` to the Sales Users group.

## 6. Group Policy Management

- **GPO Deployment:**
    - Applied Group Policy Objects to restrict sales employees from changing desktop wallpapers and accessing Control Panel.
    - Linked policies to Zilina OU for targeted management.
- **Policy Enforcement:**  
    - Executed domain-wide GPO update using PowerShell script (`gpupdate`) from WinServerDC.

## 7. Remote Desktop Administration

- **Enabled Remote Desktop Services:**
    - Configured Sales-Smith client PC for remote access.
- **Testing:**  
    - Connected remotely from WinServerDC to Sales-Smith, demonstrated file system operations (e.g., folder creation) as an admin.

## 8. Advanced Monitoring & Proactive Alerting

- **Event Viewer:**  
    - From WinServerDC, connected to Sales-Smith PC using Event Viewer to inspect system/application logs remotely.
- **Performance Monitor Alert:**
    - Configured Performance Monitor on Sales-Smith to trigger an alert when disk space drops below 10%.
    - Verified remote logging and alerting functionality for proactive support.
