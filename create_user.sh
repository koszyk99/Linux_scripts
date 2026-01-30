#!/bin/bash

# checking if the script is run as root
if [ "$EUID" -ne 0 ]; then                      # root UID = 0, if UID doesn't equal 0 then exit
    echo "Run as a root."
    exit 1
fi

# create user login
read -p "Add login for new user: " newuser

if [ -z "$newuser" ]; then              # checks whether a login was has been provided, -z means "whether variable is empty"
    echo "You didn't provide login."
    exit 1                                      # end script if something gone wrong
fi

# whether a user with the given name already exists
if id "$newuser" &>/dev/null; then
    echo "This user already exist!"
    exit 1
fi

# confirm user name
echo "Your login is: $newuser"

# create user password
read -s -p "Add password for ${newuser}: " password
echo

if [ -z "$password" ]; then                             # check whether variable isn't empty
    echo "You didn't provide password."
    exit 1
fi

# check password for validity
max_attempt=3
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

if [ "$attempt" -gt "$max_attempt" ]; then
    echo "Too many failed attemp."
    exit 1
fi

echo "Input validated successfully."
