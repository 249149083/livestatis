#!/bin/sh

function LDATE()
{
        date +"%Y%m%d" -d"1 days ago"
}


if [ $1"AA" = "AA" ]
then
        targetdate=`LDATE`
else
        targetdate=$1
fi


cd `dirname $0`


hadoopdatadir="livestatis/data/${targetdate}/"
hadoop fs -rm -r ${hadoopdatadir}
hadoop fs -mkdir ${hadoopdatadir}
rm -rf /home/logstat/livestatis/test/data/${targetdate}
mkdir -p /home/logstat/livestatis/test/data/${targetdate}/	
for ip in "logagent193" "logagent194" "logagent195"
do
	for((i=0;i<24;i++))
	do
		dd=`printf "%02d" ${i}`
		orifile="root@"${ip}":/data1/logagent/data/${targetdate}/${dd}.log"
		tarfile="/home/logstat/livestatis/test/data/${targetdate}/${dd}_${ip}.log"
		rsync -avp  --bwlimit 40000 ${orifile} ${tarfile} 
		if [ $?"AA" != "0AA" ];then
			echo " [SCP ERROR] in orifile=${orifile} tarfile=${tarfile}"
			continue
		fi
		hadoop fs -put ${tarfile} ${hadoopdatadir}
		if [ $?"AA" != "0AA" ];then
			echo " [hadoop put error ] in orifile=${orifile} tarfile=${tarfile}"
			continue
		fi
		
	done

done


sh livestatis2hive.sh  ${targetdate}
python count.py  ${targetdate}
