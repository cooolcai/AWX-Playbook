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
