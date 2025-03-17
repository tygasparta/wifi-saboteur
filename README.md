
                                                        
                          Version 1.0
                      Developed By Tyga Sparta
           https://github.com/tygasparta/wifi-saboteur

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
```

### Step 2: Navigate to the Project Folder

Move into the project directory:

```bash
cd wifi-saboteur
```

### Step 3: Make the Script Executable

Make the script executable:

```bash
chmod +x wifi_saboteur.sh
```

### Step 4: Install Required Tools

Ensure the required tools are installed:

```bash
sudo apt update
sudo apt install aircrack-ng wireless-tools
```

---

## Usage

### Step 1: Run the Script

Run the script with sudo:

```bash
sudo ./wifi_saboteur.sh
```

### Step 2: Scan for Networks

The tool will automatically scan for available Wi-Fi networks and display them in a numbered list.

### Step 3: Select a Network

Enter the number of the network you want to target.

### Step 4: Choose Deactivation Mode

You will be prompted to choose between:

- **Deactivate all devices**: This will deactivate all devices connected to the selected network.
- **Deactivate a single device**: This will allow you to select a specific device to deactivate.

### Step 5: Wait for Completion

The tool will perform the deauthentication attack. Once done, it will automatically restore your network manager functionality.

---

## Example Usage

Run the script:

```bash
sudo ./wifi_saboteur.sh
```

Scan for networks:

```
[*] Scanning for available Wi-Fi networks...
1) Network1 - 11
2) Network2 - 11
3) Network3 - 11
```

Select a network:

```
Enter the number of the network you want to target: 1
[+] Selected network: Network1 (BSSID: 12:34:56:78:90:AB, Channel: 11)
```

Choose deactivation mode:

```
1. Deactivate all devices
2. Deactivate a single device
Choose an option: 1
```

Wait for completion:

```
[!] Deactivating all devices on Network1...
[+] Cleaning up and exiting...
```
Top Cancel or Stop the Process click CTRL + C
---

## Developer

Tyga Sparta

---

## Disclaimer

This tool is for educational purposes only. Use it responsibly and only on networks you own or have explicit permission to test. Unauthorized use of this tool is illegal and unethical.

---

## Contributing

Contributions are welcome! If you'd like to contribute to this project, follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Make your changes and commit them:
   ```bash
   git commit -m "Add your commit message here"
   ```
4. Push your changes to your forked repository:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a pull request on GitHub.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Support

If you encounter any issues or have questions, feel free to open an issue on the GitHub repository.

Enjoy using WiFi Saboteur! 🚀

