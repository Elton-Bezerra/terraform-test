provider "aws" {
  region = "sa-east-1"
}

module "db" {
  source       = "./db"
  server_names = ["mariadb", "mysql", "mssql"]
}

output "private_ips" {
  value = module.db.db_server_private_ip
}
