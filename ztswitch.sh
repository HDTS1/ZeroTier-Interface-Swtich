# Interface variable

INTFACE=$(ip addr | grep "zt")

# Color  Variables
green='\e[32m'
blue='\e[34m'
clear='\e[0m'
ColorGreen(){
        echo -ne $green$1$clear
}
ColorBlue(){
        echo -ne $blue$1$clear
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

menu(){
echo -ne "
My First Menu
$(ColorGreen '1)') Turn ON
$(ColorGreen '2)') Turn OFF
$(ColorGreen '3)') Status
$(ColorGreen '0)') Exit
$(ColorBlue 'Choose an option:') "
        read a
        case $a in
                1) ON ; menu ;;
                2) OFF ; menu ;;
                3) STATUS ; menu ;;
                0) exit 0 ;;
                *) echo -e $red"Wrong option."$clear; WrongCommand;;
        esac
}

# Call the menu function
menu
