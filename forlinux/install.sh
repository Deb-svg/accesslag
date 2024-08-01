#!/bin/bash

# install.sh - Setup script for accesslag

# Function to display help message
show_help() {
    echo "Usage: install.sh [options]"
    echo
    echo "Options:"
    echo "  -h, --help       Show this help message"
    echo "  -i, --install    Install the accesslag command and dependencies"
}

# Function to install dependencies and move acslag
install_accesslag() {
    echo "Starting installation..."

    # Install required dependencies
    echo "Installing dependencies..."
    sudo apt-get update
    sudo apt-get install -y \
        curl \
        wget \
        git \
        vim \
        nano \
        htop \
        net-tools \
        build-essential \
        python3-pip \
        python3-venv \
        npm \
        software-properties-common

    # Check if the acslag file exists in the current directory
    if [ -f "acslag.sh" ]; then
        # Move the acslag script to /usr/local/bin
        sudo mv acslag.sh /usr/local/bin/acslag.sh
        sudo chmod +x /usr/local/bin/acslag.sh
    else
        echo "Error!"
        exit 1
    fi

    # Install Python packages if requirements.txt is present
    if [ -f "requirements.txt" ]; then
        echo "Installing Python packages..."
        python3 -m pip install --upgrade pip
        pip install -r requirements.txt
    fi

    # Install Node.js packages if package.json is present
    if [ -f "package.json" ]; then
        echo "Installing Node.js packages..."
        npm install
    fi

    echo "Installation complete."
}

# Main script logic
case "$1" in
    -h|--help)
        show_help
        ;;
    -i|--install)
        install_accesslag
        ;;
    *)
        echo "Error: Unknown option '$1'."
        show_help
        exit 1
        ;;
esac
