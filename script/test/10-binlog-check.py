#! /usr/bin/python
#coding:utf-8

#引用依赖包
import os

#关闭selinux，否则无法修改mysql端口和数据目录
#os.system("sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config")
#os.system("setenforce 0")

var_src_db_user = 'root'
var_src_db_pwd = 'sql_mYpwd@123'
var_src_db_ip = '192.168.101.177'
var_src_db_port = 5575

mysql_server_id = str(os.popen("ifconfig ens192 |grep netmask|awk '{print $2}'|awk -F. '{print $3$4}'").read().strip('\n'))

var_binlog_status = str(os.popen("mysql -u%s -p%s -h %s -P %s -e \"show variables like 'log_bin';\"| grep -Evi \"database|Variable_name|Value\"|awk '{print $2}'" % (var_src_db_user,var_src_db_pwd,var_src_db_ip,var_src_db_port)).read().strip('\n'))
print(var_binlog_status)

var_binlog_conf = str(os.popen("cat /etc/my.cnf |grep binlog ").read().strip('\n'))
print(var_binlog_conf)

if var_binlog_status == "OFF":
    print("%s ：The query shows binlog status is OFF\nNow alter the setting file.\nEnable binlog!\nIt will be works after restart mysql!" % (var_binlog_status))
    if var_binlog_conf == '':
        os.system("sed -i '$a###########enable-binlog###########\\nserver-id = %s \\nlog_bin = mysql-bin\\nbinlog_format = row\\nbinlog_row_image = full\\nexpire_logs_days = 10\\n' /etc/my.cnf" % (mysql_server_id))
        os.system("service mysqld restart")
    else:
        os.system("service mysqld restart")
else:
    if var_binlog_status == "ON":
        print("%s ：The query shows binlog status is ON" % (var_binlog_status))

