#!/usr/local/bin/python
# coding=utf8
import subprocess
from ctypes import *
import time
import os
import sys
import datetime
import string
import lyutils
import pdb
import platform
import MySQLdb
from conf import *
from lyutils import ExecHql
from lyutils import ExecCmd
from lyutils import HiveToFile_AddJar
from lyutils import HiveToFile_AddJar_Append 
from lyutils import Mysql_Loadfile
from lyutils import Mysql_Loadfile_retion


os.chdir('/home/logstat/livestatis/etl2hive')

if len(sys.argv) == 2 :
	try:
		td = sys.argv[1]
		td_time = datetime.datetime.strptime( td, "%Y%m%d" )
	except :
		print "argv[1] error"
		exit(1)
else :
	print "1"
	td_time = lyutils.get_last_time(datetime.date.today(), 1, "day")
	td = td_time.strftime( "%Y%m%d")

#dropday = lyutils.get_last_time(td_time, 45 , "day" )



etldata = "livestatis/result/%s/part*" % td
livetodaytable = "livetodaytable" + td
fulllivetodaytable = " fulllivetodaytable1_" + td
fulllivetodaytable2 = " fulllivetodaytable2_" + td
##############   创建 每天的日志表  
print ''' ##############   创建 每天的日志表  '''
hql = " drop table %s " % livetodaytable
ExecHql(hql)

hql = " create table %s( "  % livetodaytable
print "fields=" , fields
for f in  fields:
	print "f=" ,f 
	hql = hql + f + " " + fields[f] + ' ,'
hql = hql[:len(hql)-1] + " ) row format delimited  fields terminated by '\t' "  

ExecHql(hql)

####  加载数据到每天的日志表
print ''' 加载数据到每天的日志表 '''

cmd = " hadoop fs -cp %s /user/hive/warehouse/%s  " % ( etldata , livetodaytable )
ExecCmd(cmd)

#############   计算新增用户(CID) 
# 规则： 只要出现就算新增 , liveHistorytable_cid 新增CID ， liveHistorytable_cid 新增UID 
print ''' #############   计算新增用户(CID) '''
print '''# 规则： 只要出现就算新增 , liveHistorytable_cid 新增CID ， liveHistorytable_cid 新增UID '''

hql = " alter table liveHistorytable_cid  DROP PARTITION (dt='%s') " % td
ExecHql(hql)

hql = "  alter table liveHistorytable_cid ADD PARTITION (dt='%s') " % td
ExecHql(hql)

hql = ''' insert overwrite table liveHistorytable_cid partition(dt='%s') select '''  % td 
for f in fields :
	hql = hql + "%s.%s ," % ( livetodaytable , f ) 
hql = hql[:len(hql)-1] 
hqltail = ''' from %s left outer join ( select cid from liveHistorytable_cid where dt<'%s' ) history on ( %s.cid = history.cid  ) where history.cid is null and %s.cus_firstcid='1' ''' % (  livetodaytable , td , livetodaytable , livetodaytable ) 
hql = hql + hqltail 
ExecHql(hql)

##############   计算新增用户(UID) '''
# # 规则： 只要出现就算新增 , liveHistorytable_cid 新增UID ， liveHistorytable_uid 新增UID '''
print ''' ##############   计算新增用户(UID) '''
print ''' # 规则： 只要出现就算新增 , liveHistorytable_cid 新增UID ， liveHistorytable_uid 新增UID '''

hql = " alter table liveHistorytable_uid  DROP PARTITION (dt='%s') " % td
ExecHql(hql)

hql = "  alter table liveHistorytable_uid ADD PARTITION (dt='%s') " % td
ExecHql(hql)

hql = ''' insert overwrite table liveHistorytable_uid partition(dt='%s') select '''  % td 
for f in fields :
	hql = hql + "%s.%s ," % ( livetodaytable , f ) 
