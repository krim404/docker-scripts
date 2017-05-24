#!/bin/bash
if [ $1 ]
	then
		if docker ps | grep -qw $1;
		then		
			echo "Stopping Container"
			docker stop $1
			echo "Setting Container $1 to run on bootup using systemctl"
			cp ./docker-container.service /etc/systemd/system/docker-container@$1.service
			systemctl daemon-reload
			echo "Starting container using systemctl"
			systemctl start docker-container@$1
			systemctl enable docker-container@$1
		else
			echo "Container $1 not running / found"
		fi
	else
		echo "USAGE: ./makeAutorun.sh CONTAINER"
fi
