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


comment="^#${key}${split}.*"
from="^${key}${split}.*"
to="${key}${split}${val}"

grep "${comment}" ${filepath}
if [[ $? = 0 ]]; then
    sed -i "s!${comment}!${to}!g" ${filepath}
else
    grep "${from}" ${filepath}
    if [[ $? = 0 ]]; then
        sed -i "s!${from}!${to}!g" ${filepath}
    else
        echo "${to}" >> ${filepath}
    fi
fi
echo "Setted \"${to}\""