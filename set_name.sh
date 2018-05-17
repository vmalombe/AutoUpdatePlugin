#!/bin/bash

# Get user input for the directory
DIR=$(whiptail --title "SET PATH TO UPDATE PLUGIN" --inputbox "Absolute path of directory with plugin scripts" 10 60 /home/pi/AutoUpdatePlugin 3>&1 1>&2 2>&3)
exitstatus=$? # 0 - User enters value and selects ok, 1 or other - User cancels input
 
if [ $exitstatus = 0 ]; then
    sed -i '2i\mypath='\"$DIR\" set_frequency.sh # Write out the path to set_frequency.sh script
else
    echo "You chose Cancel."
fi
