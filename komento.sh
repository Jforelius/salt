#!/bin/bash
get_name() {
  hostname -i
}
ID="PEASANT_XUBUNTU"
echo -e "master: $(get_name)\nid: $ID" |sudo tee /etc/salt/minion
sudo systemctl restart salt-minion
