#!/usr/bin/env bash

echo "########################################"
echo "#          Stoffel java setup          #"
echo "########################################"

filepath=$( cd "$(dirname "$0")" ; pwd )

declare -a jdk_urls=(https://download.oracle.com/otn/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz https://download.oracle.com/otn/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jdk-9.0.4_linux-x64_bin.tar.gz https://download.oracle.com/otn/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.tar.gz http://download.oracle.com/otn-pub/java/jdk/11.0.2+9/f51449fcd52f4d52b93a989c5c56ed3c/jdk-11.0.2_linux-x64_bin.tar.gz)

I=7
for url in "${jdk_urls[@]}" ; do
    echo "Processing JDK ${I}"
    curl -C - -LR#OH "Cookie: oraclelicense=accept-securebackup-cookie" ${url}
    I=$((${I} + 1))
done



if [[ ${OS} == Debian ]]; then
    {
        echo "Creating java directory"
        sudo mkdir /var/lib/java
    } || {
        echo "Moving JDK files to java directory"
        echo "Moving JDK 7 to /var/lib/java/java7..."
        sudo mv jdk-7u80-linux-x64.tar.gz /var/lib/java/java7
        echo "...done"
        echo "Moving JDK 8 to /var/lib/java/java8..."
        sudo mv jdk-8u201-linux-x64.tar.gz /var/lib/java/java8
        echo "...done"
        echo "Moving JDK 9 to /var/lib/java/java9..."
        sudo mv jdk-9.0.4_linux-x64_bin.tar.gz /var/lib/java/java9
        echo "...done"
        echo "Moving JDK 10 to /var/lib/java/java10..."
        sudo mv jdk-10.0.2_linux-x64_bin.tar.gz /var/lib/java/java10
        echo "...done"
        echo "Moving JDK 11 to /var/lib/java/java11..."
        sudo mv jdk-11.0.2_linux-x64_bin.tar.gz /var/lib/java/java11
        echo "...done"
    }

    echo "Copying cjava command to /bin..."
    sudo cp java/dotfiles/cjava /bin/
    echo "...done"
    echo "Making cjava executable..."
    sudo chmod a+x /bin/cjava
    echo "...done"
    echo "Making first symbolic link on java 11..."
    sudo ln -sf /var/lib/java/java11 /var/lib/java/java
    echo "done"
elif [[ ${OS} == CentOS ]]; then
    {
        echo "Creating java directory"
        sudo mkdir /var/lib/java
    } || {
        echo "Moving JDK files to java directory"
        echo "Moving JDK 7 to /var/lib/java/java7..."
        sudo mv jdk-7u80-linux-x64.tar.gz /var/lib/java/java7
        echo "...done"
        echo "Moving JDK 8 to /var/lib/java/java8..."
        sudo mv jdk-8u201-linux-x64.tar.gz /var/lib/java/java8
        echo "...done"
        echo "Moving JDK 9 to /var/lib/java/java9..."
        sudo mv jdk-9.0.4_linux-x64_bin.tar.gz /var/lib/java/java9
        echo "...done"
        echo "Moving JDK 10 to /var/lib/java/java10..."
        sudo mv jdk-10.0.2_linux-x64_bin.tar.gz /var/lib/java/java10
        echo "...done"
        echo "Moving JDK 11 to /var/lib/java/java11..."
        sudo mv jdk-11.0.2_linux-x64_bin.tar.gz /var/lib/java/java11
        echo "...done"
    }
    echo "Copying cjava command to /bin..."
    sudo cp java/dotfiles/cjava /bin/
    echo "...done"
    echo "Making cjava executable..."
    sudo chmod a+x /bin/cjava
    echo "...done"
    echo "Making first symbolic link on java 11..."
    sudo ln -sf /var/lib/java/java11 /var/lib/java/java
    echo "done"
else
    echo "java installation failed.. Couldn't figure out what system you use"
fi
