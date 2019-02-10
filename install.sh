#!/usr/bin/env bash

echo "########################################"
echo "#       Stoffel dotfiles setup         #"
echo "########################################"

echo "---------------------------"
echo "-     Determining OS      -"
echo "---------------------------"

echo ${OS}

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
                echo "-----------------------------------"
                echo "-   Found ${Directory}/${file}    -"
                echo "-----------------------------------"
                read -r -p "Installing ${Directory} with sudo privileges are you sure you want to continue? [Y/n] " input

                case ${input} in
                    [yY][eE][sS]|[yY])
                        echo "-----------------------------------"
                        echo "- Executing ${Directory}/${file}  -"
                        echo "-----------------------------------"
                        bash ${Directory}/${file}
                    ;;
                    [nN][oO]|[nN])
                        exit 1
                    ;;
                    *)
                        echo "-----------------------------------"
                        echo "- Executing ${Directory}/${file}  -"
                        echo "-----------------------------------"
                        bash ${Directory}/${file}
                    ;;
                    esac

                echo "-----------------------------------"
                echo "-  Executed ${Directory}/${file}  -"
                echo "-----------------------------------"
            fi
        done
    fi
done
