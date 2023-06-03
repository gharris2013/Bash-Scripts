#!/bin/bash

#Simple Password Generator

echo "This is a simple Password Generator"
echo "Please enter the length of characters of Password:"
read -r PASS_LENGTH

if P in $(seq 1); then
    openssl rand -base64 48 | cut -c1 "$PASS_LENGTH"
fi
0