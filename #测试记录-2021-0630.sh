  #测试记录-2021-0630

  918  curl -ku admin:password -H "Content-Type: application/json" -X POST  http://10.20.3.44/api/v2/inventories/ -d '{"name": "Example Inventory3","organization": 1,"variables": "api_awx_url: \"http://10.20.3.44\"\napi_awx_username: admin\napi_awx_password: password"}' | python3 -m json.tool
  919  curl -ku admin:password -H "Content-Type: application/json" -X DELETE  http://10.20.3.44/api/v2/inventories/ -d '{"name": "Example Inventory3","organization": 1,"variables": "api_awx_url: \"http://10.20.3.44\"\napi_awx_username: admin\napi_awx_password: password"}' | python3 -m json.tool
  920  curl -ku admin:password -H "Content-Type: application/json" -X GET  http://10.20.3.44/api/v2/inventories/ | python3 -m json.tool
  921  curl -ku admin:password -H "Content-Type: application/json" -X DELETE http://10.20.3.44/api/v2/inventories/8/ | python3 -m json.tool
  922  history
  923  ping github.com
  924  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool
  925  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool |grep name
  926  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool
  927  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool| id
  928  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool| grep id
  929  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/39/ | python3 -m json.tool| grep id
  930  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/39/ | python3 -m json.tool
  931  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool| grep echo-git-3
  932  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool| grep echo
  933  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool| grep using
  934  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool
  935  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/jobs/ | python3 -m json.tool >01-list-job.json
  936  ls
  937  vim 01-list-job.json
  938  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/ | python3 -m json.tool
  939  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/ | python3 -m json.tool > 02-list-job-templates
  940  vim 02-list-job-templates
  941  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/23/ | python3 -m json.tool > 03-list-23-template
  942  vim 03-list-23-template
  943  ll
  944  mv 02-list-job-templates 02-list-job-templates.json
  945  mv 03-list-23-template 03-list-23-template.json
  946  vim 03-list-23-template.json
  947  curl -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool
  948  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool
  949  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool >04-GET-template-launch.json
  950  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool
  951  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/23/relaunch/ | python3 -m json.tool
  952  curl -ku admin:password -H "Content-Type: application/json" -X GET http://10.20.3.44/api/v2/job_templates/23/launch/ -d {}| python3 -m json.tool
  953  curl -ku admin:password -H "Content-Type: application/json" -X POST -d {  "extra_vars": {    "ask_variables_on_launch": true  }} http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool
  954  curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"extra_vars": {"ask_variables_on_launch": true}}' http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool
  955  ll
  956  curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"extra_vars": {"ask_variables_on_launch": true}}' http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool >05-POST-template-launch.json
  957  ll
  958  vim 04-GET-template-launch.json
  959  curl -ku admin:password -H "Content-Type: application/json" -X POST -d '{"extra_vars": {"ask_variables_on_launch": true}}' http://10.20.3.44/api/v2/job_templates/23/launch/ | python3 -m json.tool >05-POST-template-launch.json
  960  ansible localhost -m setup
