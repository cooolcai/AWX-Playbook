#! /usr/bin/python
#coding:utf-8

import os

var_new_db_c = 'db_commodity_nodex'
var_new_db_t = 'db_transaction_nodex'
var_mysql_pwd = 'Ynyc2019a@!'

os.system("mysql -uroot -p'%s' -e \"drop database if exists %s;\"" % (var_mysql_pwd,var_new_db_c))
os.system("mysql -uroot -p'%s' -e \"create database %s DEFAULT CHARACTER SET utf8;\"" % (var_mysql_pwd,var_new_db_c))

os.system("mysql -uroot -p'%s' -e \"drop database if exists %s;\"" % (var_mysql_pwd,var_new_db_t))
os.system("mysql -uroot -p'%s' -e \"create database %s DEFAULT CHARACTER SET utf8;\"" % (var_mysql_pwd,var_new_db_t))


os.system("mysql -uroot -p'I.lw@2020' %s < /mnt/%s.sql" % (line,line))