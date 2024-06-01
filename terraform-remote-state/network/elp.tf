resource "aws_eip" "lb" {
  domain   = "vpc"
}

output "elp_addr" {
  value = aws_eip.lb.public_ip
}