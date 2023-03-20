
# install nexus


 
#!/bin/bash

sudo su 
yum install java -y 
sudo yum install wget -y 
wget https://download.sonatype.com/nexus/3/nexus-3.43.0-01-unix.tar.gz

tar -zxvf nexus-3.43.0-01-unix.tar.gz
cd nexus-3.43.0-01
cd bin 
./nexus start 
./nexus status 

echo -e "default password is admin and admin123"
