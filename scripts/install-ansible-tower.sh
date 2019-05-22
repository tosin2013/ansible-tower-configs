#!/bin/bash
# Ansible tower cli quick install
if [[ -z $1 ]]; then
  echo "USAGE: $0 poolid"
  exit 1
fi
POOL_ID=$1

subscription-manager register
subscription-manager attach --pool=$POOL_ID
#subscription-manager attach --auto
sudo subscription-manager repos --enable  rhel-7-server-ansible-2.6-rpms
sudo subscription-manager repos --enable rhel-server-rhscl-7-rpms

sudo yum install ansible -y
sudo yum install python27-python-pip -y
sudo scl enable python27 bash

# https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz
# https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-3.3.3-1.tar.gz

curl -OL https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-3.3.3-1.tar.gz
tar -zxvf ansible-tower-setup-3.3.3-1.tar.gz
cd ansible-tower-setup-3.3.3-1
mv inventory inventory.bak
openssl rand –base64 14
cat > inventory <<EOF
[tower]
localhost ansible_connection=local

[database]

[all:vars]
admin_password='$(openssl rand -base64 15)'

pg_host=''
pg_port=''

pg_database='awx'
pg_username='awx'
pg_password='$(openssl rand -base64 15)'

rabbitmq_username=tower
rabbitmq_password='$(openssl rand -base64 15)'
rabbitmq_cookie=cookiemonster

# Isolated Tower nodes automatically generate an RSA key for authentication;
# To disable this behavior, set this value to false
# isolated_key_generation=true
EOF

pip install ansible-tower-cli

./setup.sh