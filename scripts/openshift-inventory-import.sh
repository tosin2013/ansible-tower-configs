#/bin/bash

if [[ -z $1  && -z $2 ]]; then
  echo "Please pass inventory directory and  inventory name."
  echo "Usage: $0 environments/minimal/inventory site001-inventory"
  exit 
fi

CURRENT_DIR=$(find $HOME/  -type d  -name ansible-tower-configs)
if [[ -z $CURRENT_DIR ]]; then 
  echo "unable to find ansible-tower-configs directory"
  exit 1
fi

SITEENV=${1}
AWXINVENTORYNAME=${2}
ORGANIZATION="Default"

FULLPATHTOINV="${CURRENT_DIR}/${SITEENV}"

if [[ ! -f ${FULLPATHTOINV} ]]; then 
  echo "Unable to locate ${FULLPATHTOINV}"
  exit 1
fi

tower-cli inventory  create -n  ${AWXINVENTORYNAME} --organization ${ORGANIZATION} || exit $?
tower-manage inventory_import --source=${FULLPATHTOINV} --inventory-name="${AWXINVENTORYNAME}" --overwrite --overwrite-vars || exit $?

#Examples 
#tower-manage inventory_import --source=/opt/ansible-config/environments/tosinslab/minimal --inventory-name=OSE_3.11 --overwrite --overwrite-vars