#!/bin/bash
# This Script is just for creating a new Cert for openVPN
if [ $1 ]
then

        if [ -e /etc/openvpn/easy-rsa2/keys/$1.key ]
        then
                echo "The Clientname $1 is already used"
        else
                cd /etc/openvpn/easy-rsa2
                source ./vars
                sudo -E ./build-key $1
                mkdir /etc/openvpn/easy-rsa2/keys/temp
                cp /etc/openvpn/easy-rsa2/keys/$1.crt /etc/openvpn/easy-rsa2/keys/temp/client.crt
                cp /etc/openvpn/easy-rsa2/keys/$1.key /etc/openvpn/easy-rsa2/keys/temp/client.key
                cp /etc/openvpn/easy-rsa2/keys/dh2048.pem /etc/openvpn/easy-rsa2/keys/ca.crt /etc/openvpn/client.conf /etc/openvpn/easy-rsa2/keys/temp/
                cd /etc/openvpn/easy-rsa2/keys/temp
                tar -czvf $1.tgz client.conf client.crt client.key ca.crt dh2048.pem
                echo "$1.tgz created"
                mv $1.tgz /etc/openvpn/
                rm -Rf /etc/openvpn/easy-rsa2/keys/temp
        fi
else
        echo "USAGE: ./genNewCert.sh CLIENTNAME"
fi
