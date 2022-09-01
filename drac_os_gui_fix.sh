#!/bin/bash

# This script is used for the DracOS operating system to be able to fix that holes that are present in otder to
# gain a graphical user interface.  Please keep in mind that this is a temporary fix before any major fixes are 
# made.
#
# This script was made for DracOS-3.1.5-amd64-Beta version.

# Run this script after installing the operating system.  You will need to make sure that your user is in the sudo
# group using the command as root "usermod -aG sudo [username].  This will allow your user to run this script as
# root.

# Make sure the script is being run wuth superuser privileges
if [[ "${UID}" -ne 0 ]]

then
	echo "This script must be run as a superuser.  Try running as root?"
	exit 66
fi



# Fix missing key issue
read -p 'Enter the key value shown in error: ' KEY_VALUE


# Download and install key
apt key adv --keyserver keyserver.ubuntu.com --recv-keys ${KEY_VALUE}

# Check to make sure command works
if [[ "${?}" -ne 0 ]]

then
	echo "The command did not execute properly."
	exit 66
fi



# Update/upgrade the system
apt update && apt upgrade -y

# Reboot the system
reboot
