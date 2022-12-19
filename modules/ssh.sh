#!/bin/bash
#----------------------------

MODULE="ssh"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"

confpath="/etc/ssh/sshd_config"
split=" "


echo "SSHD Configuration ..."

# 启用 public key 免密登录（需要客户端使用 ssh-keygen 生成密钥对，并把公钥写入 ）
modules/_set_conf.sh ${confpath} "PubkeyAuthentication" "yes" ${split}

# 默认不关闭密码登录模式，避免未设置 public key 导致无法登录
# modules/_set_conf.sh ${confpath} "PasswordAuthentication" "no" ${split}

# 非活动 ssh 保活
# 每 ClientAliveInterval 秒发送一个数据包，未响应次数超过 ClientAliveCountMax 则断开连接
modules/_set_conf.sh ${confpath} "ClientAliveInterval" "60" ${split}
modules/_set_conf.sh ${confpath} "ClientAliveCountMax" "1" ${split}



service sshd restart

echo "Done ."
echo "-------------------------------"