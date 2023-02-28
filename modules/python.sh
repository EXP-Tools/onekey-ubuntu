#!/bin/bash
#----------------------------

MODULE="python"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


echo "Install python3 ..."
apt-get install -y python3 python3-pip
ln -s /usr/bin/python3 /usr/bin/python
python -m pip install --upgrade pip
python --version

# 修改为国内源
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/


echo "Done ."
echo "-------------------------------"