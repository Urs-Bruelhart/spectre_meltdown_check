# Spectre and Meltdown Vulnerability Check #
  last updated on 2018-02-19<br>
  by [V01dDweller](https://github.com/V01dDweller)

**Requirements:** Bash on any Linux, OS X, Cygwin or WSL control machine with ansible 1.9 - 2.4 in your PATH. 

**sm_check.sh** is a wrapper around the short ansible linux_spectre_check.yml playbook which, in turn, executes Red Hat's spectre_meltdown.sh script against your ansible inventory, allowing the script to be run againts many hosts simultaneously. spectre_meltdown.sh can also be uploaded manually and run via ssh session if ansible is not an option. Check [Red Hat's site](https://access.redhat.com/labsinfo/speculativeexecution) for the latest version of spectre_meltdown.sh.

**Usage:**

```
./sm_check.sh <ansible-inventory-file>
```

or

```
./sm_check.sh host1,host2,host3
```

**Notes/Limitations**
* Hosts must be RHEL5/CentOS 5 or higher
* User must have ssh access to all hosts, (remove '-c paramiko -k' to use default ssh-key exchange)
* If using an inline list of hosts, have at least one comma and no spaces.

* This playbook uses the "human_log.py" callback plugin so that ansible script module output is readable. More info for that plug-in can be found [here](https://github.com/n0ts/ansible-human_log).

* Since the script will often fail to find CPU microcode update on a patched system, it will exit with return code 1 causing ansible to return a lot of red junk in addition to the script output. The pipe to sed removes the junk leaving clean script output.

* Ansible will run as current user by default, root access/privilege-escalation is not required.
