#! /usr/bin/env python
# coding=gbk
import subprocess
from ctypes import *
import time
import os
import sys
import datetime
import string
import lyutils
import pdb
import MySQLdb

######################################
flag = True
#flag = False
Mysqlflag = True 
######################################


def get_last_time(cur, delta, type):
    if type == "year":
        try:
            last_time = datetime.date(cur.year - delta, cur.month, cur.day)
        except:
            return False
#     elif type == "month":
#             yeardelta =  delta/12
#             monthdelta = delta%12
#             last_time = datetime.date(cur.year-yeardelta, cur.month-monthdelta, cur.day)
    elif type == "day":
        try:
            last_time = cur - datetime.timedelta(days=delta)
        except Exception as e:
            print '[ERROR] Exception in LoadSongList():', str(e)
    return last_time 


def get_last_data(cur, delta, type):
        try:
            last_time = get_last_time(cur, delta, type)
        except:
            return False
        
        
def MysqlGetWithReturn(exe_cmd,):
  try:
    print exe_cmd
    conn=MySQLdb.connect(host='192.168.205.60',user='root',passwd='yeelion',port=3306)
    cur=conn.cursor(MySQLdb.cursors.SSDictCursor)
    conn.select_db('LogStat_RT')
    cur.execute(exe_cmd)
    for i in cur.fetchall():
        res = float( i[unlucky_user_radio])
    return res
  except MySQLdb.Error,e:
    print "Mysql Error %d: %s" % (e.args[0], e.args[1])
    
def MysqlGetWithNoReturn(exe_cmd,):
  try:
    PRINT_SQL(exe_cmd)
    if Mysqlflag  == False :
	return 
    conn=MySQLdb.connect(host='192.168.37.196',user='livestatis',passwd='yeelion',port=3306)
    cur=conn.cursor()
    conn.select_db('livestatis')
    cur.execute(exe_cmd)
    return True
  except MySQLdb.Error,e:
    print "Mysql Error %d: %s" % (e.args[0], e.args[1])
    return False
    
def HiveToFile_AddJar(HQL, file_name):
    try:
        PRINT_HQL(HQL)
	if flag == False :
		return 
        hive_cmd = "hive -e "
        HQL_CMD = hive_cmd +  "\"" + HQL + "\"  >  " + "./result/" + file_name 
        if 0 != os.system(HQL_CMD) :
		print "[ERROR] in HiveToFile_AddJar "
		#exit(1)
    except Exception as e:
        print '[ERROR] Exception in HiveToFile_AddJar:', str(e)
def ExecHql(HQL):
    try:
        hive_cmd = "hive -e "
        HQL_CMD = hive_cmd + "\"" + HQL + "\"    "  
	PRINT_HQL(HQL_CMD)
	if flag == False :
		return	
        if 0 != os.system(HQL_CMD):
		print "### [ERROR] ###  EXECUTE HQL_CMD error" 
		print "HQL:", HQL
		#exit(1)
    except Exception as e :
        print '[ERROR] Exception in ExecHive:', str(e)
	exit(1)
	
def ExecCmd(cmd):
    try:
	PRINT_HQL(cmd)
	if flag == False :
		return	
        if 0 != os.system(cmd):
		print "### [ERROR] ###  EXECUTE HQL_CMD error" 
		print "HQL:", HQL
		exit(1)
    except Exception as e :
        print '[ERROR] Exception in ExecCmd:', str(e)
	exit(1)

