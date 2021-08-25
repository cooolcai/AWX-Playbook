#! /usr/bin/python
#coding:utf-8

#引用依赖包
import os

#关闭selinux，否则无法修改mysql端口和数据目录
#os.system("sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config")
#os.system("setenforce 0")

#定义需要检查的源库相关信息
var_src_db_user = 'root'
var_src_db_pwd = 'sql_mYpwd@123'
var_src_db_ip = '192.168.101.177'
var_src_db_port = 5575