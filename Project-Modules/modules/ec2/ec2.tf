# provider "aws" {
#   # region     = ""
#   # access_key = ""
#   # secret_key = ""  
# }
locals {  
  common_tags = {
    owners  = "devops_team"
    service = "backend"
  }
  mahmoud = {
    name = "hossni"
    age  = "30"
  }
}
data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  subnet_id     = "subnet-04b7d15cff5ab9e87"
  # count = var.istest == true ? 1 : 0
  tags = local.mahmoud

  lifecycle {
    # ignore_changes = [tags]
    # create_before_destroy = true
    # prevent_destroy = true
  }
}