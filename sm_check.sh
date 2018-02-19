#!/bin/bash

########################################################################
# Requires: ansible 1.9 or higher.
# Usage: sm_check.sh <inventory> Where inventory is either an ansible
# inventory or a list of comma-sperated hostnames, e.g.
#
#   sm_check.sh host1,host2,host3
#
# or
#
#   sm_check.sh my_inventory.ini
#
# If there is only one host, then be sure it ends in a comma, e.g.
#
#   sm_check.sh host1,
#
########################################################################

ansible-playbook -i $1 linux_spectre_check.yml -c paramiko -k | sed '/fatal/d'
