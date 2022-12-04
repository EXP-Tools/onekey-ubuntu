#!/bin/bash
#----------------------------

MODULE="ohmyzsh"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"


echo "Install zsh ..."
if [[ ! "$SHELL" = "/bin/zsh" ]]; then
    apt-get install -y zsh
    chsh -s /bin/zsh 
fi


echo "Install oh my zsh ..."
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sh -c "$(wget https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh -O -)"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' /root/.zshrc
sources /root/.zshrc


echo "Add oh my zsh For all users ..."
for user in `ls /home` 
do
    if [ ! -f "/home/${user}/.zshrc" ]; then
        echo "Set oh my zsh For ${user} ..."
        cp -R /root/.oh-my-zsh "/home/${user}/"
        cp /root/.zshrc "/home/${user}/.zshrc"

        chown ${user}:${user} "/home/${user}/.oh-my-zsh"
        chown ${user}:${user} "/home/${user}/.zshrc"
        chsh -s /bin/zsh ${user}
    fi
done


echo "Done ."
echo "-------------------------------"

