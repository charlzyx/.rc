#!/bin/bash

set -x
set -e

# 配置变量
WSL_DOMAIN="wsl.com"
PORXY_PORT=7890

# DNS
# Windows Host 文件, 属性 -> 安全 -> 选择当前用户 -> 编辑 -> 允许写入权限
HOSTS_FILE_WIN="/mnt/c/Windows/System32/drivers/etc/hosts"
WSL_IP=`ifconfig eth0 | grep -o "inet [0-9]*\.[0-9]*\.[0-9]*\.[0-9]*  netmask" | cut -f 2 -d " "`
DNS_LN=`cat -n ${HOSTS_FILE_WIN} | grep ${WSL_DOMAIN} | awk '{print $1}'`
DNS_IP=`cat ${HOSTS_FILE_WIN} | grep -o "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]* ${WSL_DOMAIN}" | cut -f 1 -d " "`

if [ ${DNS_LN} ]; then
    echo 'has settings'
    if [ ${WSL_IP} != ${DNS_IP} ]; then
        echo 'bad settings'
        sed -i "${DNS_LN}d" ${HOSTS_FILE_WIN}
        echo "${WSL_IP} ${WSL_DOMAIN} #wsl dns config" >> ${HOSTS_FILE_WIN}
    fi
else
    echo 'no settings'
    echo "${WSL_IP} ${WSL_DOMAIN} #wsl dns config" >> ${HOSTS_FILE_WIN}
fi

# Proxy
WIN_HOST_IP=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")

export ALL_PROXY="http://$WIN_HOST_IP:$PORXY_PORT"

echo "Proxy by Host Windows! $WIN_HOST_IP:$PORXY_PORT, WSL ip is $WSL_IP"

# thanks: https://zhuanlan.zhihu.com/p/407559102