hql = hql[:len(hql)-1] 
hqltail = ''' from %s left outer join ( select uid from liveHistorytable_uid where dt<'%s' ) history on ( %s.uid = history.uid  ) where history.uid is null and %s.cus_firstuid='1' ''' % (  livetodaytable , td , livetodaytable , livetodaytable ) 
hql = hql + hqltail 
ExecHql(hql)
#####


##############   创建 每天的扩展表  
print ''' ##############   创建 每天的扩展表  '''

hql = " drop table %s " % fulllivetodaytable
ExecHql(hql)

hql = " create table %s( "  % fulllivetodaytable
for f in fullfields :
	hql = hql + f + " " + fullfields[f] + ' ,'
hql = hql[:len(hql)-1] + " ) "  

ExecHql(hql)

hql = "insert overwrite table %s   select  " % (  fulllivetodaytable )
for f in fields :
	hql = hql + " %s.%s ," % ( livetodaytable , f ) 
hqltail = '''  ( case when history.dt='%s' then 1 else 0 end ) , history.chid  from %s inner join ( select cid , chid , dt  from liveHistorytable_cid where dt<='%s' ) history on ( %s.cid = history.cid ) ''' % (  td , livetodaytable , td , livetodaytable  )  
hql = hql + hqltail
ExecHql(hql)


hql = " drop table %s " % fulllivetodaytable2
ExecHql(hql)

hql = " create table %s( "  % fulllivetodaytable2
for f in fullfields2 :
	hql = hql + f + " " + fullfields2[f] + ' ,'
hql = hql[:len(hql)-1] + " ) "  

ExecHql(hql)

hql = "insert overwrite table %s   select  " % ( fulllivetodaytable2  )
for f in fullfields :
	hql = hql + " %s.%s ," % ( fulllivetodaytable , f ) 
hqltail = '''  ( case when history.dt='%s' then 1 else 0 end ) , history.chid  from %s inner join ( select uid , chid , dt  from liveHistorytable_uid where dt<='%s' ) history  on ( %s.uid = history.uid ) ''' % (  td ,  fulllivetodaytable  , td , fulllivetodaytable  )  
hql = hql + hqltail
ExecHql(hql)

###### 真正开始的统计项 : 渠道充值 , ID = 1 
print ''' ###### 真正开始的统计项 : 渠道充值 , ID = 1 '''
statisfile = 'statis_1_' + td + '.xls' 
mysqltb    = 'statis_1'

hql = '''        select '%s' , cus_platform , chid , 
		 count ( distinct case when is_cidnew='1' then cid else NULL end ) activation_num ,  
		 count ( distinct case when act='start' then cid else NULL end ) active_num , 
		 count ( distinct case when act='pay' then cid else NULL end )  device_recharge_num , 
		 sum ( case when act='pay' then price else 0 end ) device_recharge_money, 
		 count ( distinct case when is_uidnew='1' then uid else NULL end )  register_num, 
		 count ( distinct case when act='login' then uid else NULL end ) login_num 
		 from %s group by cus_platform , chid 
	''' % ( td , fulllivetodaytable2 )
HiveToFile_AddJar(hql , statisfile )

hql = '''        select '%s' , cus_platform , 'all' , 
		 count ( distinct case when is_cidnew='1' then cid else NULL end ) activation_num ,  
		 count ( distinct case when act='start' then cid else NULL end ) active_num , 
		 count ( distinct case when act='pay' then cid else NULL end )  device_recharge_num , 
		 sum ( case when act='pay' then price else 0 end ) device_recharge_money, 
		 count ( distinct case when is_uidnew='1' then uid else NULL end )  register_num, 
		 count ( distinct case when act='login' then uid else NULL end ) login_num 
		 from %s group by cus_platform 
	''' % ( td , fulllivetodaytable2 )
HiveToFile_AddJar_Append(hql , statisfile )
Mysql_Loadfile( statisfile , mysqltb , td )

