
provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  alias  = "hossni"
  region = "us-east-1"
}

resource "aws_eip" "lb01" {
  domain = "vpc"
}

resource "aws_eip" "lb02" {
  domain   = "vpc"
  provider = "aws.hossni"
  profile  = "account-2"
}
# output "public_ip" {
#    value = "https://${aws_eip.lb.public_ip}:8080"
# }