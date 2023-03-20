
# install sonar-qube

#!/bin/bash

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin 
sudo systemctl start docker
sudo systemctl status docker
docker run -d -p 9000:9000 sonarqube:lts  
echo -e "default password is admin admin"
