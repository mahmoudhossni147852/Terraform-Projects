data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
   subnet_id     = "subnet-04b7d15cff5ab9e87"
}

resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  domain   = "vpc"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.private_ip}/32"]

  }
}
