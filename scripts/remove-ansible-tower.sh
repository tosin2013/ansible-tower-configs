#!/bin/bash
# https://access.redhat.com/solutions/3107181

echo "Shut down Tower services"
sudo  ansible-tower-service stop

echo "Uninstall ansible-tower packages"
yum remove ansible-tower\*

echo" Uninstall Rabbit MQ"
sudo yum -y remove rabbitmq-server

echo "Delete Tower data/configuration files"
sudo rm -rf /etc/tower /var/lib/{pgsql,awx,rabbitmq}

echo "Verify that Ansible Tower components are uninstalled"
 rpm -qa | grep ansible-tower

echo "Use yum erase <package-name> to remove any remaining ansible-tower-* packages."