###### 真正开始的统计项 : 渠道充值 , ID = 2 
print ''' ###### 真正开始的统计项 : 渠道充值 , ID = 2 '''
statisfile = 'statis_2_' + td + '.xls' 
mysqltb    = 'statis_2'

hql = '''        select '%s' , cus_platform , 
		 uid_register_chid , 
		 count( distinct case when act='pay' then uid else null end  ) , 
		 sum( case when act='pay' then price else 0 end )  
		 from %s group by cus_platform , uid_register_chid
	''' % ( td  , fulllivetodaytable2 )
HiveToFile_AddJar(hql , statisfile )


hql = '''        select '%s' , cus_platform , 
		 'all' , 
		 count( distinct case when act='pay' then uid else null end  ) , 
		 sum( case when act='pay' then price else 0 end ),
		 sum( case when act='pay' then price else 0 end )/count( distinct case when act='pay' then uid else null end  ) 
		 from %s group by cus_platform
	''' % ( td  , fulllivetodaytable2 )

HiveToFile_AddJar_Append(hql , statisfile )
Mysql_Loadfile( statisfile , mysqltb , td )

####### 终端类型统计(渠道） ID = 6  
print ''' ####### 终端类型统计(渠道） ID = 6  '''
statisfile = 'statis_6_' + td + '.xls' 
mysqltb    = 'statis_6'

hql = ''' select '%s' , cus_platform , chid , dev ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , chid , dev ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar(hql , statisfile )

hql = ''' select '%s' , cus_platform , chid , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , chid  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

hql = ''' select '%s' , cus_platform , 'all' , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )
Mysql_Loadfile( statisfile , mysqltb , td )

####### 终端类型统计(渠道） ID = 5  
print ''' ####### 终端类型统计(渠道） ID = 5  '''
statisfile = 'statis_5_' + td + '.xls' 
mysqltb    = 'statis_5'

hql = ''' select '%s' , cus_platform , cus_version , dev ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , cus_version  , dev ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar(hql , statisfile )

hql = ''' select '%s' , cus_platform , cus_version , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , cus_version  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

hql = ''' select '%s' , cus_platform , 'all' , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )
Mysql_Loadfile( statisfile , mysqltb , td )

####### 终端类型统计(渠道） ID = 7  
print '''####### 终端类型统计(渠道） ID = 7  '''
statisfile = 'statis_7_' + td + '.xls' 
mysqltb    = 'statis_7'

hql = ''' select '%s' , cus_platform , chid , cus_isp , net , count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , chid , cus_isp , net   ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar(hql , statisfile )

hql = ''' select '%s' , cus_platform , chid , cus_isp , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , chid , cus_isp  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

hql = ''' select '%s' , cus_platform , chid , 'all' , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , chid  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

hql = ''' select '%s' , cus_platform , 'all' , 'all' , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

Mysql_Loadfile( statisfile , mysqltb , td )

####### 终端类型统计(渠道） ID = 8  
print ''' ####### 终端类型统计(渠道） ID = 8  '''
statisfile = 'statis_8_' + td + '.xls' 
mysqltb    = 'statis_8'

hql = ''' select '%s' , cus_platform , cus_version , cus_isp , net , count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , cus_version , cus_isp , net   ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar(hql , statisfile )

hql = ''' select '%s' , cus_platform , cus_version , cus_isp , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , cus_version , cus_isp  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

hql = ''' select '%s' , cus_platform , cus_version , 'all' , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , cus_version  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

hql = ''' select '%s' , cus_platform , 'all' , 'all' , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

Mysql_Loadfile( statisfile , mysqltb , td )

####### 终端类型统计(版本） ID = 9  
print ''' ####### 终端类型统计(版本） ID = 9  '''
statisfile = 'statis_9_' + td + '.xls' 
mysqltb    = 'statis_9'

