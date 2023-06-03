#!/bin/bash

echo "Enter the Subnet"
read SUBNET
for IP in $(seq 1-254); do
    ping -c 1 $SUBNET.$IP
fi
0
