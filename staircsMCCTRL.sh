#!/bin/bash --login

serverName="stairCSmc"
serverPath="/home/aikbs/memcached-1.4.22"
serverPort="12302"


cd $serverPath


if [[ $1 = "start" ]];then
  echo "-----------------------"
# -d  启动一个守护（daemon）进程
# -m  分配给 memcache 使用的内存数量，单位是MB
# -u  运行 memcache 的用户
# -l  监听的服务器IP地址
# -p  设置 memcache 监听的端口，端口最好大于1024
# -c  设置 memcache 最大运行的并发连接数，默认是1024
# -P  设置保存 memcache 的pid文件地址
  /usr/local/memcached-1.4/bin/memcached -d -m 200 -u `whoami`  -p ${serverPort} -c 256 -P ${serverPath}/${serverName}.pid
  echo "-----------------------"


elif [[ $1 = "stop" ]];then
  echo "-----------------------"
   kill `cat ${serverPath}/${serverName}.pid`
  echo "-----------------------"


else
  echo "Process :--"
  ps -ef|grep $serverName | grep -v grep |grep -v CTRL
  echo "Port    :--"
  netstat -na|grep :$serverPort |grep LISTEN
  echo ""
fi


