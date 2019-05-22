#/bin/bash

sudo scl enable python27 bash
tower-cli config verify_ssl false

#login to ansible tower via cli
tower-cli login admin

# Notes
# https://github.com/ansible/tower-cli/issues/581
tower-cli send towerconfigs/ansible-tower-configuration-v0.0.3.json

mkdir /root/ose3.11
touch /root/ose3.11/ansible-hosts
