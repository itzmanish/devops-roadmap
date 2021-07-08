output "users" {
  description = "Users with access permission to this bucket"
  value       = [aws_iam_user.primary.name, aws_iam_user.secondary.name]
}

output "primary_user_credential" {
  description = "s3 rw user credential"
  value       = aws_iam_access_key.primary.secret
  sensitive   = true
}

output "secondary_user_credential" {
  description = "s3 read only user credential"
  value       = aws_iam_access_key.secondary.secret
  sensitive   = true
}
