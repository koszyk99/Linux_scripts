#!/bin/bash

# colors
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
RESET_COLOR="\[\e[0m\]"

# pause function
pause(){
    read -p "Press ENTER to continue..."
}

show_menu (){
    clear
    echo -e "${BLUE}$(date)${RESET_COLOR}"
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

system_info(){
    echo -e "${YELLOW}System:$RESET_COLOR"
    uname -a
}

host_name(){
    echo -e "${YELLOW}Host name:$RESET_COLOR"
    hostname
}

disk_usage(){
    echo -e "${YELLOW}Disk usage:${RESET_COLOR}"
}



