
module "sgmodule" {
  source = "../../modules/sg"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "dev" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
  subnet_id     = "subnet-04b7d15cff5ab9e87"
  vpc_security_group_ids = [module.sgmodule.sg_id]
}