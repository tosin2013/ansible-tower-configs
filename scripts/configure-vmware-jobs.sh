#/bin/bash

#sudo scl enable python27 bash

tower-cli config verify_ssl false

#login to ansible tower via cli
tower-cli login admin

# Linking openshift ansible folder to /var/lib/awx/projects/
ln -s /usr/share/ansible/openshift-ansible /var/lib/awx/projects/

# Notes
# https://github.com/ansible/tower-cli/issues/581
tower-cli send ../towerconfigs/ansible-tower-configuration-v0.1.1.json
