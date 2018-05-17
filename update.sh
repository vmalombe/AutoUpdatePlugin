#!/bin/sh
echo ------------------------------------
echo $(date)

#Go into the software directory
cd /home/pi/AutoUpdatePlugin/*/

#Then fetch and merge remote git to clone
echo "----------------------------------------------" >> /home/pi/logs/update 2>&1 
echo $(date) >> /home/pi/logs/update 2>&1
git pull https://github.com/vmalombe/LED_Dim.git  >> /home/pi/logs/update 2>&1

#Kill the old process
kill $(pgrep python)

#And then run it afresh
python /home/pi/AutoUpdatePlugin/*/*.py # > /home/pi/logs/update 2>&1
#End
