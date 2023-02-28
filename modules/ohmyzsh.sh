#!/bin/bash
#----------------------------

MODULE="ohmyzsh"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


ROOT_ZSHRC="/root/.zshrc"
ROOT_OMZSH="/root/.oh-my-zsh"


echo "Install zsh ..."
if [[ ! "$SHELL" = "/bin/zsh" ]]; then
    apt-get install -y zsh
    chsh -s /bin/zsh 
fi


echo "Install oh my zsh ..."
if [ ! -f "${ROOT_ZSHRC}" ]; then
    # 国外源
#     sh -c "$(wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" <<EOF
# Y
# EOF
    # 国内源
    sh -c "$(wget --no-check-certificate https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh -O -)" <<EOF
Y
EOF
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ${ROOT_ZSHRC}
    echo "alias ll='ls -alF'" >> ${ROOT_ZSHRC}
    sources ${ROOT_ZSHRC}
fi


echo "Add oh my zsh For all users ..."
for user in `ls /home` 
do
    if [ ! -f "/home/${user}/.zshrc" ]; then
        echo "Set oh my zsh For ${user} ..."
        cp -r ${ROOT_OMZSH} "/home/${user}/"
        cp ${ROOT_ZSHRC} "/home/${user}/.zshrc"

        chown -R ${user}:${user} "/home/${user}/.oh-my-zsh"
        chown ${user}:${user} "/home/${user}/.zshrc"
        chsh -s /bin/zsh ${user}
    fi
done


echo "Done ."
echo "-------------------------------"

