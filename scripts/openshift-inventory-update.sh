#/bin/bash

AWXDIRECTORYNAME="ose3.11"
AWXINVENTORYNAME="OSE_3.11"

tower-manage inventory_import --source=/root/${AWXINVENTORYNAME} --inventory-name="$AWXINVENTORYNAME" --overwrite --overwrite-vars