def HiveToFile_AddJar_install(HQL, file_name , DEBUG=False ):
    try:
        PRINT_HQL(HQL)
        add_jar = "\"add jar /home/mobile_static/lutest/pc_daily/FindFromForPcDaily.jar;  add jar /home/mobile_static/lutest/pc_daily/FindVersionForPcDaily.jar;  add jar /home/mobile_static/user_hardware_level2/FindVersion.jar;add jar /home/mobile_static/user_hardware_level2/FindFrom.jar; \""; 
        create_temporary = "\" CREATE TEMPORARY FUNCTION FindFromForPcDaily  AS  'FindFromForPcDaily'; CREATE TEMPORARY FUNCTION FindVersionForPcDaily  AS  'FindVersionForPcDaily'; CREATE TEMPORARY FUNCTION FindVersion  AS  'FindVersion';CREATE TEMPORARY FUNCTION FindFrom AS  'FindFrom'; \"" 
        hive_cmd = "hive -e "
        HQL_CMD = hive_cmd + add_jar + create_temporary + "\"" + HQL + "\"  >  " + "./" + file_name 
        if DEBUG == False:
            os.system(HQL_CMD)
    except Exception as e:
        print '[ERROR] Exception in HiveToFile_AddJar_install:', str(e)

def HiveQuery_Install(HQL , DEBUG=False):
    try:
        PRINT_HQL(HQL)
        add_jar = "\"add jar /home/mobile_static/lutest/pc_daily/FindFromForPcDaily.jar;  add jar /home/mobile_static/lutest/pc_daily/FindVersionForPcDaily.jar;   add jar /home/mobile_static/user_hardware_level2/FindVersion.jar;add jar /home/mobile_static/user_hardware_level2/FindFrom.jar;  \""; 
        create_temporary = "\" CREATE TEMPORARY FUNCTION FindFromForPcDaily  AS  'FindFromForPcDaily'; CREATE TEMPORARY FUNCTION FindVersionForPcDaily  AS  'FindVersionForPcDaily';  CREATE TEMPORARY FUNCTION FindVersion  AS  'FindVersion';CREATE TEMPORARY FUNCTION FindFrom AS  'FindFrom';  \"" 
        hive_cmd = "hive -e "
        HQL_CMD = hive_cmd + add_jar + create_temporary + "\"" + HQL + "\"  "
	print  "qiandw" + HQL_CMD
        if DEBUG == False:
            os.system(HQL_CMD)
    except Exception as e:
        print '[ERROR] Exception in HiveQuery_Install:', str(e)
        
def HiveToFile_AddJar_Append(HQL, file_name):
    try:
	PRINT_HQL(HQL)
	if flag == False :
		return 
        hive_cmd = "hive -e "
        HQL_CMD = hive_cmd + "\"" + HQL + "\"  >>  " + "./result/" + file_name 
        os.system(HQL_CMD)
    except Exception as e:
        print '[ERROR] Exception in HiveToFile_AddJar_Append:', str(e)         
        
def CreateHQL(HQL, targetday, type):
    try:
        if type == "pc":
            table_name = ""
            print(HQL_CMD)
    except Exception as e:
        print '[ERROR] Exception in CreateHQL', str(e)
        
        
def MkDir(Dirname):
    try:
        os.mkdir(Dirname)
    except Exception as e:
        print '[ERROR] Exception in MkDir:', str(e)
        return False

def MysqlCreatetable(field,primary_key):
        aa = "aaa"

def Mysql_Loadfile(file_name,table_name , td ):
    try:
       deletecmd = ''' delete from %s where dtime='%s' '''  % ( table_name , td )
       MysqlGetWithNoReturn(deletecmd)
       load_cmd ="load data local  infile './result/"+file_name+"' into table "+table_name
       MysqlGetWithNoReturn(load_cmd)
    except Exception as e:
        print '[ERROR] Exception in Mysql_Loadfile:', str(e)
        return False
def Mysql_Loadfile_retion(file_name,table_name , td ):
    try:
       deletecmd = ''' delete from %s where create_time='%s' '''  % ( table_name , td )
       MysqlGetWithNoReturn(deletecmd)
       load_cmd ="load data local  infile './result/"+file_name+"' into table "+table_name
       MysqlGetWithNoReturn(load_cmd)
    except Exception as e:
        print '[ERROR] Exception in Mysql_Loadfile:', str(e)
        return False
    
