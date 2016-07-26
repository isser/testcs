#!/bin/bash --login

serverName="stairKBS"
tomcatBinPath="/home/aikbs/tomcat-6.0.43-10090/bin"
warPrefix="stairkbs"
serverPort="10090"


cd $tomcatBinPath

if [[ $1 = "clean" ]];then
  echo "-----------------------"
  cd ../webapps
  rm -rf ${warPrefix}*
  echo "-----------------------"


elif [[ $1 = "renew" ]];then
  echo "-----------------------"
  cd ../webapps
  unzip -oq ${warPrefix}.war -d ${warPrefix}
  rm -rf ${warPrefix}.war 
  echo "-----------------------"


elif [[ $1 = "start" ]];then
  echo "-----------------------"
  ./startup.sh
  echo "-----------------------"


elif [[ $1 = "stop" ]];then
  echo "-----------------------"
  ./shutdown.sh
  sleep 5
  ps -ef|grep java|grep $serverName |awk '{print $2}' |xargs kill -9
  echo "-----------------------"


elif [[ $1 = "restart" ]];then
  echo "-----------------------"
  ./shutdown.sh
  sleep 5
  ps -ef|grep java|grep $serverName |awk '{print $2}' |xargs kill -9
  echo "-----------------------"
  ./startup.sh
  echo "-----------------------"


elif [[ $1 = "log" ]];then
  echo "-----------------------"
  tail -f ../logs/catalina.out
  echo "-----------------------"


else
  echo "Process :--"
  ps -ef|grep java | grep `whoami` |grep $serverName | grep -v grep
  echo "Port    :--"
  netstat -na|grep :$serverPort |grep LISTEN
  echo ""
fi
