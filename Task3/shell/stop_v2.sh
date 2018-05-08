#!/bin/bash
#kill tomcat pid
a=$1
pidlist=`ps -ef|grep java|grep "$a"|grep -v "grep"|awk '{print $2}'`
function stop(){#创建函数
if [ "$pidlist" == "" ]
  then
    echo "----Tomcat-test 已经关闭----"
    exit 0
 else
    echo -e "$a 进程号 :\n$pidlist"
    kill -9 $pidlist
    echo -e "KILL $pidlist"
fi
}

stop#调用函数
pidlist2=`ps -ef|grep tomcat-test|grep -v "grep"|awk '{print $2}'`
if [ "$pidlist2" == "" ]
    then 
       echo "----关闭$a成功----"
else
    echo "----关闭$a失败----"
fi