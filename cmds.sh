#!/bin/bash

# cmds.sh - Command installation and management script

# Function to handle various commands
commands_install() {
    # Function to display help message
    show_help() {
        echo "Usage: $0 <command> [options]"
        echo
        echo "Commands:"
        echo "  install         Install specified commands"
        echo "  util <name>     Execute a utility script from 'utils/'"
        echo "  tool <name>     Execute a tool script from 'tools/'"
        echo
        echo "Flags:"
        echo "  -h, --help      Show this help message"
    }

    case "$1" in
        install)
            echo "Installing commands..."

            # Update package list
            sudo apt-get update

            # Install the commands
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

            echo "Command installation complete."
            ;;
        util)
            if [ -z "$2" ]; then
                echo "Error: Utility name required."
                show_help
                exit 1
            fi
            local util_name=$2
            local util_path="utils/${util_name}.sh"
            
            if [[ -f "$util_path" ]]; then
                echo "Executing utility script '$util_name'..."
                bash "$util_path"
            else
                echo "Utility script '$util_name' not found in 'utils/'."
                exit 1
            fi
            ;;
        tool)
            if [ -z "$2" ]; then
                echo "Error: Tool name required."
                show_help
                exit 1
            fi
            local tool_name=$2
            local tool_path="tools/${tool_name}.sh"
            
            if [[ -f "$tool_path" ]]; then
                echo "Executing tool script '$tool_name'..."
                bash "$tool_path"
            else
                echo "Tool script '$tool_name' not found in 'tools/'."
                exit 1
            fi
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
}

# Check if a command is provided
if [ -z "$1" ]; then
    echo "Error: No command provided."
    commands_install help
    exit 1
fi

# Call the commands_install function with the provided arguments
commands_install "$@"
