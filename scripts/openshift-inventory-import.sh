#/bin/bash

AWXDIRECTORYNAME="yourinventoryfile"
AWXINVENTORYNAME="OSE_3.11"

tower-manage inventory_import --source=/root/${AWXINVENTORYNAME} --inventory-name="$AWXINVENTORYNAME" --overwrite --overwrite-vars

#Examples 
#tower-manage inventory_import --source=/opt/ansible-config/environments/tosinslab/minimal --inventory-name=OSE_3.11 --overwrite --overwrite-vars