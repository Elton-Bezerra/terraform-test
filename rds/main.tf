provider "aws" {
  region = "sa-east-1"
}

resource "aws_db_instance" "myRDS" {
  name                = "dbName"
  identifier          = "my-first-rds"
  instance_class      = "db.t2.micro"
  engine              = "mariadb"
  engine_version      = "10.2.21"
  username            = "test"
  password            = "password_123"
  port                = "3306"
  allocated_storage   = 20
  skip_final_snapshot = true
}
