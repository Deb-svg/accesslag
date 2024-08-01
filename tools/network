#!/bin/bash

# scan.sh - Network scanning script

# Function to perform a basic scan
basic_scan() {
    echo "Performing basic scan on $1..."
    nmap -v -A "$1"
}

# Function to perform a port scan
port_scan() {
    echo "Performing port scan on $1..."
    nmap -v -p 1-65535 "$1"
}

# Function to perform a vulnerability scan
vuln_scan() {
    echo "Performing vulnerability scan on $1..."
    nmap --script vuln "$1"
}

# Check if an IP address or hostname is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <target> [scan_type]"
    echo "scan_type: basic (default), port, vuln"
    exit 1
fi

TARGET=$1
SCAN_TYPE=${2:-basic}

case $SCAN_TYPE in
    basic)
        basic_scan "$TARGET"
        ;;
    port)
        port_scan "$TARGET"
        ;;
    vuln)
        vuln_scan "$TARGET"
        ;;
    *)
        echo "Invalid scan type. Use: basic, port, vuln"
        exit 1
        ;;
esac
