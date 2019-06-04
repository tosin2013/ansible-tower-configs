#!/bin/bash

# Login to ansible tower and export the configuration 
tower-cli login admin
tower-cli  receive --all > ansiblefile.json

echo "scrubing ansible file "
sed -i 's~"$encrypted$"~"changeme"~g' ansiblefile.json

# rename the ansiblefile.json to what ever you would like 

# backup all configuration to generate tar file. 
./setup.sh -b
