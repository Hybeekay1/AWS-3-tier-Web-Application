
resource "aws_db_subnet_group" "default" {
  name       = "webapp-db-subnet-group"
  subnet_ids = var.db_subnets

  tags = {
    Name = "webapp-db-subnet-group"
  }
}

resource "aws_db_instance" "webapp" {
  identifier              = var.db_identifier
  engine                  = "postgres"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = var.db_username
  manage_master_user_password = true
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = [var.db_sg_id]
  multi_az                = true
  publicly_accessible     = false
  skip_final_snapshot     = true
}

