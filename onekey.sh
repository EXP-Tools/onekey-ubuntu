#!/bin/bash
#----------------------------
# Ubuntu 一键装机脚本
#----------------------------

if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


./modules/apt.sh
./modules/python.sh
./modules/env.sh
./modules/vm.sh
./modules/cron.sh
./modules/ssh.sh
./modules/ohmyzsh.sh
./modules/docker.sh
./modules/ftp.sh


echo "All Done."
exit 0