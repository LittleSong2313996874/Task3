#!/bin/sh

PROJECT_LOG_PATH=/usr/local/data/jnshu-home/task1_finally/logs/INFOlog.log

echo ""

echo "项目相关数据:"

echo "访问DB用时(划分时间段):"

echo "访问DB时间为10ms以内的次数是:"
cat ${PROJECT_LOG_PATH} | awk 'BEGIN{sum=0}  {if($5~/com.ss.controller.*/ && $7<10) sum++;} END {print sum}'
echo "访问DB时间为20ms以内的次数是:"

cat ${PROJECT_LOG_PATH} | awk 'BEGIN{sum=0}  {if($5~/com.ss.controller.*/ && $7>=10 && $7<20) sum++;} END {print sum}'

#根据时间分段统计,同上,使用awk命令自带的if语句和BEGIN,END代码块,同时使用//匹配字符串的形式确定是执行访问DB方法的行

echo "访问DB时间为(20ms-30ms)之间的次数是:"

cat ${PROJECT_LOG_PATH} | awk 'BEGIN{sum=0} {if($5~/com.ss.controller.*/ && $7>=20 && $7<40) sum++;} END {print sum}'

echo "访问DB时间为(40ms-60ms)之间的次数是:"

cat ${PROJECT_LOG_PATH} | awk 'BEGIN{sum=0} {if($5~/com.ss.controller.*/ && $7>=40 && $7<60) sum++;} END {print sum}'

echo "访问DB时间为(60ms-80ms)之间的次数是:"

cat ${PROJECT_LOG_PATH} | awk 'BEGIN{sum=0} {if($5~/com.ss.controller.*/ && $7>=60 && $7<80) sum++;} END {print sum}'

echo "访问DB时间为(80ms-100ms)之间的次数是:"

cat ${PROJECT_LOG_PATH} | awk 'BEGIN{sum=0} {if($5~/com.ss.controller.*/ && $7>=80 && $7<100) sum++;} END {print sum}'

echo "访问DB时间为100ms以上的次数是:"

cat ${PROJECT_LOG_PATH} | awk 'BEGIN{sum=0} {if($5~/com.ss.controller.*/ && $7>=100) sum++;} END {print sum}'


echo "总共次数:"

cat ${PROJECT_LOG_PATH} | awk 'BEGIN{sum=0} {if($5~/com.ss.controller.*/ ) sum++;} END {print sum}'

