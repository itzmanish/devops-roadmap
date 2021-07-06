output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.main.address
  sensitive   = true
}

output "rds_dbname" {
  description = "RDS instance database name"
  value       = aws_db_instance.main.name
  sensitive   = true
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.main.port
  sensitive   = true
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.main.username
  sensitive   = true
}

output "rds_password" {
  description = "RDS instance password"
  value       = aws_db_instance.main.password
  sensitive   = true
}
