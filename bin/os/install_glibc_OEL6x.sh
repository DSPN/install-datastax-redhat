#!/usr/bin/env bash

# Install glibc on Oracle Linux 6.x and later

echo "reached install_jglibc_OEL6x.sh"  >> install_jglibc_OEL6x.sh.out

# Make the yum.repos.d your current directory
cd /etc/yum.repos.d

# Download the public-yum-ol6.repo package from the repository
curl -o public-yum-ol6.repo http://public-yum.oracle.com/public-yum-ol6.repo

# Ready to install glibc.i686
yum list

# do we need to sudo or does this script run privileged?
sudo yum install -y glibc.i686

echo "leaving install_jglibc_OEL6x.sh"  >> install_jglibc_OEL6x.sh.out

