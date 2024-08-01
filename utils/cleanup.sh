#!/bin/bash

# cleanup.sh - System cleanup script

# Function to clean up the system
cleanup_system() {
    echo "Cleaning up system..."
    sudo apt-get autoremove -y
    sudo apt-get autoclean
    echo "System cleanup complete."
}

cleanup_system
