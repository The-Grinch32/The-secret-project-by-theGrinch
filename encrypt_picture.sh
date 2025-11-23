#!/bin/bash

# Input file name (the image to encrypt)
INPUT_FILE="flag.jpg"
# Output file name (the encrypted image)
OUTPUT_FILE="flag.enc"

# The password will be the first argument passed to the script ($1)
PASSWORD="$1"

# Check if the input image exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: The input file '$INPUT_FILE' does not exist."
    echo "Make sure 'flag.jpg' is in the same directory as this script."
    exit 1
fi

# Check if the password was provided as an argument
if [ -z "$PASSWORD" ]; then
    echo "Error: The encryption password was not provided."
    echo "Usage: $0 [SECRET_PASSWORD]"
    exit 1
fi

echo "Encrypting '$INPUT_FILE' to '$OUTPUT_FILE' with the provided password..."

# OpenSSL command for encryption, using the $PASSWORD variable
openssl enc -aes-256-cbc -salt -in "$INPUT_FILE" -out "$OUTPUT_FILE" -pass pass:"$PASSWORD"

# Check if the encryption was successful
if [ $? -eq 0 ]; then
    echo "Encryption successful! The encrypted file is: $OUTPUT_FILE"
    echo "To decrypt, the student will need to use the following command (after finding the password):"
    echo "openssl enc -aes-256-cbc -d -salt -in $OUTPUT_FILE -out decrypted_flag.jpg -pass pass:[SECRET_PASSWORD]"
else
    echo "Error: Encryption failed."
fi

exit 0
