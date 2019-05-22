#!/bin/bash
# Ansible tower cli quick install
pip install ansible-tower-cli

curl -OL https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
mv jq-linux64 /usr/local/bin/jq
chmod +x /usr/local/bin/jq
jq

tower-cli  --help || exit 1


# disable ssl verification
tower-cli config verify_ssl false
