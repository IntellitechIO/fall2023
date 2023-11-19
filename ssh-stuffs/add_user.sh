#!/bin/bash
#
sudo useradd arslan
mkdir /home/arslan/.ssh
touch /home/arslan/.ssh/authorized_keys
sudo chmod 777 -R /home/arslan/
cat arslan-key.pub >> /home/arslan/.ssh/authorized_keys

