#!/bin/bash
#----------------------------

MODULE="ssh"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"


SSHD_PATH="/etc/ssh/sshd_config"
PUKK="PubkeyAuthentication"
PASS="PasswordAuthentication"
PUKK_RGX="^${PUKK}.*"
PASS_RGX="^${PASS}.*"


echo "Enable pubkey ..."
grep "${PUKK_RGX}" ${SSHD_PATH}
if [[ $? = 0 ]] ; then
    sed -i "s/${PUKK_RGX}/${PUKK} yes/g" ${SSHD_PATH}
else
    echo "${PUKK} yes" >> ${SSHD_PATH}
fi
service sshd restart


# 默认不关闭密码登录模式，避免未设置 public key 导致无法登录
# echo "Disable password ..."
# grep "${PASS_RGX}" ${SSHD_PATH}
# if [[ $? = 0 ]] ; then
#     sed -i "s/${PASS_RGX}/${PASS} no/g" ${SSHD_PATH}
# else
#     echo "${PASS} no" >> ${SSHD_PATH}
# fi
# service sshd restart


echo "Done ."
echo "-------------------------------"