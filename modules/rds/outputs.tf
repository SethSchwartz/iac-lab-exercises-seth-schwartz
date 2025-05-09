
output "db_address" {
  description = "Database address"
  value       = aws_db_instance.database.address
}

output "db_secret_arn" {
  description = "Database secret ARN"
  value       = data.aws_secretsmanager_secret.db.arn
}

output "db_secret_key_id" {
  description = "Database secret key ID"
  value       = data.aws_secretsmanager_secret.db.kms_key_id
}