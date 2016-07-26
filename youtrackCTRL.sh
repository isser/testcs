


serverPath="/home/ciserver/youtrack"
serverPort="8000"
serverName="youtrack"

if [ -z $1 ];then
 
  echo "Command not finished, parameter like stop/start/restart must be set."
  exit 0
fi



cd $serverPath


if [ $1 = "start" ];then
  echo "-----------------------"
  nohup java -Xmx1g -XX:MaxPermSize=250m -Djava.awt.headless=true -jar youtrack-6.0.12634.jar 10.11.20.120:${serverPort}/${serverName}  >> youtrack.log  2>&1 &
  echo "-----------------------"
  tail -f youtrack.log
fi


if [ $1 = "stop" ];then
  echo "-----------------------"
  ps -ef|grep java|grep $serverName |grep -v grep |awk '{print $2}' |xargs kill -9
  echo "-----------------------"
fi



if [ $1 = "status" ];then
  echo "-----------------------"
  ps -ef|grep java|grep $serverName |grep -v grep
  echo "-----------------------"
  netstat -na|grep LISTEN|grep :$serverPort
  echo "-----------------------"
fi


if [ $1 = "log" ];then
  echo "-----------------------"
  tail -f youtrack.log
fi


