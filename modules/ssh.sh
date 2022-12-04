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


echo "Disable password ..."
grep "${PASS_RGX}" ${SSHD_PATH}
if [[ $? = 0 ]] ; then
    sed -i "s/${PASS_RGX}/${PASS} no/g" ${SSHD_PATH}
else
    echo "${PASS} no" >> ${SSHD_PATH}
fi
service sshd restart


echo "Done ."
echo "-------------------------------"