#!/usr/bin/env bash

echo "########################################"
echo "#       Stoffel dotfiles setup         #"
echo "########################################"

echo "---------------------------"
echo "-     Determining OS      -"
echo "---------------------------"

if [[ -f /etc/redhat-release ]]; then
    OS=CentOS
elif [[ -f /etc/debian_version ]]; then
    OS=Debian
fi

echo "OS is ${OS}"
echo "Exporting OS variable for all scripts"

export OS

echo "-----------------------------------"
echo "-    Finding install.sh files     -"
echo "-----------------------------------"

for Directory in *; do
    if [[ -d ${Directory} ]]; then
        for file in $(ls ${Directory}); do
            if [[ ${file} == "install.sh" ]]; then
                echo "Found ${Directory}/${file}"
                echo "Executing ${Directory}/${file}"
                bash ${Directory}/${file}
                echo "--------------------------------"
                echo "-  Executed ${Directory}/${file}  -"
                echo "--------------------------------"
            fi
        done
    fi
done
