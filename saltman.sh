#!/bin/bash
sudo apt-get update
sudo apt-get -y install salt-minion
echo "-------------------"
echo "installed salt minion"
hostname -I
whoami
echo -e "master: 192.168.10.35\nid: script_peasant" |sudo tee /etc/salt/minion
sudo systemctl restart salt-minion.service
