#!/bin/bash
# file should be linked to /etc/init.d/dcontainer for the old unix look and feel to start/stop a script
if [ $1 ] && [ $2 ]
then
	if [ -e /etc/systemd/system/docker-container@$1.service ]
	then
		echo "Executing $2 on Container $1"
		service docker-container@$1 $2
	else
		echo "Container $1 not registered in systemd"
	fi
else
	echo "USAGE: dcontainer CONTAINER start/stop/restart/statu/status"
fi
