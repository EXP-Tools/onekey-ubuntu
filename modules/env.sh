#!/bin/bash
#----------------------------

MODULE="env"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"


echo "Set system timezone ..."
grep "Shanghai" /etc/profile
if [[ ! $? = 0 ]] ; then
    echo "export TZ=Asia/Shanghai" >> /etc/profile
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    apt-get install tzdata
fi


echo "Set UTF-8 chinese language ..."
grep "zh_CN" /etc/environment
if [[ ! $? = 0 ]] ; then
    apt-get install -y \
        language-pack-zh-hans \
        language-pack-zh-hans-base \
        language-pack-gnome-zh-hans \
        language-pack-gnome-zh-hans-base
    apt-get install -y locales
    echo 'zh_CN.GBK GBK' >> /etc/locale.gen
    echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen
    echo "LANG=zh_CN.UTF-8" >> /etc/environment
    locale-gen
fi


echo "Set alias ..."
ALIAS_LL="alias ll='ls -alF'"

grep "alias ll" /root/.bashrc
if [[ ! $? = 0 ]] ; then
    echo "${ALIAS_LL}" >> /root/.bashrc
fi

for user in `ls /home` 
do
    grep "alias ll" /home/${user}/.bashrc
    if [[ ! $? = 0 ]] ; then
        echo "${ALIAS_LL}" >> /home/${user}/.bashrc
    fi
done


echo "Done ."
echo "-------------------------------"