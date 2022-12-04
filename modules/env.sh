#!/bin/bash
#----------------------------

MODULE="env"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"


echo "Set system timezone ..."
echo "export TZ=Asia/Shanghai" >> /etc/profile
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
apt-get install tzdata


echo "Set UTF-8 chinese language ..."
apt-get install -y \
    language-pack-zh-hans \
    language-pack-zh-hans-base \
    language-pack-gnome-zh-hans \
    language-pack-gnome-zh-hans-base
apt-get install -y locales
echo 'zh_CN.GBK GBK' >> /etc/locale.gen
echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen
echo "LANG=zh_CN.UTF-8" >> /etc/environment
echo "export LANG=zh_CN.UTF-8" >> /etc/profile
echo "export LANGUAGE=zh_CN.UTF-8" >> /etc/profile
echo "export LC_ALL=zh_CN.UTF-8" >> /etc/profile
locale-gen


echo "Set alias ..."
echo "alias ll='ls -al'" >> /root/bash


echo "Done ."
echo "-------------------------------"