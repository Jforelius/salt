#!/bin/bash
touch .my.cnf
get_name() {
  pwgen 20 1 -s
}
echo -e "password: $(get_name)" |sudo tee .my.cnf
