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




hql = " drop table livehistorytable_uid "
ExecHql(hql)

hql = " drop table livehistorytable_cid "
ExecHql(hql)

hql = " create table %s( "  % "livehistorytable_uid "
for f in  fields:
	hql = hql + f + "  string ,"
hql = hql[:len(hql)-1] + " ) PARTITIONED BY (dt string)  row format delimited  fields terminated by '\t' "  

ExecHql(hql)

hql = " create table %s( "  % "livehistorytable_cid "
for f in  fields:
	hql = hql + f + "  string ,"
hql = hql[:len(hql)-1] + " ) PARTITIONED BY (dt string) row format delimited  fields terminated by '\t' "  

ExecHql(hql)


