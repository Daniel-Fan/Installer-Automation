# README.md

This is the automation for updating the installer and other singleton services' CASE bundle submodules with the [`scripts-adopter`` branch](https://github.com/IBM/ibm-common-service-operator/tree/scripts-adopter)

## Usage
Edit the crontab file with `$ crontab -e` with the content in `crontab.template`.
- It will update CASE bundle submodules four times a day at 12 AM, 6 AM, 12 PM and 6 PM EST.