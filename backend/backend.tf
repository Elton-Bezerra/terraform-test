terraform {
  backend "s3" {
    region = "sa-east-1"
    bucket = "terraform-state-saver"
    key    = "terraform/terraform.tfstate"
  }
}
