provider "aws" {
  region = "sa-east-1"
}

module "ec2module" {
  source   = "./ec2"
  ec2_name = "Name from module"
}
