output "bastion_instance_ids" {
  description = "ID of bastion instance"
  value       = aws_instance.bastion.*.id
}

output "service_instance_ids" {
  description = "ID of service instance"
  value       = aws_instance.service.*.id
}

output "bastion_public_ips" {
  description = "Public IP address of the bastion instance"
  value       = aws_eip.bastion.*.public_ip
}

output "service_private_ips" {
  value = aws_instance.service.*.private_ip
}

