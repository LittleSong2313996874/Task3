#!bin/bash

echo " $(ps -ef|grep java|grep $1|grep -v "grep"|awk '{print $2}')"