def Mysql_LoadfileWithLines(file_name,table_name,linenum):
    try:
       SHELL_CMD="head -n "+str(linenum)+" "+file_name+" > "+file_name+str(linenum)
       print SHELL_CMD
       os.system(SHELL_CMD)
       
       SHELL_CMD="awk '{print $0\"\t\"FNR}'  "+file_name+str(linenum) +">" +file_name+str(linenum)+"FNR"
       print SHELL_CMD
       os.system(SHELL_CMD)
       
      
       newfilename = file_name+str(linenum)+"FNR"
       load_cmd ="load data local  infile '"+newfilename+"' into table "+table_name
       MysqlGetWithNoReturn(load_cmd)
    except Exception as e:
        print '[ERROR] Exception in Mysql_LoadfileWithLines:', str(e)
        return False
    
def ConvertFile( filename, in_enc = "UTF-8", out_enc="GBK" ):  
    try:  
        content = open(filename).read()  
        new_content = content.decode(in_enc).encode(out_enc,'ignore')
        newfilename=filename+"_GBK"  
        open(newfilename, 'w').write(new_content)  
        return newfilename
    except Exception as e:
        print '[ERROR] Exception in ConvertFile:', str(e)
        return False
def clearData(targetday,tablename):
    HQL="delete from "+tablename+" where dtime='"+targetday+"'"
    MysqlGetWithNoReturn(HQL)

def DeleteTmpByDate(n):
    try:  
        targetday_time = get_last_time(datetime.date.today(), n, "day")
        deleteday = targetday = targetday_time.strftime('%Y_%m_%d')
        SHELL_CMD="rm -f ./resultdata/*"+deleteday+"*"
        print SHELL_CMD
        os.system(SHELL_CMD)
    except Exception as e:
        print '[ERROR] Exception in DeleteTmpByDate:', str(e)
        return False
def StrTofile(tmpstr,filename):
    try: 
        fileobj = open(filename,"w+")
        fileobj.write(tmpstr)
        fileobj.write("\n")
        fileobj.close()
    except Exception as e:
        print '[ERROR] Exception in StrTofile:', str(e)
        return False 
def Get_file_name(file_name_prefix,targetday):
    try:
        file_name = "./result/" + file_name_prefix+ "_" +targetday+".xls"
        return file_name
    except Exception as e:
        print '[ERROR] Exception in Get_file_name:', str(e)
        return False       
def Get_table_name(table_name_prefix,targetday):
    try:
        table_name = table_name_prefix + "_" +targetday
        return table_name
    except Exception as e:
        print '[ERROR] Exception in Get_table_name:', str(e)
        return False   
    
def Get_HQL_CMD(HQL,targetday,tablename):
    try:
        t1 = HQL.replace("!td",targetday);
        t2 = t1.replace("!tb", tablename)
        t3 = t2.replace("!plat","( case when plat='ar' then 'ar' else (case when plat='wp' then 'wp' else (case when (plat='ip' and prod='kwplayer') then 'ip' else (case when (plat='ip' and prod='kwplayerhd') then 'ip_hd' else 'NA' end) end) end ) end)")
        return t3
    except Exception as e:
        print '[ERROR] Exception in Get_HQL_CMD:', str(e)
        return False 
    
