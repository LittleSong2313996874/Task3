#!/bin/bash

tomcathome=/root/data/tomcat/apache-tomcat-8.5.30
jettyhome=/root/data/jetty/jetty-9.4.9
resinhome=/root/data/resin/Resin_install


if [ $# -gt 0 ]; then

        for input in $@
        do

                case $input in

                        1)
                                bash $tomcathome/bin/startup.sh
                                ;;
                        2)
                              
                                #./jetty.sh restart
                                bash $jettyhome/bin/jetty.sh start
                                ;;
                        3)
                                
                                #./jetty.sh restart
                                bash $resinhome/bin/resin.sh start
                                ;;
              
                        *)
                        echo "please input 1   2 or 3, Which mean  1:tomcat  2:jetty  3:resin"
                esac

        done

else

   echo "1:tomcat  2:jetty  3:resin"

fi





                                
