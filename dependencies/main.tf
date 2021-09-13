provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "db" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"

  depends_on = [
    aws_instance.db
  ]
}
