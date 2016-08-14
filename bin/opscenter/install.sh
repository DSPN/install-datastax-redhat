#!/usr/bin/env bash
cloud_type=$1
echo "Installing OpsCenter"

echo "Adding the DataStax repository"
# temporarily using @google.com DS academy account, need to create one for Oracle Compute Cloud (OCC)
echo | sudo tee -a /etc/yum.repos.d/datastax.repo
echo "[opscenter] " | sudo tee -a /etc/yum.repos.d/datastax.repo
echo "name = DataStax Repository" | sudo tee -a /etc/yum.repos.d/datastax.repo
echo "baseurl = http://rpm.datastax.com/community" | sudo tee -a /etc/yum.repos.d/datastax.repo
echo "enabled=1" | sudo tee -a /etc/yum.repos.d/datastax.repo
echo "gpgcheck=0" | sudo tee -a /etc/yum.repos.d/datastax.repo

# Ready to install OpsCenter
opscenter_version=6.0.1
yum -y install opscenter=$opscenter_version

