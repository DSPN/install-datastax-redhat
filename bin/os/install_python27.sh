#!/usr/bin/env bash

# Install python 2.7

# To compile Python you must first install the development tools
sudo yum -y groupinstall "Development tools"
sudo yum -y install zlib-devel
sudo yum -y install bzip2-devel
sudo yum -y install openssl-devel
sudo yum -y install ncurses-devel
sudo yum -y install sqlite-devel

# Now to download, compile and install Python 2.7
cd /opt
sudo curl -o Python-2.7.11.tar.xz https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tar.xz
sudo tar xf Python-2.7.11.tar.xz
cd Python-2.7.11
sudo ./configure --prefix=/usr/local
sudo make
sudo make install

# Link Python 2.7 to /usr/bin/python
#sudo ln -s /usr/local/bin/python2.7 /usr/local/bin/python

#scl enable python27 bash
#export PYTHONPATH="/usr/lib/python2.7/site-packages/":$PYTHONPATH
