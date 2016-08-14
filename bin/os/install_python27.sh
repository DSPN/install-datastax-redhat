#!/usr/bin/env bash

# Install python 2.7
yum update ## optional
yum install -y scl-utils
yum install -y centos-release-scl-rh
yum install -y python27
scl enable python27 bash
export PYTHONPATH="/usr/lib/python2.7/site-packages/":$PYTHONPATH

# Still have problem running the command below coz repo does not contain python27
yum install -y python27