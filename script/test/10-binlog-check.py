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

#开启binlog需要指定相关的server-id，此处获取网卡的后两段作为server-id
#注意：1.不是所有服务器的默认网卡都叫做“ens192”;2.有的mysql可能定义了server-id，但是没有启用binlog。
mysql_server_id = str(os.popen("ifconfig ens192 |grep netmask|awk '{print $2}'|awk -F. '{print $3$4}'").read().strip('\n'))

#定义binlog的状态为变量
var_binlog_status = str(os.popen("mysql -u%s -p%s -h %s -P %s -e \"show variables like 'log_bin';\"| grep -Evi \"database|Variable_name|Value\"|awk '{print $2}'" % (var_src_db_user,var_src_db_pwd,var_src_db_ip,var_src_db_port)).read().strip('\n'))
print(var_binlog_status)

#获取my.cnf文件中包含binlog配置的内容，用于判断。
var_binlog_conf = str(os.popen("cat /etc/my.cnf |grep binlog ").read().strip('\n'))
print(var_binlog_conf)

#先通过sql查询判断是否开启binlog，注意，有些mysql在配置文件中有相关的binlog配置，但手动关闭了binlog。因此不能以配置文件中是否存在相关配置为判断条件。
#如果查询显示binlog为关闭状态，则检查配置文件。
#如果my.cnf配置文件中没有binlog相关配置项，则添加并重启。
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

