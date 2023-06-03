#!/bin/bash

#SSH CONFIGURATION CHANGES
#Backup the sshd config file:
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

#Set "Port Number" and "AddressFamily"
sudo sed -i 's/^#Port.*/Port 1103/' /etc/ssh/sshd_config
sudo sed -i 's/^#AddressFamily.*/AddressFamily inet/' /etc/ssh/sshd_config

#Set the value of the "PermitRootLogin" option to "no"
sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config

#Set the value of the "PasswordAuthentication" option to "no"
sudo sed -i 's/^#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
