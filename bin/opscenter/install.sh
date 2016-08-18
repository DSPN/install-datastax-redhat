#!/usr/bin/env bash
cloud_type=$1
echo "Installing OpsCenter"

echo "Adding the DataStax repository"

# are we, I don't see it here...
# temporarily using @google.com DS academy account, need to create one for Oracle Compute Cloud (OCC)

echo | tee -a /etc/yum.repos.d/datastax.repo
echo "[opscenter] " | tee -a /etc/yum.repos.d/datastax.repo
echo "name = DataStax Repository" | tee -a /etc/yum.repos.d/datastax.repo
echo "baseurl=https://datastax%40google.com:8GdeeVT2s7zi@rpm.datastax.com/enterprise" | tee -a /etc/yum.repos.d/datastax.repo
echo "enabled=1" | tee -a /etc/yum.repos.d/datastax.repo
echo "gpgcheck=0" | tee -a /etc/yum.repos.d/datastax.repo

# Ready to install OpsCenter
opscenter_version=6.0.2-1
yum -y install opscenter-$opscenter_version
