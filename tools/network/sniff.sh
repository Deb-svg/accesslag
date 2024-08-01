#!/bin/bash

# sniff.sh - Packet sniffing script

# Function to start packet sniffing
start_sniffing() {
    echo "Starting packet sniffing on interface $1..."
    sudo tcpdump -i "$1" -w "$2"
}

# Check if network interface and output file are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <interface> <output_file>"
    exit 1
fi

INTERFACE=$1
OUTPUT_FILE=$2

start_sniffing "$INTERFACE" "$OUTPUT_FILE"
