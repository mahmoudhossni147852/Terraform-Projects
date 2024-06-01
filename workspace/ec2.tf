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
  instance_type = lookup( var.instance_type , terraform.workspace)
  subnet_id     = "subnet-04b7d15cff5ab9e87"
}
variable "instance_type" {
    default = {
        default = "t2.nano"
        dev     = "t2.micro"
        prd     = "t2.large"
    }  
}