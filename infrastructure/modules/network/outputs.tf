# Output variable definitions

output "vpc_id" {
  description = "ID of vpc"
  value       = aws_vpc.main.id
}

output "bastion_sg_id" {
  description = "ID of bastion security group"
  value       = aws_security_group.allow_ssh.id
}

output "service_sg_id" {
  description = "ID of service security group"
  value       = aws_security_group.allow_ssh_internal.id
}

output "rds_sg_id" {
  description = "Id of security group for rds"
  value       = aws_security_group.rds_sg_internal.id
}

output "lb_sg_id" {
  description = "Id of security group for load balancer"
  value       = aws_security_group.allow_http_lb.id
}
output "public_sn_ids" {
  description = "Ids of private subnet"
  value       = aws_subnet.public_sn.*.id
}

output "private_sn_ids" {
  description = "Id of private subnet"
  value       = aws_subnet.private_sn.*.id
}

