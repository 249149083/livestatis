#!/usr/bin/python
#coding=utf8

import sys
import pdb
import os
import urllib
sys.path.append("./")

printerror = True 
printerror = False

fields_mr1 = [ 'cid' , 'appver' , 'adid' , 'uid' , 'chid' , 'net' , 'dev' , 'osv' , 'devinfo' , 'tm' , 'ip' , 'zone' , 'cus_isp' , 'cus_province' , 'cus_city' , 'cus_company' , 'cus_platform' ,  'cus_prod' , 'cus_version' , 'act' , 'price' ,'cus_firstcid' , 'cus_firstuid' ]

fields_mr2 = [ 'uid' , 'cid' , 'appver' , 'adid' ,  'chid' , 'net' , 'dev' , 'osv' , 'devinfo' , 'tm' , 'ip' , 'zone' , 'cus_isp' , 'cus_province' , 'cus_city' , 'cus_company' , 'cus_platform' ,  'cus_prod' , 'cus_version' , 'act' , 'price' ,'cus_firstcid' , 'cus_firstuid' ]


def outputKv( kv , fields , withkey = True ):
	try:
		result = ""
		for k in fields :
			if k in kv :
				if kv[k] == '' :
					if withkey == False :
						result = result + "NA" + "\t"
					else :
						result = result + k + "=" + "NA" + "\t"
				else :
					if withkey == False :
						result = result + kv[k] + "\t"
					else :
						result = result + k + "=" + kv[k] + "\t"
			else :
				if withkey == False :
					result = result + "NA" + "\t"
				else :
					result = result + k + "=" + "NA" + "\t"
		result = result[:len(result)-1] + '\n'
		sys.stdout.write(result)
		return True
	except  Exception  as e:
		print "output ERROR:" , str(e)		
		return False

def line2kv( line , kv , sep1 , sep2 , printerror ):
	try :
		ll  = line.strip().split(sep1) 
		for l in ll :
			tmpkv  = l.split(sep2)
			if len(tmpkv) != 2 or tmpkv[0] =='' :
				continue	
			kv[ tmpkv[0] ] = tmpkv[1]  
		return True
	except  Exception as e:
		info = " [Exception in line2kv] [line=#%s#] [error=#%s#] " % ( line , str(e) )
		PF( info , printerror )
		return False
def PF( info ,  printerror ) :
	if printerror == True :
		print info
	
		
		
def findMintm( tmplist , printerror ):
	try :
		mintm = -1
		kv = dict()
		for line in tmplist :
			if line2kv(line , kv , '\t' , '=' , printerror ) == False :
				return -1
			if mintm < 0  or  long( kv['tm'] )  <  mintm :
				mintm = long( kv['tm'] )
			return mintm
	except  Exception as e:
		info = "[Exception] in findMintm [line=#%s#] [error=#%s#] " % ( line , str(e) )
		PF( info , printerror )
		return -1	
