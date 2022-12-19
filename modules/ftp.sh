#!/bin/bash
#----------------------------

MODULE="ftp"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"
if [[ ! "${UID}" = "0" ]]; then
    echo "Please switch to root user !!!"
    exit 1
fi


confpath="/etc/vsftpd.conf"
split="="
userpath="/etc/vsftpd.userlist"
touch ${userpath}


echo "Install FTP ..."
apt-get install -y vsftpd
systemctl enable vsftpd


echo "FTP Configuration ..."

# 关闭匿名登录
modules/_set_conf.sh ${confpath} "anonymous_enable" "NO" ${split}

# 允许本地用户登录
modules/_set_conf.sh ${confpath} "local_enable" "YES" ${split}

# 启用可以修改文件的 FTP 命令
modules/_set_conf.sh ${confpath} "write_enable" "YES" ${split}

# 本地用户创建文件的 umask 值
modules/_set_conf.sh ${confpath} "local_umask" "022" ${split}

# 当用户第一次进入新目录时显示提示消息
modules/_set_conf.sh ${confpath} "dirmessage_enable" "YES" ${split}

# 一个存有详细的上传和下载信息的日志文件
modules/_set_conf.sh ${confpath} "xferlog_enable" "YES" ${split}

# 在服务器上针对 PORT 类型的连接使用端口 20（FTP 数据）
modules/_set_conf.sh ${confpath} "connect_from_port_20" "YES" ${split}

# 保持标准日志文件格式
modules/_set_conf.sh ${confpath} "xferlog_std_format" "YES" ${split}

# 阻止 vsftpd 在独立模式下运行
modules/_set_conf.sh ${confpath} "listen" "YES" ${split}

# 监听 ipv6 而不是 IPv4，可以根据你的网络情况设置
modules/_set_conf.sh ${confpath} "listen_ipv6" "NO" ${split}

# vsftpd 将使用 PAM 验证设备的名字
modules/_set_conf.sh ${confpath} "pam_service_name" "YES" ${split}

# 允许 vsftpd 加载用户名字列表
modules/_set_conf.sh ${confpath} "userlist_enable" "YES" ${split}

# 打开 tcp 包装器
modules/_set_conf.sh ${confpath} "tcp_wrappers" "YES" ${split}



echo "FTP Security Configuration ..."

# 启用 FTP 用户登录名单
modules/_set_conf.sh ${confpath} "userlist_enable" "YES" ${split}

# 设置 FTP 用户登录名单
modules/_set_conf.sh ${confpath} "userlist_file" ${userpath} ${split}

# 在登录名单里的用户允许登录
modules/_set_conf.sh ${confpath} "userlist_deny" "NO" ${split}

# 限制用户登录后默认在其 home 目录
modules/_set_conf.sh ${confpath} "chroot_local_user" "YES" ${split}

# 允许用户读写其 home 目录下的文件
modules/_set_conf.sh ${confpath} "allow_writeable_chroot" "YES" ${split}



echo "Add FTP login users ..."
# 默认禁止 root 登录 FTP
# echo root >> ${userpath}

for user in `ls /home` 
do
    grep ${user} ${userpath}
    if [[ $? = 0 ]]; then
        echo "Please exec \"passwd ${user}\" with root for login ftp !!!"
        echo "Please exec \"passwd ${user}\" with root for login ftp !!!"
        echo "Please exec \"passwd ${user}\" with root for login ftp !!!"
    else
        echo ${user} >> ${userpath}
        echo "Add ${user}"
    fi
done



service vsftpd restart

echo "Done ."
echo "-------------------------------"
