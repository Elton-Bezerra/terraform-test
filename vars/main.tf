provider "aws" {
  region = "sa-east-1"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "ec2" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"
  count         = var.number_of_servers
}
