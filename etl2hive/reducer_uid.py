#!/usr/bin/python
#coding=utf8
import sys
import pdb
import os
import urllib
sys.path.append("./")
from unit import *
#############################################################################

tmplist = []
lastkey = "XXX"
#############################################################################

def Output( tmplist , printerror , mintm  ) :
	try:
		for l in tmplist :
			kv = dict() 
			line2kv( l , kv , '\t' , '=' , printerror )
			if long( kv['tm'] )  == mintm and mintm > 0 :
				kv['cus_firstuid'] = '1'
				mintm = -1 
			else :
				kv['cus_firstuid'] = '0' 
			if outputKv( kv , fields_mr2 , False ) ==  False : continue
				
	except Exception as e :
		info = "[Exception] in Output [error=#%s#] " % str(e)
		PF(info , printerror )
		return False 
			
	
		
		
linenum = 0
for line in sys.stdin:
	try:
		linenum = linenum + 1
		line = line.strip()
		kv = dict()
		if line2kv( line , kv , '\t' , '=' , printerror ) == False :
			info = '''[ EXCEPTION in findMintm ][skip][line=#%s#] '''  % line
			PF(info, printerrorflag )
			continue
		if kv[ fields_mr2[0] ] != lastkey :
			mintm =  findMintm( tmplist  , printerror )
			if mintm == -1 :
				info = '''[ EXCEPTION in findMintm ][skip][line=#%s#] '''  % line
				PF(info, printerrorflag )
				continue
			Output( tmplist , printerror , mintm )
			lastkey = kv[ fields_mr2[0] ]
			tmplist = []
		tmplist.append(line)
        except Exception, e:
                info = "[Exceprtion in MAIN][error=#%s#][line=#%s#]" % (  str(e) , line )
                PF( info , printerror )
                continue


if len(tmplist) != 0 :
        mintm =  findMintm( tmplist , printerror )
        if mintm == -1 :
                info = '''[ EXCEPTION in findMintm ][skip][line=#%s#] '''  % line
                PF(info, printerrorflag )
        else :
                Output( tmplist , printerror , mintm )	
