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

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

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
                read -r -p "Installing ${Directory} with sudo privileges are you sure you want to continue? [Y/n]" input

                case ${input} in
                    [yY][eE][sS]|[yY])
                        echo -e "${GREEN}-----------------------------------"
                        echo -e "- Executing ${Directory}/${file}  -"
                        echo -e "-----------------------------------${NOCOLOR}"
                        bash ${Directory}/${file}
                    ;;
                    [nN][oO]|[nN])
                        echo -e "${RED}Not installing ${Directory}${NOCOLOR}"
                        continue
                    ;;
                    *)
                        echo "${GREEN}-----------------------------------"
                        echo "- Executing ${Directory}/${file}  -"
                        echo "-----------------------------------${NOCOLOR}"
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
