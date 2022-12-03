#!/bin/bash

# 安装系统 GBK 和 UTF-8 中文语言包
apt-get install -y 
    language-pack-zh-hans \
    language-pack-zh-hans-base \
    language-pack-gnome-zh-hans \
    language-pack-gnome-zh-hans-base

apt-get install -y locales && \
    echo 'zh_CN.GBK GBK' >> /etc/locale.gen && \
    echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen && \
    echo "LANG=zh_CN.UTF-8" >> /etc/environment && \
    locale-gen
