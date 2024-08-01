#!/bin/bash

# helper.sh - Helper functions script

# Function to display system information
display_system_info() {
    echo "Displaying system information..."
    uname -a
    lsb_release -a
}

# Function to display disk usage
display_disk_usage() {
    echo "Displaying disk usage..."
    df -h
}

# Function to display memory usage
display_memory_usage() {
    echo "Displaying memory usage..."
    free -h
}

# Function to check network connectivity
check_network_connectivity() {
    echo "Checking network connectivity..."
    ping -c 4 google.com
}

# Function to display available helper commands
display_help() {
    echo "Available commands:"
    echo "1. system_info - Display system information"
    echo "2. disk_usage - Display disk usage"
    echo "3. memory_usage - Display memory usage"
    echo "4. network_connectivity - Check network connectivity"
}

# Main script logic
if [ -z "$1" ]; then
    echo "Usage: $0 <command>"
    display_help
    exit 1
fi

COMMAND=$1

case $COMMAND in
    system_info)
        display_system_info
        ;;
    disk_usage)
        display_disk_usage
        ;;
    memory_usage)
        display_memory_usage
        ;;
    network_connectivity)
        check_network_connectivity
        ;;
    *)
        echo "Invalid command."
        display_help
        ;;
esac