hql = ''' select '%s' , cus_platform , chid , cus_province , cus_city ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , chid , cus_province , cus_city    ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar(hql , statisfile )

hql = ''' select '%s' , cus_platform , chid , cus_province , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , chid , cus_province  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

hql = ''' select '%s' , cus_platform , chid , 'all' , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , chid ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

hql = ''' select '%s' , cus_platform , 'all' , 'all' , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

Mysql_Loadfile( statisfile , mysqltb , td )

####### 终端类型统计(版本） ID = 10  
print ''' ####### 终端类型统计(版本） ID = 10  '''
statisfile = 'statis_10_' + td + '.xls' 
mysqltb    = 'statis_10'

hql = ''' select '%s' , cus_platform , cus_version , cus_province , cus_city ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , cus_version , cus_province , cus_city    ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar(hql , statisfile )

hql = ''' select '%s' , cus_platform , cus_version , cus_province , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , cus_version , cus_province  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

hql = ''' select '%s' , cus_platform , cus_version , 'all' , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform , cus_version ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

hql = ''' select '%s' , cus_platform , 'all' , 'all' , 'all' ,  count(*) , count(distinct cid ) ,  count(*) / count( distinct cid ) from %s group by cus_platform  ''' % ( td , fulllivetodaytable2 ) 
HiveToFile_AddJar_Append(hql , statisfile )

Mysql_Loadfile( statisfile , mysqltb , td )

####### 留存统计   1，2，3，4，5，6，7，14，30日留存统计（渠道）  ID = 3  
print ''' ####### 留存统计   1，2，3，4，5，6，7，14，30日留存统计（渠道）  ID = 3  '''

mysqltb = "statis_3"
statisfile = 'statis_3_%s.xls'  % ( td )
open( './result/' + statisfile , 'w').close()

