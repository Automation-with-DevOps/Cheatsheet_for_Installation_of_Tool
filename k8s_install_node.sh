#!/bin/bash
#for node install 
systemctl stop firewalld
systemctl disable firewalld
sed -i '/swap/d' /etc/fstab
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

yum remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine 


yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF

yum install -y yum-utils device-mapper-persistent-data lvm2 kubeadm docker-ce containerd.io 

sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

sudo systemctl enable --now kubelet
rm -rf /etc/containerd/config.toml

systemctl start docker
systemctl enable docker
systemctl status docker
systemctl start containerd
systemctl enable containerd
systemctl status containerd
systemctl enable kubelet
