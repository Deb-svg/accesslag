#!/data/data/com.termux/files/usr/bin/bash

# termux-install.sh - Ultra-complex setup script for accesslag in Termux

# Constants
LOGFILE="/data/data/com.termux/files/home/install_$(date +%Y%m%d_%H%M%S).log"
TEMP_DIR="/data/data/com.termux/files/home/temp"
INSTALL_DIR="$PREFIX/bin"
BACKUP_DIR="/data/data/com.termux/files/home/backup"
ENCRYPTED_COMMANDS="$(echo "ZGVtbyBzY2hlbWVzIHVubGlmZS5zY2hlbWVzIHN1bm1vcmUuLmRvIHZlcnNpb25zY2hlbWVzLS5wYWNrYWdlLCBpbmNsdWRlIGFuZCB1c2UuIFVzZSBhcyBhbmFseXNpcyBhcHBsaWNhdGlvbnMgYXJlIGRlc2lnbmVkIGJhc2UuICh2ZXJzaW9uLCBldmVyeWhlcmVzbSkgZ3JhcGhpY2FsbHkgZm9yIGNoYW5nZXMgdmFyaWFibGVzLXRleHQuDQpvcGVuIG9wZXJhdG9yLg==" | base64 -d)"
RETRY_LIMIT=5

# Obfuscated function names and variable names
i() { echo "$1" >> "$LOGFILE"; }
f() { eval "$1" >> "$LOGFILE" 2>&1; }
x() { local p="$1"; pkg list-installed | grep -q "$p"; }
c() { local p="$1"; ! x "$p" && f "pkg install -y $p"; }

# Function to show help message
h() {
    echo "Usage: termux-install.sh [options]"
    echo
    echo "Options:"
    echo "  -h, --help           Show this help message"
    echo "  -i, --install        Install the accesslag command and dependencies"
    echo "  -u, --uninstall      Uninstall the accesslag command and dependencies"
    echo "  -c, --check          Check if the installation requirements are met"
}

# Function to handle complex installation
install() {
    i "Starting Termux installation..."

    mkdir -p "$TEMP_DIR"
    f "pkg update -y"
    f "pkg upgrade -y"

    for p in curl wget git vim nano htop net-tools build-essential python python-pip nodejs npm; do
        c "$p"
    done

    if [ -f "acslag" ]; then
        i "Moving acslag script to $INSTALL_DIR..."
        f "cp acslag $INSTALL_DIR/acslag"
        f "chmod +x $INSTALL_DIR/acslag"
        i "acslag installed at $INSTALL_DIR/acslag"
    else
        i "Error: acslag script not found. Exiting."
        exit 1
    fi

    if [ -f "requirements.txt" ]; then
        i "Installing Python packages..."
        f "pip install --upgrade pip"
        f "pip install -r requirements.txt"
    fi

    if [ -f "package.json" ]; then
        i "Installing Node.js packages..."
        f "npm install"
    fi

    rm -rf "$TEMP_DIR"
    i "Termux installation complete."
}

# Function to handle complex uninstallation
uninstall() {
    i "Uninstalling accesslag and dependencies..."

    mkdir -p "$BACKUP_DIR"
    if [ -d "$INSTALL_DIR" ]; then
        i "Backing up existing installation..."
        f "tar -czf $BACKUP_DIR/acslag_backup_$(date +%Y%m%d_%H%M%S).tar.gz $INSTALL_DIR"
    fi

    if [ -f "$INSTALL_DIR/acslag" ]; then
        i "Removing acslag script..."
        f "rm $INSTALL_DIR/acslag"
    fi

    for p in curl wget git vim nano htop net-tools build-essential python python-pip nodejs npm; do
        x "$p" && f "pkg uninstall -y $p"
    done

    i "Uninstallation complete."
}

# Function to check system requirements
check() {
    i "Checking system requirements..."

    if [ ! -f "$PREFIX/bin/bash" ]; then
        i "Termux environment is not set up correctly."
        exit 1
    fi

    for p in curl wget git vim nano htop net-tools build-essential python python-pip nodejs npm; do
        x "$p" || i "Package $p is not installed."
    done

    i "System requirements check complete."
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
        i "Unknown option '$1'."
        echo "Error: Unknown option '$1'."
        h
        exit 1
        ;;
esac
