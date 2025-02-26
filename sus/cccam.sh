#!/bin/bash

# Check for mounted storage
###########################################
dir="/usr/lib/enigma2/python/Plugins/Extensions/ElieSatPanel/sus/iptv.txt"
if [ ! -s "$dir" ]; then
echo "> url= None"
echo "> port= None"
echo "> username= None"
echo "> username= None"
sleep 2
echo "Write and save a new iptv user , then try again ..." 
sleep 1
exit 1 
fi

# Check for cmd cccam file
###########################################
if [ -f $dir ]; then 
echo "> cmd file found"
sleep 1
else
echo "> cmd file not found"
sleep 1
exit 1 
fi

# determine cccam line data
###########################################

label=$(grep 'label' $dir | cut -d= -f2)
url=$(grep 'url' $dir | cut -d= -f2)
port=$(grep 'port' $dir | cut -d= -f2)
username=$(grep 'username' $dir | cut -d= -f2)
password=$(grep 'password' $dir | cut -d= -f2)

# write cccam line data in emus
###########################################

for cam_config_file in oscam ncam
do

if ! grep -q $username /etc/tuxbox/config/$cam_config_file.server >/dev/null 2>&1; then

   if [ ! -f /etc/tuxbox/config/$cam_config_file.server ]; then
   echo "> $cam_config_file emu not found"
   sleep 3
   else
   echo "> $cam_config_file emu found"
   sleep 3
cat <<EOF >> /etc/tuxbox/config/$cam_config_file.server
   
[reader]
label                         = $label
protocol                      = cccam
device                        = $url,$port
user                          = $username
password                      = $password
inactivitytimeout             = 30
group                         = 1
disablecrccws                 = 1
cccversion                    = 2.0.11
cccwantemu                    = 1
ccckeepalive                  = 1
audisabled                    = 1

EOF

   echo "> cccam server installed in $cam_config_file successfully"
sleep 3
   fi

else
echo "> cccam server already exist in $cam_config_file"
sleep 3
fi
done

