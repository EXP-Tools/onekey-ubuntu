#!/bin/bash
#----------------------------

MODULE="ftp"
echo "+++++++++++++++++++++++++++++++"
echo "SETTING [${MODULE}]"

set_ftp_conf() {
    key=$1
    val=$2
    conf_path="/etc/vsftpd.conf"

    from1="^#${key}=.*"
    from2="^${key}=.*"
    to="${key}=${val}"

    grep "${from1}" ${conf_path}
    if [[ $? = 0 ]]; then
        sed -i "s/${from1}/${to}/g" ${conf_path}
    else
        grep "${from2}" ${conf_path}
        if [[ $? = 0 ]]; then
            sed -i "s/${from2}/${to}/g" ${conf_path}
        else
            echo "${to}" >> ${conf_path}
        fi
    fi
    echo "Setted ${to}"
}


echo "Install FTP ..."
apt-get install -y vsftpd
systemctl enable vsftpd



echo "FTP Configuration ..."

# 关闭匿名登录
set_ftp_conf "anonymous_enable" "NO"

# 允许本地用户登录
set_ftp_conf "local_enable" "YES"

# 启用可以修改文件的 FTP 命令
set_ftp_conf "write_enable" "YES"

# 本地用户创建文件的 umask 值
set_ftp_conf "local_umask" "022"

# 当用户第一次进入新目录时显示提示消息
set_ftp_conf "dirmessage_enable" "YES"

# 一个存有详细的上传和下载信息的日志文件
set_ftp_conf "xferlog_enable" "YES"

# 在服务器上针对 PORT 类型的连接使用端口 20（FTP 数据）
set_ftp_conf "connect_from_port_20" "YES"

# 保持标准日志文件格式
set_ftp_conf "xferlog_std_format" "YES"

# 阻止 vsftpd 在独立模式下运行
set_ftp_conf "listen" "YES"

# 监听 ipv6 而不是 IPv4，可以根据你的网络情况设置
set_ftp_conf "listen_ipv6" "NO"

# vsftpd 将使用 PAM 验证设备的名字
set_ftp_conf "pam_service_name" "YES"

# 允许 vsftpd 加载用户名字列表
set_ftp_conf "userlist_enable" "YES"

# 打开 tcp 包装器
set_ftp_conf "tcp_wrappers" "YES"



echo "FTP Security Configuration ..."

# 启用 FTP 用户登录名单
set_ftp_conf "userlist_enable" "YES"

# 设置 FTP 用户登录名单
user_path="/etc/vsftpd.userlist"
touch ${user_path}
set_ftp_conf "userlist_file" ${user_path}

# 在登录名单里的用户允许登录
set_ftp_conf "userlist_deny" "NO"

# 限制用户登录后默认在其 home 目录
set_ftp_conf "chroot_local_user" "YES"

# 允许用户读写其 home 目录下的文件
set_ftp_conf "allow_writeable_chroot" "YES"


echo "Add FTP login users ..."
# 默认禁止 root 登录 FTP
# echo root >> ${user_path}

for user in `ls /home` 
do
    grep ${user} ${user_path}
    if [[ $? = 0 ]]; then
        echo "Please exec \"passwd ${user}\" with root for login ftp !!!"
        echo "Please exec \"passwd ${user}\" with root for login ftp !!!"
        echo "Please exec \"passwd ${user}\" with root for login ftp !!!"
    else
        echo ${user} >> ${user_path}
        echo "Add ${user}"
    fi
done




service vsftpd restart

echo "Done ."
echo "-------------------------------"