deploy_infra:
	cd infrastructure && terraform apply

test_infra:
	cd infrastructure && terraform plan

output_infra:
	cd infrastructure && terraform output

destroy_infra:
	cd infrastructure && terraform destroy

deploy_registry_server:
	@echo "Make sure you have set S3_ACCESSKEY and S3_SECRETKEY environment variable."
	cd ansible && ansible-playbook -i ec2-hosts.py lab.yml