def Get_HQL_CMD2(HQL,targetday,table_name_prefix):
    try:
        tablename = table_name_prefix +"_"+ targetday
        t1 = HQL.replace("!td",targetday);
        t2 = t1.replace("!tb", tablename)
        t3 = t2.replace("!plat","( case when (plat='ar' and prod='kwplayerhd') then 'ar_hd' else (case when( plat='ar' and prod='kwplayer') then 'ar' else (case when plat='wp' then 'wp' else (case when (plat='ip' and prod='kwplayer') then 'ip' else (case when (plat='ip' and prod='kwplayerhd') then 'ip_hd' else 'NA' end) end) end ) end) end)")
        t4 = t3.replace("!u" , "(case when plat='wp' then devid else u end)")
        t5 = t4.replace("!install_plat" , "( case when ( instr(act, 'kwplayerhd_ar')!=0  ) then 'ar_hd' else  ( ( case when ( instr(act,'kwplayer_ar')!=0  ) then 'ar' else ( ( case when ( instr(act,'kwplayerhd_ip')!=0  ) then 'ip_hd' else ( ( case when (instr(act,'kwplayer_ip')!=0 ) then 'ip' else ( ( case when ( instr(act,'kwplayer_wp')!=0 ) then 'wp' else 'NA' end ) ) end ) ) end  )  )end )  ) end  )")
        t6 = t5.replace("!install_u" , "(case when instr(act, 'kwplayer_wp') !=0 then devid else u end)")
        return t6
    except Exception as e:
        print '[ERROR] Exception in Get_HQL_CMD2:', str(e)
        return False 
### 复制MOdule表为HIVE表      
def ModuleTableToHiveTable(sql_table_name):
    try:
    
        tmp = sql_table_name.split('_')
        if len(tmp) != 2:
            print "### %s split error " % sql_table_name
            return False  
        Module_table = "ModuleData_"+tmp[1]

        sqlcmd = "desc %s ;" %  sql_table_name
        if MysqlGetWithNoReturn(sqlcmd) == True:
            print " %s 表已经存在，无法被创建" % sql_table_name
            return False
        
        sqlcmd = "CREATE TABLE %s  like  %s ;" %  (sql_table_name,Module_table)
        if MysqlGetWithNoReturn(sqlcmd) ==False:
            print " %s 创建 失败" % sql_table_name
            return False
       
        sqlcmd = "INSERT into %s  select * from %s ;" %  (sql_table_name,Module_table)
        if MysqlGetWithNoReturn(sqlcmd) ==False:
            print " %s 复制失败" % sql_table_name
            return False
        return True
    except Exception as e:
        print '[ERROR] Exception in ModuleTableToHiveTable:', str(e)
        return False      
## 更新HiveConfig表，此表在HIVE中只使用了start_level,这个字段来标识是否执行成功，（0成功，1失败）
def UpDateHiveConfig(sql_table_name , targetday , result):
    try:
        tmp = sql_table_name.split('_')
        if len(tmp) != 2:
            print "### %s split error " % sql_table_name
            return False  
        sqlcmd = " update HiveConfig set start_level=%d ,logtime=%s where id =%s" % (result , targetday ,tmp[1])
        if MysqlGetWithNoReturn(sqlcmd) ==False:
            print " 更新HiveConfig失败"
            return False            
    except Exception as e:
        print '[ERROR] Exception in UpDateHiveConfig:', str(e)
        return False 
def clearDataWithDperiod(targetday,tablename,dperiod):
    SQL="delete from "+tablename+" where dtime='"+targetday+"' and dperiod='"+ str (dperiod )+"'"
    MysqlGetWithNoReturn(SQL)    
    
def Mysql_LoadfileWithDperiod(file_name,table_name,targetday,dperiod):
    try:
       print file_name , table_name , targetday , dperiod
       awkfilename = file_name + "_awk" ;
       cmd = "awk '{print \"%d\t%s\t\"$0}' %s > %s" % (dperiod,targetday,file_name,awkfilename)
       print cmd
       os.system(cmd)
       Mysql_Loadfile(awkfilename , table_name )
    except Exception as e:
        print '[ERROR] Exception in Mysql_LoadfileWithDperiod:', str(e)
        return False
def PRINT_HQL(HQL):
    print '\033[1;32;40m'
    print "EXECUTE HQL : " , HQL
    print '\033[0m'
	
def PRINT_SQL(SQL):
    print '\033[1;32;40m'
    print "EXECUTE , SQL : " , SQL
    print '\033[0m'

