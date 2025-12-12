#!/bin/bash


# create user login
read -p "Add login for new user: " newuser
    if [ -n "$newuser" ]; then # checks whether a login was has been provided
        if id "$newuser" &>/dev/null; then # check if the user already exist
            echo "User exist!"
        exit 1
    fi
        echo "Your login is: ${newuser}."
    else
        echo "You didn't provide login."
        exit 1
    fi

# create user password
read -s -p "Add password for ${newuser}: " password
    if [ -n "$password" ]; then  # check whether variable isn't empty
        echo "Your password is: ${password}"
    else
        echo "You didn't provide password."
        exit 1
    fi

# check password for validity
max_attempt=2
attempt=1

while [ $attempt -le $max_attempt ]; do

    read -s -p "Confirm your password: " password2
    echo

    if [ "$password" = "$password2" ]; then
        echo "Password confirmed."
        break
    else
        echo "Invalid password. Attempt $attempt of $max_attempt."
    fi

    attempt=$(( attempt + 1 ))

done


