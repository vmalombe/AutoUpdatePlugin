#!/bin/bash

# Get user input (Remote repo url)
URL=$(whiptail --title "SET YOUR REMOTE REPO GIT URL" --inputbox "Enter Git URL to the git remote repository from which updates will be fetched from" 10 60 https://github.com/vmalombe/LED_Dim.git 3>&1 1>&2 2>&3)

# Extract the domain name from URL and initialise domain variable with it
domain=$(echo $URL | awk -F/ '{print $3}')

exitstatus=$?
if [ $exitstatus = 0 ]; then

	openssl s_client -connect $domain:443 -tls1_2 > /home/pi/logs/conStat 2>&1 # Check if domain supports TLS 1.2	
	exitstatus=$?
	if [ $exitstatus = 0 ]; then
		echo "Secure: The remote server ($domain) supports TLS 1.2"
		git clone $URL
	else
		echo "Insecure: The remote server ($domain) DOES NOT support TLS 1.2"
	fi
    	
else
    	echo "You chose Cancel."
fi
