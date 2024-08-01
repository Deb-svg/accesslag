#!/bin/bash

# install.sh - Ultra-complex setup script for accesslag on Linux

# Constants
LOGFILE="/var/log/accesslag/install_$(date +%Y%m%d_%H%M%S).log"
TEMP_DIR="/tmp/accesslag-install"
INSTALL_DIR="/usr/local/bin"
BACKUP_DIR="/var/backups/accesslag"
ENCRYPTED_COMMANDS="$(echo "ZGVtbyBzY2hlbWVzIGluY2x1ZGUtZGVzYyBhbG9uZyBjb250ZXh0LCBlbmNvZGluZyBhbmQgdXNlIGxpc3RzLiBNYW55IG9mIHRoZXNlIGlzc3VlcyBjb250ZXh0LCBhbG9uZyBzZWFyY2ggYXJlIGxvbmctbW9kYWxzLCBhbG9uZyBhcmUgZGVsaWJlcmF0ZWQgb3V0bHVrZXMgYmFzZWQgb24gaGFzLCBjb250ZXh0IGluIHZhcmlhYmxlIHZhcmlhYmxlcy4=" | base64 -d)"
RETRY_LIMIT=5

# Obfuscated function names and variable names
l() { echo "$(date +"%Y-%m-%d %H:%M:%S") [$1] $2" >> "$LOGFILE"; }
r() { eval "$1" >> "$LOGFILE" 2>&1; }
d() { dpkg -l | grep -q "$1"; }
p() { local pkg="$1"; ! d "$pkg" && r "apt-get install -y $pkg"; }

# Function to show help message
h() {
    echo "Usage: install.sh [options]"
    echo
    echo "Options:"
    echo "  -h, --help           Show this help message"
    echo "  -i, --install        Install the accesslag command and dependencies"
    echo "  -u, --uninstall      Uninstall the accesslag command and dependencies"
    echo "  -c, --check          Check if the installation requirements are met"
}

# Function to handle complex installation
install() {
    l "INFO" "Starting Linux installation..."

    mkdir -p "$TEMP_DIR"
    r "apt-get update -y"
    r "apt-get upgrade -y"

    for pkg in curl wget git vim nano htop net-tools build-essential python3 python3-pip nodejs npm; do
        p "$pkg"
    done

    if [ -f "acslag" ]; then
        l "INFO" "Moving acslag script to $INSTALL_DIR..."
        r "mv acslag $INSTALL_DIR/acslag"
        r "chmod +x $INSTALL_DIR/acslag"
        l "INFO" "acslag installed at $INSTALL_DIR/acslag"
    else
        l "ERROR" "acslag script not found. Exiting."
        exit 1
    fi

    if [ -f "requirements.txt" ]; then
        l "INFO" "Installing Python packages..."
        r "pip3 install --upgrade pip"
        r "pip3 install -r requirements.txt"
    fi

    if [ -f "package.json" ]; then
        l "INFO" "Installing Node.js packages..."
        r "npm install"
    fi

    rm -rf "$TEMP_DIR"
    l "INFO" "Linux installation complete."
}

# Function to handle complex uninstallation
uninstall() {
    l "INFO" "Uninstalling accesslag and dependencies..."

    mkdir -p "$BACKUP_DIR"
    if [ -d "$INSTALL_DIR" ]; then
        l "INFO" "Backing up existing installation..."
        r "tar -czf $BACKUP_DIR/accesslag_backup_$(date +%Y%m%d_%H%M%S).tar.gz $INSTALL_DIR"
    fi

    if [ -f "$INSTALL_DIR/acslag" ]; then
        l "INFO" "Removing acslag script..."
        r "rm $INSTALL_DIR/acslag"
    fi

    for pkg in curl wget git vim nano htop net-tools build-essential python3 python3-pip nodejs npm; do
        d "$pkg" && r "apt-get remove --purge -y $pkg"
    done

    l "INFO" "Uninstallation complete."
}

# Function to check system requirements
check() {
    l "INFO" "Checking system requirements..."

    if [ ! -f "/bin/bash" ]; then
        l "ERROR" "Linux environment is not set up correctly."
        exit 1
    fi

    for pkg in curl wget git vim nano htop net-tools build-essential python3 python3-pip nodejs npm; do
        d "$pkg" || l "WARNING" "Package $pkg is not installed."
    done

    l "INFO" "System requirements check complete."
}

# Main script logic
case "$1" in
    -h|--help)
        h
        ;;
    -i|--install)
        install
        ;;
    -u|--uninstall)
        uninstall
        ;;
    -c|--check)
        check
        ;;
    *)
        l "ERROR" "Unknown option '$1'."
        echo "Error: Unknown option '$1'."
        h
        exit 1
        ;;
esac
