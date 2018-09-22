#!/usr/bin/env bash
cloud_type=$1
opscenter_version=6.5.2

if [ -z "$OPSC_VERSION" ]
then
  echo "env \$OPSC_VERSION is not set, using default: $opscenter_version"
else
  echo "env \$OPSC_VERSION is set: $OPSC_VERSION overiding default"
  opscenter_version=$OPSC_VERSION
fi

echo "Installing OpsCenter"
echo | tee -a /etc/yum.repos.d/datastax.repo
echo "[opscenter] " | tee -a /etc/yum.repos.d/datastax.repo
echo "name = DataStax Repository" | tee -a /etc/yum.repos.d/datastax.repo
echo "baseurl=https://datastax%40oracle.com:*9En9HH4j^p4@rpm.datastax.com/enterprise" | tee -a /etc/yum.repos.d/datastax.repo
echo "enabled=1" | tee -a /etc/yum.repos.d/datastax.repo
echo "gpgcheck=0" | tee -a /etc/yum.repos.d/datastax.repo

yum -y install opscenter-$opscenter_version

