#!/usr/bin/python
#coding=utf8

import sys
import pdb
import os
import urllib
sys.path.append("./")
from unit import *

def parseLine( line , kv , printerror ):
	try :
		if line2kv( line , kv , '|' , '=' , printerror ) == False : return False 
		for f in fields_mr1 :
			if kv.has_key(f) == False :
				if f in [ 'price' , 'tm' ] :
					if f == 'price' : 
						kv[ f ] = '0'
					if f == 'tm' :
						kv[ f ] = '1577808000' ###20200101
				else :
					kv [ f ] = 'NA'
			else :
				if f in [ 'dev' , 'zone' , 'price' , 'tm' , 'appver'] :
					if f == 'dev' :
						try :
							kv['dev'] = urllib.unquote( kv[f] )
						except :	
							kv['dev'] = 'NA'
					if f == 'zone' :
						location = kv[f].split('_')
						if len(location) == 3 :
							kv['cus_isp'] = location[0] 
							kv['cus_province'] = location[1] 
							kv['cus_city'] = location[2] 
						if len(location) == 2 :
							kv['cus_isp'] = location[0] 
							kv['cus_province'] = location[1] 
						if len(location) == 1 :
							kv['cus_isp'] = location[0] 
					if f == 'price' :
						try :
							long( kv[f] )
						except :
							kv[ f ] = '0'
					if f == 'tm' :
						try :
							long( kv[f] )
						except :
							kv[ f ] = '1577808000'
					if f == 'appver' :
						cpal = kv[ f ].split('_')
						if len(cpal) == 4 :
							kv['cus_company'] = cpal[0]
							kv['cus_prod'] = cpal[1]
							kv['cus_platform'] = cpal[2]
							kv['cus_version'] = cpal[3]
							
		return True
	except  Exception as e:
		info = '[EXCEPTION in ParseLine][line=#%s#error=#%s#]' % ( line , str(e) )  	
		PF( info , printerror )
		return False
	
		
		
for line in sys.stdin:
	try:
		kv = dict()
		line = line.strip()
		if parseLine( line , kv , printerror  ) == False :
			info = ' [parseLine error][skip][line=#%s#] '  % line 
			PF( info , printerror )
			continue
		if outputKv( kv , fields_mr1 ) == False :
			info = ' [outputKv error][skip][line=#%s#] '  % line
			PF( info , printerror )
			continue
	except Exception, e:
		info = ' [mapper : Exception in main ][skip][error=%s] '     % e
		PF( info , printerror )
		continue
		
	
