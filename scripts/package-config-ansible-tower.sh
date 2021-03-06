#!/bin/bash
# Ansible tower cli quick install
if [[ -z $1 ]]; then
  echo "USAGE: $0 poolid"
  echo "To list poolids: sudo subscription-manager list --available"
  exit 1
fi
POOL_ID=$1

sudo subscription-manager attach --pool=$POOL_ID
#subscription-manager attach --auto

sudo subscription-manager repos --disable="*"
sudo subscription-manager repos --enable  rhel-7-server-ansible-2.6-rpms
sudo subscription-manager repos --enable rhel-server-rhscl-7-rpms
sudo subscription-manager repos \
   --enable="rhel-7-server-rpms" \
   --enable="rhel-7-server-extras-rpms" \
   --enable="rhel-7-server-ose-3.11-rpms"

sudo yum install ansible vim -y
#https://developers.redhat.com/blog/2018/08/13/install-python3-rhel/
#^^ansible python3 pip
sudo yum install python27-python-pip -y
sudo yum install openshift-ansible -y

sudo scl enable python27 bash
