#! /usr/bin/python
#coding:utf-8

import os

#获取数据库名称字符串
dbname = os.popen("mysql -uroot -p'sql_mYpwd@123' -h 192.168.101.177 -P 5575 -e \"show databases;\"| grep -Evi \"database|^mysql$|^sys$|^information_schema$|^performance_schema$\"").read().strip('\n')
#print(dbname)

#字符串转为列表
dbnamelist = list(dbname.split('\n'))
#print(dbnamelist)

#在镜像库上新建数据库
for line in dbnamelist:
    #print(type(line))
    os.system("mysql -uroot -p'I.lw@2020' -e \"drop database if exists %s;\"" % (line))
    os.system("mysql -uroot -p'I.lw@2020' -e \"create database %s DEFAULT CHARACTER SET utf8;\"" % (line))
os.system("mysql -uroot -p'I.lw@2020' -e \"show databases;\"")

#在镜像库上获取源库的dump数据
for line in dbnamelist:
    #print(type(line))
    os.system("mysqldump -uroot -p'sql_mYpwd@123' -h 192.168.101.177 -P 5575 -d --events -B %s > /mnt/%s.sql" % (line,line))

#在镜像库上还原dump数据
for line in dbnamelist:
    os.system("mysql -uroot -p'I.lw@2020' %s < /mnt/%s.sql" % (line,line))
