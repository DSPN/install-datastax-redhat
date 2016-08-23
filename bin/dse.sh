#!/usr/bin/env bash

echo "Running install-datastax-redhat/bin/dse.sh"

# opc or bare-metal
cloud_type=$1
seed_node_ip=$2
data_center_name=$3
opscenter_ip=$4

# should use meta data service instead
node_broadcast_ip=`curl --retry 10 icanhazip.com`
node_ip=`echo $(hostname -I)`

echo "Configuring nodes with the settings:"
echo cloud_type \'$cloud_type\'
echo data_center_name \'$data_center_name\'
echo seed_node_ip \'$seed_node_ip\'
echo node_broadcast_ip \'$node_broadcast_ip\'
echo node_ip \'$node_ip\'
echo opscenter_ip \'$opscenter_ip\'

#### Ok, now let's starting making changes to the system...

# Installing prerequisite software components for DSE 5.0.x
./os/install_java.sh
./os/install_python27.sh
./os/install_glibc_OEL6x.sh

# OpsCenter uses iostat
# OEL 6.7 does not have sysstat package pre-installed
yum -y install sysstat

./dse/install.sh $cloud_type
./dse/configure_cassandra_rackdc_properties.sh $cloud_type $data_center_name
./dse/configure_cassandra_yaml.sh $node_ip $node_broadcast_ip $seed_node_ip
./dse/configure_agent_address_yaml.sh $node_ip $node_broadcast_ip $opscenter_ip
./dse/start.sh
