#! /usr/bin/python
#coding:utf-8

#引用依赖包
import os
import tarfile

#卸载与mysql冲突的maria依赖包（此处可加排除逻辑：若存在则卸载，否则跳过）
var_maria_check = str(os.popen('rpm -qa |grep maria').read())
if var_maria_check !='':
    os.system("yum remove -y %s" % (var_maria_check))

#此处/media下为什么有mysql安装包？通过asb的copy模块复制而来。
#解压mysql离线安装包
os.chdir("/media")
os.system("pwd")
tarfile.open("mysql-5.7.31-1.el7.x86_64.rpm-bundle.tar").extractall()
tarfile.open("mysql-5.7.31-1.el7.x86_64.rpm-bundle.tar").close

#按顺序离线安装rpm文件
mysql_version = "5.7.31"
os.system("rpm -ivh mysql-community-common-%s-1.el7.x86_64.rpm" % (mysql_version))
os.system("rpm -ivh mysql-community-libs-%s-1.el7.x86_64.rpm" % (mysql_version))
os.system("rpm -ivh mysql-community-libs-compat-%s-1.el7.x86_64.rpm" % (mysql_version))
os.system("rpm -ivh mysql-community-client-%s-1.el7.x86_64.rpm" % (mysql_version))
os.system("rpm -ivh mysql-community-server-%s-1.el7.x86_64.rpm" % (mysql_version))

#创建数据目录
mysql_data = "/data/mysql-data/"
if os.path.exists(mysql_data):
    print("/data/mysql is exist!")
else:
    os.makedirs(mysql_data)
    print ("/data/mysql is crated")

#关闭selinux，否则无法修改mysql端口和数据目录
os.system("sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config")
os.system("setenforce 0")

#配置文件默认模板
#注意：正式生产数据库应该有自己的mysql配置，应该使用对方的配置文件
mysql_conf_template = "[mysqld]\ndatadir=/data/mysql-data\nsocket=/var/lib/mysql/mysql.sock\n\nsymbolic-links=0\n\noptimizer_switch='derived_merge=off'\n\nsql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION\n\nmax_connections=1024\n\ncharacter_set_server=utf8\ninit_connect='SET NAMES utf8'\nport=5575\nlower_case_table_names=1\n\nlog-error=/var/log/mysqld.log\npid-file=/var/run/mysqld/mysqld.pid\n\nserver-id = 1111\n\nlog_bin = mysql-bin\nbinlog_format = row\nbinlog_row_image = full\n\nexpire_logs_days = 10\n"
mysql_server_id = str(os.popen("ifconfig ens192 |grep netmask|awk '{print $2}'|awk -F. '{print $3$4}'").read().strip('\n'))
mysql_conf = "/etc/my.cnf"

#备份及修改配置文件
os.system("cp /etc/my.cnf /etc/my.cnf.old")
os.system("echo >/etc/my.cnf")
if os.path.exists("/etc/my.cnf"):
    f = open("/etc/my.cnf","w")
    f.write(mysql_conf_template)
    f.close()

#os.system("echo %s>/etc/my.cnf"% (str1))
print("now cat the setting!!!!")
os.system("cat /etc/my.cnf")

#修改mysql的serverid，最好每台机器都不一致，此处使用IP的末尾两段。
#注意：可能因为系统版本不同，导致网卡名称不同：如ens192、eth0等等，导致获取ip失败。
os.system("sed -i 's/1111/%s/g' /etc/my.cnf" % (mysql_server_id))
print("now cat the setting secondly!!!!")
os.system("cat /etc/my.cnf")
#os.system("service mysqld restart")
#os.system("netstat -ano |grep 5575")
###########################################
os.system("sudo service mysqld restart")
str3 = str(os.popen("netstat -ano |grep 5575").read().strip('\n'))
print(str3)
###########################################
mysql_default_pwd = str(os.popen("cat /var/log/mysqld.log |grep 'temporary password'|awk '{print $11}'").read().strip('\n'))
mysql_new_pwd = "I.lw@2020"
mysql_init_template = "use mysql;\ndelete from mysql.user where user!='root';\ngrant all on *.* to root@'%' identified by 'I.lw@2020';\nflush privileges;"

#生成初始化sql文件
f2 = open("/media/mysql-ini.sql","w")
f2.write(mysql_init_template)
f2.close()
os.system("sed -i 's/I.lw@2020/%s/g' /media/mysql-ini.sql" % (mysql_new_pwd))

#执行初始化文件
#os.system("mysql --connect-expired-password -u root -p'%s' -h localhost < /media/mysql-ini.sql" % (var3))
os.system("mysql --connect-expired-password -uroot -p'%s' -e \"alter user root@localhost identified by '%s';\"" % (mysql_default_pwd,mysql_new_pwd))

#方式一使用sql导入
#os.system("mysql --connect-expired-password -u root -p'I.lw@2020' -h localhost < /media/mysql-ini.sql")

#方式二直接紧跟命令执行
os.system("mysql --connect-expired-password -uroot -p'%s' -e \"grant all on *.* to root@'%%' identified by '%s';\nflush privileges;\"" % (mysql_new_pwd,mysql_new_pwd))

os.system("service mysqld restart")

os.system("firewall-cmd --zone=public --add-port=5575/tcp --permanent && firewall-cmd --reload")
