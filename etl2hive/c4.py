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












	


