
data "terraform_remote_state" "elp" {
  backend = "s3"

  config = {
    bucket = "terraform-state-file-store-myself"
    key    = "network/eip.tfstate"
    region = "us-east-2"
  }
}
