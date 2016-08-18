#!/usr/bin/env bash

echo "Starting DataStax Enterprise"
service dse start

echo "Starting the DataStax Agent"
service datastax-agent start
