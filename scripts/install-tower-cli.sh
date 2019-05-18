#!/bin/bash
# Ansible tower cli quick install
pip install ansible-tower-cli

tower-cli  --help || exit 1


# disable ssl verification
tower-cli config verify_ssl false
