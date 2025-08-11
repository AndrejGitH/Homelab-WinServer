# Homelab Process Documentation – Windows Server Small Office Simulation

## 1. Environment Deployment

- **Hypervisor:** Hyper-V
- **Virtual Machines:**
    - **WinServerDC:** Windows Server 2022 — Domain Controller
    - **WinServerUI:** Windows Server 2022 — File & Proxy Server
    - **Sales-Smith:** Windows 10 — Workstation (Sales role simulation)

## 2. Domain Infrastructure Configuration

- Installed the following roles on **WinServerDC**:
    - Active Directory Domain Services (AD DS)
    - Domain Name System (DNS)
    - Dynamic Host Configuration Protocol (DHCP)
- Promoted WinServerDC to Domain Controller, establishing a new Active Directory forest and domain.
- Joined both WinServerUI and Sales-Smith to the domain for centralized management.

## 3. Organizational Structure & Account Provisioning

- Created the **“Zilina” Organizational Unit (OU)** to group related users and assets.
- Established a **global security group, "Sales Users,"** within the Zilina OU.
- Provisioned a user account (**John Smith**) and assigned membership in the Sales Users group.

## 4. File Server and Secure Shared Storage (WinServerUI)

- Enabled the File Server role on WinServerUI.
- Created the **Sales-Shared** folder for department file collaboration.
- Configured both **NTFS and share-level permissions** to grant access solely to members of Sales Users.
- Leveraged **Group Policy Preferences** to map the S: drive (`\\WinServerUI\Sales-Shared`) automatically for all Sales Users, delivering seamless access in File Explorer.

## 5. Proxy Server Configuration & Monitoring (WinServerUI)

- Installed and configured **CCProxy** on WinServerUI to filter web traffic and monitor user activity.
- Limited proxy access to the **Sales-Smith workstation** by IP, ensuring only authorized devices use the proxy.
- Standardized HTTP proxy port (e.g., 808) settings on both WinServerUI and Sales-Smith, aligning client and server configuration.
- Created an inbound Windows Firewall rule on WinServerUI permitting TCP traffic on the proxy port.
- Verified that all internet traffic from Sales-Smith was routed through the proxy, as intended.
- **Used CCProxy’s monitoring/logging features** to capture and review Sales-Smith's web activity, supporting compliance and visibility.

## 6. Group Policy Implementation

- Deployed targeted Group Policy Objects (GPOs) to the Zilina OU/Sales Users group:
    - Prevented desktop wallpaper changes.
    - Restricted access to the Control Panel.
- Used a PowerShell script from WinServerDC to trigger a domain-wide GPO update, ensuring immediate application of policy changes.

## 7. Remote Desktop Administration

- Enabled Remote Desktop on the Sales-Smith workstation for support and management.
- Connected from WinServerDC using RDP to demonstrate hands-on remote troubleshooting and administrative file management.

## 8. Monitoring & Alerting

- Used Event Viewer on WinServerDC to remotely access and review system and application logs from Sales-Smith, supporting centralized incident monitoring.
- Configured **Performance Monitor** on Sales-Smith to trigger an alert when disk space dropped below 10%, facilitating proactive issue detection.

## 9. Backup

### 1) Veeam
- **Purpose:** Back up the Domain Controller (DC) using Veeam Windows Computer backup job.
- **Backup Name:** `Backup2025`
- **Scope:** First-level backup selecting a few folders.
- **Schedule:** Monthly
- **Retention Policy:** 7 days

### 2) Windows Backup
- Installed **Windows Server Backup** feature.
- Created a new volume for backups.
- Scheduled backup for `C:\Sales-Data`.

## 10. Scripts

- Created scripts to automate:
  - Creating users
  - Removing users
  - Automating policy management
- See scripts folder for details.






