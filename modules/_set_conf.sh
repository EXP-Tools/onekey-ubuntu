#!/bin/bash
#----------------------------
# 替换指定文件里的键值对
# bin/_set_conf.sh ${filepath} ${key} ${val} ${split}
#----------------------------


filepath=$1
key=$2
val=$3
split=$4


from1="^#${key}=.*"
from2="^${key}${split}.*"
to="${key}${split}${val}"

grep "${from1}" ${conf_path}
if [[ $? = 0 ]]; then
    sed -i "s/${from1}/${to}/g" ${conf_path}
else
    grep "${from2}" ${conf_path}
    if [[ $? = 0 ]]; then
        sed -i "s/${from2}/${to}/g" ${conf_path}
    else
        echo "${to}" >> ${conf_path}
    fi
fi
echo "Setted \"${to}\""