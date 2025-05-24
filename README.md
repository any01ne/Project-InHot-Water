# Implementation of Domain Environment for InHotWater using Windows Server 2025

## Author
Wojciech Jasieniak  
**Project Duration:** April - May 2025

## Project Goal
Develop hands-on skills in Windows Server administration and Active Directory domain services by designing and deploying a complete IT environment for a small e-commerce company.

## Technologies Used
- Windows Server 2025
- Windows Server 2022 (Backup)
- Windows 11 Pro / Windows 10 Pro
- Hyper-V (on Windows 11 Host)
- Active Directory, DNS, DHCP, WSUS
- GPO (Group Policy Objects)

## Infrastructure Overview
Fully virtualized environment built with Hyper-V:
- 1x Domain Controller (Windows Server 2025) – AD DS, DHCP, DNS, WSUS, File Server
- 1x Backup Server (Windows Server 2022)
- 3x Client Stations (2x Windows 11, 1x Windows 10)

## Hyper-V Configuration
- **vSwitch External**: internet access
- **vSwitch Private**: internal communication
- VMs: vCPU: 2, RAM: 4 GB, dynamic VHDX disks

## Setup Steps
1. Install Hyper-V and create VMs
2. Install OS from ISO images
3. Add roles: AD DS, DHCP, DNS, WSUS
4. Promote DC and create domain: ihw.company
5. Configure DHCP scope: 10.0.0.100-200
6. Join client PCs to the domain

## Active Directory Structure
- OUs: AdminIT, Headquarter, HR, IT, Management
- Security Groups created per department
- User accounts created accordingly

## GPO Policies by Department

### HR Department
- Blocked access to drive C
- Disabled Control Panel and Settings
- Network drive H: mapped to shared folder

### Management
- Prevent visual customizations
- Mapped drive M:

### Headquarter
- Registry and Control Panel blocked
- Limited access to local drive
- Mapped drive H:

### IT Department
- Limited privileges on standard accounts
- Admin tasks via separate AdminIT accounts
- RDP access enabled

### AdminIT
- Full administrative rights
- No GPO restrictions
- Access to PowerShell and MMC tools

## Backup Plan
- Separate backup server with daily incremental backups
- Targets: user profiles, department data, server configs
- VM checkpoints after major changes

## Issues & Fixes
- **Windows 11 local account setup**: bypassed Microsoft login using `OOBE\BYPASSNRO` command

## Conclusions
- Real-world Windows Server deployment experience
- Applied best practices: backup, user role separation, GPO policies
- Ready for scaling: SCCM, RADIUS, monitoring solutions

## Future Improvements
- Deploy Microsoft Endpoint Configuration Manager (SCCM)
- Implement RADIUS/NPS for Wi-Fi auth
- Add monitoring tools (Zabbix, PRTG)
- Test Disaster Recovery scenarios and backup automation

---

> **Project includes the following folders:**  
> - `/docs` – diagrams (network, GPO, AD)  
> - `/scripts` – PowerShell for user creation and drive mapping  
> - `/configs` – DHCP scope and OU structure  
> - `/backups` – backup strategy documentation
