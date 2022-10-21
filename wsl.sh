#!/bin/bash

${WSL_HOST:="wsl.com"}
${WIN_PORXY_PORT:=7890}

# Windows Host 文件, 属性 -> 安全 -> 选择当前用户 -> 编辑 -> 允许写入权限
HOSTS_FILE_WIN='/mnt/c/Windows/System32/drivers/etc/hosts'
# 获取 WSL 的 IP
WSL_IP=`ifconfig eth0 | grep -o "inet [0-9]*\.[0-9]*\.[0-9]*\.[0-9]*  netmask" | cut -f 2 -d " "`
# 获取 Windows 宿主机的 Ip
WIN_HOST_IP=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")
# 尝试 获取 windows hosts 文件中 wsl2 所在的行号
LINE_NO =`cat -n ${HOSTS_FILE_WIN} | grep wsl2 | awk '{print $1}'`
# 尝试 获取 windows hosts 文件中 已经设置的 ip
DNS_IP=`cat ${HOSTS_FILE_WIN} | grep -o "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]* ${WSL_HOST} #wsl2" | cut -f 1 -d " "`

# set -x
set -e
if [ ${LINE_NO} ]  # 若已设置
then
        if [ ${WSL_IP} != ${DNS_IP} ] # 已设置dns不正确
        then
                echo reset
                sed -i "${LINE_NO}d" ${HOSTS_FILE_WIN}  # 删除对应行
                echo "${WSL_IP} ${WSL_HOST} #wsl2 dns config" >> ${HOSTS_FILE_WIN} # 重新设置
        fi
else # 未设置
        echo "${WSL_IP} ${WSL_HOST} #wsl2 dns config" >> ${HOSTS_FILE_WIN} # 直接设置
fi


export ALL_PROXY="http://$WIN_HOST_IP:${WIN_PORXY_PORT}" # 设置代理，7890为我的代理端口

echo "Proxy by Windows! $WIN_HOST_IP:${WIN_PORXY_PORT}, WSL's ip is $WSL_IP"

# thanks: https://zhuanlan.zhihu.com/p/407559102
