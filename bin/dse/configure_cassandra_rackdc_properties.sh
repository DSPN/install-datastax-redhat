#!/usr/bin/env bash

function get_rack {
  cloud_type=$1
  rack="rack1"
  echo $rack
}

cloud_type="$1"
dc="$2"
rack=`get_rack $cloud_type`

file=/etc/dse/cassandra/cassandra-rackdc.properties

date=$(date +%F)
backup="$file.$date"
cp $file $backup

cat $file \
| sed -e "s:^\(dc\=\).*:dc\=$dc:" \
| sed -e "s:^\(rack\=\).*:rack\=$rack:" \
| sed -e "s:^\(prefer_local\=\).*:rack\=true:" \
| sed -e "s:[# ]*\(prefer_local\=\).*:prefer_local\=true:" \
> $file.new

mv $file.new $file
