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
  instance_type = "t2.micro"
  subnet_id     = "subnet-04b7d15cff5ab9e87"
  key_name      = "terraform"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform.pem")
    host        = aws_instance.myec2.public_ip
  }

#that type of provisioners using for create a file localy with the data from the resouce that we created
  provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }
#that using for run code or script from internet in the resouce
  provisioner "remote-exec" {
    inline = [

      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]

  }
  #that for copy file from local to the future resouce that will created

  provisioner "file" {
    source = "/home/file.txt"
    destination = "/home/file.txt"
  }
}



output "public_ip" {
  value = "https://${aws_instance.myec2.public_ip}"
}
