#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Check if USER_LIST argument is provided
if [ $# -eq 0 ]; then
    echo "Error: USER_LIST argument is required."
    echo "Usage: $0 \"user1 user2 user3\""
    exit 1
fi

# Assign the first argument to USER_LIST
USER_LIST=$1

for user in $USER_LIST; do
    useradd --create-home --shell /bin/bash $user &&
        echo "$user:$user" | chpasswd &&
        user_home="/home/$user" &&
        mkdir -p "$user_home/.config/rstudio" &&
        cp /home/rstudio/.config/rstudio/rstudio-prefs.json "$user_home/.config/rstudio/" &&
        cp /home/rstudio/.Rprofile "$user_home/" &&
        chown -R $user:$user "$user_home"
done
