variable "ec2_name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2_name 
  }
}