#for t in [ 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 14 , 30 ] :
#for t in [ 0 , 1 ] :
for t in [ 0 , 1  , 3  , 7 ] :
	delta = t 

	retionday_time = lyutils.get_last_time(td_time, delta, "day")
	retionday = retionday_time.strftime( "%Y%m%d")
	print '''##### 开始计算 %s 的  %d 日渠道留存  ''' % ( retionday , delta ) 

	hql = ''' drop table liveretion_chid_%d_%s ''' % ( delta , retionday ) 
	ExecHql(hql)
	
	tdtb = ''' livetodaytable%s ''' % td
	hql = ''' create table liveretion_chid_%d_%s as select  new.cus_platform , new.chid , new.cid from ( select cus_platform , chid , cid from livehistorytable_cid where dt='%s' group by cus_platform , chid , cid ) new inner join  ( select cus_platform , chid , cid from %s group by cus_platform , chid , cid ) tdtb on ( new.cus_platform = tdtb.cus_platform and new.chid = tdtb.chid  and new.cid = tdtb.cid ) group by new.cus_platform , new.chid , new.cid '''  % ( delta , retionday , retionday  , tdtb )
	ExecHql(hql)
	
	hql = ''' drop table fenzi_chid_%d_%s ''' % ( delta , retionday )
	ExecHql(hql)
	hql = ''' create table fenzi_chid_%d_%s as select cus_platform , chid , count( distinct cid ) fenzinum from liveretion_chid_%d_%s group by cus_platform , chid ''' % ( delta , retionday , delta , retionday ) 
	ExecHql(hql)
	
	hql = ''' drop table fenmu_chid_%d_%s ''' % ( delta , retionday )
	ExecHql(hql)
	hql = ''' create table fenmu_chid_%d_%s as select cus_platform , chid , count( distinct cid ) fenmunum from  livehistorytable_cid where dt='%s' group by cus_platform , chid ''' % ( delta , retionday , retionday  ) 
	ExecHql(hql)
	
	hql = ''' select '%s' , '%d' , fenzi.cus_platform , fenzi.chid  , fenzi.fenzinum , fenmu.fenmunum , fenzi.fenzinum/fenmu.fenmunum , '%s' from fenzi_chid_%d_%s fenzi inner join fenmu_chid_%d_%s fenmu on ( fenzi.cus_platform = fenmu.cus_platform and  fenzi.chid = fenmu.chid ) '''  % ( retionday , delta , td , delta , retionday  , delta , retionday   )  
	HiveToFile_AddJar_Append( hql , statisfile ) 

	print ''' ####### 开始计算 %s 的  %d 日渠道留存  ( ALL ) ##### ''' % ( retionday , delta ) 
	hql = ''' drop table liveretion_all_chid_%d_%s ''' % ( delta , retionday ) 
	ExecHql(hql)
	
	tdtb = ''' livetodaytable%s ''' % td
	hql = ''' create table liveretion_all_chid_%d_%s as select  new.cus_platform , new.cid from ( select cus_platform , cid from livehistorytable_cid where dt='%s' group by cus_platform , cid ) new inner join  ( select cus_platform , cid from %s group by cus_platform , cid ) tdtb on ( new.cus_platform = tdtb.cus_platform and new.cid = tdtb.cid ) group by new.cus_platform , new.cid '''  % ( delta , retionday , retionday  , tdtb )
	ExecHql(hql)
	
	hql = ''' drop table fenzi_all_chid_%d_%s ''' % ( delta , retionday )
	ExecHql(hql)
	hql = ''' create table fenzi_all_chid_%d_%s as select cus_platform , count( distinct cid ) fenzinum from liveretion_all_chid_%d_%s group by cus_platform ''' % ( delta , retionday , delta , retionday ) 
	ExecHql(hql)
	
	hql = ''' drop table fenmu_all_chid_%d_%s ''' % ( delta , retionday )
	ExecHql(hql)
	hql = ''' create table fenmu_all_chid_%d_%s as select cus_platform , count( distinct cid ) fenmunum from  livehistorytable_cid where dt='%s' group by cus_platform  ''' % ( delta , retionday , retionday  ) 
	ExecHql(hql)
	
	hql = ''' select '%s' , '%d' , fenzi.cus_platform ,  'all' , fenzi.fenzinum , fenmu.fenmunum , fenzi.fenzinum/fenmu.fenmunum , '%s' from fenzi_all_chid_%d_%s fenzi inner join fenmu_all_chid_%d_%s fenmu on ( fenzi.cus_platform = fenmu.cus_platform ) '''  % ( retionday , delta , td , delta , retionday , delta , retionday )  
	HiveToFile_AddJar_Append( hql , statisfile ) 


Mysql_Loadfile_retion( statisfile , mysqltb , td )




####### 留存统计   1，2，3，4，5，6，7，14，30日留存统计（版本）  ID = 4  
print ''' ####### 留存统计   1，2，3，4，5，6，7，14，30日留存统计（版本）  ID = 4  '''

mysqltb = "statis_4"
statisfile = 'statis_4_%s.xls'  % ( td )
open( './result/' + statisfile , 'w').close()

