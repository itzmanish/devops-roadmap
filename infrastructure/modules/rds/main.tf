resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.namespace}-db-subnet-group"
  }
}

resource "aws_db_instance" "main" {
  allocated_storage      = 10
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = "db.t2.micro"
  name                   = var.db_name
  username               = var.db_user
  password               = var.db_password
  skip_final_snapshot    = true
  vpc_security_group_ids = var.rds_sg_ids
  db_subnet_group_name   = aws_db_subnet_group.main.id

  tags = {
    "Name" = "${var.namespace}-db-${var.db_engine}-${var.db_engine_version}"
  }
}
