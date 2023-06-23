#!/bin/bash
#----------------------------

MODULE="bfg"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi

echo "Install BFG for git ..."
wget https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar -O /usr/local/bin/bfg
chmod +x /usr/local/bin/bfg

echo "Done ."
echo "-------------------------------"