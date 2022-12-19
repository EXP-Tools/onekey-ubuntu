#!/bin/bash
#----------------------------

MODULE="crontab"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


echo "Install crontab ..."
apt-get install -y cron
(crontab -l -u root; echo '0 0 1 1 * echo `date` >> /tmp/happy_new_year.log') | crontab
service cron restart


echo "Enable crontab log ..."
sed -i "s@#cron@cron@g" /etc/rsyslog.d/50-default.conf
sed -i "s@/var/log/cron.log@/var/log/cron/cron.log@g" /etc/rsyslog.d/50-default.conf
service rsyslog restart


echo "Done ."
echo "-------------------------------"