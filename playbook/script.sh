#! /bin/bash

# VAULT_PASSWORD_FILE="./.vault_pass"

docker run -d --name ubuntu  pycontribs/ubuntu sleep 10000
docker run -d --name centos7  pycontribs/centos:8 sleep 10000
docker run -d --name fedora pycontribs/fedora sleep 10000
ansible-playbook -i ./inventory/prod.yml ./site.yml --ask-vault-pass 
# ansible-playbook -i ./inventory/prod.yml ./site.yml --vault-password-file "$VAULT_PASSWORD_FILE"
docker rm -f ubuntu centos7 fedora
