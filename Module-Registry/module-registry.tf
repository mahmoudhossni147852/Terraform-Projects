
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "single-instance"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-04b7d15cff5ab9e87"
}