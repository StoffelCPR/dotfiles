#!/usr/bin/env bash

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
UNDERLINED="\e[4m"
NORMAL="\e[0m"
NOCOLOR="\033[0m"

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
                echo -e "${GREEN}-----------------------------------"
                echo -e "-   Found ${UNDERLINED}${Directory}/${file}${NORMAL}    -"
                echo -e "-----------------------------------${NOCOLOR}"
                read -r -p "Installing ${Directory} with sudo privileges are you sure you want to continue? [Y/n]" input

                case ${input} in
                    [yY][eE][sS]|[yY])
                        echo -e "${YELLOW}-----------------------------------"
                        echo -e "- Executing ${UNDERLINED}${Directory}/${file}${NORMAL}  -"
                        echo -e "-----------------------------------${NOCOLOR}"
                        bash ${Directory}/${file}
                    ;;
                    [nN][oO]|[nN])
                        echo -e "${RED}Not installing ${UNDERLINED}${Directory}${NORMAL}${NOCOLOR}"
                        continue
                    ;;
                    *)
                        echo -e "${YELLOW}-----------------------------------"
                        echo -e "- Executing ${UNDERLINED}${Directory}/${file}${NORMAL}  -"
                        echo -e "-----------------------------------${NOCOLOR}"
                        bash ${Directory}/${file}
                    ;;
                    esac

                echo -e "${GREEN}-----------------------------------"
                echo -e "-  Executed ${UNDERLINED}${Directory}/${file}${NORMAL}  -"
                echo -e "-----------------------------------${NOCOLOR}"
            fi
        done
    fi
done
