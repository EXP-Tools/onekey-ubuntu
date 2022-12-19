#!/bin/bash
#----------------------------

MODULE="apt"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


echo "Update sources ..."
sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
apt-get clean
apt-get update -y
apt-get upgrade -y


echo "Install software-properties-common (Timezone:Asia/Shanghai)"
apt-get install -y software-properties-common <<EOF
6
70
EOF


echo "Install base software ..."
apt-get install -y curl wget vim procps dos2unix screen git tree 
apt-get install -y lrzsz zip unzip p7zip-full p7zip-rar
apt-get install -y iputils-ping telnet net-tools netcat 
apt-get install -y logrotate rsyslog 


echo "Done ."
echo "-------------------------------"
