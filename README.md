# Ansibler Tower Configs

Collection of configuration files and scripts for an Ansible tower Mutli-Site OpenShift deployment. Used with the [openshift-ansible-tower](https://github.com/tosin2013/openshift-ansible-tower) repo. 

## Prerequisites 
* Ansible tower License

## Prerequisites if using VMWARE
* Create RHEL 7.6 VM Templates on vmware

## Quick Start
* start up RHEL 7.6 VM template 
* run scripts/package-config-ansible.sh
  - Configures packages needed to run thee install-ansible-tower script
* run or follow steps in scripts/install-ansible-tower.sh
  - installs ansible tower
  - installs tower CLI
* Login to ansible tower
  - the username and password are auto-generated under the inventory file

## Auto License 
* Copy your ansible license to tower 
* edit the tower file as seen below add eula_accepted to license file
```
{
    "eula_accepted": "true", <- add above line below
    "company_name": "Red Hat",
```
* run the register-ansible-tower.sh script

## Documentation
**OpenShift Deployment Steps on VMWARE**  
Use the following document below to get your OpenShift cluster configured.  
[Workflow Documentation](docs/workflow-documentation.adoc)

**Add Multiple Sites to inventory**  
Import OpenShift inventory in to ansible tower  
[Import Openshift Inventory](docs/import-openshift-inventory.adoc)

# Testing
Test the Deploy Virtual Machine on VMWARE Job Template
Test the Wipe vmware vm Job Template

# Notes and Recommendations
* Create backups of your server once  deployment has completed successfully
* save ansible-tower-configs and ansible inventory  in git repo  

# NOTICE
* Modifications may need to be made to script to work in your environment.

## Known Issues
* After Deleteing vm you must go into the smart inventory and remove the entry.

## Author
* Tosin Akinosho - Inital work - [tosin2013](https://github.com/tosin2013)
