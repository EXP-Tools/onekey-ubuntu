#!/bin/bash

RUN apt-get clean && \
    apt-get update -y && \
    apt-get upgrade -y


# 安装系统必要组件
RUN apt-get install -y curl wget vim zip unzip git telnet net-tools cron logrotate rsyslog procps

apt-get install -y tofrodos
ln -s /usr/bin/todos /usr/bin/unix2dos && \
ln -s /usr/bin/fromdos /usr/bin/dos2unix 

apt-get install -y python3 python3-pip
python -m pip install --upgrade pip
ln -s /usr/bin/python3 /usr/bin/python

