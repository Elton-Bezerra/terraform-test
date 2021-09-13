variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db_server" {
  ami           = "ami-09b9b17384f68fd7c"
  instance_type = "t2.micro"
  count         = length(var.server_names)

  tags = {
    Name = var.server_names[count.index]
  }
}

output "db_server_private_ip" {
  value = [aws_instance.db_server.*.private_ip]
}
