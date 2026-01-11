#!/bin/bash
#installing ansible
# sudo dnf install epel-release -y
#install ansible
sudo dnf install ansible -y
sudo systemctl start ansible
sudo systemctl enable ansible