#!/bin/bash

# crack_wpa.sh - WPA/WPA2 password cracking script

# Function to crack WPA/WPA2 password
crack_wpa() {
    echo "Starting WPA/WPA2 password cracking..."
    echo "Capture file: $1"
    echo "Wordlist: $2"
    aircrack-ng -w "$2" -b "$3" "$1"
}

# Check if capture file, wordlist, and BSSID are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <capture_file> <wordlist> <bssid>"
    exit 1
fi

CAPTURE_FILE=$1
WORDLIST=$2
BSSID=$3

crack_wpa "$CAPTURE_FILE" "$WORDLIST" "$BSSID"
