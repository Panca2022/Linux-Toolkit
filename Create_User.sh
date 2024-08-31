#!/bin/bash 

#Checking the user is running in the root
if [[ $EUID -ne 0 ]]; then 
	echo "This should runs with root access user"
	exit 1
fi

#Adding user
read -p "Enter the User that going to be add newly:" username
useradd -m $username 

passwd $username

#Adding the user to group
read -p "Enter the group name where the new user should be added:" group
if [ -n "$group" ]; then 
	usermod -aG $group $username
fi

echo "User $username has been created successfully"
