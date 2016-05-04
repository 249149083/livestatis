#!/usr/bin/python
#coding=utf8
import collections
fields = collections.OrderedDict([
	('uid','string') , 
	('cid','string') , 
	('appver','string') , 
	('adid','string') , 
	('chid','string') , 
	('net','string') , 
	('dev','string') , 
	('osv','string') , 
	('devinfo','string') , 
	('tm','string') , 
	('ip','string') , 
	('zone','string') , 
	('cus_isp','string') , 
	('cus_province','string') , 
	('cus_city','string' ), 
	('cus_company','string'), 
	('cus_platform','string') ,  
	('cus_prod','string') , 
	('cus_version','string') , 
	('act','string') , 
	('price','DOUBLE' ),
	('cus_firstcid','string' ) ,
	('cus_firstuid','string')]
	)	
print fields
fullfields = collections.OrderedDict([
	('uid','string' ), 
	('cid','string' ), 
	('appver','string' ), 
	('adid','string' ), 
	('chid','string' ), 
	('net','string' ), 
	('dev','string' ), 
	('osv','string' ), 
	('devinfo','string' ), 
	('tm','string' ), 
	('ip','string' ), 
	('zone','string' ), 
	('cus_isp','string' ), 
	('cus_province','string' ), 
	('cus_city','string' ), 
	('cus_company','string' ), 
	('cus_platform','string' ),  
	('cus_prod','string' ), 
	('cus_version','string' ), 
	('act','string') , 
	('price','DOUBLE' ),
	('cus_firstcid','string'),
	('cus_firstuid','string'),
	('is_cidnew','string' ), 
	('cid_register_chid','string')]
	)
print fullfields

fullfields2 = collections.OrderedDict([
	('uid','string' ), 
	('cid','string' ), 
	('appver','string' ), 
	('adid','string' ), 
	('chid','string' ), 
	('net','string' ), 
	('dev','string' ), 
	('osv','string' ), 
	('devinfo','string' ), 
	('tm','string' ), 
	('ip','string' ), 
	('zone','string' ), 
	('cus_isp','string' ), 
	('cus_province','string' ), 
	('cus_city','string' ), 
	('cus_company','string' ), 
	('cus_platform','string' ),  
	('cus_prod','string' ), 
	('cus_version','string' ), 
	('act','string') , 
	('price','DOUBLE' ),
	('cus_firstcid','string'),
	('cus_firstuid','string'),
	('is_cidnew','string' ), 
	('cid_register_chid','string'),
	('is_uidnew','string' ), 
	('uid_register_chid','string')]
	)
print fullfields

