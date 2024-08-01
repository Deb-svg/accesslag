#!/data/data/com.termux/files/usr/bin/bash

# termux-acslag.sh - Command management for accesslag in Termux

# Function to display help message
show_help() {
    echo "Usage: termux-acslag.sh <command> [options]"
    echo
    echo "Commands:"
    echo "  install         Install required dependencies and tools"
    echo "  run <script>    Execute a specific script from 'utils/' or 'tools/'"
    echo "  update          Update all tools and dependencies"
    echo "  cleanup         Clean up temporary files and directories"
    echo "  -h, --help      Show this help message"
}

# Function to install required dependencies and tools
install_dependencies() {
    echo "Installing dependencies..."

    pkg update
    pkg install -y \
        curl \
        wget \
        git \
        vim \
        nano \
        htop \
        net-tools \
        build-essential \
        python \
        python-pip \
        nodejs \
        npm

    echo "Dependencies installed."
}

# Function to execute a specific script from 'utils/' or 'tools/'
run_script() {
    if [ -z "$1" ]; then
        echo "Error: Script name required."
        show_help
        exit 1
    fi
    local script_name=$1
    local script_path

    if [[ -f "utils/${script_name}.sh" ]]; then
        script_path="utils/${script_name}.sh"
    elif [[ -f "tools/${script_name}.sh" ]]; then
        script_path="tools/${script_name}.sh"
    else
        echo "Error: Script '$script_name' not found in 'utils/' or 'tools/'."
        exit 1
    fi

    echo "Executing script '$script_name'..."
    bash "$script_path"
}

# Function to update all tools and dependencies
update_tools() {
    echo "Updating tools and dependencies..."

    # Example: Update commands and scripts
    git pull origin main

    # Update Python packages
    pip install --upgrade pip
    pip install -r requirements.txt

    # Update Node.js packages
    npm install

    echo "Tools and dependencies updated."
}

# Function to clean up temporary files and directories
cleanup() {
    echo "Cleaning up temporary files and directories..."

    # Example: Remove temporary files
    rm -rf temp/*

    echo "Cleanup complete."
}

# Main script logic
case "$1" in
    install)
        install_dependencies
        ;;
    run)
        run_script "$2"
        ;;
    update)
        update_tools
        ;;
    cleanup)
        cleanup
        ;;
    -h|--help)
        show_help
        ;;
    *)
        echo "Error: Unknown command '$1'."
        show_help
        exit 1
        ;;
esac
