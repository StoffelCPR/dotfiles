#!/usr/bin/env bash

echo "########################################"
echo "#       Stoffel python3.6 setup        #"
echo "########################################"

if [[ ${OS} == Debian ]]; then
    echo "Using sudo to update and install git with apt-get. Please enter password"
    sudo apt-get update
    sudo apt-get install python3.6
    sudo apt-get install python3-pip
elif [[ ${OS} == CentOS ]]; then
    echo "Not Implemented yet"
else
    echo "Python installation failed.. Couldn't figure out what system you use"
fi
