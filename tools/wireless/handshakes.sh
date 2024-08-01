#!/bin/bash

# handshakes.sh - WPA/WPA2 handshake capture script

# Function to capture WPA/WPA2 handshakes
capture_handshakes() {
    echo "Starting WPA/WPA2 handshake capture..."
    echo "Target AP: $1"
    echo "Interface: $2"
    sudo airodump-ng --bssid "$1" --channel "$3" --write "$4" "$2"
}

# Check if target AP, interface, channel, and output file are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
    echo "Usage: $0 <target_ap> <interface> <channel> <output_file>"
    exit 1
fi

TARGET_AP=$1
INTERFACE=$2
CHANNEL=$3
OUTPUT_FILE=$4

capture_handshakes "$TARGET_AP" "$INTERFACE" "$CHANNEL" "$OUTPUT_FILE"
