
# import {
#   to = aws_security_group.default
#   id = "sg-0c95b67a36200613c"
# }
provider "aws" {
  region     = ""
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "new" {
  # ami           = "unknown"
  # instance_type = "unknown"
}