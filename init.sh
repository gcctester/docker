#!/bin/bash
# description: init docker environment in daoclou.io host
# version: 1.0
# author: gcctester
# date: 2018-06-13
# use: sudo ./init.sh IP

homeDir=/home/ubuntu

# changed password for ubuntu
echo ubuntu:testgcc |chpasswd

# copy private key to ~/.ssh
rm -f ${homeDir}/.ssh/*
cp id_rsa ${homeDir}/.ssh/id_rsa

# config git
git config --global user.name "gcctester"
git config --global user.email "st201410303@163.com"

