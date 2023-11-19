#!/bin/bash
#
sudo useradd arslan
sudo mkdir /home/arslan/.ssh
sudo touch /home/arslan/.ssh/authorized_keys
sudo chmod 777 -R /home/arslan/
cat arslan-key.pub >> /home/arslan/.ssh/authorized_keys

