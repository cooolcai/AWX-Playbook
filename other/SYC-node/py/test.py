#! /usr/bin/python
#coding:utf-8

import os

var_new_db_c = 'db_commodity_nodex'
var_new_db_t = 'db_transaction_nodex'

os.system("mysql -uroot -p'Ynyc2019a@!' -e \"drop database if exists %s;\"" % (line))
os.system("mysql -uroot -p'Ynyc2019a@!' -e \"create database %s DEFAULT CHARACTER SET utf8;\"" % (line))
