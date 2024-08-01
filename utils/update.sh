#!/bin/bash

# update.sh - System update script

# Function to update the system
update_system() {
    echo "Updating system packages..."
    sudo apt-get update && sudo apt-get upgrade -y
    echo "System update complete."
}

update_system
