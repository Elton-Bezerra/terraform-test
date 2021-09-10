provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"
  tags = {
    Name = "provided-terraform-ec2"
  }
}
