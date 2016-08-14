#!/usr/bin/env bash

echo "Installing the Oracle JDK"

# Install add-apt-repository
yum -y install software-properties-common

#add-apt-repository -y ppa:webupd8team/java
yum -y update
#echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
#echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
yum install -y java-1.8.0-openjdk

# We're seeing Java installs fail intermittently.  Retrying indefinitely seems problematic.  I'm not sure
# what the correct solution is.  For now, we're just going to run the install a second time.  This will do
# nothing if the first install was successful and I suspect will eliminate the majority of our failures.
#yum install -y java-1.8.0-openjdk

