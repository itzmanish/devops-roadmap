output "users" {
  description = "Users with access permission to this bucket"
  value       = [aws_iam_user.s3_rw.name, aws_iam_user.s3_ronly.name]
}

output "rw_user_credential" {
  description = "s3 rw user credential"
  value       = [aws_iam_access_key.s3_rw.id, aws_iam_access_key.s3_rw.secret]
  sensitive   = true
}

output "ronly_user_credential" {
  description = "s3 read only user credential"
  value       = [aws_iam_access_key.s3_ronly.id, aws_iam_access_key.s3_ronly.secret]
  sensitive   = true
}
