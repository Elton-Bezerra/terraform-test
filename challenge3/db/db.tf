resource "aws_instance" "db_server" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"
  tags = {
    Name = "db_server"
  }
}

output "db_server_private_ip" {
  value = aws_instance.db_server.private_ip
}