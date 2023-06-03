#!/bin/bash
#Securing RHEL by way of automation script
#Auther: Gary Harris Date: Apr. 12 2023 
#Script Repository https://
#Ensure you add permissions to this script "700"

#Update System
yum update -y
sudo yum install dnf-automatic
    #sed edit dnf-automatic config.

#Change root password
read -rs 'Enter new root password:' new_password
echo "root:$new_password" | sudo chpasswd

#######################################################


#Creating a new User
echo "Enter the username for the new user:"
read -r username
sudo useradd -m "$username"

#Enter the passwd for the user
echo "Enter the password for the new user:"
read -rs password
echo "$username:$password" | sudo chpasswd
echo "User $username created successfully."

#Verifying the user and password "whoami"
echo "Verifying the user and password..."
sudo su - "$username" -c "whoami"

#Add user to visudoer 
sudo usermod -aG sudo "$username" 

########################################################
########################################################

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



exit 0