#!/bin/bash

ip=$1
if [ "$ip" ]; then
echo "ip: $ip"
ports=$(nmap -p- --min-rate=1000 -T4 $ip | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)

if [ "$ports" ];then
echo "open ports : $ports"
echo "=============================================================="
nmap -p$ports -sC -sV -oN nmap.txt $ip 
else
echo "No open ports found."
fi
else
echo "Usage: ./scan.sh <ip-address>"
fi


