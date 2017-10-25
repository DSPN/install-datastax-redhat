#!/usr/bin/env bash

opscenter_broadcast_ip=$1

file="/etc/opscenter/opscenterd.conf"
echo "Adding disable_platform_check to disable OS check"
echo "[lifecycle_manager]" >> $file
echo "disable_platform_check = True" >> $file
echo "" >> $file
