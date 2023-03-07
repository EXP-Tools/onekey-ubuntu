#!/bin/bash
#----------------------------

MODULE="maven"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


echo "Install maven ..."
apt-get install -y maven


echo "Set maven env For all users ..."
env_filepath="/etc/environment"
split="="
grep "M2_HOME" ${env_filepath}
if [[ $? = 1 ]]; then
    modules/_set_conf.sh ${env_filepath} "M2_HOME" "/usr/share/maven" ${split}

    # 确保 PATH 在最后一行
    sed -i '/^PATH=/d' ${env_filepath}
    modules/_set_conf.sh ${env_filepath} "PATH" "${PATH}:\${M2_HOME}/bin" ${split}
    source ${env_filepath}
fi
mvn -v


echo "Done ."
echo "-------------------------------"