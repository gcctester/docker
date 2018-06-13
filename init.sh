#!/bin/bash
# description: init docker environment in daoclou.io host
# version: 1.1
# author: gcctester
# date: 2018-06-13
# use: sudo ./init.sh IP

homeDir=/home/ubuntu
IP=$1
ftpgcc=daocloud.io/mygcc/gcc:v4

# changed password for ubuntu
echo ubuntu:testgcc |chpasswd

# copy private key to ~/.ssh
rm -f ${homeDir}/.ssh/*
cp id_rsa ${homeDir}/.ssh/id_rsa

# config git
git config --global user.name "gcctester"
git config --global user.email "st201410303@163.com"
git remote rm origin
git remote add origin git@github.com:gcctester/docker.git
git remote add github https://github.com/gcctester/docker.git

# config docker
docker login -u gcctester -p testgcc daocloud.io
docker pull ${ftpgcc}
docker run -d -v /home/ubuntu:/home/vsftpd -p 20-21:20-21 -p 47400-47470:47400-47470 -p 8009:8009 -e FTP_USER=gcctester -e FTP_PASS=testgcc -e PASV_ADDRESS=${IP} --name=ftpgcc --restart=always ${ftpgcc}

# config vi
cp .vimrc ${homeDir}/.vimrc

