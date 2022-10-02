#SUBNET GROUP
resource "aws_db_subnet_group" "vpc10_subnet_group" {
  name       = "vpc10_subnet_group"
  subnet_ids = [var.sn_vpc10_priv_1a_id, var.sn_vpc10_priv_1c_id]

  tags = {
    Name = "vpc10 Subnet Group"
  }
}
#PARAMETER GROUP
resource "aws_db_parameter_group" "vpc10_parameter_Group" {
  name        = "vpc10-parameter-group"
  family      = "mysql8.0"
  description = "RDS Parameter Group"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_database"
    value = "utf8"
  }
}

#DATA BASE
resource "aws_db_instance" "rds_notifier_db" {
  identifier             = "rds-notifier-db"
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  storage_type           = var.storage_type
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  monitoring_interval    = var.monitoring_interval
  name                   = var.name
  username               = var.username
  password               = var.password
  multi_az               = true
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.vpc10_subnet_group.name
  parameter_group_name   = aws_db_parameter_group.vpc10_parameter_Group.name
  vpc_security_group_ids = [var.vpc10_sg_priv_id]

  tags = {
    Name = "rds-notifier-db"
  }

}
