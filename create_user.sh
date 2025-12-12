#!/bin/bash

# create user login
read -p "Add login for new user: " newuser

# check whether variable isn't empty
if [ -n "$newuser" ]; then
    echo "Your login is: ${newuser}."
else
    echo "You didn't provide login."
    exit 1
fi

# create user password
read -s -p "Add password for ${newuser}: " password

# check whether variable isn't empty
if [ -n "$password" ]; then
    echo "Your password is: ${password}"
else
    echo "You didn't provide password."
    exit 1
fi
