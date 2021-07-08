output "ubuntu_2004_ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "available_azs" {
  value = data.aws_availability_zones.available
}

output "bastion_public_ips" {
  description = "Public IP address of the bastion instance"
  value       = module.instance.bastion_public_ips
}

output "service_private_ips" {
  description = "Private ips of service instances"
  value       = module.instance.service_private_ips
}

output "alb_endpoint" {
  description = "Endpoint for application load balancer"
  value       = module.alb.dns
}

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = module.rds.rds_hostname
  sensitive   = true
}

output "s3_users" {
  description = "Users with access permission on s3 bucket."
  value       = module.s3.users
}

output "s3_primary_user_credential" {
  description = "s3 rw user credential"
  value       = module.s3.primary_user_credential
  sensitive   = true
}

output "s3_secondary_user_credential" {
  description = "s3 read only user credential"
  value       = module.s3.secondary_user_credential
  sensitive   = true
}
