#!/usr/bin/env bash

echo "########################################"
echo "#          Stoffel git setup           #"
echo "########################################"

filepath=$( cd "$(dirname "$0")" ; pwd )

if [[ ${OS} == Debian ]]; then
    sudo apt-get update
    sudo apt-get -y install git
elif [[ ${OS} == CentOS ]]; then
    yum install -y git
else
    echo "Git installation failed.. Couldn't figure out what system you use"
fi

echo "Now copying dotfiles"

gitconfig=~/.gitconfig
gitignoreglobal=~/.gitignore_global
if [[ -e ${gitignoreglobal} ]]; then
    echo "found ${gitignoreglobal}... Backing up"
    cp -v ${gitignoreglobal} ${gitignoreglobal}.bak
else
   echo "No global gitignore found"
fi

if [[ -e ${gitconfig} ]]
then
    echo "${gitconfig} found... Backing up"
    cp -v ${gitconfig} ${gitconfig}.bak
else
    echo "git config not found."
fi

echo "No copying new dotfiles"

cp -v ${filepath}/dotfiles/.gitignore_global ${gitignoreglobal}
cp -v ${filepath}/dotfiles/.gitconfig  ${gitconfig}