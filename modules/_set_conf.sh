#!/bin/bash
#----------------------------
# 替换指定文件里的键值对
# bin/_set_conf.sh ${filepath} ${key} ${val} ${split}
#----------------------------


filepath=$1
key=$2
val=$3
split="$4"
if [[ "x${split}" = "x" ]]; then
    split=" "
fi


from1="^#${key}${split}.*"
from2="^${key}${split}.*"
to="${key}${split}${val}"

grep "${from1}" ${filepath}
if [[ $? = 0 ]]; then
    sed -i "s/${from1}/${to}/g" ${filepath}
else
    grep "${from2}" ${filepath}
    if [[ $? = 0 ]]; then
        sed -i "s/${from2}/${to}/g" ${filepath}
    else
        echo "${to}" >> ${filepath}
    fi
fi
echo "Setted \"${to}\""