provider "aws" {
  region = "sa-east-1"
}

module "db" {
  source = "./db"
}

module "web" {
  source = "./web"
}

output "PrivateIP" {
  value = module.db.db_server_private_ip
}

output "PublicIP" {
  value = module.web.PublicIP
}
