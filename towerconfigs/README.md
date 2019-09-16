# Custom tower configs

1. Export config using the export-ansible-tower-config.sh script
2. Edit the ansiblefile.json



### Edits
* scrub ansiblefile.json
  - `sed -i 's~"$encrypted$"~"changeme"~g' ansiblefile.json`
* Remove "asset_type": "user"
  - https://github.com/ansible/tower-cli/issues/581
  - ```
    {
        "asset_type": "user"
    },
    ```
* Rename ansible tower config
  - `mv ansiblefile.json ansible-tower-configuration-v0.0.X.json`