#for t in [ 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 14 , 30 ] :
#for t in [ 0 , 1 ] :
for t in [ 0 , 1  , 3  , 7 ] :
	delta = t 

	retionday_time = lyutils.get_last_time(td_time, delta, "day")
	retionday = retionday_time.strftime( "%Y%m%d")
	print '''##### 开始计算 %s 的  %d 日版本留存  ''' % ( retionday , delta ) 

	hql = ''' drop table liveretion_version_%d_%s ''' % ( delta , retionday ) 
	ExecHql(hql)
	
	tdtb = ''' livetodaytable%s ''' % td
	hql = ''' create table liveretion_version_%d_%s as select  new.cus_platform , new.cus_version , new.cid from ( select cus_platform , cus_version , cid from livehistorytable_cid where dt='%s' group by cus_platform , cus_version , cid ) new inner join  ( select cus_platform , cus_version , cid from %s group by cus_platform , cus_version , cid ) tdtb on ( new.cus_platform = tdtb.cus_platform and new.cus_version = tdtb.cus_version  and new.cid = tdtb.cid ) group by new.cus_platform , new.cus_version , new.cid '''  % ( delta , retionday , retionday  , tdtb )
	ExecHql(hql)
	
	hql = ''' drop table fenzi_version_%d_%s ''' % ( delta , retionday )
	ExecHql(hql)
	hql = ''' create table fenzi_version_%d_%s as select cus_platform , cus_version , count( distinct cid ) fenzinum from liveretion_version_%d_%s group by cus_platform , cus_version ''' % ( delta , retionday , delta , retionday ) 
	ExecHql(hql)
	
	hql = ''' drop table fenmu_version_%d_%s ''' % ( delta , retionday )
	ExecHql(hql)
	hql = ''' create table fenmu_version_%d_%s as select cus_platform , cus_version , count( distinct cid ) fenmunum from  livehistorytable_cid where dt='%s' group by cus_platform , cus_version ''' % ( delta , retionday , retionday  ) 
	ExecHql(hql)
	
	hql = ''' select '%s' , '%d' , fenzi.cus_platform , fenzi.cus_version  , fenzi.fenzinum , fenmu.fenmunum , fenzi.fenzinum/fenmu.fenmunum , '%s' from fenzi_version_%d_%s fenzi inner join fenmu_version_%d_%s fenmu on ( fenzi.cus_platform = fenmu.cus_platform and  fenzi.cus_version = fenmu.cus_version ) '''  % ( retionday , delta , td , delta , retionday  , delta , retionday   )  
	HiveToFile_AddJar_Append( hql , statisfile ) 

	print ''' ####### 开始计算 %s 的  %d 日版本留存  ( ALL ) ##### ''' % ( retionday , delta ) 
	hql = ''' drop table liveretion_all_version_%d_%s ''' % ( delta , retionday ) 
	ExecHql(hql)
	
	tdtb = ''' livetodaytable%s ''' % td
	hql = ''' create table liveretion_all_version_%d_%s as select  new.cus_platform , new.cid from ( select cus_platform , cid from livehistorytable_cid where dt='%s' group by cus_platform , cid ) new inner join  ( select cus_platform , cid from %s group by cus_platform , cid ) tdtb on ( new.cus_platform = tdtb.cus_platform and new.cid = tdtb.cid ) group by new.cus_platform , new.cid '''  % ( delta , retionday , retionday  , tdtb )
	ExecHql(hql)
	
	hql = ''' drop table fenzi_all_version_%d_%s ''' % ( delta , retionday )
	ExecHql(hql)
	hql = ''' create table fenzi_all_version_%d_%s as select cus_platform , count( distinct cid ) fenzinum from liveretion_all_version_%d_%s group by cus_platform ''' % ( delta , retionday , delta , retionday ) 
	ExecHql(hql)
	
	hql = ''' drop table fenmu_all_version_%d_%s ''' % ( delta , retionday )
	ExecHql(hql)
	hql = ''' create table fenmu_all_version_%d_%s as select cus_platform , count( distinct cid ) fenmunum from  livehistorytable_cid where dt='%s' group by cus_platform  ''' % ( delta , retionday , retionday  ) 
	ExecHql(hql)
	
	hql = ''' select '%s' , '%d' , fenzi.cus_platform ,  'all' , fenzi.fenzinum , fenmu.fenmunum , fenzi.fenzinum/fenmu.fenmunum , '%s' from fenzi_all_version_%d_%s fenzi inner join fenmu_all_version_%d_%s fenmu on ( fenzi.cus_platform = fenmu.cus_platform ) '''  % ( retionday , delta , td , delta , retionday , delta , retionday )  
	HiveToFile_AddJar_Append( hql , statisfile ) 


Mysql_Loadfile_retion( statisfile , mysqltb , td )












	


