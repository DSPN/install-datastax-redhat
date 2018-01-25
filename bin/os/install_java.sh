#!/usr/bin/env bash

echo "Installing the Oracle Java 8 JDK"

yum install -y wget
cd ~
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.rpm"
yum -y localinstall jdk-8u162-linux-x64.rpm
