# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create a DB instance
resource "aws_db_instance" "example" {
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = "example_database_prod"
  username            = "admin"
  password            = "${var.db_password}"
  skip_final_snapshot = true
}
