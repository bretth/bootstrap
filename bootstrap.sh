#!/bin/sh
localectl set-locale LANG=en_AU.UTF-8
timedatectl set-timezone Australia/Sydney
apt-get --quiet --yes update 
apt-get -qy upgrade
apt-get -qy install git python
git clone https://github.com/bretth/bootstrap
cp --no-clobber /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
cp -f bootstrap/etc/ssh~sshd_config /etc/ssh/sshd_config
