
variable "region" {
  default = ""
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-2" = "ami-0900fe555666598a2"
    "us-east-1" = "ami-0900fe555666598a2"
    "us-east-3" = "ami-0470e33cd681b2476"
  }
}
