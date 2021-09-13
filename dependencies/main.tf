provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "ec2db" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"

  tags = {
    "name" = "DB Server"
  }
}

resource "aws_instance" "ec2" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"

  depends_on = [
    aws_instance.ec2db
  ]
}

data "aws_instances" "dbsearch" {
  instance_state_names = ["terminated"]
  instance_tags = {
    Name = "mysql"
  }

}

output "dbsearch_output" {
  value = data.aws_instances.dbsearch.ids
}

