#!/usr/bin/env bash

echo "reached dse2.sh"

#### Ok, now let's starting making changes to the system...

./os/install_java.sh

# OpsCenter uses iostat and OEL 6.7 doesn't seem to have it installed by default.
sudo yum -y install sysstat

#./dse/install.sh $cloud_type
#./dse/configure_cassandra_rackdc_properties.sh $cloud_type $data_center_name
#./dse/configure_cassandra_yaml.sh $node_ip $node_broadcast_ip $seed_node_ip
#./dse/configure_agent_address_yaml.sh $node_ip $node_broadcast_ip $opscenter_ip
#./dse/start.sh