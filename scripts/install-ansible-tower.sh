#!/bin/bash
# https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz
# https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-3.3.3-1.tar.gz

curl -OL https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-3.3.3-1.tar.gz
tar -zxvf ansible-tower-setup-3.3.3-1.tar.gz
cd ansible-tower-setup-3.3.3-1
mv inventory inventory.bak
cat > inventory <<EOF
[tower]
localhost ansible_connection=local

[database]

[all:vars]
admin_password='$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1)'

pg_host=''
pg_port=''

pg_database='awx'
pg_username='awx'
pg_password='$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 15 | head -n 1)'

rabbitmq_username=tower
rabbitmq_password='$(openssl rand -hex 8)'
rabbitmq_cookie=cookiemonster

# Isolated Tower nodes automatically generate an RSA key for authentication;
# To disable this behavior, set this value to false
# isolated_key_generation=true
EOF

pip install ansible-tower-cli

./setup.sh
