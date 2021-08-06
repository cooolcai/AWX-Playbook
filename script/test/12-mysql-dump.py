#! /usr/bin/python
#coding:utf-8

import os

var_src_db_user = root
var_src_db_pwd = 'sql_mYpwd@123'
var_src_db_ip = '192.168.101.177'
var_src_db_port = 5575
var_tgt_db_dump_sql_path = /mnt

#获取数据库名称字符串，并且排除4个系统默认数据库：mysql、sys、information_schema、performance_schema
var_src_dbname = os.popen("mysql -u%s -p%s -h %s -P %s -e \"show databases;\"| grep -Evi \"database|^mysql$|^sys$|^information_schema$|^performance_schema$\"" % (var_src_db_user,var_src_db_pwd,var_src_db_ip,var_src_db_port)).read().strip('\n')
#print(dbname)

#字符串转为列表
var_src_dbname_list = list(var_src_dbname.split('\n'))
#print(dbnamelist)

#在镜像库上新建数据库
for line in var_src_dbname_list:
    #print(type(line))
    os.system("mysql -uroot -p'I.lw@2020' -e \"drop database if exists %s;\"" % (line))
    os.system("mysql -uroot -p'I.lw@2020' -e \"create database %s DEFAULT CHARACTER SET utf8;\"" % (line))
os.system("mysql -uroot -p'I.lw@2020' -e \"show databases;\"")

#在镜像库上获取源库的dump数据
for line in var_src_dbname_list:
    #print(type(line))
    os.system("mysqldump -uroot -p'sql_mYpwd@123' -h 192.168.101.177 -P 5575 -d --events -B %s > /mnt/%s.sql" % (line,line))

#在镜像库上还原dump数据
for line in var_src_dbname_list:
    os.system("mysql -uroot -p'I.lw@2020' %s < /mnt/%s.sql" % (line,line))
