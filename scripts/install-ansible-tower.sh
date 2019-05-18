#!/bin/bash
# Ansible tower cli quick install
if [[ -z $1 ]]; then
  echo "USAGE: $0 poolid"
  exit 1
fi
POOL_ID=$1

subscription-manager register
subscription-manager attach --pool=$POOL_ID
subscription-manager attach  rhel-7-server-ansible-2.6-rpms
subscription-manager repos --enable rhel-server-rhscl-7-rpms

yum install ansible -y
yum install python27-python-pip -y
scl enable python27 bash
