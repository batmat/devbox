#!/bin/zsh

currentDir="${0:a:h}"
ansible-playbook -i $currentDir/hosts --ask-vault-pass $currentDir/playbook.yml
