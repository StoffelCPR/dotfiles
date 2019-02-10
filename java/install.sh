#!/usr/bin/env bash

echo "########################################"
echo "#          Stoffel java setup          #"
echo "########################################"

filepath=$( cd "$(dirname "$0")" ; pwd )

if [[ ${OS} == Debian ]]; then
    echo "RETRIEVE JAVA FOLDERS CP THEM AND EXPORT PATHs"
elif [[ ${OS} == CentOS ]]; then
    echo "RETRIEVE JAVA FOLDERS CP THEM AND EXPORT PATHs"
else
    echo "java installation failed.. Couldn't figure out what system you use"
fi
