curl -ku admin:password -H "Content-Type: application/json" -X POST  http://10.20.3.44/api/v2/inventories/ -d '{"name": "Example Inventory3","organization": 1,"variables": "api_awx_url: \"http://10.20.3.44\"\napi_awx_username: admin\napi_awx_password: password"}' | python3 -m json.tool

#查看inven列表
curl -ku admin:password -H "Content-Type: application/json" -X GET  http://10.20.3.44/api/v2/inventories/ | python3 -m json.tool

#删除某条ini
curl -ku admin:password -H "Content-Type: application/json" -X DELETE http://10.20.3.44/api/v2/inventories/8/ | python3 -m json.tool

#获取job列表
curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool
#获取job列表时，没有最新的job。返回值当中没有已在ui中显示成功运行的job。
、

#获取job列表
curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/ | python3 -m json.tool
#能获取到相关最新的template，也能获取到相关的id、和launch接口

#使用get请求访launch接口时，仅会返回，并不会真正执行job
curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool
#没有用户密码将无法调用接口
curl -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool
#使用post请求，增加请求体后能成功返回，能成功执行job，在ui界面也出现相关的job。
curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"extra_vars": {"ask_variables_on_launch": true}}' http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool







#没有开启是否启用变量时，发送请求，会产山ignored字段
curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"extra_vars": {"echo_output": "/media/echo-oupt2222.txt"}}' http://10.20.3.44/api/v2/job_templates/32/launch/ | python3 -m json.tool

#没有开启是否启用变量时，正常发送启动请求，可行
curl -ku admin:password -H "Content-Type: application/json" -X POST http://10.20.3.44/api/v2/job_templates/32/launch/ | python3 -m json.tool

#尝试用update修改template属性
	#首先查询具体的模板信息：
	curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/32/ | python3 -m json.tool

	#尝试修改template的属性。至少需要两个必要参数：name、playbook
	curl -ku admin:password -H "Content-Type: application/json" -X PUT -d '{"name": "32-datahub-gitlab","playbook": "32-datahub-echo.yml","ask_variables_on_launch": true}' http://10.20.3.44/api/v2/job_templates/32/ | python3 -m json.tool
	#成功

【修改脚本内的变量】
1.查询对应的template-id，通过template才能启动各种任务，如指定某台主机执行某个任务（job）。
    curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/ | python3 -m json.tool
    curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/32/ | python3 -m json.tool
2.修改对应temlate的属性："ask_variables_on_launch": true
    curl -ku admin:password -H "Content-Type: application/json" -X PUT -d '{"name": "32-datahub-gitlab","playbook": "32-datahub-echo.yml","ask_variables_on_launch": true}' http://10.20.3.44/api/v2/job_templates/32/ | python3 -m json.tool
3.此时传入变量即可成功，否则传入的变量无效，会归入ingnored段。
    curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"extra_vars": {"echo_output": "/media/echo-oupt2222.txt"}}' http://10.20.3.44/api/v2/job_templates/32/launch/ | python3 -m json.tool
4.extra_vars中使用的变量，在创建hosts时就已经创建。可对已有变量修改。若直接新增变量，还需要测试。



#尝试修改host，指定不同IP完成操作
curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/hosts/| python3 -m json.tool

【修改主机IP，如何将同一个playbook应用于多个不同主机hosts？】
创建inventory
创建host：创建host的接口说明在inventory中
指定host使用的变量
创建group
修改template指定的inventory
修改templae中需要自定义的变量
启动template即可成功

#创建inventory的接口
curl -ku admin:password -H "Content-Type: application/json" -X POST http://10.20.3.44/api/v2/inventories/| python3 -m json.tool

{
    "name": [
        "This field is required."
    ],
    "organization": [
        "This field is required."
    ]
}

