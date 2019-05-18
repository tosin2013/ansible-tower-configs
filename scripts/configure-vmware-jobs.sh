#/bin/bash

SERVERNAME=changeme.example.com
USERNAME=administrator@vsphere.local
PASSWORD=changemypass

tower-cli config verify_ssl false

#login to ansible tower via cli
tower-cli login admin

# Notes
# https://github.com/ansible/tower-cli/issues/581
tower-cli send towerconfigs/vmware-ansible-tower-node.json
