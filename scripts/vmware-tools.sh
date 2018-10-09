#!/bin/bash -eux

yum install -y epel-release
yum install -y open-vm-tools
systemctl enable vmtoolsd.service
