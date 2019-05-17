#!/bin/bash
# Author: Tosin Akinosho (Red Hat)
# Purpose: Sync changes to inventory file to git repo

if [[ -z $1  && -z $2 ]]; then
  echo "Please pass inventory directory and  inventory name."
  echo "Usage: $0 dev test-inventory"
  exit 1
fi

PROJECTFOLDER="/root/ose3.11"
ENVFOLDER="$1"
INVENTORYFILE="$2"

cp PROJECTFOLDER="/root/ose3.11/ansible-hosts" environments/${ENVFOLDER}/${INVENTORYFILE}

echo "Checking status"
git status

echo "Review changes"
git add -p

read -p "Commit description:" $COMMITMESSAGE
git commit -m "${COMMITMESSAGE}"

echo "Performing a pull"
git pull

echo "Checking status"
git status

echo "Attempting to push"
git push

echo "Checking status"
git status
