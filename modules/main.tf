provider "aws" {
  region = "sa-east-1"
}

module "ec2module" {
  source   = "./ec2"
  ec2_name = "Name from module"
}

output "module_output" {
  value = module.ec2module.instance_id
}
