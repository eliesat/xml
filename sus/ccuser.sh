#!/bin/bash

dir="/usr/lib/enigma2/python/Plugins/Extensions/ElieSatPanel/sus/cccam.txt"
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
cmdfile=found
sleep 1
else
echo "> cmd file not found"
sleep 1
exit 1 
fi

# determine cccam data
###########################################

label=$(more $dir | tail -n 1 |awk '{print $1}')
echo "> label= $label"
sleep 1
protocol=$(more $dir | tail -n 1 |awk '{print $2}')
echo "> protocol= $protocol"
sleep 1
url=$(more $dir | tail -n 1 |awk '{print $3}')
echo "> url= $url"
sleep 1
port=$(more $dir | tail -n 1 |awk '{print $4}')
echo "> port= $port"
sleep 1
username=$(more $dir | tail -n 1 |awk '{print $5}')
echo "> username= $username"
sleep 1
password=$(more $dir | tail -n 1 |awk '{print $6}')
echo "> password= $password"
sleep 1
echo
