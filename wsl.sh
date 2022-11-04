#!/bin/bash

# set -x
# set -e

# 配置变量
WSL_DOMAIN="wsl.com"
PORXY_PORT=7890
WSL_FLAG="WSL_ARCH"
# Proxy
# 获取 Windows 宿主机的 ip
WIN_HOST_IP=$(cat /etc/resolv.conf |grep "nameserver" |cut -f 2 -d " ")

export ALL_PROXY="http://${WIN_HOST_IP}:${PORXY_PORT}" # 设置代理，7890为我的代理端口
# echo $ALL_PROXY

# DNS
# Windows Host 文件, 属性 -> 安全 -> 选择当前用户 -> 编辑 -> 允许写入权限
WINDOWS_HOST="/mnt/c/Windows/System32/drivers/etc/hosts"
# https://stackoverflow.com/questions/12850882/sed-permission-denied-when-overwriting-file
COPY_TMP="./TMP_FOR_SED"
WSL_IP=`ifconfig eth0 | grep -o "inet [0-9]*\.[0-9]*\.[0-9]*\.[0-9]*  netmask" | cut -f 2 -d " "`
DNS_LINE_NO=`cat -n ${WINDOWS_HOST} | grep "#${WSL_FLAG}" | awk '{print $1}'`
DNS_IP=`cat ${WINDOWS_HOST} | grep -o "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]* ${WSL_DOMAIN}" | cut -f 1 -d " "`

echo ${WINDOWS_HOST}

# echo $DNS_LINE_NO

# 存在的话就删掉
if [ ${DNS_LINE_NO} ]; then
  touch ${COPY_TMP}
  # echo "loggin: remote before to : $DNS_LINE_NO and write to $COPY_TMP"
  cat ${WINDOWS_HOST} > ${COPY_TMP}
  sed -i "${DNS_LINE_NO}d" ${COPY_TMP}
  cat ${COPY_TMP} > ${WINDOWS_HOST}
  rm ${COPY_TMP}
fi

echo "${WSL_IP} ${WSL_DOMAIN} #${WSL_FLAG} dns config" >> ${WINDOWS_HOST}

echo "Proxy by Windows! ${WIN_HOST_IP}:${PORXY_PORT}, WSL ip is ${WSL_IP}"

# thanks: https://zhuanlan.zhihu.com/p/407559102
