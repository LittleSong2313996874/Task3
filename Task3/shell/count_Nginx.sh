#!/bin/sh

LOG_PATH=/usr/local/nginx/logs/access.log


echo "Nginx相关数据:"

echo "所有访问次数为:"

cat ${LOG_PATH} | wc -l   # //这一句是统计访问Nginx中该服务的次数

echo "Nginx响应时间(划分时间段):"

echo "响应时间为20ms以内的次数是:"

cat ${LOG_PATH} | awk 'BEGIN{sum=0} {if($NF<0.020) sum++;} END {print sum}'      

#根据时间分段统计,使用awk命令自带的if语句和BEGIN,END代码块

echo "响应时间为(0.020ms-0.030ms)之间的次数是:"

cat ${LOG_PATH} | awk 'BEGIN{sum=0} {if(($NF>=0.020)&&($NF<0.030)) sum++;} END {print sum}'

echo "响应时间为(0.030ms-0.040ms)之间的次数是:"

cat ${LOG_PATH} | awk 'BEGIN{sum=0} {if(($NF>=0.030)&&($NF<=0.040)) sum++;} END {print sum}'

echo "响应时间为(0.040ms-0.050ms)以内的次数是:"

cat ${LOG_PATH} | awk 'BEGIN{sum=0} {if(($NF>0.040)&&($NF<=0.050)) sum++;} END {print sum}'


echo "响应时间超过0.050ms的次数是:"

cat ${LOG_PATH} | awk 'BEGIN{sum=0} {if($NF>0.050) sum++;} END {print sum}'

echo ""
