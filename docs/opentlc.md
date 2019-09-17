# OPENTLC Instructions

## Quick start
* Deploy Service ()"Ansible Foundations - Tower Lab")[https://labs.opentlc.com/catalog/explorer]
* login to ansible tower using username and password admin:ansible
* upload license


``
1. Create credential for git repo
name:  gitlab-credentials
CREDENTIAL TYPE: Source Control
USERNAME: yourusername
PASSWORD: yourpassword
2. Create Project
NAME: openshift-ansible-tower
SCM TYPE: Git
Source Details: https://gitlab.consulting.redhat.com/rto/openshift-ansible-tower.git
SCM/BRANCH/TAG/COMMIT: master
SCM CREDENTIAL:  gitlab-credentials
SCM UPDATE OPTIONS: CLEAN and DELETE ON UPDATE
# Save and refresh project
```

* ssh onto ansible server and  git clone ansible-tower-configs
```
git clone https://gitlab.consulting.redhat.com/rto/ansible-tower-configs.git
```
* run configure-infra-jobs.sh based off infrastructure
  - refer to scripts/configure-vmware-jobs.sh
  - tower-cli send towerconfigs/ansible-tower-configuration-v0.0.7.json
* confirm there are no errors in configuration push
