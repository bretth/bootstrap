#!/bin/sh
localectl set-locale LANG=en_AU.UTF-8
timedatectl set-timezone Australia/Sydney
apt --quiet --yes update 
apt -qy upgrade
apt -qy install git python unattended-upgrades
git clone https://github.com/bretth/bootstrap
cp --no-clobber /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
cp -f bootstrap/etc/ssh~sshd_config /etc/ssh/sshd_config
cp -f bootstrap/etc/apt~apt.conf.d~10periodic /etc/apt/apt.conf.d/10periodic
cp -f bootstrap/etc/apt~apt.conf.d~50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades