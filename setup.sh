#!/bin/bash

# setup.sh - Setup script for accesslag hacking simulation project

# Function to check and install a package if not already installed
install_package() {
    if ! dpkg -l | grep -q "$1"; then
        echo "Installing $1..."
        sudo apt-get install -y "$1"
    else
        echo "$1 is already installed."
    fi
}

echo "Starting setup for accesslag..."

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install necessary packages
echo "Installing necessary packages..."
install_package nmap
install_package aircrack-ng
install_package sqlmap
install_package nikto
install_package metasploit-framework
install_package wireshark
install_package python3
install_package python3-pip

# Install Python packages
echo "Installing Python packages..."
pip3 install requests bs4

# Set execute permissions for all .sh files in tools directory
echo "Setting execute permissions for all .sh files in tools directory..."
find tools/ -type f -name "*.sh" -exec chmod +x {} \;

echo "Setup complete. You can now run the scripts from the tools directory."

# End of setup script
