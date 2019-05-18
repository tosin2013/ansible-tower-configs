#/bin/bash

SERVERNAME=changeme.example.com
USERNAME=administrator@vsphere.local
PASSWORD=changemypass

tower-cli config verify_ssl false

#login to ansible tower via cli
tower-cli login admin

# Ansible Inventory Files - https://github.com/ansible/ansible/tree/devel/contrib/inventory
curl -OL https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/vmware_inventory.ini

# update vmware_inventory.ini
echo "Updating SERVERNAME, USERNAME and PASSWORD please manually update vmware_inventory.ini for any custom changes."
sed  -i 's/^server=.*/server='${SERVERNAME}'/g' vmware_inventory.ini
sed  -i 's/^username=.*/username='${USERNAME}'/g' vmware_inventory.ini
sed  -i "s~password=.*~password="${PASSWORD}"~" vmware_inventory.ini


# copy vmware_inventory.ini to /etc/ansible
cp  vmware_inventory.ini  /etc/ansible/vmware_inventory.ini
rm vmware_inventory.ini
# Notes
# https://github.com/ansible/tower-cli/issues/581
tower-cli send towerconfigs/vmware-ansible-tower-node.json

SERVERNAME=photon-machine.attlocal.net
USERNAME=administrator@vsphere.local
PASSWORD='uetXFpqVWDn^3Q1vW&O%'
