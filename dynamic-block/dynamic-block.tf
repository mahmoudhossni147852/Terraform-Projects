provider "aws" {
  region     = ""
  access_key = ""
  secret_key = ""
}

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8100, 8200, 8300, 8400, 8500]
}

resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # dynamic "egress" {
  #   for_each = var.sg_ports
  #   content {
  #     from_port   = egress.value
  #     to_port     = egress.value
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  # }
}

