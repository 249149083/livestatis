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
input=livestatis/data/$targetdate
output=livestatis/result_tmp/$targetdate
streaming=/usr/lib/hadoop-mapreduce/hadoop-streaming.jar
echo "######   targetdate=${targetdate}   ######"
echo "######   input     =${targetdate}   ######"
echo "######   output    =${targetdate}   ######"
echo "######   starttime = `date +"%Y%m%d %T"` "

hadoop fs -rm -r -skipTrash $output 2 >/dev/null
#hadoop jar $streaming -Dmapred.output.compress=true -Dmapred.output.compression.codec=com.hadoop.compression.lzo.LzoCodec -Dmapred.output.compression.type=BLOCK -Dmapred.compress.map.output=true -Dmapred.map.output.compression.codec=com.hadoop.compression.lzo.LzoCodec -input $input -output $output -mapper "mapper.py" -file mapper.py -cmdenv targetday=${targetdate}  || alarm "hadoop error"
#hadoop jar $streaming -Dmapred.output.compress=true  -D stream.non.zero.exit.is.failure=false -Dmapred.reduce.tasks=1 -Dmapred.output.compression.type=BLOCK -Dmapred.compress.map.output=true -input $input -output $output -mapper "mapper.py" -file mapper.py -file unit.py -reducer "reducer.py" -file "reducer.py" -cmdenv targetday=${targetdate}  || alarm "hadoop error"
hadoop jar $streaming -Dmapred.reduce.tasks=1 -input $input -output $output -mapper "mapper.py" -file mapper.py -file unit.py -reducer "reducer.py" -file "reducer.py" -cmdenv targetday=${targetdate}  || alarm "hadoop error"

hadoop fs -text ${output}/part*  > "r1"${targetdate}

echo "######   endttime   = `date +"%Y%m%d %T"` "

input=livestatis/result_tmp/$targetdate/part*
output=livestatis/result/$targetdate
streaming=/usr/lib/hadoop-mapreduce/hadoop-streaming.jar


hadoop fs -rm -r -skipTrash $output 2 >/dev/null
#hadoop jar $streaming -Dmapred.output.compress=true  -D stream.non.zero.exit.is.failure=false -Dmapred.reduce.tasks=1 -Dmapred.output.compression.type=BLOCK -Dmapred.compress.map.output=true -input $input -output $output -mapper "mapper_uid.py" -file mapper_uid.py -reducer "reducer_uid.py" -file reducer_uid.py -file conf.py -cmdenv targetday=${targetdate}  || alarm "hadoop error"
hadoop jar $streaming -Dmapred.reduce.tasks=10 -input $input -output $output -mapper "mapper_uid.py" -file mapper_uid.py -reducer "reducer_uid.py" -file reducer_uid.py -file unit.py -cmdenv targetday=${targetdate}  || alarm "hadoop error"

hadoop fs -text ${output}/part*  > "r2"${targetdate}
