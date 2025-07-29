# 📦 Common Packages Installer

This script installs a standard set of useful system and development packages on any Ubuntu/Debian system. It's ideal for setting up a fresh environment with essential tools.

---

## What It Installs

- `build-essential` — compilers and dev headers  
- `curl`, `wget` — for downloading resources  
- `git` — version control  
- `vim`, `zsh` — terminal utilities  
- `unzip`, `htop`, `tree` — system tools  
- `net-tools` — ifconfig/netstat support  
- `gnupg2` — GPG for secure key operations  
- `ca-certificates`, `software-properties-common` — system support packages  

---

## Usage

Run directly from GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/itsSwArchitect/bash-scripts/main/common-packages/install-packages.sh | bash
```
##  Folder Structure
```
common-packages/
├── install-packages.sh  # Main installer script
└── README.md            # This documentation
```
### 
---

Let me know if you want to add **OS checks**, **logging**, or **version info** in the script or docs.


