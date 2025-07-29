# System Initializer for Ubuntu/Debian

A modular, interactive Bash script for initial system setup on Ubuntu/Debian servers and virtual machines.  
This script allows you to quickly configure hostname, timezone, locale, and APT mirror — all through a simple terminal-based menu, with **no external dependencies**.

---

## Features

- Interactive terminal menu for ease of use
- Fully bash-only (no `dialog`, `whiptail`, `fzf`, or external tools required)
- Clean and colorized output for readability
- Supports listing and selecting from all timezones
- Sets hostname with confirmation
- Configures system locale with available choices
- Updates the system’s APT sources to faster regional mirrors

---

## What It Configures

| Option           | Description                                 |
|------------------|---------------------------------------------|
| Hostname         | Set or update the system's hostname         |
| Timezone         | Browse and select timezone from full list   |
| Locale           | Configure system language and region        |
| APT Mirror       | Set your preferred APT source repository    |

---

## Installation

### One-liner (recommended)

```bash
curl -fsSL https://yourdomain.com/system-init.sh | bash

