#!/usr/bin/env bash

# Installing glibc on Oracle Linux 6.x and later

# Make the yum.repos.d your current directory
cd /etc/yum.repos.d

# Download the public-yum-ol6.repo package from the repository
curl -o public-yum-ol6.repo http://public-yum.oracle.com/public-yum-ol6.repo

# Ready to install glibc.i686
yum list
yum install -y glibc.i686

