# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Use Module
module "webserver_cluster" {
  source = "git::git@github.com:alfonsof/terraform-aws-repo-examples.git//modules/services/webserver-cluster?ref=v0.0.2"
  
  cluster_name           = "werservers-stage"
  db_remote_state_bucket = "${var.db_remote_state_bucket}"
  db_remote_state_key    = "${var.db_remote_state_key}"
  
  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
}

# Create a Security Group Rule
resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = "${module.webserver_cluster.elb_security_group_id}"

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
