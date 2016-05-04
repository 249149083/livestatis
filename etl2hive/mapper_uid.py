#!/usr/bin/python
#coding=utf8
import sys
import pdb
import os
import urllib
sys.path.append("./")
from unit import *

		
for line in sys.stdin:
	try:
		kv = dict()
		if line2kv ( line , kv , '\t' , '=' , printerror ) == False :
			info = ' [ ERROR in lin2kv] [line=#%s#][SKIP]' % ( line ) 
			PF( info , printerror ) 
			continue
		if outputKv( kv , fields_mr2 )  == False :
			info = ' [ ERROR in outputKv ] [line=#%s#][SKIP]' % ( line ) 
			PF( info , printerror ) 
			continue
	except Exception, e:
		info = '[EXCEPTION in MAIN] [error=#%s#]' %  str(e) 	
		PF( info , printerror )
		continue
		
	
