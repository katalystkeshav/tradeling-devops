#!/bin/bash 

yum -y update

#install python 3.7
yum install -y gcc openssl-devel bzip2-devel libffi-devel wget
cd /usr/src
wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
tar xzf Python-3.7.4.tgz
cd Python-3.7.4
./configure --enable-optimizations
make altinstall
rm /usr/src/Python-3.7.4.tgz
python3.7 -V

#install kubectl
cd
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

#install aws-iam-authenticator
cd
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
aws-iam-authenticator help

##install aws cli
#cd
#yum -y install python3-pip
#pip3 install awscli --upgrade --user
#
##add as client
#cd
#aws eks update-kubeconfig --name TestCluster --region us-east-1