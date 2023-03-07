#!/bin/bash
#----------------------------

MODULE="java"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


echo "Install jdk-8 ..."
apt-get install -y openjdk-8-jdk


echo "Set jdk env For all users ..."
env_filepath="/etc/environment"
split="="
grep "JAVA_HOME" ${env_filepath}
if [[ $? = 1 ]]; then
    modules/_set_conf.sh ${env_filepath} "JAVA_HOME" "/usr/lib/jvm/java-8-openjdk-amd64" ${split}
    modules/_set_conf.sh ${env_filepath} "JRE_HOME" "\${JAVA_HOME}/jre" ${split}
    modules/_set_conf.sh ${env_filepath} "CLASSPATH" ".:\${JAVA_HOME}/lib:\${JRE_HOME}/lib" ${split}

    # 确保 PATH 在最后一行
    sed -i '/^PATH=/d' ${env_filepath}
    modules/_set_conf.sh ${env_filepath} "PATH" "\${JAVA_HOME}/bin:${PATH}" ${split}
    source ${env_filepath}
fi
java -version


echo "Done ."
echo "-------------------------------"