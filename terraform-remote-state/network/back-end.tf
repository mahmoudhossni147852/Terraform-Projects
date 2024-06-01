terraform {
  backend "s3" {
    bucket = "terraform-state-file-store-myself"
    key    = "network/eip.tfstate"
    region = "us-east-2"
  }
}
