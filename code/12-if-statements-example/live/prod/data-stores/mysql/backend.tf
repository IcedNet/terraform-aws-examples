# Define Terraform backend using a S3 bucket for storing the Terraform state
terraform {
  backend "s3" {
    bucket = "terraform-state-my-bucket"
    key    = "if-statements-example/prod/data-stores/mysql/terraform.tfstate"
    region = "us-east-1"
  }
}
