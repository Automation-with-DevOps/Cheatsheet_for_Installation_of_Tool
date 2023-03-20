# install helm 

#!/bin/bash
yum install wget -y
yum install unzip -y  
wget https://get.helm.sh/helm-v3.10.2-linux-amd64.tar.gz
tar -zxvf helm-v3.10.2-linux-amd64.tar.gz
sudo chmod +x linux-amd64/helm && sudo mv linux-amd64/helm /usr/bin/helm

open new terminal 
