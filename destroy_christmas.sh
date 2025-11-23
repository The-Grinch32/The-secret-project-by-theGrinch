#!/bin/bash

# Christmas Destruction Script - DO NOT RUN WITHOUT AUTHORIZATION!

# --- Environment Check ---

if [[ $(whoami) != "root" ]]; then
    echo "ERROR: Unauthorized access. This script must be launched by the 'root' user from the administration console."
    exit 1
fi

echo "--- Starting the North Pole Emergency Shutdown Sequence ---"
echo "Preparing to delete all toy list files..."
sleep 2

# Simulation of deletion and malicious action
rm -rf /tmp/test_list_toys.log > /dev/null 2>&1
echo "Deleting test logs... OK"

# --- The Important Fictive File (The Hint or the Flag) ---
# This code contains a Base64 or ROT13 message which is the flag.
SECRET_MESSAGE="Q1RGe05vZWxfTmV2ZXJfRGlzYnVhcnRzX09TfQ=="

echo ""
echo "!!! CONFIDENTIAL ACCESS TO CENTRAL SYSTEM !!!"
echo "The destruction message is as follows, it must be decoded:"
echo $SECRET_MESSAGE
echo ""
echo "Shutdown sequence complete. Production files untouched. MERRY CHRISTMAS."

# The Base64 encoded flag is: CTF{Noel_Never_Disburts_OS}
