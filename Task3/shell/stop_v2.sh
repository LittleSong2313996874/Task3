#!/bin/bash
#kill tomcat pid
a=$1
pidlist=`ps -ef|grep java|grep "$a"|grep -v "grep"|awk '{print $2}'`
function stop(){#��������
if [ "$pidlist" == "" ]
  then
    echo "----Tomcat-test �Ѿ��ر�----"
    exit 0
 else
    echo -e "$a ���̺� :\n$pidlist"
    kill -9 $pidlist
    echo -e "KILL $pidlist"
fi
}

stop#���ú���
pidlist2=`ps -ef|grep tomcat-test|grep -v "grep"|awk '{print $2}'`
if [ "$pidlist2" == "" ]
    then 
       echo "----�ر�$a�ɹ�----"
else
    echo "----�ر�$aʧ��----"
fi