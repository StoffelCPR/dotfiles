#!/usr/bin/env bash

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
UNDERLINED="\e[4m"
NORMAL="\e[0m"
BOLD="\e[1m"
NOCOLOR="\033[0m"

echo "########################################"
echo "#       Stoffel dotfiles setup         #"
echo "########################################"

if [[ ${OSTYPE} == "msys" || ${OSTYPE} == "win32" || ${OSTYPE} == "darwin" ]]; then
  echo "Please install a proper operating system to use this dotfiles project."
fi

echo -e "${YELLOW}---------------------------"
echo "-     Determining OS      -"
echo -e "---------------------------${NOCOLOR}"

echo "${MAGENTA}${OSTYPE}${NOCOLOR}"

if [[ -f /etc/redhat-release ]]; then
    OS=CentOS && echo -e "${GREEN}...done OS is ${OS}${NOCOLOR}"
elif [[ -f /etc/debian_version ]]; then
    OS=Debian && echo -e "${GREEN}...done. OS is ${OS}/${OS} based${NOCOLOR}"
fi


echo -e "${YELLOW}Exporting OS variable for all scripts${NOCOLOR}"

export OS && echo -e "${GREEN}...done${NOCOLOR}"

echo -e "${YELLOW}${BOLD}-----------------------------------"
echo "-   Searching install.sh files    -"
echo -e "-----------------------------------${NORMAL}"

for Directory in *; do
    if [[ -d ${Directory} ]]; then
        for file in $(ls ${Directory}); do
            if [[ ${file} == "install.sh" ]]; then
                echo -e "${GREEN}-----------------------------------"
                echo -e "-   Found ${UNDERLINED}${Directory}/${file}${NORMAL}    -"
                echo -e "${GREEN}-----------------------------------${NOCOLOR}"
                read -r -p "Installing ${Directory} with sudo privileges are you sure you want to continue? [Y/n]" input

                case ${input} in
                    [yY][eE][sS]|[yY])
                        echo -e "${YELLOW}-----------------------------------"
                        echo -e "- Executing ${UNDERLINED}${Directory}/${file}${NORMAL}  -"
                        echo -e "${YELLOW}-----------------------------------${NOCOLOR}"
                        bash ${Directory}/${file}
                    ;;
                    [nN][oO]|[nN])
                        echo -e "${RED}Not installing ${UNDERLINED}${Directory}${NORMAL}${NOCOLOR}"
                        continue
                    ;;
                    *)
                        echo -e "${YELLOW}-----------------------------------"
                        echo -e "- Executing ${UNDERLINED}${Directory}/${file}${NORMAL}  -"
                        echo -e "${YELLOW}-----------------------------------${NOCOLOR}"
                        bash ${Directory}/${file}
                    ;;
                    esac

                echo -e "${GREEN}-----------------------------------"
                echo -e "-  Executed ${UNDERLINED}${Directory}/${file}${NORMAL}  -"
                echo -e "${GREEN}-----------------------------------${NOCOLOR}"
            fi
        done
    fi
done
