#!/usr/bin/env bash

##### We should install the Oracle JDK instead of openjdk
echo "Installing the Open JDK"

echo "reached install_java.sh"  >> install_java.sh.out

# Install add-apt-repository
yum -y install software-properties-common

yum -y update
yum install -y java-1.8.0-openjdk

echo "leaving install_java.sh"  >> install_java.sh.out
