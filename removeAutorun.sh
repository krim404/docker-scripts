#!/bin/bash
if [ $1 ]
	then
		if [ -e /etc/systemd/system/docker-container@$1.service ] 
		then
		
				echo "Stopping container using systemctl"
				systemctl stop docker-container@$1
				echo "Removing Container from systemctl"
				systemctl disable docker-container@$1
				rm /etc/systemd/system/docker-container@$1.service
				systemctl daemon-reload
				systemctl reset-failed
				echo "removed $1"	
		else	
			echo "Container $1 service not found"
		fi
	else
		echo "USAGE: ./removeAutorun.sh CONTAINER"
fi
