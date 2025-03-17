# WiFi Saboteur

A Bash script for Kali Linux to deactivate devices connected to a Wi-Fi network. This tool allows you to scan for available Wi-Fi networks, select a target network, and deactivate all or specific devices connected to it.

---

## Features
- Scan for available Wi-Fi networks.
- Select a target network.
- Deactivate all devices or a single device on the network.
- Automatically restores network manager functionality after use.

---

## Requirements
- **Kali Linux** (or any Linux distribution with the required tools installed).
- A **Wi-Fi adapter** that supports monitor mode and packet injection.
- The following tools installed:
  - `aircrack-ng`
  - `iwconfig`
  - `wireless-tools`

---

## Installation

### Step 1: Clone the Repository
Clone the repository to your local machine:
```bash
git clone https://github.com/tygasparta/wifi-saboteur.git
