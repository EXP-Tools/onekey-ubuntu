#!/bin/bash
#----------------------------

MODULE="crontab"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"


echo "Install crontab ..."
apt-get install -y cron
(crontab -l -u root; echo '0 0 1 1 * echo `date` >> /tmp/happy_new_year.log') | crontab
service cron restart


echo "Enable crontab log ..."
sed -i s@#cron@cron@g /etc/rsyslog.d/50-default.conf
service rsyslog restart


echo "Done ."
echo "-------------------------------"