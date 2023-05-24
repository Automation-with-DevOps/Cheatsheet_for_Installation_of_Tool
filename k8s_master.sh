

#!/bin/bash
#for master install 
sudo yum update -y 
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo sed -i '/swap/d' /etc/fstab
sudo sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine -y


sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF

sudo yum install -y yum-utils device-mapper-persistent-data lvm2 kubeadm docker-ce containerd.io 

sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

sudo systemctl enable --now kubelet
sudo rm -rf /etc/containerd/config.toml

sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sudo systemctl start containerd
sudo systemctl enable containerd
sudo systemctl status containerd
sudo systemctl enable kubelet

sudo kubeadm init

sudo echo -e "apply this command after kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml"
