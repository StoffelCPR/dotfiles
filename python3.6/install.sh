#!/usr/bin/env bash

echo "########################################"
echo "#       Stoffel python3.6 setup        #"
echo "########################################"

filepath=$( cd "$(dirname "$0")" ; pwd )

if [[ ${OS} == Debian ]]; then
    sudo apt-get update
    sudo apt-get -y install python3.6
    sudo apt-get -y install python3-pip

elif [[ ${OS} == CentOS ]]; then
    echo "Not Implemented yet"
else
    echo "Python installation failed.. Couldn't figure out what system you use"
fi
