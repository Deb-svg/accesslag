#!/bin/bash

# phishing.sh - Phishing setup script

# Function to start a phishing server
start_phishing() {
    echo "Starting phishing server on $1..."
    echo "Make sure you have installed ngrok and have an account."
    echo "Starting ngrok..."
    ngrok http "$1"
}

# Check if the port number is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <port>"
    exit 1
fi

PORT=$1

start_phishing "$PORT"