创建inventory成功，直接返回inventory id 为14
curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"name": "curl-ini","organization": 1}' http://10.20.3.44/api/v2/inventories/| python3 -m json.tool
{
    "id": 14,
    "type": "inventory",
    "url": "/api/v2/inventories/14/",
    "related": {
        "named_url": "/api/v2/inventories/curl-ini++test/",
        "created_by": "/api/v2/users/1/",
        "modified_by": "/api/v2/users/1/",
        "hosts": "/api/v2/inventories/14/hosts/",
        "groups": "/api/v2/inventories/14/groups/",
        "root_groups": "/api/v2/inventories/14/root_groups/",
        "variable_data": "/api/v2/inventories/14/variable_data/",
        "script": "/api/v2/inventories/14/script/",
        "tree": "/api/v2/inventories/14/tree/",
        "inventory_sources": "/api/v2/inventories/14/inventory_sources/",
        "update_inventory_sources": "/api/v2/inventories/14/update_inventory_sources/",
        "activity_stream": "/api/v2/inventories/14/activity_stream/",
        "job_templates": "/api/v2/inventories/14/job_templates/",
        "ad_hoc_commands": "/api/v2/inventories/14/ad_hoc_commands/",
        "access_list": "/api/v2/inventories/14/access_list/",
        "object_roles": "/api/v2/inventories/14/object_roles/",
        "instance_groups": "/api/v2/inventories/14/instance_groups/",
        "copy": "/api/v2/inventories/14/copy/",
        "organization": "/api/v2/organizations/1/"
    },
    "summary_fields": {
        "organization": {
            "id": 1,
            "name": "test",
            "description": ""
        },
        "created_by": {
            "id": 1,
            "username": "admin",
            "first_name": "",
            "last_name": ""
        },
        "modified_by": {
            "id": 1,
            "username": "admin",
            "first_name": "",
            "last_name": ""
        },
        "object_roles": {
            "admin_role": {
                "description": "Can manage all aspects of the inventory",
                "name": "Admin",
                "id": 169
            },
            "update_role": {
                "description": "May update the inventory",
                "name": "Update",
                "id": 170
            },
            "adhoc_role": {
                "description": "May run ad hoc commands on the inventory",
                "name": "Ad Hoc",
                "id": 171
            },
            "use_role": {
                "description": "Can use the inventory in a job template",
                "name": "Use",
                "id": 172
            },
            "read_role": {
                "description": "May view settings for the inventory",
                "name": "Read",
                "id": 173
            }
        },
        "user_capabilities": {
            "edit": true,
            "delete": true,
            "copy": true,
            "adhoc": true
        }
    },
    "created": "2021-07-07T07:53:42.356590Z",
    "modified": "2021-07-07T07:53:42.356665Z",
    "name": "curl-ini",
    "description": "",
    "organization": 1,
    "kind": "",
    "host_filter": null,
    "variables": "",
    "has_active_failures": false,
    "total_hosts": 0,
    "hosts_with_active_failures": 0,
    "total_groups": 0,
    "has_inventory_sources": false,
    "total_inventory_sources": 0,
    "inventory_sources_with_failures": 0,
    "insights_credential": null,
    "pending_deletion": false
}

下一步给新建的inventory创建host
curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"name": "10.20.3.42","enabled": true,"variables": {"server_name": "42-apollo","user": "root","password": "ilw@2020","rcp_output": "/root/rcp.txt","echo_output": "/root/echo42.txt"}}' http://10.20.3.44/api/v2/inventories/14/hosts| python3 -m json.tool
#指定变量的json {"server_name": "32-datahub","user": "root","password": "ilw@2020","rcp_output": "/root/rcp.txt","echo_output": "/root/echo.txt"}
#默认的json格式需要增加转义字符，否则将会显示无效值报错。如下是转义后的json格式：
"{\n\t\"server_name\": \"32-datahub\",\n\t\"user\": \"root\",\n\t\"password\": \"ilw@2020\",\n\t\"rcp_output\": \"/root/rcp.txt\",\n\t\"echo_output\": \"/root/echo.txt\"\n}"

给新的inventory创建hosts成功。
curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"name": "10.20.3.37","enabled": true,"varihables": "{\n\t\"server_name\": \"37-datahub\",\n\t\"user\": \"root\",\n\t\"password\": \"ilw@2020\",\n\t\"rcp_output\": \"/root/rcp.txt\",\n\t\"echo_output\": \"/root/echo.txt\"\n}","groups": "32-datahub"}' http://10.20.3.44/api/v2/inventories/14/hosts| python3 -m json.tool

