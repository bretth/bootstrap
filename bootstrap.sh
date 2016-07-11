#!/bin/sh

# environment
localectl set-locale LANG=en_AU.UTF-8
timedatectl set-timezone Australia/Sydney

# update and install
apt --quiet --yes update 
apt -qy upgrade
apt -qy install git mosh python unattended-upgrades

# clone the current config files
git clone https://github.com/bretth/bootstrap

# tighten ssh
cp -f bootstrap/etc/ssh~sshd_config /etc/ssh/sshd_config
systemctl restart sshd

# unattended upgrades
cp -f bootstrap/etc/apt~apt.conf.d~10periodic /etc/apt/apt.conf.d/10periodic
cp -f bootstrap/etc/apt~apt.conf.d~50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades