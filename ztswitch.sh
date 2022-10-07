#!/usr/bin/env bash
# Interface variable

INTFACE=$(ip addr | grep "zt")

# Color  Variables
RESET='\033[0m'
YELLOW='\033[1;33m'
CYAN='\e[36m'
GRAY='\033[0;37m'
WHITE='\033[1;37m'
GRAY_R='\033[39m'
WHITE_R='\033[39m'
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\e[34m'
BOLD='\e[1m'
BLINK='\033[5m'

LOADER() {
echo -e "${GREEN}*******************************************************************${RESET}"
echo -e "${GREEN}&                     ZEROTIER INTERFACE SWITCH                   &${RESET}"
echo -e "${GREEN}*******************************************************************${RESET}"
echo -e "${YELLOW} Manage ZeroTier interface: ${RESET} ${BOLD}"
echo
}

# Functions
ON() {
    echo ""
        echo "Bringing zt interface up.. "
        echo
        sleep 1 &
         PID=$!
         i=1
         sp="/-\|"
         echo -n ' '
         while [ -d /proc/$PID ]
         do
           printf "\b${sp:i++%${#sp}:1}"
         done
        echo
        ip link set dev $INTFACE up
        echo "All done. INTFACE is up. "
}

OFF() {
    echo ""
        echo "Bringing zt interface down.. "
        echo
        sleep 1 &
         PID=$!
         i=1
         sp="/-\|"
         echo -n ' '
         while [ -d /proc/$PID ]
         do
           printf "\b${sp:i++%${#sp}:1}"
         done
        echo
        ip link set dev $INTFACE up
        echo "All done. INTFACE is down. "
}

STATUS() {
    echo ""
        echo "Checking $INTFACE status.. "
        echo
        ip link show $INTFACE
}

SELECTION(){
LOADER
PORT_NO=""
PS3='Select: '
options=("ON" "OFF" "STATUS" "EXIT")
select opt in "${options[@]}"
do
    case $opt in
        "ON")
            echo && echo -e "${YELLOW}Bringing interface $INTFACE up${RESET}" ; sleep 1 ; exit 0 ;;
        "OFF")
            echo && echo -e "${YELLOW}Bringing interface $INTFACE down${RESET}" ; sleep 1 ; exit 0 ;;
        "STATUS")
            echo && echo -e "${YELLOW}Getting status of interface $INTFACE ${RESET}" ; sleep 1 ; exit 0 ;;
        "EXIT")
            clear ; break
            ;;
        *) echo "invalid option $REPLY"
                echo $PORT_NO ;;
    esac
done
}

SELECTION
