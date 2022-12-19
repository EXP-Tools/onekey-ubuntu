#!/bin/bash
#----------------------------

MODULE="python"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


echo "Install python3 ..."
apt-get install -y python3 python3-pip
ln -s /usr/bin/python3 /usr/bin/python
python -m pip install --upgrade pip


echo "Done ."
echo "-------------------------------"