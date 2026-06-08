#!/bin/bash

read -p "Enter service name : " service_name
read -p "Do you want to check the status : (y/n) " answer

if [ "$answer" = "y" ]; then
	status=$(systemctl is-active "$service_name")

	if [ "$status" = "active" ]; then
	    sudo systemctl status "$service_name"
	    echo "$service_name is Active....!!"
	else
	   echo "$service_name is not Active...!!"
        fi
else
	echo "Skipped"
fi

