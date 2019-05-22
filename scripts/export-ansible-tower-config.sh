#!/bin/bash
tower-cli login admin
tower-cli  receive --all > ansiblefile.json

./setup.sh -b

echo "scrubing ansible file "
sed -i 's~"$encrypted$"~"changeme"~g' ansiblefile.json

