#!/bin/sh

echo "Type in your username [michael]:"
read thename
thename=${thename:-michael}

echo "Add as new user"
adduser $thename

echo "Add user to sudo group..."
usermod -aG sudo $thename

echo "Show UFW App Profiles..."
ufw app list 

echo "Allow SSH Connections in Firewall..."
ufw allow OpenSSH

echo "Activate Firewall..."
ufw enable

echo "Show Firewall status..."
ufw status