给inventory创建group。
curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"name": "32-datahub"}' http://10.20.3.44/api/v2/inventories/14/groups/| python3 -m json.tool
{
    "id": 10,
    "type": "group",
    "url": "/api/v2/groups/10/",
    "related": {
        "named_url": "/api/v2/groups/32-datahub++curl-ini++test/",
        "created_by": "/api/v2/users/1/",
        "modified_by": "/api/v2/users/1/",
        "variable_data": "/api/v2/groups/10/variable_data/",
        "hosts": "/api/v2/groups/10/hosts/",
        "potential_children": "/api/v2/groups/10/potential_children/",
        "children": "/api/v2/groups/10/children/",
        "all_hosts": "/api/v2/groups/10/all_hosts/",
        "job_events": "/api/v2/groups/10/job_events/",
        "job_host_summaries": "/api/v2/groups/10/job_host_summaries/",
        "activity_stream": "/api/v2/groups/10/activity_stream/",
        "inventory_sources": "/api/v2/groups/10/inventory_sources/",
        "ad_hoc_commands": "/api/v2/groups/10/ad_hoc_commands/",
        "inventory": "/api/v2/inventories/14/"
    },
    "summary_fields": {
        "inventory": {
            "id": 14,
            "name": "curl-ini",
            "description": "",
            "has_active_failures": false,
            "total_hosts": 1,
            "hosts_with_active_failures": 0,
            "total_groups": 0,
            "has_inventory_sources": false,
            "total_inventory_sources": 0,
            "inventory_sources_with_failures": 0,
            "organization_id": 1,
            "kind": ""
        },
        "created_by": {
            "id": 1,
            "username": "admin",
            "first_name": "",
            "last_name": ""
        },
        "modified_by": {
            "id": 1,
            "username": "admin",
            "first_name": "",
            "last_name": ""
        },
        "user_capabilities": {
            "edit": true,
            "delete": true,
            "copy": true
        }
    },
    "created": "2021-07-08T07:31:31.611269Z",
    "modified": "2021-07-08T07:31:31.611345Z",
    "name": "32-datahub",
    "description": "",
    "inventory": 14,
    "variables": ""
}

修改template使用的inventory
    查看目标template
    curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/32/ | python3 -m json.tool
    修改目标template的inventory
    curl -ku admin:password -H "Content-Type: application/json" -X PUT -d '{"name": "32-datahub-gitlab","playbook": "32-datahub-echo.yml","inventory": 14}' http://10.20.3.44/api/v2/job_templates/32/ | python3 -m json.tool

启动template执行job
    curl -ku admin:password -H "Content-Type: application/json" -X POST http://10.20.3.44/api/v2/job_templates/32/launch/ | python3 -m json.tool
    找不到匹配的hosts
    原因，除了给inventry创建groups外，还需要给hosts指定groups
    查看所有groups
    curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/groups/ | python3 -m json.tool

    解决：不要再创建inventory的时候就创建主机。
    单独调用hosts接口创建主机，指定inventory就能成功关联进去。卧槽还是没有给host关联上group
    curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"name": "10.20.3.37","inventory": 14,"groups": "32-datahub"}' http://10.20.3.44/api/v2/hosts/ | python3 -m json.tool

    真正的解决分两步
    第一步关联主机和组
    curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"name": "10.20.3.37","inventory": "curl-ini"}' http://10.20.3.44/api/v2/groups/10/hosts/ | python3 -m json.tool
    第二步查询对应hosts-id，新增hosts变量，将会在执行task中需要
    curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/hosts/ | python3 -m json.tool
    curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"name": "10.20.3.37","inventory": "curl-ini","variables": "{\n\t\"server_name\": \"37-datahub\",\n\t\"user\": \"root\",\n\t\"password\": \"ilw@2020\",\n\t\"rcp_output\": \"/root/rcp.txt\",\n\t\"echo_output\": \"/root/echo.txt\"\n}",}' http://10.20.3.44/api/v2/hosts/22/ | python3 -m json.tool
    第三步启动对应的template
