#!/bin/bash
tomcathome=/root/data/tomcat/apache-tomcat-8.5.30
jettyhome=/root/data/jetty/jetty-9.4.9
resinhome=/root/data/resin/Resin_install
deployPath=/root/mywork/deploye

function deploy(){

	rm -rf $1/webapps/*	
	cd $deployPath
	cp *.war $1/webapps
	cd $1/webapps
        mkdir ROOT
	cd ROOT
        SERVER=${1##*/}
	var1="<html><head><title>$SERVER Default Home Page</title></head><body>"
	var2="<h1 style=\"background: #ccddff\" >$SERVER Default Home Page</h1></body></html>"      
	var3=${var1}${var2}
	echo $var3 > index.jsp
	cd ..
	ls

}


if [ $# -gt 0 ]; then

        for input in $@
        do

            case $input in

                1)
				deploy $tomcathome
				;;
                2)
				deploy $jettyhome								
                ;;
                3)
                 deploy $resinhome		            					
                 ;;
              
				*)
				echo "please input 1   2 or 3, Which mean  1:tomcat  2:jetty  3:resin"
            esac

        done

else

   echo "1:tomcat  2:jetty  3:resin"

fi

