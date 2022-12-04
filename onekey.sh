#!/bin/bash
#----------------------------
# Ubuntu 一键装机脚本
#----------------------------

./modules/apt.sh
./modules/python.sh
./modules/env.sh
./modules/vm.sh
./modules/cron.sh

echo "All Done."