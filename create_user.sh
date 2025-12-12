#!/bin/bash


# create user login and checks whether a login was has been provided
read -p "Add login for new user: " newuser
    if [ -n "$newuser" ]; then
        if id "$newuser" &>/dev/null; then # check if the user already exist
            echo "User exist!"
        exit 1
    else
         echo "User does not exist."
    fi
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
