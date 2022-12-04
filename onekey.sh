#!/bin/bash
#----------------------------
# Ubuntu 一键装机脚本
#----------------------------

./modules/apt.sh
./modules/python.sh
./modules/env.sh
./modules/vm.sh
./modules/cron.sh
./modules/ssh.sh
./modules/ohmyzsh.sh


echo "All Done."