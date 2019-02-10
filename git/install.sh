#!/usr/bin/env bash

echo "########################################"
echo "#          Stoffel git setup           #"
echo "########################################"

filepath=$( cd "$(dirname "$0")" ; pwd )

if [[ ${OS} == Debian ]]; then
    echo "Using sudo to update and install git with apt-get. Please enter password"
    sudo apt-get update
    sudo apt-get install git
elif [[ ${OS} == CentOS ]]; then
    yum install -y git
else
    echo "Git installation failed.. Couldn't figure out what system you use"
fi
