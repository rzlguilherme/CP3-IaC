# DB INSTANCE
output "rds_endpoint" {
  value = aws_db_instance.rds_notifier_db.endpoint
}
