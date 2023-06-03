#!/bin/bash

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