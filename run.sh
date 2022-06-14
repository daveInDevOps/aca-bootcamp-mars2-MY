#!/bin/bash

if [[ $USER != root ]] 
then    
        echo "Permission denied: run script as root"
else
	./nginx-install.sh
	./nginx-change-config.sh
	./system-info.sh &
fi
