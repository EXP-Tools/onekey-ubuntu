#!/bin/bash
#----------------------------

MODULE="virtual memory"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


VM_SIZE=4096
VM_DIR="/swap"
VM_FILE="swapfile"
VM_PATH="${VM_DIR}/${VM_FILE}"


echo "Set vm (4G) ..."
vm_total=$(free -mh | awk '/Swap/{print $2}')
if [ "${vm_total}" = "0" ] || [ "${vm_total}" = "0B" ]; then
    mkdir -p ${VM_DIR}
    dd if=/dev/zero of=${VM_PATH} bs=1M count=${VM_SIZE}
    chmod 600 ${VM_PATH}
    mkswap ${VM_PATH}
    swapon ${VM_PATH}
    echo "${VM_PATH} swap swap defaults 0 0" >> /etc/fstab
fi

free -mh
echo "Done ."
echo "-------------------------------"