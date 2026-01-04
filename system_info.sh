#!/bin/bash

# Script name : system_info.sh
# Description : Interactive Bash menu for displaying basic Linux system information
#              such as system details, hostname, disk usage, memory, network
#              , configuration and system uptime.
#
# Author      : Krzysztof Koszyk
# Created     : 04.01.2026
# Usage       : ./system_info.sh
#

# Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET_COLOR="\e[0m"

# Pause function that execution until user presses ENTER
pause(){
    read -p "Press ENTER to continue..."
}

# Display main menu with available system information option
show_menu(){
    clear                                                   # Clear terminal screen
    echo -e "${BLUE}$(date)${RESET_COLOR}"                  # Display current date
    echo "==============================="
    echo -e "${GREEN}1.${RESET_COLOR} System info"
    echo -e "${GREEN}2.${RESET_COLOR} Host name"
    echo -e "${GREEN}3.${RESET_COLOR} Disk usage"
    echo -e "${GREEN}4.${RESET_COLOR} RAM"
    echo -e "${GREEN}5.${RESET_COLOR} Network"
    echo -e "${GREEN}6.${RESET_COLOR} System operation time"
    echo -e "${GREEN}7.${RESET_COLOR} Exit"
    echo "==============================="
}

# Display detailed system information (kernel, architecture, OS)
system_info(){
    echo -e "${YELLOW}System:$RESET_COLOR"
    uname -a
}

host_name(){
    echo -e "${YELLOW}Host name:$RESET_COLOR"
    hostname
}

# Display disk usage for root filesystem
disk_usage(){
    echo -e "${YELLOW}Disk usage:${RESET_COLOR}"
    df -h /
}

# Display memory usage (RAM and swap) in megabytes
ram(){
    echo -e "${YELLOW}RAM information:${RESET_COLOR}"
    free -m
}

# Display IP addresses
network(){
    echo -e "${YELLOW}Network:${RESET_COLOR}"
    ip -brief addr
}

system_operation_time(){
    echo -e "${YELLOW}System operation time:${RESET_COLOR}"
    uptime
}

exit_program(){
    echo -e "${YELLOW}Exit${RESET_COLOR}"
    exit 0
}

# Main program loop
# Continuously display menu and execute selected option
while true; do
    show_menu

    # Read user input
    read -p "Select your choice [ 1 - 7 ]: " choice

    case "$choice" in
        1) system_info ;;
        2) host_name ;;
        3) disk_usage ;;
        4) ram ;;
        5) network ;;
        6) system_operation_time ;;
        7) exit_program ;;
        *) echo -e "${RED}Wrong choice! Select numbers from 1 to 7${RESET_COLOR}" ;;
    esac

    pause
done


