#!/usr/bin/env bash

echo "Running install-datastax-redhat/bin/opscenter.sh"

# opc or bare-metal
cloud_type=$1
seed_node_ip=$2

echo "Configuring OpsCenter with the settings:"
echo cloud_type \'$cloud_type\'
echo seed_node_ip \'$seed_node_ip\'

./os/install_java.sh
./os/install_python27.sh
./opscenter/install.sh $cloud_type

./opscenter/start.sh

echo "Waiting for OpsCenter to connect to seed node..."
sleep 10
./opscenter/manage_existing_cluster.sh $seed_node_ip

echo "Changing the keyspace from SimpleStrategy to NetworkTopologyStrategy."
./opscenter/configure_opscenter_keyspace.sh
