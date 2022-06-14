#!/bin/bash
#Author: David Vardanyan

webserver_path=$(cat /etc/nginx/sites-available/default | grep "root" | tr -s " " | cut -d " " -f 3 | cut -d ";" -f 1)

while true
do

#Getting the CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
	   awk '{print 100 - $1"%"}')

#Getting the Ram usage    
mem_usage=$(free -m | grep -i mem | tr -s " " | cut -d " " -f 3)

#Getting the disk usage of root directory
disk_usage=$(df -h | tr -s " " | cut -d " " -f 5 | head -4 | tail -1)

echo "CPU usage: $cpu_usage   ||   RAM usage: $mem_usage   ||   Disk usage: $disk_usage" > $webserver_path/index.html

sleep 10

done 
