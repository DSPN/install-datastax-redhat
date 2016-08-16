#!/usr/bin/env bash

echo "Running install-datastax/bin/opscenter.sh"

cloud_type=$1
seed_node_ip=$2

echo "Configuring OpsCenter with the settings:"
echo cloud_type \'$cloud_type\'
echo seed_node_ip \'$seed_node_ip\'

./os/install_java.sh >> ./os/install_java.sh.log
./os/install_python27.sh >> ./os/install_python27.sh.log
./opscenter/install.sh $cloud_type >> ./opscenter/install.sh.out

./opscenter/start.sh

echo "Waiting for OpsCenter to connect to seed node..."
sleep 10
./opscenter/manage_existing_cluster.sh $seed_node_ip

echo "Changing the keyspace from SimpleStrategy to NetworkTopologyStrategy."
./opscenter/configure_opscenter_keyspace.sh
