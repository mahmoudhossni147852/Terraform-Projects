provider "aws" {
  region     = ""
  access_key = ""
  secret_key = ""
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0"
    }
  }
}

resource "aws_iam_user" "lb" {
  name =  "mahmoud.${count.index}"
  count = 2
}

output "arns"{
  value = aws_iam_user.lb[*].arn
}

output "name"{
  value = aws_iam_user.lb[*].name
}

output "zipmap"{
  value = zipmap(aws_iam_user.lb[*].name,aws_iam_user.lb[*].arn)
}

# output "terraform" {
#    value = var.name
# }

# resource "aws_instance" "data_type" {
#   ami           = "ami-123"
#   instance_type = var.map["k3"]

# }