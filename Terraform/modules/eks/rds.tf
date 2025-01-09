resource "aws_db_subnet_group" "my_db_subnet_group" {
  name        = "subnet group"
  description = "My DB Subnet Group"
  subnet_ids  = module.vpc.public_subnets
}

resource "aws_db_instance" "mydb" {
  allocated_storage                   = 20
  identifier                          = "ashiqdb"
  storage_type                        = "gp2"
  engine                              = "mysql"
  engine_version                      = "8.0.39"
  instance_class                      = "db.t3.micro"
  db_name                             = "ashiqdb"
  username                            = "ashiq"
  password                            = "ashiqpassword"
  iam_database_authentication_enabled = true
  parameter_group_name                = "default.mysql8.0"
  skip_final_snapshot                 = true
  publicly_accessible                 = true
  db_subnet_group_name                = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids              = [aws_security_group.rds_sg.id]
  tags = {
    Name = "sqldb"
  }
  lifecycle {
    replace_triggered_by = [aws_security_group.rds_sg.id]
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds_security_group"
  description = "Security group for RDS instances"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


