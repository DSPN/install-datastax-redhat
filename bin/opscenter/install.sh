#!/usr/bin/env bash
cloud_type=$1
echo "Installing OpsCenter"

echo | tee -a /etc/yum.repos.d/datastax.repo
echo "[opscenter] " | tee -a /etc/yum.repos.d/datastax.repo
echo "name = DataStax Repository" | tee -a /etc/yum.repos.d/datastax.repo
echo "baseurl=https://datastax%40oracle.com:*9En9HH4j^p4@rpm.datastax.com/enterprise" | tee -a /etc/yum.repos.d/datastax.repo
echo "enabled=1" | tee -a /etc/yum.repos.d/datastax.repo
echo "gpgcheck=0" | tee -a /etc/yum.repos.d/datastax.repo

opscenter_version=6.1.4
yum -y install opscenter-$opscenter_version
