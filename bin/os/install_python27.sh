#!/usr/bin/env bash

# Install python 2.7

echo "reached install_python27.sh"  >> install_python27.sh.out

# do we need sudo here?

# To compile Python you must first install the development tools
yum -y groupinstall "Development tools"
yum -y install zlib-devel
yum -y install bzip2-devel
yum -y install openssl-devel
yum -y install ncurses-devel
yum -y install sqlite-devel
yum -y install xz

# Now to download, compile and install Python 2.7
cd /opt
curl -o Python-2.7.9.tar.xz https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz
unxz Python-2.7.9.tar.xz
tar -xf Python-2.7.9.tar
cd Python-2.7.9
./configure --prefix=/usr/local
make
make install

# Link Python 2.7 to /usr/bin/python
#sudo ln -s /usr/local/bin/python2.7 /usr/local/bin/python

#scl enable python27 bash
#export PYTHONPATH="/usr/lib/python2.7/site-packages/":$PYTHONPATH

echo "leaving install_python27.sh"  >> install_python27.sh.out