def GetDateList(date_fmt, begin_date, end_date):
    try:
        begin = datetime.datetime.strptime(begin_date, date_fmt)
        end = datetime.datetime.strptime(end_date, date_fmt)
        date_list = []
        dt = begin
        delta = datetime.timedelta(days=1)
        while dt < end:
            date_list.append(dt.strftime(date_fmt))
            dt += delta
        return date_list
    except:
        PrintError('Exception in Utils::GetDateList()')
        return []

def HIVE_EXEC(HQL , targetday , table_name_prefix,DEBUG=False):
    HQL_CMD = Get_HQL_CMD2(HQL,targetday,table_name_prefix)
    if  HQL_CMD==False:
        print "进行HQL转换时失败"
        exit(1)
    HiveQuery_Install(HQL_CMD,DEBUG)

def HIVE_EXEC_to_file(HQL , targetday , table_name_prefix, tmp_file_name , DEBUG=False):
    HQL_CMD = Get_HQL_CMD2(HQL,targetday,table_name_prefix)
    if  HQL_CMD==False:
        print "进行HQL转换时失败"
        exit(1)
    HiveToFile_AddJar_install(HQL_CMD , tmp_file_name , DEBUG)


def GetProvince(name):
    province = dict()
    province["shanghai"] = "上海"
    province["yunnan"]=    "云南"
    province["neimenggu"]   = "内蒙古"
    province["beijing"]   = "北京"
    province["jilin"]    = "吉林"
    province["sichuan"]   = "四川"
    province["tianjin"]    = "天津"
    province["ningxia"]    = "宁夏"
    province["anhui"]    = "安徽"
    province["shandong"]   = "山东"
    province["shan1xi"]   = "山西"
    province["guangdong"]    = "广东"
    province["guangxi"]    = "广西"
    province["xinjiang"]   = "新疆"
    province["jiangsu"]    = "江苏"
    province["jiangxi"]    = "江西"
    province["hebei"]    = "河北"
    province["henan"]    = "河南"
    province["zhejiang"]   = "浙江"
    province["hainan"]    = "海南"
    province["hubei"]   = "湖北"
    province["hunan"]    = "湖南"
    province["gansu"]    = "甘肃"
    province["fujian"]    = "福建"
    province["xizang"]    = "西藏"
    province["guizhou"]    = "贵州"
    province["liaoning"]    = "辽宁"
    province["chongqing"]    = "重庆"
    province["shan3xi"]   = "陕西"
    province["qinghai"]   = "青海"
    province["heilongjiang"]    = "黑龙江"
    province["hongkong"]    = "香港"
    province["default"]    = "默认"
    province["macau"]    = "澳门"
    province["taiwan"]    = "台湾"
    if province.has_key(name.lower()) == False:
        return name.lower()
    return province[name.lower()]
       
def ConvertFile_GetProvince(input , index , output):
    try:
        fileobj_r = open(input,"r+" )
        fileobj_w = open(output , "w+")
        
        lines = fileobj_r.readlines()
        for l in lines:
            tmplist = l.strip().split("\t")
            if len(tmplist) < index:
                continue
            tmplist[ index -1] = GetProvince(tmplist[ index -1] )
            fileobj_w.write( "\t".join(tmplist) )
            fileobj_w.write("\n")
    except Exception as e:
        print '[ERROR] Exception in ConvertFile_GetProvince:', str(e)
        return False 


def GetDataList(beginday,endday):
    try:
        result = []
        begin_date = datetime.datetime.strptime(beginday ,"%Y_%m_%d").date()
        end_date = datetime.datetime.strptime(endday ,"%Y_%m_%d").date()
        while begin_date <=end_date:
            result.append( begin_date.strftime('%Y_%m_%d') )
            begin_date = begin_date + datetime.timedelta(days=1)
        return result
    except Exception as e:
        print '[ERROR] Exception in GetDataList:', str(e)
                
