#!/bin/bash

function CDATE()
{
	date +"%Y%m%d"
}

targetdate=`CDATE`

function LDATE()
{
	date +"%Y%m%d" -d"1 days ago"
}

function alarm()
{
        /usr/bin/AlarmClient "S_dms3" "lv3" "livestatis ERROR " "$1"
}

function fault()
{
        echo "Error: $1"
        alarm "$1"
        exit 1
}

workdir=`dirname $0`
cd $workdir

lastdate=`LDATE`

if [ $1"AA" = "AA" ]
then
	targetdate=`LDATE`
else
	targetdate=$1
fi
input=/data/log/client/real/$targetdate
output=result/liyang/mod_operation_indicator/$targetdate
streaming=/opt/cloudera/parcels/CDH/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming.jar
echo "######   targetdate=${targetdate}   ######"
echo "######   input     =${targetdate}   ######"
echo "######   output    =${targetdate}   ######"
echo "######   starttime = `date +"%Y%m%d %T"` "

hadoop fs -rm -r -skipTrash $output 2 >/dev/null
hadoop jar $streaming -Dmapred.output.compress=true -Dmapred.output.compression.codec=com.hadoop.compression.lzo.LzoCodec -Dmapred.output.compression.type=BLOCK -Dmapred.compress.map.output=true -Dmapred.map.output.compression.codec=com.hadoop.compression.lzo.LzoCodec -input $input -output $output -mapper "mapper.py" -file mapper.py -reducer "reducer.py" -file reducer.py  -cmdenv targetday=${targetdate}  || alarm "hadoop error"

echo "######   endttime   = `date +"%Y%m%d %T"` "
