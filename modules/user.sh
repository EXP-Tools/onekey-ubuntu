#!/bin/bash


USERNAME=$1



# 添加用户为 sudo 免密
a=`cat /etc/sudoers | grep ${USERNAME}`
if
    chmod 640 /etc/sudoers
    echo "${USERNAME} ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
    chmod 440 /etc/sudoers


# 添加用户到 docker 组
a=`cat /etc/group | grep docker`
if 
    sudo gpasswd -a ${USERNAME} docker