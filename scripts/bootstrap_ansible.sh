#!/bin/bash

set -e

echo "Installing Ansible..."
sudo yum -y install epel-release
sudo yum -y update
sudo yum -y -d 10 install ansible
sudo yum -y install wget
#yum -y install python-pip

# Use for local network testing:
# On host, browse to guest ip number (http://10.100.198.100) and verify html page is presented
# or curl
sudo yum -y install httpd
sudo systemctl start httpd

cp /vagrant/ansible/ansible.cfg /etc/ansible/avagnsible.cfg

# Fix problem with lost fixed ip address
# https://github.com/mitchellh/vagrant/issues/6235
sudo nmcli connection reload
sudo systemctl restart network.service