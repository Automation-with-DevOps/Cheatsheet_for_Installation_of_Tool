ansible installation 

#!/bin/bash
yum install wget -y
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install epel* -y
yum update –y
yum -y install git python python-level python-pip openssl ansible 
ansible --version
cat /etc/hosts
adduser ansible
passwd ansible
