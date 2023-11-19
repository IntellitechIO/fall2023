#!/bin/bash
#
sudo useradd arslan
mkdir /home/arslan/.ssh
touch /home/arslan/.ssh/authorized_keys
cat arslan-key.pub >> /home/arslan/.ssh/authorized_keys

