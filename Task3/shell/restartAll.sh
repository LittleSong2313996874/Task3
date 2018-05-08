#!/bin/bash

tomcathome=/root/data/tomcat/apache-tomcat-8.5.30
jettyhome=/root/data/jetty/jetty-9.4.9
resinhome=/root/data/resin/Resin_install

# ${file##*/} 拿掉最后一条/及其左边的字串：my.file.txt

function getPid(){

TheID=`ps -ef|grep java|grep "${1##*/}"|grep -v "grep"|awk '{print $2}'`
if [ -n "$TheID" ]; then
echo "${1##*/} pid is : $TheID"
else
 echo "It should be closed: ${1##*/} "
fi
}



function stop(){  #创建函数

if [ -n $1 ]; then
    echo "Shutdown..."
    kill $1
        echo "Please waitting 4 seconds"
    sleep 4

        # ensure again
        getPid $2

       if [ -n "$TheID" ]; then
        kill -9 $TheID
        sleep 1
    else
                echo "The program is already closed . BylittleSong"
        fi

else
    echo "The program is already closed . BylittleSong"

fi

}

function YoN(){
if [ -n $1 ]; then
        
    echo " start successfully,${2##*/} pid: $1"

else
    echo "The program is not Opened, Please check"

fi

}

if [ $# -gt 0 ]; then

        for input in $@
        do

                case $input in

                        1)
                                getPid $tomcathome
                                stop $TheID $tomcathome
                                bash $tomcathome/bin/startup.sh
                                sleep 2
                                getPid $tomcathome
                                YoN $TheID $tomcathome
                                ;;
                        2)
                              
                                #./jetty.sh restart
                                bash $jettyhome/bin/jetty.sh restart
                                ;;
                        3)
                                
                                #./jetty.sh restart
                                bash $resinhome/bin/resin.sh restart
                                ;;
              
                        *)
                        echo "please input 1   2 or 3, Which mean  1:tomcat  2:jetty  3:resin"
                esac

        done

else

   echo "1:tomcat  2:jetty  3:resin"

fi





                                
