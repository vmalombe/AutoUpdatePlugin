#!/bin/bash
mypath="/home/pi/AutoUpdatePlugin"
mypath="/home/pi/AutoUpdatePlugin"
mypath="/home/pi/AutoUpdatePlugin"
mypath="/home/pi/AutoUpdatePlugin"
mypath="/home/pi/AutoUpdatePlugin"
mypath="/home/pi/AutoUpdatePlugin"

# Define and Initialise crontab variables
command="/bin/sh $mypath/update.sh >> /home/pi/logs/cronlog 2>&1" # Command to be run by cron daemon
job="00 09-17 * * * $command" # crontab entry

# Allow user to select time frequency
OPTION=$(whiptail --title "SET FREQUENCY OF UPDATES" --menu "Choose your option" 15 60 5 \
"1" "Every minute" \
"2" "Every hour" \
"3" "Once a day" \
"4" "Once a week" \
"5" "Once a month"  3>&1 1>&2 2>&3)
 
if [[ $OPTION = 1 ]] ; then
	job="* * * * * $command"
elif [[ $OPTION = 2 ]] ; then
	job="01 * * * * $command"
elif [[ $OPTION = 3 ]] ; then
	job="02 4 * * * $command"
elif [[ $OPTION = 4 ]] ; then
	job="22 4 * * 0 $command"
elif [[ $OPTION = 5 ]] ; then
	job="42 4 4 * * $command"
else
    echo "Select a valid time frequency"
fi

# Set the crontab to the system
cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -
