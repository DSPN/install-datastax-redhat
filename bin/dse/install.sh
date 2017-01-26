#!/usr/bin/env bash

cloud_type=$1

echo "Installing DataStax Enterprise"

echo "Adding the DataStax repository"
echo "[datastax]" | tee -a /etc/yum.repos.d/datastax.repo
echo "name = DataStax Repo for DataStax Enterprise" | tee -a /etc/yum.repos.d/datastax.repo

# temporarily using @google.com DS academy account, need to create one for Oracle Compute Cloud (OCC)
echo "baseurl=https://datastax%40google.com:8GdeeVT2s7zi@rpm.datastax.com/enterprise" | tee -a /etc/yum.repos.d/datastax.repo

echo "enabled=1" | tee -a /etc/yum.repos.d/datastax.repo
echo "gpgcheck=0" | tee -a /etc/yum.repos.d/datastax.repo

# Import the DataStax Enterprise repository key
rpm --import http://rpm.datastax.com/rpm/repo_key

# Install the DSE package
dse_version=5.0.5
yum -y install dse-full-$dse_version dse-$dse_version dse-demos-$dse_version dse-libsolr-$dse_version dse-libtomcat-$dse_version dse-libsqoop-$dse_version dse-liblog4j-$dse_version dse-libmahout-$dse_version dse-libhadoop-native-$dse_version dse-libcassandra-$dse_version dse-libhive-$dse_version dse-libpig-$dse_version dse-libhadoop-$dse_version dse-libspark-$dse_version  dse-libgraph-$dse_version dse-libhadoop2-client-$dse_version

echo "Running yum install datastax-agent"
opscenter_version=6.0.7
yum -y install datastax-agent-$opscenter_version

# The install of dse creates a cassandra user, so now we can do this:
chown cassandra -R /mnt
chgrp cassandra -R /mnt
