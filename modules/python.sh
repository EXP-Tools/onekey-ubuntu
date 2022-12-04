#!/bin/bash
#----------------------------

MODULE="python"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"


echo "Install python3 ..."
apt-get install -y python3 python3-pip
ln -s /usr/bin/python3 /usr/bin/python
python -m pip install --upgrade pip


echo "Done ."
echo "-------------------------------"