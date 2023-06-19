#!/bin/bash
#----------------------------

MODULE="docker / docker-compose"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


echo "Add docker lib ..."
apt-get install -y apt-transport-https ca-certificates software-properties-common gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y


echo "Install docker ..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable docker
systemctl start docker
docker version


echo "Install docker-compose ..."
# curl -L "https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
python -m pip install docker-compose
chmod a+x /usr/local/bin/docker-compose
docker-compose version


echo "Install users to docker group ..."
for user in `ls /home` 
do
    gpasswd -a ${user} docker
    echo "Add ${user}"
done


echo "Done ."
echo "-------------------------------"