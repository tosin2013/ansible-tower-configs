#!/bin/bash

if [[ $# -ne 3 ]]; then
  echo "Please pass the required arguments."
  echo "Usage: $@ username password ansibletower"
  exit 1
fi

USERNAME=${1}
PASSWORD=${2}
ANSIBLETOWER=${3}

LICENSE_FILE=$(ls license_*.txt | head -1)
if [[ ! -f ${LICENSE_FILE} ]]; then 
  echo "Ansible license not found please copy file to current directory."
  exit 1
fi

#tower-cli setting modify LICENSE "'"$(cat $LICENSE_FILE)"'"

curl -k -H "Content-Type: application/json" -X POST \
  -u ${USERNAME}:${PASSWORD} \
  -d @/home/tosin/ansible-tower-configs/scripts/$(echo ${LICENSE_FILE}) \
  https://${ANSIBLETOWER}/api/v2/config/